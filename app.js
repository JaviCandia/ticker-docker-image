const cron = require("node-cron");
const { syncDB } = require("./tasks/sync-db");
let times = 0;

console.log("Running the app...");

cron.schedule("1-59 * * * * *", syncDB);
