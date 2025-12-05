Feature: Worker discovery landing
  As a client
  I want to browse workers by skill and location
  So that I can quickly hire someone nearby

  Scenario: Viewing available workers
    Given I am on the Work For Me landing page
    When I view the available workers section
    Then I should see worker cards with skills and travel radius

  Scenario: Exploring the new hero and quick filters
    Given I am on the Work For Me landing page
    When I look at the hero banner
    Then I should see calls to post a job request and browse categories
    And I can review quick filter cards to jump into popular categories
