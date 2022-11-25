*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${FIRSTNAME_FIELD} =   id=billing-firstname-field
${FIRSTNAME} =  testname
${LASTNAME_FIELD} =   id=billing-lastname-field
${LASTNAME} =   testlastname
${ADDRESS_FIELD} =   id=billing-domestic-address-search
${ADDRESS} =   00002 Helsinki
${DROPDOWN_ADDRESS} =   xpath=//*[text()='00002 HELSINKI']
${EMAIL_FIELD} =   id=billing-email-field
${EMAIL} =   test@test.com
${CHECKOUT_BUTTON} =   id=checkoutNexBtn



*** Keywords ***
Fill in information
    Input Text      ${FIRSTNAME_FIELD}     ${FIRSTNAME}
    Input Text      ${LASTNAME_FIELD}    ${LASTNAME}
    Input Text      ${ADDRESS_FIELD}    ${ADDRESS}
    Sleep           3s
    Click Element   ${DROPDOWN_ADDRESS}
    Input Text      ${EMAIL_FIELD}    ${EMAIL}
    Sleep           3s
    
Proceed to payment page
    Click Button                ${CHECKOUT_BUTTON}

Verify payment page is loaded
    Wait Until Page Contains    Select payment method