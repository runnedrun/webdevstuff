Feature: Create a place, assign it a title, location, description.  
  In order to make a new place
  I want to fill in the form for each attribute

  Scenario: New place
    When I make a new place
    Then fill in "location" with "hiya"