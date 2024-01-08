FROM golang:1.21.5

COPY main.go .

RUN go build -o k8slearn ./main.go

EXPOSE 8080

CMD ["./k8slearn"]