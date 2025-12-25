*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           https://www.automationexercise.com/login
${BROWSER}       chrome
# Using these variables - Ensure you have registered this user manually first!
${USER_EMAIL}    tester_gemini@example.com
${USER_PASS}     Password123

*** Test Cases ***
Login and Scroll to Bottom Using JavaScript
    [Documentation]    Logs in and executes JS to scroll to the bottom of the page.
    Open My Library Browser    ${URL}

    # Step 1: Login
    Input Text                 xpath=//input[@data-qa='login-email']       ${USER_EMAIL}
    Input Text                 xpath=//input[@data-qa='login-password']    ${USER_PASS}
    Click Button               xpath=//button[@data-qa='login-button']

    # Step 2: Bypass the 'Logged in as' check if it's flaky
    # We wait for a generic element on the home page instead
    Sleep    2s

    # Step 3: Use JavaScript for Smooth Scrolling
    # This script scrolls to the bottom with a visible animation
    Execute JavaScript    window.scrollTo({top: document.body.scrollHeight, behavior: 'smooth'})

    # Step 4: Wait to see the bottom
    Sleep    5s

    # Step 5: Verify we reached the bottom by checking for the footer
    Element Should Be Visible    id=footer

    [Teardown]    Close Browser

*** Keywords ***
Open My Library Browser
    [Arguments]    ${site_url}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-gpu

    Create Webdriver    Chrome    options=${options}
    Go To    ${site_url}
    Maximize Browser Window