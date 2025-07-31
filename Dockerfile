# Uncomment the line below to build for a specific platform, e.g., linux/amd64
FROM --platform=$BUILDPLATFORM node:19.2-alpine3.16

# Use the line below to build for the current platform
# FROM node:19.2-alpine3.16


# Available folders: /app /var /lib
# cd /app
WORKDIR /app

# "Copy these files into the destination file (the last one)"
# Since we are already in /app we can use ./
COPY package.json ./

# Installing dependencies 
RUN npm install

# ---- The files and steps above this are very unlikely to change.
# From here, files  will change its content a lot, so it is put in the last steps
COPY . .

# Running tests
RUN npm run test

# Removing not necessary files in PROD
RUN rm -rf tests && rm -rf node_modules

## Installing prod dependencies
RUN npm install --prod

# Running the app
CMD [ "npm", "start" ]