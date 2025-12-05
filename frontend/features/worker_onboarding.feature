Feature: Worker discovery landing
  As a client
  I want to browse workers by skill and location
  So that I can quickly hire someone nearby

  Scenario: Viewing available workers
    Given I am on the Work For Me landing page
    When I view the available workers section
    Then I should see worker cards with skills and travel radius
