import { createClient } from '@supabase/supabase-js'

const supabaseUrl = 'https://ACRE.supabase.co'
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhzcG5pZ2F0eHRpc2JucXd4a2x3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTg1MjYyMDMsImV4cCI6MjAzNDEwMjIwM30.gDNiZEzGdNQwLrCC5UMwyme69_AAQhkAw1o5wyIo--E'
const supabase = createClient(supabaseUrl, supabaseKey)

// Function to insert a new profile
export const insertProfile = async () => {
    const { data, error } = await supabase
        .from('profiles')
        .insert([
            { username: 'johndoe', email: 'johndoe@example.com' }
        ])

    if (error) {
        console.error('Error inserting data:', error);
    } else {
        console.log('Data inserted:', data);
    }
}

// Function to call the Edge Function
export const callFunction = async () => {
    const response = await fetch('https://ACRE.supabase.co/functions/v1/hello-world', {
        method: 'POST'
    });
    const result = await response.json();
    console.log(result); // { message: "Hello, world!" }
}
