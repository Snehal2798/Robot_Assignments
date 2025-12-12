*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${HOME_URL}        https://www.automationexercise.com/
${PRODUCTS_URL}    https://www.automationexercise.com/products

*** Test Cases ***
Open Homepage Get Location Go To And Go Back
    [Documentation]    Opens homepage, gets location, navigates to products, and goes back.

    # 1. Open https://www.automationexercise.com/ in Chrome
    Open Browser    ${HOME_URL}    Chrome
    Maximize Browser Window

    # Wait for the homepage to load (Verification point: Logo is visible)
    Wait Until Element Is Visible    xpath=//img[@alt='Website for automation practice']    timeout=10s

    # 2. Use the Get Location keyword to retrieve the current URL
    ${initial_url}=    Get Location
    Log    Initial URL is: ${initial_url}

    # Verify we are actually on the homepage
    Should Be Equal    ${initial_url}    ${HOME_URL}

    # 3. Use the Go To keyword to navigate to the Products page
    Go To    ${PRODUCTS_URL}

    # 4. Wait for the Products page to load
    # (Verification point: "All Products" text is visible)
    Wait Until Element Is Visible    xpath=//h2[contains(text(), 'All Products')]    timeout=10s
    Log    Successfully navigated to Products page.

    # 5. Use the Go Back keyword to return to the homepage
    Go Back

    # 6. Verify that you are back on the homepage
    ${current_url}=    Get Location
    Log    Current URL after going back: ${current_url}

    # Compare the current URL with the initial URL we saved in step 2
    Should Be Equal    ${current_url}    ${initial_url}

    # Double check by ensuring the home logo is visible again
    Wait Until Element Is Visible    xpath=//img[@alt='Website for automation practice']

    # 7. Close the browser
    Close Browser