import { pgTable, serial, text, timestamp, uuid } from 'drizzle-orm/pg-core';

export const Boards = pgTable('boards', {
  id: serial('id').primaryKey(),
  title: text('title').notNull(),
  content: text('content').notNull(),
  email: text('email'),
  createdAt: timestamp('created_at').notNull().defaultNow(),
  updatedAt: timestamp('updated_at').notNull().defaultNow(),
});