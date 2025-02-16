import { drizzle } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';
import { Boards } from '@/db/schema/board';

const connectionString = process.env.DATABASE_URL || '';

// Disable prefetch as it is not supported for "Transaction" pool mode
const client = postgres(connectionString, { prepare: false, max: 3, idle_timeout: 20, connect_timeout: 10 });
const db = drizzle(client, {
  schema: {
    boards: Boards,
  },
});

export default db;