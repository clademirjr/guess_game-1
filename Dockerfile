# Etapa de construção
FROM node:18 AS build

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

# Definir a variável de ambiente para o backend
ENV REACT_APP_BACKEND_URL=http://localhost:5000

COPY . .
RUN npm run build

# Etapa final: servidor NGINX
FROM nginx:alpine



# Copiar os arquivos do build do frontend para o NGINX
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80

# Iniciar o servidor NGINX
CMD ["nginx", "-g", "daemon off;"]
