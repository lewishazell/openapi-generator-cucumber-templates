Feature: PetStore API
    In order to programatically manage pets at the pet store
    As a developer
    I need to call pet store endpoints

    Scenario: I request to find a pet at the pet store
        Given there is a "findPetById" request
        And the request has a parameter "id" with a value of "1"
        When the request is sent
        Then the response status is 200

    Scenario: I request to delete a pet from the pet store
        Given there is a "deletePet" request
        And the request has a parameter "id" with a value of "1"
        When the request is sent
        Then the response status is 204

    Scenario: I request a list of all pets at the pet store with a matching tag
        Given there is a "findPets" request
        And the request has a parameter "tags" containing:
            | cat |
            | dog |
        And the request has a parameter "limit" with a value of "2"
        When the request is sent
        Then the response status is 200

    Scenario: I request a list of all pets at the pet store with a matching tag with no limit
        Given there is a "findPets" request
        And the request has a parameter "tags" containing:
            | cat |
            | dog |
        When the request is sent
        Then the response status is 200

    Scenario: I request to add a pet to the pet store
        Given there is an "addPet" request
        And the request has a parameter "petDetails" with a value of:
            """json
            {
                "name": "Pickle",
                "tag": "cat"
            }
            """
        When the request is sent
        Then the response status is 200