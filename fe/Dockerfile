# pull official base image
FROM node:20

# Set the working directory to /app inside the container
WORKDIR /app

COPY . .

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# ==== BUILD =====
# Install dependencies (npm ci makes sure the exact versions in the lockfile gets installed)
RUN npm install 
# Build the app
RUN npm run build
RUN npm install --global -y serve
# ==== RUN =======
# Set the env to "production"
ENV NODE_ENV production
# Expose the port on which the app will be running (3000 is the default that `serve` uses)
EXPOSE 3000
# Start the app
CMD [ "serve", "-s", "build" ]