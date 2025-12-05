*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/browser.robot

*** Variables ***
${ADD_TO_CART_BTN}   xpath://input[contains(@value,'Add to cart')]

*** Keywords ***
Add Product To Cart
    Click Button    ${ADD_TO_CART_BTN}