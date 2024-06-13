# Stage 1: Build
FROM node:19 AS builder

# Set the working directory
WORKDIR /app

# Copy the application files
COPY . .

# Install dependencies
RUN npm install

# Stage 2: Runtime
FROM node:19-slim

# Set the working directory
WORKDIR /app

# Copy the built application files from the builder stage
COPY --from=builder /app .

# Install dependencies
RUN npm install

# Expose the application port
EXPOSE 3000

# Command to run the application
CMD ["npm", "run", "dev"]

