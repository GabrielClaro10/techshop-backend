FROM ghcr.io/cirruslabs/flutter:3.24.4

RUN useradd -m flutteruser

WORKDIR /app

COPY pubspec.* ./

USER flutteruser

RUN flutter pub get

COPY . .

RUN flutter build web --release

EXPOSE 8080

CMD ["flutter", "run", "-d", "web-server", "--web-port", "8080", "--web-hostname", "0.0.0.0"]
