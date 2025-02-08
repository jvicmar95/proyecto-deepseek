# Usar una imagen base de nginx
FROM nginx:alpine

# Copiar los archivos de la carpeta 'html' a la carpeta de nginx
COPY html/ /usr/share/nginx/html/

# Exponer el puerto 80 para servir la aplicación
EXPOSE 80

# No es necesario el CMD porque nginx lo hace por defecto