# Use the official Node.js image as the base
FROM node:22.8.0-bookworm-slim AS builder

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install --production

# Copy the application code
COPY server.js ./

# Expose the port the app runs on
EXPOSE 8081

# Start the application
CMD ["npm", "start"]
