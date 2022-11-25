*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${PROCEED_TO_CHECKOUT_BUTTON} =     xpath=//span[@class='sc-y6ox3a-1 djhntP']
${TOTAL_FIELD} =    xpath=//h3[@id='cart-totals-total-value']
${EXPECTED_TOTAL} =    29.95 €

*** Keywords ***
Verify total
    ${ACTUAL_TOTAL} =     Get Text             ${TOTAL_FIELD}
    Should Be Equal       ${ACTUAL_TOTAL}      ${EXPECTED_TOTAL}

Proceed to checkout
    Click Element               ${PROCEED_TO_CHECKOUT_BUTTON}
    Sleep                       3s
    
Verify checkout page is loaded
    Wait Until Page Contains    Your information