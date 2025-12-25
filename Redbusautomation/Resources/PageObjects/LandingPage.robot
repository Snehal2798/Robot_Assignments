*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${INPUT_SOURCE}         id:src
${INPUT_DEST}           id:dest
${BUTTON_SEARCH}        id:search_btn
${CALENDAR_ICON}        id:onward_cal

# CSS Selector for the first result in the dropdown
${FIRST_DROPDOWN_RESULT}    css:ul.autoFill li:first-child

*** Keywords ***
Enter Source City
    [Arguments]    ${source_city}
    Wait Until Element Is Visible    ${INPUT_SOURCE}    10s
    Click Element    ${INPUT_SOURCE}
    Input Text       ${INPUT_SOURCE}    ${source_city}

    # Click first dropdown result
    Wait Until Element Is Visible    ${FIRST_DROPDOWN_RESULT}    10s
    Click Element    ${FIRST_DROPDOWN_RESULT}

Enter Destination City
    [Arguments]    ${dest_city}
    Wait Until Element Is Visible    ${INPUT_DEST}    10s
    Click Element    ${INPUT_DEST}
    Input Text       ${INPUT_DEST}    ${dest_city}

    # Click first dropdown result
    Wait Until Element Is Visible    ${FIRST_DROPDOWN_RESULT}    10s
    Click Element    ${FIRST_DROPDOWN_RESULT}

Select Travel Date
    [Documentation]    Pick the current date
    ${calendar_visible}=    Run Keyword And Return Status    Element Should Be Visible    id:rb-calendar_onward_cal
    Run Keyword If    not ${calendar_visible}    Click Element    ${CALENDAR_ICON}

    # Click the current day cell
    Wait Until Element Is Visible    xpath://td[@class='current day']    10s
    Click Element    xpath://td[@class='current day']

Click Search Buses
    Wait Until Element Is Visible    ${BUTTON_SEARCH}    10s
    Click Button    ${BUTTON_SEARCH}