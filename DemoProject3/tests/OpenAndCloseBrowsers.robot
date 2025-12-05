*** Settings ***
Resource    ../resources/LoginPage.robot
Suite Teardown    Close All Browsers

*** Test Cases ***
single_and_multibrowser
    [Documentation]    Open Link in Multiple Browsers and Close All
    [Tags]    smoke
    # Open the same link in two separate Chrome instances (aliases browser1 and browser2)
    Open Login Page In Browser    browser1
    Open Login Page In Browser    browser2

    # Optional - verify both pages loaded
    Verify Login Page Opened    browser1
    Verify Login Page Opened    browser2

    # Wait for a few seconds (simulate user / observation time)
    Sleep    3s

    # Close all open browsers (this will close browser1 and browser2)
    Close All Browsers

    # Expected result: both browser windows opened successfully and were closed.
