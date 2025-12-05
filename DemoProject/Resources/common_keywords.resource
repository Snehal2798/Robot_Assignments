*** Keywords ***
Generate Unique Email
    ${timestamp}=    Evaluate    int(__import__('time').time())
    ${UNIQUE_EMAIL}=    Set Variable    test_${timestamp}@example.com
    Set Suite Variable    ${UNIQUE_EMAIL}
