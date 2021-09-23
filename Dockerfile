FROM node:alpine as builder
# el builder es como un alias para referirse a la imagen

WORKDIR '/app'

COPY package.json .
RUN npm install 
COPY . .
RUN npm run build

# /app/build <--- acá estará todo lo que neceistamos para producción, nada mas importa

# la fase del run 
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html




