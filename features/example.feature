Feature: Example

  Scenario: Approving a new Position
    Given I am a Universal Container recruiter
    When I send a new position for approval
    And my manager approves it
    Then then the position is approved

  Scenario: Calculating Review Scores
    Given a job application for a position
    When I write a review for the application
    And another interviewer writes a review
    Then the job application is updated with the number of reviews
    And the job application is updated with the average score of the reviews

  Scenario: Assigning a position from the queue

