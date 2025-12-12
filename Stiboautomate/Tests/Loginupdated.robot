*** Settings ***
Library    SeleniumLibrary

Test Setup       Setup Chrome With Popup Fix
Test Teardown    Close All Browsers

*** Variables ***
${URL}             https://auth-usea01.mdm.stibosystems.com/auth/realms/pivotree-sb01/protocol/openid-connect/auth?response_type=code&client_id=Step&redirect_uri=https%3A%2F%2Fpivotree-sb01.mdm.stibosystems.com%2F
${USERNAME}        snehal.desai
${PASSWORD}        snehal

# Locators
${LOGIN_USER}      id:username
${LOGIN_PASS}      id:password
${LOGIN_BTN}       id:kc-login
${VIVEK_LINK}      xpath=//a[contains(@id, 'VivekWebUI')]
${MAIN_IFRAME}     xpath=//iframe[contains(@id, 'step')]
${TREE_TAB}        xpath=//div[contains(text(), 'Tree')]

*** Test Cases ***
Login And Load Dashboard
    [Documentation]    Simple flow to login and load the Stibo Dashboard.

    # 1. Login
    Wait Until Element Is Visible    ${LOGIN_USER}    timeout=15s
    Input Text       ${LOGIN_USER}    ${USERNAME}
    Input Password   ${LOGIN_PASS}    ${PASSWORD}
    Click Button     ${LOGIN_BTN}

    # 2. Click the VivekWebUI Link
    Wait Until Element Is Visible    ${VIVEK_LINK}    timeout=20s
    Click Element    ${VIVEK_LINK}

    # 3. Wait for Dashboard to Load (Handle Iframe)
    Sleep    10s    # Give Stibo time to initialize

    # Try to switch to the main frame if it exists
    Run Keyword And Ignore Error    Select Frame    ${MAIN_IFRAME}

    # 4. Verify Success (Look for 'Tree' tab)
    Wait Until Element Is Visible    ${TREE_TAB}    timeout=30s
    Log    Dashboard Loaded Successfully!

*** Keywords ***
Setup Chrome With Popup Fix
    [Documentation]    Opens Chrome and blocks the 'Local Network' popup.
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    # Define arguments to block popups
    ${arg1}=    Set Variable    --disable-features=LocalNetworkAccessChecks
    #${arg2}=    Set Variable    --disable-features=WebBluetooth
    #${arg3}=    Set Variable    --disable-device-discovery-notifications

    Call Method    ${options}    add_argument    ${arg1}
    #Call Method    ${options}    add_argument    ${arg2}
    #Call Method    ${options}    add_argument    ${arg3}
    #Call Method    ${options}    add_argument    --disable-notifications

    Create Webdriver    Chrome    options=${options}
    Maximize Browser Window
    Go To    ${URL}