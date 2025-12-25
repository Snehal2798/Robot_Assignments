*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://www.automationexercise.com/
${BROWSER}    chrome

*** Test Cases ***
Verify Browser Launch Using Custom Keyword
    [Documentation]    Test case to demonstrate a user-defined keyword without arguments.

    # Using the user-defined keyword
    Open My Library Browser

    # Optional: Verify the page loaded
    Title Should Be    Automation Exercise

    [Teardown]    Close Browser

*** Keywords ***
Open My Library Browser
    [Documentation]    Opens the browser to the automation exercise site.
    Open Browser               ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    5 seconds