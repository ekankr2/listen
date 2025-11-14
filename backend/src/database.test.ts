import { describe, it, expect } from "bun:test";
import { connectDatabase } from "@/db";

describe("Database", () => {
  it("shouldConnectToDatabaseOnStartup", async () => {
    const db = await connectDatabase();

    expect(db).toBeDefined();
    expect(db.isConnected).toBe(true);
  });
});