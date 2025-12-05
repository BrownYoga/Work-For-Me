package domain

import "time"

// Worker represents a skilled individual advertising their services.
type Worker struct {
	ID          string
	Name        string
	Email       string
	Phone       string
	NationalID  string
	Skills      []string
	GeoRadiusKm int
	CreatedAt   time.Time
	UpdatedAt   time.Time
}
