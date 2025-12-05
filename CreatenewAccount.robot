<<<<<<< HEAD
*** Settings ***
Library    SeleniumLibrary
Suite Setup     Open Browser To Login Page
Suite Teardown  Close Browser

*** Variables ***
${BROWSER}     chrome
${URL}         https://www.automationexercise.com/login

# Signup Page
${SIGNUP_NAME}       xpath://input[@data-qa='signup-name']
${SIGNUP_EMAIL}      xpath://input[@data-qa='signup-email']
${SIGNUP_BUTTON}     xpath://button[@data-qa='signup-button']

# Account Information Page
${TITLE_MR}          xpath://input[@id='id_gender1']
${PASSWORD_INPUT}    xpath://input[@id='password']
${DOB_DAY}           xpath://select[@id='days']
${DOB_MONTH}         xpath://select[@id='months']
${DOB_YEAR}          xpath://select[@id='years']

${NEWSLETTER}        xpath://input[@id='newsletter']
${OFFERS}            xpath://input[@id='optin']

# Address Details
${FIRSTNAME}         xpath://input[@id='first_name']
${LASTNAME}          xpath://input[@id='last_name']
${COMPANY}           xpath://input[@id='company']
${ADDRESS1}          xpath://input[@id='address1']
${ADDRESS2}          xpath://input[@id='address2']
${COUNTRY}           xpath://select[@id='country']
${STATE}             xpath://input[@id='state']
${CITY}              xpath://input[@id='city']
${ZIP}               xpath://input[@id='zipcode']
${MOBILE}            xpath://input[@id='mobile_number']

${CREATE_ACCOUNT}    xpath://button[@data-qa='create-account']
${ACCOUNT_CREATED}   xpath://b[contains(text(),'Account Created')]


*** Test Cases ***
robot_s4a1_create_account
    [Documentation]   New user fills in account and address information and successfully creates an account.

    Generate Unique Email
    Enter Signup Details
    Fill Account Information
    Fill Address Information
    Submit Account Form
    Verify Account Created


*** Keywords ***

Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${SIGNUP_BUTTON}    10s


Generate Unique Email
    ${timestamp}=    Evaluate    int(__import__('time').time())
    ${UNIQUE_EMAIL}=    Set Variable    test_${timestamp}@example.com
    Set Suite Variable    ${UNIQUE_EMAIL}


Enter Signup Details
    Input Text    ${SIGNUP_NAME}     Test User
    Input Text    ${SIGNUP_EMAIL}    ${UNIQUE_EMAIL}
    Click Button  ${SIGNUP_BUTTON}
    Wait Until Element Is Visible    ${PASSWORD_INPUT}    10s


Fill Account Information
    Click Element    ${TITLE_MR}
    Input Text       ${PASSWORD_INPUT}    Test@12345
    Select From List By Value    ${DOB_DAY}      10
    Select From List By Value    ${DOB_MONTH}    5
    Select From List By Value    ${DOB_YEAR}     1990

    Click Element    ${NEWSLETTER}
    Click Element    ${OFFERS}


Fill Address Information
    Input Text    ${FIRSTNAME}     Test1
    Input Text    ${LASTNAME}      User1
    Input Text    ${COMPANY}       TestCompany1
    Input Text    ${ADDRESS1}      123 Test Street1
    Input Text    ${ADDRESS2}      Test Building1
    Select From List By Label      ${COUNTRY}    India
    Input Text    ${STATE}         Maharashtra
    Input Text    ${CITY}          Mumbai
    Input Text    ${ZIP}           4000012
    Input Text    ${MOBILE}        9876543210


Submit Account Form
    Wait Until Element Is Visible    ${CREATE_ACCOUNT}    10s
    Scroll Element Into View         ${CREATE_ACCOUNT}
    Sleep    1s
    Press Keys    NONE    PAGE_DOWN
    Sleep    1s
    Click Button    ${CREATE_ACCOUNT}


Verify Account Created
    Wait Until Element Is Visible    ${ACCOUNT_CREATED}    10s
    Element Should Be Visible        ${ACCOUNT_CREATED}
=======
*** Settings ***
Library    SeleniumLibrary
Suite Setup     Open Browser To Login Page
Suite Teardown  Close Browser

*** Variables ***
${BROWSER}     chrome
${URL}         https://www.automationexercise.com/login

# Signup Page
${SIGNUP_NAME}       xpath://input[@data-qa='signup-name']
${SIGNUP_EMAIL}      xpath://input[@data-qa='signup-email']
${SIGNUP_BUTTON}     xpath://button[@data-qa='signup-button']

# Account Information Page
${TITLE_MR}          xpath://input[@id='id_gender1']
${PASSWORD_INPUT}    xpath://input[@id='password']
${DOB_DAY}           xpath://select[@id='days']
${DOB_MONTH}         xpath://select[@id='months']
${DOB_YEAR}          xpath://select[@id='years']

${NEWSLETTER}        xpath://input[@id='newsletter']
${OFFERS}            xpath://input[@id='optin']

# Address Details
${FIRSTNAME}         xpath://input[@id='first_name']
${LASTNAME}          xpath://input[@id='last_name']
${COMPANY}           xpath://input[@id='company']
${ADDRESS1}          xpath://input[@id='address1']
${ADDRESS2}          xpath://input[@id='address2']
${COUNTRY}           xpath://select[@id='country']
${STATE}             xpath://input[@id='state']
${CITY}              xpath://input[@id='city']
${ZIP}               xpath://input[@id='zipcode']
${MOBILE}            xpath://input[@id='mobile_number']

${CREATE_ACCOUNT}    xpath://button[@data-qa='create-account']
${ACCOUNT_CREATED}   xpath://b[contains(text(),'Account Created')]


*** Test Cases ***
robot_s4a1_create_account
    [Documentation]   New user fills in account and address information and successfully creates an account.

    Generate Unique Email
    Enter Signup Details
    Fill Account Information
    Fill Address Information
    Submit Account Form
    Verify Account Created


*** Keywords ***

Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${SIGNUP_BUTTON}    10s


Generate Unique Email
    ${timestamp}=    Evaluate    int(__import__('time').time())
    ${UNIQUE_EMAIL}=    Set Variable    test_${timestamp}@example.com
    Set Suite Variable    ${UNIQUE_EMAIL}


Enter Signup Details
    Input Text    ${SIGNUP_NAME}     Test User
    Input Text    ${SIGNUP_EMAIL}    ${UNIQUE_EMAIL}
    Click Button  ${SIGNUP_BUTTON}
    Wait Until Element Is Visible    ${PASSWORD_INPUT}    10s


Fill Account Information
    Click Element    ${TITLE_MR}
    Input Text       ${PASSWORD_INPUT}    Test@12345
    Select From List By Value    ${DOB_DAY}      10
    Select From List By Value    ${DOB_MONTH}    5
    Select From List By Value    ${DOB_YEAR}     1990

    Click Element    ${NEWSLETTER}
    Click Element    ${OFFERS}


Fill Address Information
    Input Text    ${FIRSTNAME}     Test1
    Input Text    ${LASTNAME}      User1
    Input Text    ${COMPANY}       TestCompany1
    Input Text    ${ADDRESS1}      123 Test Street1
    Input Text    ${ADDRESS2}      Test Building1
    Select From List By Label      ${COUNTRY}    India
    Input Text    ${STATE}         Maharashtra
    Input Text    ${CITY}          Mumbai
    Input Text    ${ZIP}           4000012
    Input Text    ${MOBILE}        9876543210


Submit Account Form
    Wait Until Element Is Visible    ${CREATE_ACCOUNT}    10s
    Scroll Element Into View         ${CREATE_ACCOUNT}
    Sleep    1s
    Press Keys    NONE    PAGE_DOWN
    Sleep    1s
    Click Button    ${CREATE_ACCOUNT}


Verify Account Created
    Wait Until Element Is Visible    ${ACCOUNT_CREATED}    10s
    Element Should Be Visible        ${ACCOUNT_CREATED}
>>>>>>> e7e8c98b3b6f0d7a6c67f9343a86c37d5b741e19
    Log To Console    Account Created Successfully.