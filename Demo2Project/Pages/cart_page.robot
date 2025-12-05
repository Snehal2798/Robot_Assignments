*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/browser.robot

*** Variables ***
${CART_LINK}     xpath://a[@href='/cart']
${CHECKOUT_BTN}  id:checkout

*** Keywords ***
Go To Cart
    Click Link    ${CART_LINK}

Click Checkout
    Click Button    ${CHECKOUT_BTN}