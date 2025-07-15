FROM node:23

# Optional: Set timezone and update base packages
ENV TZ=Asia/Colombo

RUN apt-get update && \
    apt-get install -y \
        ffmpeg \
        imagemagick \
        webp && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package.json ./

RUN npm install && npm install -g qrcode-terminal pm2

# Copy all app source
COPY . .

# Expose port (change if needed)
EXPOSE 5000

# Start app
CMD ["npm", "start"]
