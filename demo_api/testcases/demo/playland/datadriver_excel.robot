*** Settings ***
Resource   ../../../../_utils/init.robot
Library    DataDriver   ${path_testdata}/playland/Employee_001.xlsx

Test Template       TEST_EMP_1_WITH_EMPLOYEE_1

*** Test Cases ***
TEST-EMP-1
    [Tags]    success_case    medium

*** Keywords ***
TEST_EMP_1_WITH_EMPLOYEE_1
    [Arguments]   ${execution}    ${firstname}    ${lastname}
    log    ${execution}
    log    ${firstname}
    log    ${lastname}
    Should Be Equal As Strings    ${execution}    1
    Should Be Equal As Strings    ${firstname}    daechatorn
    Should Be Equal As Strings    ${lastname}     namjai


