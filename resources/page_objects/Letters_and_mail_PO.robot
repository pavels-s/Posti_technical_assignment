*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${SEND_LETTER_BUTTON} =   xpath=//button[@aria-label='Send a letter']
${PAGE_HEADER} =   Letters and mail
${LETTER_AND_POSTCARD_HEADER} =   Send a letter or postcard

*** Keywords ***
Load page
    Go To                       ${LETTERS_AND_MAILS_URL}
    Sleep                       1s
    Click Button                ${ACCEPT_COOKIES_BUTTON}

Verify letters and mails page loaded
    Wait Until Page Contains    ${PAGE_HEADER}

To Send a letter
    Run Keyword And Ignore Error  Scroll Element Into View      xpath=//div[@class='a8mvof-1 jhZyIX']
    Sleep                                                       1s
    Click Element                                               ${SEND_LETTER_BUTTON}

Verify letter and postcard page loaded
    Wait Until Page Contains     ${LETTER_AND_POSTCARD_HEADER}