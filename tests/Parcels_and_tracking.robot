*** Settings ***
Documentation   This is a testing suite of the "parcels and tracking" page
Resource        ../resources/Parcels_and_tracking_app.robot
Resource        ../resources/Common.robot
Test Setup      Common.Begin Web Test
Test Teardown   Common.End Web Test

#To run the test suite:
#robot -d results tests/Parcels_and_tracking.robot

*** Variables ***
${BROWSER} =  chrome
${PARCELS_AND_TRACKING_URL} =     https://www.posti.fi/en/private/parcels-and-tracking
${CORRECT_TRACKING_NR} =   CF753732593DE
${LETTERS_AND_MAILS_URL} =   https://www.posti.fi/en/private/letters-and-mail
${ACCEPT_COOKIES_BUTTON} =   id=onetrust-accept-btn-handler

*** Test Cases ***
User can track the parcels without logging in
    [Documentation]         Testing data for tracking: CF753732593DE
    [Tags]                  P02-1   Smoke
    Log                     Starting testing: tracking without logging in
    Given User load "parcels and tracking" page
    When User search for correct parcel
    Then The correct parcel is found


Application must display a notice if shipments are not found
    [Documentation]         Error notice if shipments are not found: “No items could be found based on the tracking code”
    [Tags]                  P02-2   Smoke
    Log                     Starting testing: can't find items
    Given User load "parcels and tracking" page
    When User search for incorrect parcel
    Then The incorrect parcel is not found


