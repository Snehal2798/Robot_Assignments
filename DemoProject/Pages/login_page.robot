*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SIGNUP_NAME}       xpath://input[@data-qa='signup-name']
${SIGNUP_EMAIL}      xpath://input[@data-qa='signup-email']
${SIGNUP_BUTTON}     xpath://button[@data-qa='signup-button']
${PASSWORD_INPUT}    xpath://input[@id='password']

*** Keywords ***
Enter Signup Details
    Input Text    ${SIGNUP_NAME}    Test User
    Input Text    ${SIGNUP_EMAIL}   ${UNIQUE_EMAIL}
    Click Button  ${SIGNUP_BUTTON}
    Wait Until Element Is Visible    ${PASSWORD_INPUT}    10s