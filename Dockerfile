# Sync the APIs
FROM node:lts-alpine as portal-api-sync

WORKDIR /
RUN mkdir static-api
COPY .env /.env

WORKDIR /app

COPY ./portal-api-sync ./

RUN npm install

RUN npm run sync


# Build the docs
FROM squidfunk/mkdocs-material:9.5 AS docs-builder

COPY ./docs ./docs
COPY mkdocs.yml .

RUN mkdocs build --site-dir=static-docs

# Build the server
FROM golang:alpine AS server-builder
# Set necessary environmet variables needed for our image
ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

WORKDIR /app

COPY ./server ./

RUN go mod download
# Git is required for fetching the dependencies.
RUN #apk add --no-cache ca-certificates git

# build server
WORKDIR /app/cmd
RUN go build -ldflags="-extldflags=-static" -o dev-portal .

WORKDIR /dist
RUN cp /app/cmd/dev-portal .

# Build the client
FROM node:lts-alpine as client-builder

WORKDIR /app

COPY ./client ./

RUN npm install

RUN npm run build

# Bundle output of previous builds into final, small image
FROM alpine:latest
# Git is required for fetching the dependencies.
RUN #apk add --no-cache ca-certificates git

# Bundle all the static resource into the image
COPY --from=portal-api-sync /static-api /static-api
COPY --from=docs-builder /docs/static-docs /static-docs
COPY --from=server-builder /dist /server/cmd
COPY --from=client-builder /static /static
EXPOSE 3000
ENTRYPOINT ["/server/cmd/dev-portal"]
