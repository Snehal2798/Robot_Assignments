*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}      https://www.automationexercise.com/login
${EMAIL}          testuser@example.com
${PASSWORD}       password123

# Locators
${INPUT_EMAIL}    xpath=//input[@data-qa='login-email']
${INPUT_PASS}     xpath=//input[@data-qa='login-password']
${BTN_LOGIN}      xpath=//button[@data-qa='login-button']

*** Test Cases ***
Login And Capture Screenshots
    [Documentation]    Opens login page, enters credentials, and captures screenshots.

    # 1. Open the login page
    Open Browser    ${LOGIN_URL}    Chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${INPUT_EMAIL}    timeout=10s

    # 2. Enter username and password
    Input Text        ${INPUT_EMAIL}    ${EMAIL}
    Input Password    ${INPUT_PASS}     ${PASSWORD}
    Log    Credentials entered successfully.

    # 3. Capture a screenshot of the login button element
    # This saves just the specific button to a file named 'element_screenshot.png'
    Wait Until Element Is Visible    ${BTN_LOGIN}
    Capture Element Screenshot    ${BTN_LOGIN}    element_screenshot.png
    Log    Element screenshot saved as element_screenshot.png

    # 4. Capture a full-page screenshot
    # This saves the entire visible viewport to 'full_page_screenshot.png'
    Capture Page Screenshot    full_page_screenshot.png
    Log    Full page screenshot saved as full_page_screenshot.png

    # 5. Close the browser
    Close Browser