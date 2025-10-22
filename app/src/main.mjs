import Fastify from "fastify";
import { v4 as uuidv4 } from "uuid";

const fastify = Fastify({
  logger: { level: process.env.LOG_LEVEL },
  genReqId: () => uuidv4(),
});

fastify.get("/healthz", async function (_, reply) {
  reply.send({ status: "Healthy" });
});

fastify.listen({ port: 3000, host: "0.0.0.0" }, function (err) {
  if (err) {
    fastify.log.error(err);
    process.exit(1);
  }
});
