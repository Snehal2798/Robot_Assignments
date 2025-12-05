robot_s4a1_create_account
- Scenario: Fill Account and Address Information to Create Account
Title:
New user fills in account and address information and successfully creates an account.
Preconditions:
User has entered name and email and clicked "Sign Up" on the signup page.
User is redirected to the "Enter Account Information" page.
Steps:
Choose a title (Mr. or Mrs.).
Enter a password and date of birth.
(Optional) Subscribe to newsletters or special offers.
Fill in you personal and contact details: name, company, address, country, state, city, zip code, and mobile number.
Click the "Create Account" button.
Expected Result:
Account is successfully created.
A confirmation message (e.g., "Account Created Successfully") is displayed.
User may be redirected to a welcome or dashboard page.

*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/browser.resource
Resource   ../Resources/common_keywords.resource
Resource   ../Pages/login_page.robot
Resource   ../Pages/account_info_page.robot
Resource   ../Pages/address_page.robot
Resource   ../Pages/account_created_page.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser Session

*** Test Cases ***
Create New Account Successfully
    Generate Unique Email
    Enter Signup Details
    Fill Account Information
    Fill Address Information
    Submit Account Form
    Verify Account Created
