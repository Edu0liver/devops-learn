package main

import (
	"fmt"
	"net/http"
	"os"
	"time"
)

var startedAt = time.Now()

func main() {
	http.HandleFunc("/", handler)
	http.HandleFunc("/configmap", ConfigMap)
	http.HandleFunc("/secret", Secret)
	http.HandleFunc("/healthz", Healthz)

	http.ListenAndServe(":8080", nil)
}

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello %s", os.Getenv("NAME"))
}

func ConfigMap(w http.ResponseWriter, r *http.Request) {
	data, err := os.ReadFile("/go/myfamily/family.txt")
	if err != nil {
		panic(err)
	}

	fmt.Fprintf(w, "My Family: %s.", string(data))
}

func Secret(w http.ResponseWriter, r *http.Request) {
	user := os.Getenv("USER")
	password := os.Getenv("PASSWORD")
	fmt.Fprintf(w, "User: %s. Password: %s", user, password)
}

func Healthz(w http.ResponseWriter, r *http.Request) {
	duration := time.Since(startedAt)

	if duration.Seconds() < 10 {
		w.WriteHeader(500)
		w.Write([]byte(fmt.Sprintf("Duration: %v", duration.Seconds())))
	} else {
		w.WriteHeader(200)
		w.Write([]byte("ok"))
	}
}