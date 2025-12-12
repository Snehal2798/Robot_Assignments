*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://testautomationpractice.blogspot.com/
${BROWSER}      Chrome
${INPUT_TEXT}   Hello World

*** Test Cases ***
Verify Double Click Operation
    [Documentation]    Verify Double-Click on 'Copy Text' Copies Text from Field 1 to Field 2

    # 1. Open Browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # 2. Wait for the first textbox and Enter Text
    # We wait up to 10 seconds for the element to be ready
    Wait Until Element Is Visible    id:field1    timeout=10s
    Input Text    id:field1    ${INPUT_TEXT}

    # 3. Wait for the 'Copy Text' button
    Wait Until Element Is Visible    xpath://button[text()='Copy Text']    timeout=10s

    # 4. Perform Double Click
    Double Click Element    xpath://button[text()='Copy Text']

    # 5. Wait for the result in the second textbox
    # We wait until Field 2 contains the expected text (Handles slight JS delays)
    Wait Until Keyword Succeeds    5s    0.5s    Text Should Match In Field2    ${INPUT_TEXT}

    [Teardown]    Close Browser

*** Keywords ***
Text Should Match In Field2
    [Arguments]    ${expected_text}
    ${actual_text}=    Get Value    id:field2
    Should Be Equal    ${actual_text}    ${expected_text}