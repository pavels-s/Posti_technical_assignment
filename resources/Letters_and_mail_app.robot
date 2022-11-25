*** Settings ***
Library         SeleniumLibrary
Resource        ../resources/page_objects/Letters_and_mail_PO.robot
Resource        ../resources/page_objects/Letter_or_postcard_PO.robot
Resource        ../resources/page_objects/Stamps_PO.robot
Resource        ../resources/page_objects/Checkout_PO.robot
Resource        ../resources/page_objects/Cart_PO.robot
Resource        ../resources/page_objects/Letter_price_calculator_PO.robot

*** Keywords ***
User load "Letters and mail" page
    Letters_and_mail_PO.Load page
    Letters_and_mail_PO.Verify letters and mails page loaded

User choose option "Send a letter"
    Letters_and_mail_PO.To Send a letter
    Letters_and_mail_PO.Verify letter and postcard page loaded

User choose for sending Post card to Finland
    Letter_or_postcard_PO.Choose postcard to Finland
    Letter_or_postcard_PO.Verify stamps page is loaded

User add stamp and postcard to the cart
    Stamps_PO.Add stamp to cart
    Stamps_PO.Choose postcards section
    Stamps_PO.Add postcard to cart

User go the the cart to checkout
    Stamps_PO.Go to cart
    Cart_PO.Verify total
    Cart_PO.Proceed to checkout
    Cart_PO.Verify checkout page is loaded

User fill in all necessary information and proceed to payment
    Checkout_PO.Fill in information
    Checkout_PO.Proceed to payment page
    Checkout_PO.Verify payment page is loaded

User load "Letter price calculator" page
    Letter_price_calculator_PO.Load calculator page
    Letter_price_calculator_PO.Verify calculator page is loaded

User choose Albania as a destination country
    Letter_price_calculator_PO.Fill in necessary information
    Letter_price_calculator_PO.Submit your choice

User get price for suitable product
    Letter_price_calculator_PO.Verify a price