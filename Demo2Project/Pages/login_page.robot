*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/browser.robot

*** Variables ***
${EMAIL_INPUT}      id:Email
${PASSWORD_INPUT}   id:Password
${LOGIN_BUTTON}     xpath://input[@value='Log in']

*** Keywords ***
Input Email
    [Arguments]    ${email}
    Input Text    ${EMAIL_INPUT}    ${email}

Input Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_INPUT}    ${password}

Click Login
    Click Button    ${LOGIN_BUTTON}

Login With Credentials
    [Arguments]    ${email}    ${password}
    Input Email    ${email}
    Input Password    ${password}
    Click Login