FROM node:20-slim

# تثبيت poppler-utils (pdftoppm + pdfinfo)
RUN apt-get update && apt-get install -y \
    poppler-utils \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./
RUN npm install --omit=dev

COPY . .

EXPOSE 4000

CMD ["node", "index.js"]
