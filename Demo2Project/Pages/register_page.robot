*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/browser.robot

*** Variables ***
${FIRST_NAME}     id:FirstName      timeout=10s
${LAST_NAME}      id:LastName
${EMAIL}          id:Email
${PASSWORD}       id:Password
${CONFIRM_PASS}   id:ConfirmPassword
${REGISTER_BTN}    xpath=//a[@href='/register']

*** Keywords ***
Input Registration Details
    Input Text     ${FIRST_NAME}     ${first}
    Input Text    ${LAST_NAME}     ${last}
    Input Text    ${EMAIL}         ${email}
    Input Text    ${PASSWORD}      ${password}
    Input Text    ${CONFIRM_PASS}  ${password}

Click Register
    Click Button    ${REGISTER_BTN}

Register New User
    [Arguments]    ${first}    ${last}    ${email}    ${password}
    Input Registration Details    ${first}    ${last}    ${email}    ${password}
    Click Register