# Specify the first base image
FROM node:10-alpine as builder

# Install dependencies
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .

# execute run command
RUN npm run build

# Specify the second base image
FROM nginx

# copy over the result of "npm run build"
COPY --from=builder /app/build /usr/share/nginx/html

