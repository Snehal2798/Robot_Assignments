*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                https://testautomationpractice.blogspot.com/
${BROWSER}            chrome
${SOURCE_ELEMENT}     id=draggable
${TARGET_ELEMENT}     id=droppable

*** Test Cases ***
Verify Drag and Drop Operation
    Open Browser               ${URL}    ${BROWSER}
    Maximize Browser Window

    Scroll Element Into View         ${SOURCE_ELEMENT}
    Sleep    2s    # <--- Pause to see the screen scroll

    Drag And Drop                    ${SOURCE_ELEMENT}    ${TARGET_ELEMENT}

    Sleep    2s    # <--- Pause to see the "Dropped!" text change
    Element Text Should Be           ${TARGET_ELEMENT}    Dropped!

    [Teardown]    Close Browser