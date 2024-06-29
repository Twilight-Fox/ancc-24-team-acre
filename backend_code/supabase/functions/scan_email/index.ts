// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

// Setup type definitions for built-in Supabase Runtime APIs
import "https://esm.sh/@supabase/functions-js/src/edge-runtime.d.ts"

async function _IPScannerAPI(email: string): Promise<{ exposed: boolean, plain_text_password: boolean, valid: boolean }> {
  const apiKey = Deno.env.get('IPSCANNER_API_KEY');
  console.log(apiKey)
  const IPScannerAPI = `https://www.ipqualityscore.com/api/json/leaked/email/${apiKey}/${email}`; 
  let data;

  try {
    const response = await fetch(IPScannerAPI);
    data = await response.json();
    //console.log(data);
  } catch (error) {
    console.error(error);
    data = {};
  }
  if (data.message != 'Success') {
    return {"exposed": false, "plain_text_password": false, "valid": false};
  }

  const result = {"exposed": data.exposed, "plain_text_password": data.plain_text_password, "valid": true};
  return result;
}

Deno.serve(async (req) => {
  const { email } = await req.json()
  const IPScannerRating = await _IPScannerAPI(email)

  return new Response(
    JSON.stringify(IPScannerRating),
    { headers: { "Content-Type": "application/json" } },
  )
})

/* To invoke locally:

  1. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
  2. Make an HTTP request:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/scan_email' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/json' \
    --data '{"email":"email"}'

*/
