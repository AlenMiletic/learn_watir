Feature: Testing Web 0.1

    Scenario: Learning about frames
        Given I am on the frames page
        When I send the text "frames are not my friend"
        Then the receiver should have "frames are not my friend"
