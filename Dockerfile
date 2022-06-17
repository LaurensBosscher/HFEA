FROM node:buster

# Create app directory
WORKDIR /app

ENV NODE_OPTIONS=--openssl-legacy-provider

# Install app dependencies
# RUN npm -g install serve
RUN yarn install gatsby-cli

COPY package*.json ./

RUN yarn install

# Bundle app source
COPY . .

# Build static files
RUN yarn build

# serve on port 8080
# CMD ["serve", "-l", "tcp://0.0.0.0:8080", "public"]
CMD ["gatsby", "serve", "--verbose", "--prefix-paths", "-p", "8080", "--host", "0.0.0.0"]
