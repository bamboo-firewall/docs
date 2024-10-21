FROM debian:bullseye-slim as builder

WORKDIR /

COPY ./bamboo-apiserver /server
RUN chmod +x /server

FROM gcr.io/distroless/base-debian11

WORKDIR /

COPY --from=builder /server /server

ENTRYPOINT ["/server"]