# Use a imagem oficial do PHP com Apache
FROM php:8.1-apache

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia o arquivo composer.json e composer.lock da raiz do projeto para o container
COPY composer.json composer.lock ./

# Instala o Composer
RUN apt-get update && \
    apt-get install -y zip unzip && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer install --no-scripts --no-autoloader

# Copia todos os arquivos do projeto para o container
COPY . .

# Roda o autoload do Composer
RUN composer dump-autoload --optimize

# Exponha a porta 80 (HTTP)
EXPOSE 8080

# Comando para iniciar o servidor Apache
CMD ["apache2-foreground"]
