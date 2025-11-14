import { pgTable, uuid, varchar, timestamp, pgEnum, unique } from 'drizzle-orm/pg-core';

// Enums
export const userStatusEnum = pgEnum('user_status', ['active', 'suspended', 'banned']);
export const oauthProviderEnum = pgEnum('oauth_provider', ['google', 'kakao']);

// Users table (OAuth2-only)
export const users = pgTable('users', {
  id: uuid('id').defaultRandom().primaryKey(),
  email: varchar('email', { length: 255 }).notNull().unique(),
  username: varchar('username', { length: 255 }).notNull().unique(),
  firstName: varchar('first_name', { length: 255 }),
  avatarUrl: varchar('avatar_url', { length: 500 }),
  voiceBioUrl: varchar('voice_bio_url', { length: 500 }),

  // OAuth2 fields
  oauthProvider: oauthProviderEnum('oauth_provider').notNull(),
  oauthProviderId: varchar('oauth_provider_id', { length: 255 }).notNull(),

  status: userStatusEnum('status').default('active').notNull(),
  createdAt: timestamp('created_at').defaultNow().notNull(),
  updatedAt: timestamp('updated_at').defaultNow().notNull(),
  lastLoginAt: timestamp('last_login_at'),
}, (table) => ({
  // Ensure one account per provider
  uniqueProviderUser: unique().on(table.oauthProvider, table.oauthProviderId),
}));