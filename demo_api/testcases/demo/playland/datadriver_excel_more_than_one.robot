*** Settings ***
Resource   ../../../../_utils/init.robot
Library    DataDriver   ${path_testdata}/playland/Employee_More_Than_One.xlsx

#If test template is not in this file then
        # No "Test Template" keyword found for first test case.
#If test template in this file but there is same keyword name in other file as well then
        # [ WARN ] Multiple test cases with name 'TEST-EMP-2' executed in test suite 'Datadriver Excel More Than One'.
        # It will do on all of keywords (if there is 2 duplicate then it will process each keyword)
Test Template        TEST_EMP_MORE_THAN_ONE

*** Test Cases ***
TEST-EMP-2
    [Tags]    success_case    medium

*** Keywords ***
TEST_EMP_MORE_THAN_ONE
    [Arguments]   ${execution}    ${firstname}    ${lastname}
    #Return last record
    log    ${execution}
    log    ${firstname}
    log    ${lastname}
    Should Be Equal As Strings    ${execution}    2
    Should Be Equal As Strings    ${firstname}    xxxx
    Should Be Equal As Strings    ${lastname}     yyyy


