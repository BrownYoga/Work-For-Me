package main

import (
	"context"
	"log"
	"net/http"
	"time"

	"github.com/work-for-me/wfm/internal/adapters/repositories/memory"
	"github.com/work-for-me/wfm/internal/app/services"
	appconfig "github.com/work-for-me/wfm/internal/config"
	httpports "github.com/work-for-me/wfm/internal/ports/http"
	"github.com/work-for-me/wfm/internal/telemetry"
)

func main() {
	cfg := appconfig.FromEnv()
	ctx := context.Background()

	shutdown := telemetry.InitTracer(ctx, "wfm-api", cfg.OTLPEndpoint)
	defer func() {
		_ = shutdown(ctx)
	}()

	repo := memory.NewWorkerRepository()
	service := services.NewWorkerService(repo)
	handler := httpports.NewWorkerHandler(service)

	mux := http.NewServeMux()
	mux.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		_, _ = w.Write([]byte("ok"))
	})
	mux.Handle("/api/workers", http.HandlerFunc(handler.Register))

	srv := &http.Server{
		Addr:         ":" + cfg.Port,
		Handler:      telemetry.HTTPMiddleware(cors(cfg.AllowedOrigin, mux)),
		ReadTimeout:  5 * time.Second,
		WriteTimeout: 10 * time.Second,
	}

	log.Printf("wfm api listening on %s", cfg.Port)
	if err := srv.ListenAndServe(); err != nil && err != http.ErrServerClosed {
		log.Fatalf("server failed: %v", err)
	}
}

func cors(origin string, next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Access-Control-Allow-Origin", origin)
		w.Header().Set("Access-Control-Allow-Methods", "GET,POST,OPTIONS")
		w.Header().Set("Access-Control-Allow-Headers", "Content-Type, Authorization")

		if r.Method == http.MethodOptions {
			w.WriteHeader(http.StatusNoContent)
			return
		}
		next.ServeHTTP(w, r)
	})
}
