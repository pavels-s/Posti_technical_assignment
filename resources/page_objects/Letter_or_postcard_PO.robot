*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${POSTCARD_TO_FINDAND_BUTTON} =   xpath=//*[text()='Post card to Finland']

*** Keywords ***
Choose postcard to Finland
    Sleep                                                       2s
    Run Keyword And Ignore Error  Scroll Element Into View      xpath=//div[@id='when-will-my-letter-arrive-at-its-destination']
    Sleep                                                       1s
    Click Element                                               ${POSTCARD_TO_FINDAND_BUTTON}

Verify stamps page is loaded
    ${handles} =  Get Window Handles
    Switch Window               ${handles}[1]
    Wait Until Page Contains    Category        timeout=15

