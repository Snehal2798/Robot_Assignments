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
