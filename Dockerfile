FROM ghcr.io/cirruslabs/flutter:3.24.4

# Cria o usuário flutteruser
RUN useradd -m flutteruser

# Define o diretório de trabalho
WORKDIR /app

# Copia o arquivo pubspec.* necessário para instalar dependências
COPY pubspec.* ./

# Define o usuário flutteruser para as próximas etapas
USER flutteruser

# Adiciona a exceção de segurança do Git para o diretório do Flutter
RUN git config --global --add safe.directory /sdks/flutter

# Executa o Flutter Doctor para garantir que o ambiente esteja correto
RUN flutter doctor

# Executa o comando flutter pub get para instalar as dependências
RUN flutter pub get

# Copia o restante dos arquivos da aplicação
COPY . .

# Executa o build do Flutter para gerar a versão release
RUN flutter build web --release

# Expondo a porta para o servidor web
EXPOSE 8080

# Comando padrão para rodar a aplicação no servidor web
CMD ["flutter", "run", "-d", "web-server", "--web-port", "8080", "--web-hostname", "0.0.0.0"]
