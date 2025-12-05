*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}    https://www.automationexercise.com/login
${LOGIN_FORM}   xpath=//form

*** Keywords ***
Open Login Page In Browser
    [Arguments]    ${alias}
    Open Browser    ${LOGIN_URL}    chrome    alias=${alias}
    Maximize Browser Window
    Wait Until Element Is Visible    ${LOGIN_FORM}    timeout=10s

Verify Login Page Opened
    [Arguments]    ${alias}
    Switch Browser    ${alias}
    Page Should Contain Element    ${LOGIN_FORM}