*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Multiplewindow
    Open Browser    https://demo.automationtesting.in/Windows.html    chrome
    Click Element    xpath://*[@id="Tabbed"]/a/button

    Sleep    3s    # wait for the new window to open
    Switch Window   NEW
    Close Window
Multiplewindow2
    Switch Window    MAIN
    Close Browser