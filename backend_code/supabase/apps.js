import supabase from './supabaseClient.js';

// Function to insert a new profile
const insertProfile = async () => {
    const { data, error } = await supabase
        .from('profiles')
        .insert([
            { username: 'johndoe', email: 'johndoe@example.com' }
        ]);

    if (error) {
        console.error('Error inserting data:', error);
    } else {
        console.log('Data inserted:', data);
    }
}

// Function to call the Edge Function
const callFunction = async () => {
    const response = await fetch('https://your-project.supabase.co/functions/v1/hello-world', {
        method: 'POST'
    });
    const result = await response.json();
    console.log(result); // { message: "Hello, world!" }
}

// Example usage
insertProfile();
callFunction();
