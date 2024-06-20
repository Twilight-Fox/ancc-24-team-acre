CREATE TABLE profiles (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  username text UNIQUE,
  email text UNIQUE,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now())
);

