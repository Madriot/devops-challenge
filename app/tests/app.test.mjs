import fastify from "../src/main.mjs";
import { test, expect } from "@jest/globals";

test("Fastify instance exists", () => {
  expect(fastify).toBeDefined();
});

test("GET /healthz route returns 200", async () => {
  process.env.SYS_ENV = "test";

  const response = await fastify.inject({ method: "GET", url: "/healthz" });

  expect(response.statusCode).toBe(200);
  expect(response.json()).toEqual({ SYS_ENV: "test" });
});
