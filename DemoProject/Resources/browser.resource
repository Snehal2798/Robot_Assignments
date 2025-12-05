*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Browser To Login Page
    Open Browser    https://www.automationexercise.com/login    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    xpath://button[@data-qa='signup-button']    10s

Close Browser Session
    Close Browser