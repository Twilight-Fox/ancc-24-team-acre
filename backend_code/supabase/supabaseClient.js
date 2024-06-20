import { createClient } from '@supabase/supabase-js';

const supabaseUrl = 'https://xspnigatxtisbnqwxklw.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhzcG5pZ2F0eHRpc2JucXd4a2x3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTg1MjYyMDMsImV4cCI6MjAzNDEwMjIwM30.gDNiZEzGdNQwLrCC5UMwyme69_AAQhkAw1o5wyIo--E'
';
const supabase = createClient(supabaseUrl, supabaseKey);

export default supabase;
