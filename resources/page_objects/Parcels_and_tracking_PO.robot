*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${MAIN_HEADING} =  Parcels and tracking
${SEARCH_FIELD} =  id=tracking-4L0s1sxWYTmLUXUiIotVLC-en-US
${SEARCH_BUTTON} =  xpath=//button[@class='sc-1ux7fz4-0 cJpSWm']

*** Keywords ***
Load page
    Go To                       ${PARCELS_AND_TRACKING_URL}
    Sleep                       2s
    Click Button                ${ACCEPT_COOKIES_BUTTON}

Verify page loaded
    Wait Until Page Contains    ${MAIN_HEADING}

Search a correct parcel
    Input Text                  ${SEARCH_FIELD}         text=${CORRECT_TRACKING_NR}
    Sleep                       2s
    Click Element               ${SEARCH_BUTTON}

Search an incorrect parcel
    Input Text                  ${SEARCH_FIELD}         text=testtesttest
    Sleep                       2s
    Click Element               ${SEARCH_BUTTON}