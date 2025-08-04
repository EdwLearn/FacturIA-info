# Usa imagen oficial de Node.js
FROM node:20-alpine

# Establece el directorio de trabajo
WORKDIR /app

# Copia dependencias y archivos de configuración
COPY package.json pnpm-lock.yaml ./
COPY next.config.mjs ./
COPY tailwind.config.ts postcss.config.mjs tsconfig.json ./

# Instala pnpm si lo necesitas, o usa npm/yarn
RUN npm install -g pnpm

# Instala dependencias
RUN pnpm install

# Copia el resto del proyecto
COPY . .

# Construye la app Next.js
RUN pnpm build

# Expone el puerto 3000 (por defecto para Next.js)
EXPOSE 3000

# Arranca la aplicación
CMD ["pnpm", "start"]

