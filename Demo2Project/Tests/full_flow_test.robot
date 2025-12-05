*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/browser.robot
Resource   ../Pages/register_page.robot
Resource   ../Pages/login_page.robot
Resource   ../Pages/product_page.robot
Resource   ../Pages/cart_page.robot

*** Variables ***
${EMAIL}      testuser@mail.com
${PASSWORD}   Test@123
${FIRST}      Test
${LAST}       User

*** Test Cases ***
Full User Flow
    Open Browser To Login Page
    Register New User    ${FIRST}    ${LAST}    ${EMAIL}    ${PASSWORD}
    Login With Credentials    ${EMAIL}    ${PASSWORD}
    Add Product To Cart
    Go To Cart
    Click Checkout
    SeleniumLibrary.Close Browser