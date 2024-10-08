# Use an official Node.js image for the build stage
FROM node:22.6.0-slim AS builder

# Create and set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy the rest of the application files
COPY . .

# Use a smaller image for the production stage
FROM node:22.6.0-slim AS production

# Set the working directory
WORKDIR /app

# Copy only the necessary files from the build stage
COPY --from=builder /app ./

# Expose the application on port 8081
EXPOSE 8081

# Start the application
CMD ["npm", "start"]
