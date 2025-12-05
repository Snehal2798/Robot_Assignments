*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ACCOUNT_CREATED}   xpath://b[contains(text(),'Account Created')]

*** Keywords ***
Verify Account Created
    Wait Until Element Is Visible    ${ACCOUNT_CREATED}    10s
    Element Should Be Visible        ${ACCOUNT_CREATED}
    Log To Console    Account Created Successfully.
