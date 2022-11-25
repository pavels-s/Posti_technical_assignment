*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${ADD_TO_CART_BUTTON} =   xpath=//button[@data-testid='add-0114381-10-to-cart-button']
${POSTCARDS_BUTTON} =   xpath=//a[@href="/en/category/postcards"]
${ADD_POSTCARD_TO_CART_BUTTON} =   xpath=//button[@data-testid='add-0112288-to-cart-button']
${GO_TO_CART_BUTTON} =   xpath=//span[@class='CartButton__Label-sc-e8t2bo-0 krErWi']

*** Keywords ***
Add stamp to cart
    Scroll Element Into View    ${ADD_TO_CART_BUTTON}
    Sleep                       5s
    Click Button                ${ADD_TO_CART_BUTTON}
    Sleep                       5s
    
Choose postcards section
    Click Element               ${POSTCARDS_BUTTON}
    Sleep                       3s

Add postcard to cart
    Click Button                ${ADD_POSTCARD_TO_CART_BUTTON}
    Sleep                       3s

Go to cart
    Click Element               ${GO_TO_CART_BUTTON}
    Sleep                       5s
    Wait Until Page Contains    Summary           timeout=10

