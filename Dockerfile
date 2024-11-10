FROM ghcr.io/cirruslabs/flutter:3.24.4

WORKDIR /app

COPY pubspec.* ./

RUN flutter pub get

COPY . .

RUN flutter build web

EXPOSE 8080

CMD ["flutter", "run", "-d", "web-server", "--web-port", "8080", "--web-hostname", "0.0.0.0"]
