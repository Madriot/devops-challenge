import Fastify from "fastify";

const fastify = Fastify({
  logger: { level: process.env.LOG_LEVEL },
});

fastify.get("/healthz", async function (_, reply) {
  reply.send({ SYS_ENV: process.env.SYS_ENV });
});

fastify.listen({ port: 3000, host: "0.0.0.0" }, function (err) {
  if (err) {
    fastify.log.error(err);
    process.exit(1);
  }
});

export default fastify;
