# 🕒 Cron Ticker

A minimal Node.js app that runs a scheduled task using `node-cron`. It tracks how many times a function has been triggered per second — useful as a boilerplate for cron-based services or learning Dockerized scheduled jobs.

---

## 📁 Project Structure

```
.
├── app.js                  # Main app, schedules the cron job
├── tasks/
│   └── sync-db.js          # Task to execute on every tick
├── tests/
│   └── sync-db.test.js     # Basic test for tick counter
├── Dockerfile              # Container setup
├── .dockerignore           # Excludes unnecessary files from the image
├── .gitignore
├── package.json
└── package-lock.json
```

---

## 🚀 Run locally

```bash
npm install
npm start
```

It will print:

```
Running the app...
Tick every second: 1
Tick every second: 2
...
```

---

## 🧪 Run tests

```bash
npm test
```

Test is written using Jest and ensures the task runs at least twice.

---

## 🐳 Run with Docker

```bash
# Build the image
docker build -t javicandia/cron-ticker .

# Run the container
docker run javicandia/cron-ticker
```

---

## 📦 Image contents

The image:

- Installs all dependencies
- Runs `npm test` during build
- Removes test files and dev-only dependencies
- Installs production-only dependencies
- Executes `node app.js` on start

---

## 🌐 Use cases

- Learning cron jobs with Docker
- Automating scripts at intervals
- Base template for time-based workers

---
