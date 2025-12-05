package memory

import (
	"context"
	"errors"
	"sync"

	"github.com/work-for-me/wfm/internal/domain"
)

// WorkerRepository is an in-memory implementation suitable for local dev and tests.
type WorkerRepository struct {
	mu      sync.RWMutex
	workers map[string]domain.Worker
}

func NewWorkerRepository() *WorkerRepository {
	return &WorkerRepository{workers: make(map[string]domain.Worker)}
}

func (r *WorkerRepository) Create(ctx context.Context, worker domain.Worker) error {
	r.mu.Lock()
	defer r.mu.Unlock()

	if _, ok := r.workers[worker.Email]; ok {
		return errors.New("worker already exists")
	}

	r.workers[worker.Email] = worker
	return nil
}

func (r *WorkerRepository) GetByEmail(ctx context.Context, email string) (domain.Worker, error) {
	r.mu.RLock()
	defer r.mu.RUnlock()

	worker, ok := r.workers[email]
	if !ok {
		return domain.Worker{}, errors.New("not found")
	}
	return worker, nil
}

func (r *WorkerRepository) List(_ context.Context) []domain.Worker {
	r.mu.RLock()
	defer r.mu.RUnlock()

	out := make([]domain.Worker, 0, len(r.workers))
	for _, w := range r.workers {
		out = append(out, w)
	}
	return out
}
