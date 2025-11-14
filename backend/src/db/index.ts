import { drizzle } from 'drizzle-orm/bun-sql';
import { SQL } from 'bun';
import { loadEnvironmentVariables } from "@/config";
import * as schema from './schema';

export interface Database {
  isConnected: boolean;
  db: ReturnType<typeof drizzle>;
}

let cachedDatabase: Database | null = null;

export async function connectDatabase(): Promise<Database> {
  // Return cached connection if available
  if (cachedDatabase) {
    return cachedDatabase;
  }

  const config = loadEnvironmentVariables();

  // Create Bun SQL client
  const client = new SQL(config.databaseUrl);

  // Initialize Drizzle with the client
  const db = drizzle({ client, schema });

  // Test the connection
  try {
    await db.execute('SELECT 1');
  } catch (error) {
    throw new Error(`Failed to connect to database: ${error}`);
  }

  cachedDatabase = {
    isConnected: true,
    db,
  };

  return cachedDatabase;
}