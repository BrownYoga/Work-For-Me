Feature: Worker onboarding
  As a worker
  I want to register with my skills and contact details
  So that clients can find and hire me

  Scenario Outline: Registering a worker
    Given a worker named "<name>" with email "<email>" and national ID "<id>"
    When I submit the skills <skills> within <radius> km
    Then the worker profile should be created

    Examples:
      | name          | email                  | id          | skills                 | radius |
      | Lesedi Dlamini| lesedi@example.com     | 9001015800082 | ["tiling","painting"] | 20     |
      | Lungi Maseko  | lungi@example.com      | 8102024800083 | ["plumbing"]          | 15     |

  Scenario: Reject duplicate worker by email
    Given a worker named "Nomvula" with email "nomvula@example.com" and national ID "9901014800081"
    And the worker already exists
    When I submit the skills ["gardening"] within 10 km
    Then I should receive an error indicating the worker already exists
