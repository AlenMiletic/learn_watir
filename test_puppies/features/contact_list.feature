Feature: Validating one phone number

    Scenario: find a phone number from a collection
        Given I have a phone book:
            |name| |phone|
            |Cheezy||555-1234|
            |Sneezy||999-5555|
            |Weezy||555-4321|
            |Tizy||999-4444|
            |Lizy||666-5432|
        When I look up  the phone number for "Weezy"
        Then I should see the phone number "555-4321"
