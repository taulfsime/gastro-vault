import dotenv from 'dotenv';
import { Client } from 'pg';

dotenv.config();

const client = new Client({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: Number(process.env.DB_PORT),
});

async function main() {
  await client.connect();
  console.log('Connected to the database!');

  const res = await client.query('SELECT * FROM "chef";');
  console.log('Chefs:', res.rows);

  await client.end();
}

main().catch(err => console.error('Error:', err));
