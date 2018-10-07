Feature: Book Inventory

In order to be able to keep tracl of my books
As a user
I should be able to keep an inventory of my books

  Background:
    Given I am a registered user
    And I am logged in

  Scenario: Listing books in my inventory
    Given I have populate my inventory with several books
    When I visit the homepage
    Then I should see the list of my books
