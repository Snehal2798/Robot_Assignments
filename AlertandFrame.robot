*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Alerthandling
        Open Browser        https://demo.automationtesting.in/Alerts.html   chrome    
        Wait Until Element Is Visible    xpath=//a[@href='#CancelTab']    5s
        Click Element    xpath=//a[@href='#CancelTab']
        Sleep    2s
        Click Element       xpath=//button[contains(normalize-space(.), 'confirm box')]
        Sleep    2s
        #Handle Alert    accept
        Handle Alert     dismiss
        Sleep    2s
        Close Browser