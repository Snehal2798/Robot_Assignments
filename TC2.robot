robot_s2a1_signup
Scenario: Entering Name and Email for Signup
Title:New user enters name and email to begin the signup process.
Preconditions:User is on the Automation Exercise Login Page.
Steps:
Locate the "New User Signup!" section on the login page.
https://www.automationexercise.com/login
Enter a valid name in the name input field.
Enter a valid email address in the email input field.
Click on the "Sign Up" button.
Expected Result:
The user is redirected to the account information page to continue the registration process.
A success message or form for further details is displayed.
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
    Input Text    xpath://input[@data-qa='signup-name']    Snehal Test1
    Input Text    xpath://input[@data-qa='signup-email']   snehaltest124@gmail.com
    Click Button  xpath://button[@data-qa='signup-button']
    Sleep    3s

