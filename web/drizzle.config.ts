import { defineConfig } from 'drizzle-kit';

export default defineConfig({
  schema: './db/schema/*',
  schemaFilter: ['public'],
  out: './supabase/migrations',
  dialect: 'postgresql',
  dbCredentials: {
    url: process.env.DATABASE_URL!,
  },
});