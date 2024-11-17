# syntax=docker/dockerfile:1
ARG GO_VERSION=1.22.7

FROM golang:${GO_VERSION} AS build

WORKDIR /src

# https://docs.docker.com/build/guide/mounts/
RUN --mount=type=cache,target=/go/pkg/mod/ \
    --mount=type=bind,source=go.sum,target=go.sum \
    --mount=type=bind,source=go.mod,target=go.mod \
    go mod download -x

RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=bind,source=.,target=. \
    CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -trimpath -ldflags="-s -w" -o /bin/myapp .

FROM cgr.dev/chainguard/wolfi-base AS release

LABEL org.opencontainers.image.title="" \
      org.opencontainers.image.description="" \
      org.opencontainers.image.url=""

COPY --from=build /bin/myapp /bin

ENTRYPOINT ["/bin/myapp"]
