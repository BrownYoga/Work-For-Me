package features

import (
	"context"
	"encoding/json"
	"strings"
	"testing"

	"github.com/cucumber/godog"
	"github.com/work-for-me/wfm/internal/adapters/repositories/memory"
	"github.com/work-for-me/wfm/internal/app/services"
)

type workerFeature struct {
	repo    *memory.WorkerRepository
	service *services.WorkerService
	err     error
}

func (f *workerFeature) resetScenario(*godog.Scenario) {
	f.repo = memory.NewWorkerRepository()
	f.service = services.NewWorkerService(f.repo)
	f.err = nil
}

func (f *workerFeature) aWorkerNamedWithEmailAndNationalID(name, email, id string) error {
	_, f.err = f.service.RegisterWorker(context.Background(), name, email, "", id, []string{}, 0)
	return nil
}

func (f *workerFeature) theWorkerAlreadyExists() error {
	return nil
}

func (f *workerFeature) iSubmitTheSkillsWithinKm(skillsText string, radius int) error {
	// parse skills from the table value (e.g. ["tiling","painting"])
	var skills []string
	_ = json.NewDecoder(strings.NewReader(skillsText)).Decode(&skills)
	_, f.err = f.service.RegisterWorker(context.Background(), "", "", "", "", skills, radius)
	return nil
}

func (f *workerFeature) theWorkerProfileShouldBeCreated() error {
	if f.err != nil {
		return f.err
	}
	return nil
}

func (f *workerFeature) iShouldReceiveAnErrorIndicatingTheWorkerAlreadyExists() error {
	if f.err == nil {
		return godog.ErrPending
	}
	return nil
}

func InitializeScenario(ctx *godog.ScenarioContext) {
	f := &workerFeature{}
	ctx.BeforeScenario(f.resetScenario)

	ctx.Step(`^a worker named "([^"]*)" with email "([^"]*)" and national ID "([^"]*)"$`, f.aWorkerNamedWithEmailAndNationalID)
	ctx.Step(`^the worker already exists$`, f.theWorkerAlreadyExists)
	ctx.Step(`^I submit the skills (.*) within (\d+) km$`, f.iSubmitTheSkillsWithinKm)
	ctx.Step(`^the worker profile should be created$`, f.theWorkerProfileShouldBeCreated)
	ctx.Step(`^I should receive an error indicating the worker already exists$`, f.iShouldReceiveAnErrorIndicatingTheWorkerAlreadyExists)
}

func TestFeatures(t *testing.T) {
	suite := godog.TestSuite{
		ScenarioInitializer: InitializeScenario,
		Options: &godog.Options{
			Format:   "pretty",
			Strict:   true,
			Paths:    []string{"worker_registration.feature"},
			TestingT: t,
		},
	}

	if suite.Run() != 0 {
		t.Fatal("bdd scenarios failed")
	}
}
