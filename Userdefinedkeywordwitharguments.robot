*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${URL}           https://www.automationexercise.com/
${BROWSER}       chrome

*** Test Cases ***
Register And Then Login
    [Documentation]    E2E flow: Signup, Logout, and Login.
    Open My Library Browser    ${URL}

    # Generate unique data
    ${random}=    Generate Random String    4    [LETTERS]
    ${email}=     Set Variable    user_${random}@mail.com

    # 1. Register (The keyword handles returning to home page)
    Register New User    AutomationBot    ${email}    Password123

    # 2. Logout
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/logout')]    timeout=10s
    Click Element                    xpath=//a[contains(@href, '/logout')]

    # 3. Login (Now using the User Login keyword)
    User Login                       ${email}    Password123

    # 4. Final Verify
    Element Should Be Visible        xpath=//a[contains(@href, '/logout')]
    Log To Console    Test Passed: Successfully registered and logged in with ${email}

    [Teardown]    Close Browser

*** Keywords ***
Open My Library Browser
    [Arguments]    ${site_url}
    Open Browser    ${site_url}    ${BROWSER}
    Maximize Browser Window

Register New User
    [Arguments]    ${name}    ${email}    ${password}
    Click Element    xpath=//a[contains(text(), 'Signup / Login')]
    Input Text       xpath=//input[@data-qa='signup-name']     ${name}
    Input Text       xpath=//input[@data-qa='signup-email']    ${email}
    Click Button     xpath=//button[@data-qa='signup-button']

    Wait Until Element Is Visible    id=id_gender1    timeout=10s
    Click Element                    id=id_gender1
    Input Text                       id=password    ${password}
    Input Text                       id=first_name  Automation
    Input Text                       id=last_name   Tester
    Input Text                       id=address1    123 Robot Street
    Select From List By Label        id=country     United States
    Input Text                       id=state       California
    Input Text                       id=city        Los Angeles
    Input Text                       id=zipcode     90001
    Input Text                       id=mobile_number    1234567890

    Scroll Element Into View         xpath=//button[@data-qa='create-account']
    Click Button                     xpath=//button[@data-qa='create-account']
    Wait Until Page Contains         Account Created!    timeout=10s

    # Bypass Ads by jumping to Home
    Go To    ${URL}

User Login
    [Arguments]    ${email}    ${password}
    [Documentation]    Ensures we are on the login page and enters credentials.
    # Check if we need to navigate to login page
    ${login_visible}=  Run Keyword And Return Status  Element Should Be Visible  xpath=//input[@data-qa='login-email']
    Run Keyword If  '${login_visible}' == 'False'  Click Element  xpath=//a[contains(text(), 'Signup / Login')]

    Wait Until Element Is Visible    xpath=//input[@data-qa='login-email']    timeout=10s
    Input Text       xpath=//input[@data-qa='login-email']       ${email}
    Input Text       xpath=//input[@data-qa='login-password']    ${password}
    Click Button     xpath=//button[@data-qa='login-button']