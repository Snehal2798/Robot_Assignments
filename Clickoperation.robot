*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}              https://practice.expandtesting.com/context-menu
${BOX_LOCATOR}      id:hot-spot
${EXPECTED_MSG}     You selected a context menu

*** Test Cases ***
Verify Right Click Triggers Context Menu
    [Documentation]    Navigates to the page, right-clicks the box, and verifies the alert.

    # 1. Navigate to the URL
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${BOX_LOCATOR}    timeout=10s

    # 2. Locate the box and Right-click inside it
    # 'Open Context Menu' is the keyword for Right-Click in Robot Framework
    Open Context Menu    ${BOX_LOCATOR}

    # 3. Verify the alert appears with the correct message
    # This keyword checks the text and then accepts (closes) the alert automatically
    Alert Should Be Present    ${EXPECTED_MSG}    action=ACCEPT

    Log    Right-click performed and Alert validated successfully.

    # Cleanup
    Close Browser