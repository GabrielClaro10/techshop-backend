# Imagem base com PHP
FROM php:8.1-apache

# Define o diretório de trabalho
WORKDIR /app

# Atualiza os pacotes do sistema e instala as dependências necessárias
RUN apt-get clean && apt-get update && apt-get install -y --no-install-recommends \
    git \
    unzip \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Instala o Composer diretamente do instalador oficial
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copia os arquivos de configuração do projeto (como composer.json)
COPY composer.json ./

# Instala as dependências do projeto usando o Composer
RUN composer install --no-scripts --no-autoloader

# Copia todos os arquivos do projeto para o contêiner
COPY . .

# Expõe a porta 80 para acesso HTTP
EXPOSE 80

# Comando para iniciar o servidor Apache
CMD ["apache2-foreground"]
