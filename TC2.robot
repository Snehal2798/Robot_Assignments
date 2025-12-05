<<<<<<< HEAD
*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}       https://www.automationexercise.com/login
${BROWSER}   chrome

*** Test Cases ***
NewUserSignup
    Open Browser    ${URL}   ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    xpath://input[@data-qa='signup-name']    timeout=10s
    Input Text    xpath://input[@data-qa='signup-name']    Snehal Test
    Input Text    xpath://input[@data-qa='signup-email']   snehaltest123@gmail.com
    Click Button  xpath://button[@data-qa='signup-button']
    Sleep    3s
=======
*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}       https://www.automationexercise.com/login
${BROWSER}   chrome

*** Test Cases ***
NewUserSignup
    Open Browser    ${URL}   ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    xpath://input[@data-qa='signup-name']    timeout=10s
    Input Text    xpath://input[@data-qa='signup-name']    Snehal Test
    Input Text    xpath://input[@data-qa='signup-email']   snehaltest123@gmail.com
    Click Button  xpath://button[@data-qa='signup-button']
    Sleep    3s
>>>>>>> e7e8c98b3b6f0d7a6c67f9343a86c37d5b741e19
    Close Browser