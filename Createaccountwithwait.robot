robot_s6a1_sleep_speed_timeout

- Please include the steps for setting Selenium speed, timeout, and adding sleep within the test flow of the above scenario
*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${URL}                  https://automationexercise.com/login
${BROWSER}              Chrome
${NAME}                 John Doe
${PASSWORD}             SecurePass123
${DAY}                  10
${MONTH}                May
${YEAR}                 1990
${FIRST_NAME}           John
${LAST_NAME}            Doe
${COMPANY}              Tech Corp
${ADDRESS}              123 Test Street
${COUNTRY}              India
${STATE}                Maharashtra
${CITY}                 Pune
${ZIPCODE}              411001
${MOBILE}               9876543210

*** Test Cases ***
Scenario: Fill Account and Address Information to Create Account
    [Documentation]    Fills detailed account info and verifies account creation.

    # 1. Set Selenium Timeout (Wait time for elements)
    Set Selenium Timeout    15s

    # 2. Set Selenium Speed (Delay between steps for visibility)
    Set Selenium Speed      0.3s

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # --- Precondition: Signup ---
    ${random_string}=    Generate Random String    4    [NUMBERS]
    ${email}=    Set Variable    testuser${random_string}@example.com

    Wait Until Element Is Visible    xpath://h2[contains(text(),'New User Signup!')]
    Input Text    name:name    ${NAME}
    Input Text    xpath://input[@data-qa='signup-email']    ${email}
    Click Button  xpath://button[@data-qa='signup-button']

    # --- Main Scenario: Fill Form ---
    Wait Until Element Is Visible    id:id_gender1

    # Choose Title
    Click Element    id:id_gender1

    # Password & DOB
    Input Text    id:password    ${PASSWORD}
    Select From List By Value    id:days      ${DAY}
    Select From List By Label    id:months    ${MONTH}
    Select From List By Value    id:years     ${YEAR}

    # Checkboxes
    Select Checkbox    id:newsletter
    Select Checkbox    id:optin

    # Address Details
    Input Text    id:first_name    ${FIRST_NAME}
    Input Text    id:last_name     ${LAST_NAME}
    Input Text    id:company       ${COMPANY}
    Input Text    id:address1      ${ADDRESS}
    Select From List By Value    id:country    ${COUNTRY}
    Input Text    id:state         ${STATE}
    Input Text    id:city          ${CITY}
    Input Text    id:zipcode       ${ZIPCODE}

    # ERROR WAS LIKELY HERE: Ensure 2+ spaces between locator and variable
    Input Text    id:mobile_number    ${MOBILE}

    # 3. Sleep (Hard pause before create)
    Log    Pausing for 3 seconds...
    Sleep    3s

    # Create Account
    Click Button    xpath://button[@data-qa='create-account']

    # Validation
    Wait Until Element Is Visible    xpath://b[contains(text(),'Account Created')]
    Element Should Contain           xpath://b[contains(text(),'Account Created')]    ACCOUNT CREATED

    [Teardown]    Close Browser