# Usar una imagen base de Python
FROM python:3.9-slim

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar los archivos de la carpeta `html` que contienen el código de la app
COPY html/ /app/

# Instalar las dependencias necesarias para la app Flask
RUN pip install --no-cache-dir -r /app/requirements.txt

# Exponer el puerto en el que Flask estará sirviendo la app
EXPOSE 5000

# Comando para ejecutar Flask
CMD ["python", "app.py"]
