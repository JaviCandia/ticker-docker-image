const { syncDB } = require("../tasks/sync-db");

describe("Automatic tests", () => {
  test("Should execute the method at least 2 times", () => {
    syncDB();
    const times = syncDB();

    expect(times).toBe(2)
  });
});
