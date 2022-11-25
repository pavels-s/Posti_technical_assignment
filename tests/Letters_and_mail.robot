*** Settings ***
Documentation   This is a testing suite of the "Letters and mail" page
Resource        ../resources/Letters_and_mail_app.robot
Resource        ../resources/Common.robot
Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

#To run the test suite:
#robot -d results tests/Letters_and_mail.robot

*** Variables ***
${BROWSER} =  chrome
${LETTERS_AND_MAILS_URL} =  https://www.posti.fi/en/private/letters-and-mail
${ACCEPT_COOKIES_BUTTON} =  id=onetrust-accept-btn-handler

*** Test Cases ***
User can send letters and mails and choosing products like without login
    [Documentation]         Products should be chosen without login
    [Tags]                  P02-3   Smoke
    Log                     Starting testing: choosing products
    Given User load "Letters and mail" page
    And User choose option "Send a letter"
    And User choose for sending Post card to Finland
    And User add stamp and postcard to the cart
    When User go the the cart to checkout
    Then User fill in all necessary information and proceed to payment


User can calculate the price of a letter
    [Documentation]         Calculation of a price
    [Tags]                  P02-4   Smoke
    Log                     Starting testing: price calculation
    Given User load "Letter price calculator" page
    When User choose Albania as a destination country
    Then User get price for suitable product

