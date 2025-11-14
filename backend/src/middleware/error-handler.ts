import { Elysia } from 'elysia';
import { logger } from '@/lib/logger';

export class AppError extends Error {
  constructor(
    public statusCode: number,
    message: string,
    public isOperational = true
  ) {
    super(message);
    Object.setPrototypeOf(this, AppError.prototype);
  }
}

export const errorHandler = new Elysia()
  .onError(({ code, error, set }) => {
    // Log the error
    logger.error('Request error', {
      code,
      message: error.message,
      stack: error.stack,
    });

    // Handle different error types
    if (error instanceof AppError) {
      set.status = error.statusCode;
      return {
        error: {
          message: error.message,
          statusCode: error.statusCode,
        },
      };
    }

    // Validation errors (Elysia built-in)
    if (code === 'VALIDATION') {
      set.status = 400;
      return {
        error: {
          message: 'Validation failed',
          statusCode: 400,
          details: error.message,
        },
      };
    }

    // Not found errors
    if (code === 'NOT_FOUND') {
      set.status = 404;
      return {
        error: {
          message: 'Route not found',
          statusCode: 404,
        },
      };
    }

    // Default server error
    set.status = 500;
    return {
      error: {
        message: process.env.NODE_ENV === 'production'
          ? 'Internal server error'
          : error.message,
        statusCode: 500,
      },
    };
  });