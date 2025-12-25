*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${FILTER_SECTION}    xpath://div[@class='filter-details']
${BUS_LIST}          xpath://div[@class='bus-items']

*** Keywords ***
Verify Search Results Appear
    [Documentation]    Verifies that the user has navigated to the search results page
    Wait Until Page Contains Element    ${FILTER_SECTION}    15s
    Wait Until Page Contains Element    ${BUS_LIST}    15s
    Log    Search results are successfully displayed.