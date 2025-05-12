FROM node:21-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm install

COPY . .
COPY prisma ./prisma

RUN npx prisma generate
RUN npm run build

# Etapa 2: Execução
FROM node:21-alpine
WORKDIR /app

COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/prisma ./prisma
# Copia os arquivos gerados do Prisma Client
COPY --from=builder /app/node_modules/.prisma ./node_modules/.prisma
COPY --from=builder /app/node_modules/@prisma ./node_modules/@prisma

RUN npm install --omit=dev

EXPOSE 3000
CMD ["node", "dist/main"]