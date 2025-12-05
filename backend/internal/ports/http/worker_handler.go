package http

import (
	"encoding/json"
	"net/http"

	"github.com/work-for-me/wfm/internal/app/services"
)

// WorkerHandler exposes REST endpoints for worker onboarding.
type WorkerHandler struct {
	service *services.WorkerService
}

func NewWorkerHandler(service *services.WorkerService) *WorkerHandler {
	return &WorkerHandler{service: service}
}

// Register handles POST /api/workers requests.
type registerWorkerRequest struct {
	Name       string   `json:"name"`
	Email      string   `json:"email"`
	Phone      string   `json:"phone"`
	NationalID string   `json:"nationalId"`
	Skills     []string `json:"skills"`
	GeoRadius  int      `json:"geoRadiusKm"`
}

func (h *WorkerHandler) Register(w http.ResponseWriter, r *http.Request) {
	var req registerWorkerRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, "invalid payload", http.StatusBadRequest)
		return
	}

	worker, err := h.service.RegisterWorker(r.Context(), req.Name, req.Email, req.Phone, req.NationalID, req.Skills, req.GeoRadius)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusCreated)
	_ = json.NewEncoder(w).Encode(worker)
}
