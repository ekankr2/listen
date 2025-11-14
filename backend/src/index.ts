import { Elysia } from "elysia";
import { errorHandler } from "@/middleware/error-handler";
import { logger } from "@/lib/logger";
import { loadEnvironmentVariables } from "@/config";

const config = loadEnvironmentVariables();

const app = new Elysia()
  .use(errorHandler)
  .get("/", () => "Hello Elysia")
  .get("/health", () => ({ status: "ok", timestamp: new Date().toISOString() }))
  .listen(config.port);

logger.info(`🦊 Elysia is running at ${app.server?.hostname}:${app.server?.port}`);
