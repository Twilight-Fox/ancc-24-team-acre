// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

// Setup type definitions for built-in Supabase Runtime APIs
import "https://esm.sh/v135/@supabase/functions-js@2.4.1/src/edge-runtime.d.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.44.0"

function _isValidUrl(urlString: string): string {
  let correctedUrlString = urlString;
  const pattern = new RegExp(
    '^([a-zA-Z]+:\\/\\/)?' + // protocol
      '((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.)+[a-z]{2,}|' + // domain name
      '((\\d{1,3}\\.){3}\\d{1,3}))' + // OR IP (v4) address
      '(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*' + // port and path
      '(\\?[;&a-z\\d%_.~+=-]*)?' + // query string
      '(\\#[-a-z\\d_]*)?$', // fragment locator
    'i'
  );

  if (!urlString.startsWith("http://") && !urlString.startsWith("https://") && !urlString.startsWith("www.")) {
    correctedUrlString = `http://www.${urlString}`;
  }

  else if (!urlString.startsWith("http://") && !urlString.startsWith("https://")) {
    correctedUrlString = `http://${urlString}`;
  } 

  if (pattern.test(correctedUrlString)){
    return correctedUrlString;
  }
  else {
    return '';
  }
}

Deno.serve(async (req) => {
  const { url } = await req.json()
  //const authHeader = req.headers.get('Authorization')!
  //const supabaseClient = createClient(
  //  Deno.env.get('SUPABASE_URL') ?? '',
  //  Deno.env.get('SUPABASE_ANON_KEY') ?? '',
  //  { global: { headers: { Authorization: authHeader } } }
 // )
  const URL = _isValidUrl(url);
  // console.log(supabaseClient);

  if (URL == '') {
    return new Response(JSON.stringify({ error: "Invalid URL" }), {
      status: 400,
      headers: { "Content-Type": "application/json" },
    });
  }

  //const IPScannerData = await _IPScannerAPI(URL);
  //console.log(IPScannerData);

  return new Response(JSON.stringify(URL), {
    headers: { "Content-Type": "application/json" },
  });
})

/* To invoke locally:

  1. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
  2. Make an HTTP request:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/validate_url' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/json' \
    --data '{"userID":"9c061d74-7a7b-4889-a38a-0a588038bae5", "url":"www.google.com"}'

*/
