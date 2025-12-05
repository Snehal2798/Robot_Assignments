*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        https://demowebshop.tricentis.com/

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}login    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5s

Close Browser
    Close Browser