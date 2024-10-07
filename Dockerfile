# Use an official Node.js image
FROM node:14

# Create and set the working directory
WORKDIR /app

# Copy the package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the application on port 8081
EXPOSE 8081

# Start the application
CMD ["npm", "start"]
