*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://www.redbus.in/
${BROWSER}    Chrome

*** Keywords ***
Start Test
    [Documentation]    Opens browser with fixes for RedBus detection and specific driver options.

    # 1. Create Chrome Options
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    # 2. Add arguments to disable popups and spoof a real user
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --start-maximized

    # 3. CRITICAL: Anti-Detection (Hides 'Navigator.webdriver' flag)
    # We use the backslash (\) to escape the equal sign so Robot Framework handles it correctly.
    Call Method    ${options}    add_argument    --disable-blink-features\=AutomationControlled

    # 4. Remove the "Chrome is being controlled by automated test software" bar
    ${exclude_switches}=    Create List    enable-automation
    Call Method    ${options}    add_experimental_option    excludeSwitches    ${exclude_switches}

    # 5. Open Browser
    # We open the browser. If the old driver is deleted (Step 1), this will auto-download the correct v143 driver.
    Open Browser    ${URL}    ${BROWSER}    options=${options}

    # 6. Debugging Step: Check if page loaded
    # If 'id:src' is not found in 10s, we take a screenshot to see what happened.
    ${status}=    Run Keyword And Return Status    Wait Until Element Is Visible    id:src    10s
    Run Keyword If    not ${status}    Capture Page Screenshot    filename=redbus_failure.png
    Run Keyword If    not ${status}    Log    FAILED: Page did not load correctly. Check redbus_failure.png in results folder.    WARN

    # Final check (Will fail test if element is still missing)
    Wait Until Element Is Visible    id:src    timeout=20s

End Test
    Close Browser