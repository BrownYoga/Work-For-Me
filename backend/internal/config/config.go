package config

import "os"

// Config captures environment-driven settings.
type Config struct {
	Port          string
	OTLPEndpoint  string
	AllowedOrigin string
}

func FromEnv() Config {
	return Config{
		Port:          valueOrDefault("PORT", "8080"),
		OTLPEndpoint:  valueOrDefault("OTEL_EXPORTER_OTLP_ENDPOINT", "http://localhost:4318"),
		AllowedOrigin: valueOrDefault("ALLOWED_ORIGIN", "http://localhost:4200"),
	}
}

func valueOrDefault(key, fallback string) string {
	if v := os.Getenv(key); v != "" {
		return v
	}
	return fallback
}
