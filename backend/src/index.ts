import dotenv from 'dotenv';
import { Client } from 'pg';
import express from 'express';

dotenv.config({
  path: '../.env',
});

const app = express();

const client = new Client({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: Number(process.env.DB_PORT),
});

app.get('/chefs', async (req, res) => {
  try {
    await client.connect();
    const result = await client.query('SELECT * FROM "chef";');
    res.json(result.rows);
  } catch (error) {
    console.error('Error fetching chefs:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  } finally {
    await client.end();
  }
});

const server = app.listen(process.env.BE_PORT, () => {
  console.log(`Backend is running on port ${process.env.BE_PORT}`);
});

function shutdown() {
  server.close(() => process.exit(0));
}
process.on('SIGINT', shutdown);
process.on('SIGTERM', shutdown);
