FROM nginx:alpine
COPY html/index.html /usr/share/nginx/html/index.html
COPY html/styles.css /usr/share/nginx/html/styles.css
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]