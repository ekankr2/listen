export interface Config {
  port: number;
  databaseUrl: string;
}

export function loadEnvironmentVariables(): Config {
  // Port is hardcoded to 3000
  const port = 3000;

  // Validate DATABASE_HOST
  const databaseHost = process.env.DATABASE_HOST;
  if (!databaseHost) {
    throw new Error("DATABASE_HOST environment variable is required");
  }

  // Validate DATABASE_NAME
  const databaseName = process.env.DATABASE_NAME;
  if (!databaseName) {
    throw new Error("DATABASE_NAME environment variable is required");
  }

  // Validate DATABASE_USER
  const databaseUser = process.env.DATABASE_USER;
  if (!databaseUser) {
    throw new Error("DATABASE_USER environment variable is required");
  }

  // Validate DATABASE_PASSWORD
  const databasePassword = process.env.DATABASE_PASSWORD;
  if (!databasePassword) {
    throw new Error("DATABASE_PASSWORD environment variable is required");
  }

  // Build database URL from components
  const databaseUrl = `postgresql://${databaseUser}:${databasePassword}@${databaseHost}/${databaseName}`;

  return {
    port,
    databaseUrl,
  };
}