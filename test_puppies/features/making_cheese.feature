Feature: Making Cheese
    As a cheese maker
    I want to make cheese
    so I can share my cheesiness

    Scenario: using the cheese machine
        Given I have no cheese
        When I press the make cheese button
        Then I should have 1 piece of cheese
