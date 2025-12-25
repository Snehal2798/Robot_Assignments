*** Settings ***
Documentation     Test suite for verifying context menu interactions.
Library           SeleniumLibrary

*** Variables ***
${URL}            https://practice.expandtesting.com/context-menu
${BROWSER}        Chrome
${TARGET_BOX}     id=hot-spot
${EXPECTED_MSG}   You selected a context menu

*** Test Cases ***
Verify Right-Click Triggers Context Menu
    [Documentation]    Verifies that right-clicking the specific box triggers an alert with the correct text.

    # 1. Setup and Navigation
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # 2. Locate the element (Wait ensures page is loaded)
    Wait Until Element Is Visible    ${TARGET_BOX}

    # 3. Perform Right-Click
    # "Open Context Menu" is the Robot keyword for Right-Clicking
    Open Context Menu    ${TARGET_BOX}

    # 4. Verify and Handle Alert
    # This keyword checks if the alert exists, verifies the text matches, and clicks "OK"
    Alert Should Be Present    ${EXPECTED_MSG}    action=ACCEPT

    # 5. Teardown
    [Teardown]    Close Browser