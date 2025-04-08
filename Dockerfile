#Base image
FROM node:20

# Set working directory inside container
WORKDIR /app

# Copy dependency files first (layer caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy remaining app files
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# start app
CMD ["npm", "start"]