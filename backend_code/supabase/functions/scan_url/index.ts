// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

// Setup type definitions for built-in Supabase Runtime APIs
import "https://esm.sh/@supabase/functions-js/src/edge-runtime.d.ts"

async function _IPScannerAPI(url: string): Promise<{ IPScannerRating: string, IPScannerDescription: string }> {
  const apiKey = '09jkL3Yyc3p2ymzaIWivmd6a7jcQcZaW'
  const encodedURL = encodeURIComponent(url);
  const IPScannerAPI = `https://www.ipqualityscore.com/api/json/url/${apiKey}/${encodedURL}?strictness=0&fast=true`;
  // console.log(IPScannerAPI)
  let data;
  let risk_score: string;
  let description: string = '';

  try {
    const response = await fetch(IPScannerAPI);
    data = await response.json();
    // console.log(data);
  } catch (error) {
    console.error(error);
    data = {};
  }

  if (data.risk_score < 75){
    risk_score = 'Secure';
  } else if (data.risk_score <90){
    risk_score = 'Suspicious';
  } else if (data.risk_score <100){
    risk_score = 'High Risk';
  } else {
    risk_score = 'Malicious';
  }

  if (data.malware === true) {
    description += 'Malware';
  }
  if (data.phishing === true) {
    if (description !== ''){
      description += ', ';
    }
    description += 'Phishing';
  }
  if (data.spamming === true) {
    if (description !== ''){
      description += ', ';
    }
    description += 'Spamming';
  }

  return {"IPScannerRating": risk_score, "IPScannerDescription": description};
}


async function _GoogleSafeBrowsingAPI(url: string) {
  // See https://developers.google.com/safe-browsing/reference for an explanation
  let sanitisedURL: URL;
  try{
    sanitisedURL = new URL(sanitiseURL(url));
  } catch (_error) {
    return ''
  }
  console.log(sanitisedURL); // Add a property assignment here
  const hostSuffixes = generateHostSuffixes(sanitisedURL.hostname);
  console.log('Host Suffixes:', hostSuffixes);
  const pathPrefixes = generatePathPrefixes(sanitisedURL.pathname, sanitisedURL.search);
  console.log('Path Prefixes:', pathPrefixes);
  const expressions = hostSuffixes.flatMap((host) => pathPrefixes.map((path) => `${host}${path}`));
  console.log('Expressions:', expressions);
  const encodedExpressions = await Promise.all(expressions.map((expression) => hashAndTruncate(expression)));
  //const encodedExpressions = await hashAndTruncate(sanitisedURL.toString());
  console.log('Encoded Expressions:', encodedExpressions);

  const apiKey = 'AIzaSyAEDsqZgdB0-RQI0LqP3E1MtLlK_qxXjaQ'
  const apiURL = `https://safebrowsing.googleapis.com/v5/hashes:search?key=${apiKey}`;
  try {
    const response = await fetch(`${apiURL}&hashPrefixes=WwuJdQ`, {headers: {'Accept': 'application/json'}})
    console.log(response)
    const {data} = await response.json()
    console.log(data)
  } catch (error) {
    console.error(error)
  }

// URL Preprocessing
function sanitiseURL(url: string): string {
  try {
    url = url.replace(/[\t\r\n]/g, '');

    // Step 2: Remove URL fragment
    url = url.split('#')[0];

    // Step 3: Percent-unescape repeatedly
    let decodedUrl;
    while (true) {
      decodedUrl = decodeURIComponent(url);
      if (decodedUrl === url) {
        // No more percent-encoded characters to decode
        break;
      }
      url = decodedUrl;
    }
    // Step 4: Add at least one slash following the domain
    if (!url.endsWith('/')) {
      url += '/';
    }
    return url;
  } catch (error) {
    console.error(error);
    return '';
  }
}

function generateHostSuffixes(hostname: string): string[] {
  const hostSuffixes = [];
  const parts = hostname.split('.');
  if (parts.length > 1 && !hostname.match(/^\d{1,3}(\.\d{1,3}){3}$/)) { // Exclude IP addresses
    for (let i = Math.max(parts.length - 2, 0); i < parts.length; i++) {
      const suffix = parts.slice(i).join('.');
      if (suffix !== 'com') {
        hostSuffixes.push(suffix);
      }
    }
  }
  hostSuffixes.push(hostname); // Include the full hostname
  return hostSuffixes;
}

function generatePathPrefixes(pathname: string, search: string): string[] {
  const pathPrefixes = [pathname + search]; // Include path with query
  const components = pathname.split('/').filter(Boolean);
  for (let i = 1; i <= components.length; i++) {
    pathPrefixes.push('/' + components.slice(0, i).join('/') + '/');
  }
  return pathPrefixes;
}

async function hashAndTruncate(urlComponent: string, truncateToBytes = 4) {
  // Step 1: Encode the URL component
  const encoder = new TextEncoder();
  const data = encoder.encode(urlComponent);
  console.log(`urlComponent: ${urlComponent}`)
  console.log(`Data: ${data}`)

  // Step 2: Hash the encoded data
  const hashBuffer = await crypto.subtle.digest('SHA-256', data);
  console.log(`hashBuffer: ${Array.from(new Uint8Array(hashBuffer))}`)

  // Step 3: Truncate the hash
  const hashArray = Array.from(new Uint8Array(hashBuffer)).slice(0, truncateToBytes);
  console.log(`hashArray: ${hashArray}`)

  // Step 4: Convert the truncated hash to a hexadecimal string (optional)
  const hashHex = btoa(hashArray.map(b => String.fromCharCode(b)).join(''));
  console.log(`hashHex: ${hashHex}`);
  // const hashHex = btoa(hashArray.map(b => String.fromCharCode(b)).join(''));

  return hashHex
}
}

async function _GoogleSafeBrowsingAPIv4(url: string){
  const apiKey = 'AIzaSyAEDsqZgdB0-RQI0LqP3E1MtLlK_qxXjaQ'
  const apiURL = `https://safebrowsing.googleapis.com/v4/threatMatches:find?key=${apiKey}`;

  const requestBody = {
    client: {
      clientId: "acre_flutter_app", 
      clientVersion: "1.0.0" 
    },
    threatInfo: {
      threatTypes: ["MALWARE", "SOCIAL_ENGINEERING"],
      platformTypes: ["WINDOWS"],
      threatEntryTypes: ["URL"],
      threatEntries: [
        {"url": url},
        {"url": 'http://ianfette.org/'}
      ]
    }
  };

  try {
    console.log(url)
    console.log(apiURL)
    const response = await fetch(apiURL, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(requestBody),
    });
  console.log(response)
  const data = await response.json();
    return data; // This will contain the API response indicating whether the URL is safe or not
  } catch (error) {
    console.error(error);
    return '';
  }
}

Deno.serve(async (req) => {
  const { url } = await req.json()
  const IPScannerRating = await _IPScannerAPI(url);
  //const GoogleAPIRating = await _GoogleSafeBrowsingAPIv4(url);
  //console.log(GoogleAPIRating)

  // const results = IPScannerRating
  

  return new Response(
    JSON.stringify(IPScannerRating),
    { headers: { "Content-Type": "application/json" } },
  )
})

/* To invoke locally:

  1. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
  2. Make an HTTP request:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/scan_url' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/json' \
    --data '{"url": "https://www.google.com"}'

*/
