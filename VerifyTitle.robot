*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}     https://www.automationexercise.com/login
${TITLE}   Automation Exercise - Signup / Login

*** Test Cases ***
robot_s3a2_verify_page_title
    Open Browser    ${URL}    chrome
    Maximize Browser Window

    Wait Until Page Contains Element    xpath://body    timeout=10s
    ${actual}=    Get Title
    Should Be Equal    ${actual}    ${TITLE}

    Close Browser