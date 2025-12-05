package services

import (
	"context"
	"errors"
	"time"

	"github.com/google/uuid"

	"github.com/work-for-me/wfm/internal/domain"
)

// WorkerRepository defines persistence operations for workers.
type WorkerRepository interface {
	Create(ctx context.Context, worker domain.Worker) error
	GetByEmail(ctx context.Context, email string) (domain.Worker, error)
}

// WorkerService coordinates worker onboarding logic.
type WorkerService struct {
	repo WorkerRepository
}

func NewWorkerService(repo WorkerRepository) *WorkerService {
	return &WorkerService{repo: repo}
}

// RegisterWorker creates a new worker after performing simple validation.
func (s *WorkerService) RegisterWorker(ctx context.Context, name, email, phone, nationalID string, skills []string, geoRadius int) (domain.Worker, error) {
	if name == "" || email == "" || nationalID == "" {
		return domain.Worker{}, errors.New("name, email, and national ID are required")
	}
	existing, err := s.repo.GetByEmail(ctx, email)
	if err == nil && existing.ID != "" {
		return domain.Worker{}, errors.New("worker already exists")
	}

	worker := domain.Worker{
		ID:          uuid.NewString(),
		Name:        name,
		Email:       email,
		Phone:       phone,
		NationalID:  nationalID,
		Skills:      skills,
		GeoRadiusKm: geoRadius,
		CreatedAt:   time.Now().UTC(),
		UpdatedAt:   time.Now().UTC(),
	}

	if err := s.repo.Create(ctx, worker); err != nil {
		return domain.Worker{}, err
	}
	return worker, nil
}
