*** Settings ***
Library    SeleniumLibrary

*** Variables ***
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

*** Keywords ***
Fill Address Information
    Input Text    ${FIRSTNAME}    Test1
    Input Text    ${LASTNAME}     User1
    Input Text    ${COMPANY}      TestCompany1
    Input Text    ${ADDRESS1}     123 Test Street1
    Input Text    ${ADDRESS2}     Test Building1
    Select From List By Label    ${COUNTRY}    India
    Input Text    ${STATE}        Maharashtra
    Input Text    ${CITY}         Mumbai
    Input Text    ${ZIP}          4000012
    Input Text    ${MOBILE}       9876543210

Submit Account Form
    Wait Until Element Is Visible    ${CREATE_ACCOUNT}    10s
    Scroll Element Into View         ${CREATE_ACCOUNT}
    Sleep    1s
    Press Keys    NONE    PAGE_DOWN
    Sleep    1s
    Click Button    ${CREATE_ACCOUNT}