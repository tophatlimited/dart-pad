ARG PROJECT_ID
ARG FLUTTER_CHANNEL
ARG BUILD_SHA

FROM thl/flutter:latest

WORKDIR /
COPY . .

WORKDIR /pkgs/dart_services

RUN dart pub get
RUN dart compile exe bin/server.dart -o bin/server

RUN dart run grinder build-project-templates

ENV BUILD_SHA=$BUILD_SHA

EXPOSE 8080
CMD ["/app/bin/server"]
