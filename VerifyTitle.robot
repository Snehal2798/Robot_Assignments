<<<<<<< HEAD
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

=======
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

>>>>>>> e7e8c98b3b6f0d7a6c67f9343a86c37d5b741e19
    Close Browser