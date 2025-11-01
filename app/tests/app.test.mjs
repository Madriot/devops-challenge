import { describe, it, expect, beforeAll } from "vitest";
import fastify from "../src/main.mjs";

describe("Fastify /healthz", () => {
  beforeAll(async () => {
    await fastify.ready();
  });

  it("GET /healthz returns SYS_ENV", async () => {
    process.env.SYS_ENV = "TEST";

    const res = await fastify.inject({ method: "GET", url: "/healthz" });

    expect(res.statusCode).toBe(200);

    const body = res.json();

    expect(body).toEqual({ SYS_ENV: "TEST" });
  });
});
