robot_s3a1_visible_enable_status
Enhanced Login Test Case: With Visibility & Enablement Checks
Validate that email and password input fields are visible and enabled before typing
Validate that the Login button is visible and clickable
Fail early if the UI is broken

*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           https://www.automationexercise.com/login
${BROWSER}       chrome
${EMAIL}         testuser@example.com
${PASSWORD}      Password123

# Locators
${EMAIL_INPUT}       xpath://input[@data-qa='login-email']
${PASSWORD_INPUT}    xpath://input[@data-qa='login-password']
${LOGIN_BUTTON}      xpath://button[@data-qa='login-button']

*** Test Cases ***
Enhanced Login Test
    [Documentation]    Validate login page elements before interacting
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Check if Email input is visible & enabled
    Element Should Be Visible    ${EMAIL_INPUT}
    Element Should Be Enabled      ${EMAIL_INPUT}
    Input Text                     ${EMAIL_INPUT}    ${EMAIL}

Check if Password input is visible & enabled
    Element Should Be Visible    ${PASSWORD_INPUT}
    Element Should Be Enabled      ${PASSWORD_INPUT}
    Input Text                     ${PASSWORD_INPUT}    ${PASSWORD}

Check if Login button is visible & clickable
    Element Should Be Visible    ${LOGIN_BUTTON}
    Element Should Be Enabled      ${LOGIN_BUTTON}
    Click Button                   ${LOGIN_BUTTON}

    Sleep    3s
