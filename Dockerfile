FROM golang:1.16 AS build
WORKDIR /go/src/app
COPY ./goserver .
RUN go get -d -v ./...
RUN env GOOS=linux go build -v -o /go/src/appbin .

FROM scratch
COPY --from=build /go/src/appbin /appbin
CMD ["/appbin"]
