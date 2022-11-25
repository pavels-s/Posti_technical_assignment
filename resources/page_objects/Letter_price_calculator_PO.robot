*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${CALCULATOR_PAGE_URL} =   https://www.posti.fi/en/private/letters-and-mail/send-a-letter-or-postcard/letter-price-calculator
${CALCULATOR_MAIN_HEADING} =   Letter price calculator
${ACTUAL_PRICE_FIELD} =   xpath=//*[@id="main"]/div[2]/div/div[2]/section/div[2]/div[1]/div/div[2]/div[2]/div[2]/div/span/data[2]
${EXPECTED_PRICE} =   2,25 €
${INPUT_COUNTRY_FIELD} =   xpath=//input[@id='destinationCountry']
${COUNRTY_FOR_INPUT} =   Albania
${COUNTRY_FROM_DROPDOWN} =   xpath=//li[@class='sc-ect1d1-0 jLPmIY']
${INPUT_LETTERWEIGHT_FIELD} =   name=letterWeight
${LETTERWEIGHT_FROM_DROPDOWN} =   xpath=//span[@class='sc-ect1d1-1 cKZCxS']
${LETTER_THICKNESS_CHECKBOX} =   xpath=//input[@aria-label='Max thickness/depth 3 cm']
${ADDITIONAL_SERVICES_CHECKBOX} =   xpath=//input[@aria-label='I need additional services / I am sending valuables']
${SUBMIT_BUTTON} =   xpath=//button[@type='submit']

*** Keywords ***
Load calculator page
    Go To                       ${CALCULATOR_PAGE_URL}
    Sleep                       2s
    Click Button                ${ACCEPT_COOKIES_BUTTON}

Verify calculator page is loaded
    Wait Until Page Contains    ${CALCULATOR_MAIN_HEADING}

Choose country in a list
    Run Keyword And Ignore Error  Scroll Element Into View          xpath=//h2[@class='sc-1ypvmfj-0 sc-4h7obl-4 kOjhpy']
    Input Text                          ${INPUT_COUNTRY_FIELD}      ${COUNRTY_FOR_INPUT}
    Wait Until Element Is Visible       ${SUBMIT_BUTTON}
    Click Element                       ${COUNTRY_FROM_DROPDOWN}
    Sleep                               1s
    Click Element                       ${INPUT_LETTERWEIGHT_FIELD}
    Sleep                               1s
    Click Element                       ${LETTERWEIGHT_FROM_DROPDOWN}
    Checkbox Should Be Selected         ${LETTER_THICKNESS_CHECKBOX}
    Checkbox Should Not Be Selected     ${ADDITIONAL_SERVICES_CHECKBOX}
    Sleep                               2s

Submit your choice
    Wait Until Element Is Visible       ${SUBMIT_BUTTON}
    Click Button                        ${SUBMIT_BUTTON}
    Sleep                               2s

Verify a price
    ${ACTUAL_PRICE} =     Get Text             ${ACTUAL_PRICE_FIELD}
    Should Be Equal       ${ACTUAL_PRICE}      ${EXPECTED_PRICE}