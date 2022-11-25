*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${PARCEL_ADDRESS} =  Postin automaatti, Lidl Alppikylä Purilaskuja 1, 00774 Helsinki
${CANT_FIND_MESSAGE} =  No items could be found based on the tracking code

*** Keywords ***
Check if parcel is found
    Wait Until Page Contains    ${PARCEL_ADDRESS}

Check if parcel is not found
    Wait Until Page Contains    ${CANT_FIND_MESSAGE}