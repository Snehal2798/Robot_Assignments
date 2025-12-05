*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${LOGIN_URL}        https://auth-usea01.mdm.stibosystems.com/auth/realms/pivotree-sb01/protocol/openid-connect/auth?response_type=code&state=lV8iueupjcPGfj8qwW6RXI-_ARxnamkV_iXtfKRKRf8&client_id=Step&scope=openid+profile&redirect_uri=https%3A%2F%2Fpivotree-sb01.mdm.stibosystems.com%2F%3Fcbs%3DH4sIAAAAAAAACgMAAAAAAAAAAAA%3D
${Username}     snehal.desai
${Password}     snehal

*** Test Cases ***
Login
        Open Login Page In Browser
        Enter Username and Password
        
*** Keywords ***
Open Login Page In Browser
        Open Browser    ${LOGIN_URL}    chrome
        Maximize Browser Window
Enter Username and Password
        Input Text        id:username    ${Username}
        Input Password    id:password    ${Password}
        Wait Until Element Is Visible    id:kc-login    10s
        Click Button                     id:kc-login
        Close Browser

