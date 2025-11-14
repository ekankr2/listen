import { t } from 'elysia';

// Common validation schemas
export const schemas = {
  // Email validation
  email: t.String({
    format: 'email',
    error: 'Invalid email format',
  }),

  // Password validation (min 8 chars, at least 1 letter and 1 number)
  password: t.String({
    minLength: 8,
    pattern: '^(?=.*[A-Za-z])(?=.*\\d).+$',
    error: 'Password must be at least 8 characters with at least one letter and one number',
  }),

  // Username validation (3-30 chars, alphanumeric and underscores)
  username: t.String({
    minLength: 3,
    maxLength: 30,
    pattern: '^[a-zA-Z0-9_]+$',
    error: 'Username must be 3-30 characters, alphanumeric and underscores only',
  }),

  // UUID validation
  uuid: t.String({
    format: 'uuid',
    error: 'Invalid UUID format',
  }),

  // Pagination
  pagination: {
    limit: t.Optional(
      t.Number({
        minimum: 1,
        maximum: 100,
        default: 20,
      })
    ),
    offset: t.Optional(
      t.Number({
        minimum: 0,
        default: 0,
      })
    ),
  },
};

// Auth validation schemas
export const authSchemas = {
  register: t.Object({
    email: schemas.email,
    username: schemas.username,
    password: schemas.password,
  }),

  login: t.Object({
    email: schemas.email,
    password: t.String({
      minLength: 1,
      error: 'Password is required',
    }),
  }),
};