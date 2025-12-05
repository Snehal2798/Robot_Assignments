*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}       https://www.automationexercise.com/login
${BROWSER}   chrome

*** Test Cases ***
NewUserSignup
    Open Browser    ${URL}   ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    xpath://input[@data-qa='signup-name']    timeout=10s
    Input Text    xpath://input[@data-qa='signup-name']    Snehal Test
    Input Text    xpath://input[@data-qa='signup-email']   snehaltest123@gmail.com
    Click Button  xpath://button[@data-qa='signup-button']
    Sleep    3s
    Close Browser