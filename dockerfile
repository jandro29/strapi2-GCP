FROM node:18-alpine

WORKDIR /opt/app

# Copiar package.json y lock para instalar dependencias
COPY package*.json ./

RUN npm install

# Copiar todo el código
COPY . .

# Construir Strapi (admin panel, etc.)
RUN npm run build

# Cambiar permisos de la carpeta de la app
RUN chown -R node:node /opt/app

# Usar el usuario "node" (evita problemas de permisos)
USER node

EXPOSE 1337

CMD ["npm", "run", "start"]
