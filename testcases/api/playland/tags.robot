*** Test Cases ***
Transfer Should Be Success 1
    [Tags]    success_case    high
    No Operation

Transfer Should Be Success 2
    [Tags]    success_case    medium
    No Operation

Transfer Should Be Fail
    [Tags]    fail_case    medium
    No Operation

Transfer Should Be Timeout
    [Documentation]    This test may takes about 3 to 5 minutes
    [Tags]    slow_test    low
    No Operation