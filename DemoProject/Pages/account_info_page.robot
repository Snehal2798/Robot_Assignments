*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TITLE_MR}          xpath://input[@id='id_gender1']
${PASSWORD_INPUT}    xpath://input[@id='password']
${DOB_DAY}           xpath://select[@id='days']
${DOB_MONTH}         xpath://select[@id='months']
${DOB_YEAR}          xpath://select[@id='years']
${NEWSLETTER}        xpath://input[@id='newsletter']
${OFFERS}            xpath://input[@id='optin']

*** Keywords ***
Fill Account Information
    Click Element    ${TITLE_MR}
    Input Text       ${PASSWORD_INPUT}    Test@12345
    Select From List By Value    ${DOB_DAY}      10
    Select From List By Value    ${DOB_MONTH}    5
    Select From List By Value    ${DOB_YEAR}     1990
    Click Element    ${NEWSLETTER}
    Click Element    ${OFFERS}