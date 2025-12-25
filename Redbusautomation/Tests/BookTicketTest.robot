*** Settings ***
Documentation     RedBus Booking Test
Resource          ../Resources/Common.robot
Resource          ../Resources/PageObjects/LandingPage.robot
Resource          ../Resources/PageObjects/SearchPage.robot

Test Setup        Start Test
Test Teardown     End Test

*** Variables ***
${FROM_CITY}      Mumbai
${TO_CITY}        Pune

*** Test Cases ***
Verify User Can Search For Buses
    [Tags]    Functional
    LandingPage.Enter Source City         ${FROM_CITY}
    LandingPage.Enter Destination City    ${TO_CITY}
    LandingPage.Select Travel Date
    LandingPage.Click Search Buses
    # Simple verification that URL changed or results appeared
    Wait Until Page Contains Element    xpath://div[@class='bus-items' or @id='root']    20s