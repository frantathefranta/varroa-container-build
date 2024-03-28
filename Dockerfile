# Docker image to build varroa binaries and run them in a container
FROM golang:1.21.4-alpine3.18 AS builder
ARG varroa_version
ENV varroa_version=$varroa_version

# Install ca-certificates
RUN apk add --no-cache ca-certificates

RUN wget -q -O /tmp/varroa.zip "https://gitlab.com/passelecasque/varroa/-/archive/${varroa_version}/varroa-${varroa_version}.zip" \
&& \
mkdir /app \
&& \
unzip -q -d /app /tmp/varroa.zip \
&& \
mv /app/varroa-${varroa_version}/* /app \
&& \
rm -r /app/varroa-${varroa_version}

# Set the working directory inside the container
WORKDIR /app

# Download dependencies
RUN go mod download

# Run make commands to prepare and build the binary
RUN go get -u github.com/divan/depscheck
RUN go get github.com/warmans/golocc
RUN cd cmd/varroa;CGO_ENABLED=0 go build -ldflags '-extldflags "-static"' -o /app/varroa
RUN chmod +x /app/varroa

FROM scratch
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /app/varroa /usr/bin/varroa
VOLUME /config
VOLUME /watch
VOLUME /downloads
WORKDIR /config
CMD ["/usr/bin/varroa", "start", "--no-daemon"]
