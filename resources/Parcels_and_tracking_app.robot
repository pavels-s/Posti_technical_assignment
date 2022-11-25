*** Settings ***
Library         SeleniumLibrary
Resource        ../resources/page_objects/Parcels_and_tracking_PO.robot
Resource        ../resources/page_objects/Item_tracking_PO.robot

*** Keywords ***
User load "parcels and tracking" page
    Parcels_and_tracking_PO.Load page
    Parcels_and_tracking_PO.Verify page loaded

User search for correct parcel
    Parcels_and_tracking_PO.Search a correct parcel

User search for incorrect parcel
    Parcels_and_tracking_PO.Search an incorrect parcel

The correct parcel is found
    Item_tracking_PO.Check if parcel is found

The incorrect parcel is not found
    Item_tracking_PO.Check if parcel is not found

