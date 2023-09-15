FROM node:18

WORKDIR /cafe

# Copy pkg files 
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the code
COPY . .

# Expose port
EXPOSE 1337

# Run!
CMD ["node", "ace", "serve", "--watch"]