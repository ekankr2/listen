import { describe, it, expect, beforeEach, afterEach } from "bun:test";
import { loadEnvironmentVariables } from "@/config";

describe("Config", () => {
  let originalEnv: NodeJS.ProcessEnv;

  beforeEach(() => {
    // Save original environment
    originalEnv = { ...process.env };
  });

  afterEach(() => {
    // Restore original environment
    process.env = originalEnv;
  });

  it("shouldLoadEnvironmentVariables", () => {
    // .env file is automatically loaded by Bun
    const config = loadEnvironmentVariables();

    expect(config).toBeDefined();
    expect(config.port).toBe(3000);
    expect(config.databaseUrl).toBeDefined();
    expect(typeof config.databaseUrl).toBe("string");
    expect(config.databaseUrl).toContain("postgresql://");
  });

  it("shouldHandleInvalidEnvironmentVariablesGracefully", () => {
    // Remove DATABASE_HOST
    delete process.env.DATABASE_HOST;

    expect(() => loadEnvironmentVariables()).toThrow("DATABASE_HOST environment variable is required");
  });

  it("shouldThrowWhenDatabaseNameIsMissing", () => {
    // Remove DATABASE_NAME
    delete process.env.DATABASE_NAME;

    expect(() => loadEnvironmentVariables()).toThrow("DATABASE_NAME environment variable is required");
  });

  it("shouldThrowWhenDatabaseUserIsMissing", () => {
    // Remove DATABASE_USER
    delete process.env.DATABASE_USER;

    expect(() => loadEnvironmentVariables()).toThrow("DATABASE_USER environment variable is required");
  });

  it("shouldThrowWhenDatabasePasswordIsMissing", () => {
    // Remove DATABASE_PASSWORD
    delete process.env.DATABASE_PASSWORD;

    expect(() => loadEnvironmentVariables()).toThrow("DATABASE_PASSWORD environment variable is required");
  });
});