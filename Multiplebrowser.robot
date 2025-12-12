*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Multiplebrowserstest
        Open Browser    https://www.automationexercise.com/login    chrome
        Maximize Browser Window
Multiplebrowsertest2
        Open Browser    https://testautomationpractice.blogspot.com/    chrome
        Maximize Browser Window

        Close All Browsers