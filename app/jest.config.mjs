export default {
  testEnvironment: "node",
  transform: { "^.+\\.mjs$": "babel-jest" },
  moduleFileExtensions: ["mjs", "js", "json", "node"],
  testMatch: ["<rootDir>/tests/**/*.mjs"],
};
