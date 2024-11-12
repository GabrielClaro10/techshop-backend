FROM php:8.1-apache

# Atualiza o sistema e instala dependências necessárias
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    curl \
    ca-certificates \
    && apt-get install -y composer


# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos de configuração do projeto
COPY composer.json ./

# Copia os arquivos do projeto para a imagem
COPY . .

# Expõe a porta 80 para acesso HTTP
EXPOSE 80

# Comando para iniciar o servidor Apache
CMD ["apache2-foreground"]
