FROM golang:1.16 AS build
WORKDIR /go/src/app
COPY ./goserver .
RUN go get -d -v ./...
RUN go build -o /go/src/appbin .

FROM golang:1.16 AS binary
COPY --from=build /go/src/appbin /go/src/appbin
CMD ["/go/src/appbin"]
