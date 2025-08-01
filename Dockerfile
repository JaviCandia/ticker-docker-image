# Development dependencies stage
FROM --platform=$BUILDPLATFORM node:19.2-alpine3.16 AS deps
WORKDIR /app
COPY package.json ./
RUN npm install

# Build amd test stage
FROM --platform=$BUILDPLATFORM node:19.2-alpine3.16 AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run test

# production dependencies stage
FROM --platform=$BUILDPLATFORM node:19.2-alpine3.16 AS prod-deps
WORKDIR /app
COPY package.json ./
RUN npm install --prod

# Final stage: running the app
FROM --platform=$BUILDPLATFORM node:19.2-alpine3.16 AS runner
WORKDIR /app
COPY --from=prod-deps /app/node_modules ./node_modules
COPY app.js ./
COPY tasks/ ./tasks
CMD ["node", "app.js"]