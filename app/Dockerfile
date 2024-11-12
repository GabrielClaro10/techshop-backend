# Imagem base com PHP
FROM php:8.1-apache

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos de configuração do projeto (como composer.json, se estiver usando Composer)
COPY ../../composer.json ./

# Instala as dependências com o Composer, caso necessário
RUN apt-get update && apt-get install -y git unzip \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer install

# Copia os arquivos do projeto para a imagem
COPY . .

# Expõe a porta 80 para acesso HTTP
EXPOSE 80

# Comando para iniciar o servidor Apache
CMD ["apache2-foreground"]
