*** Settings ***
Library    String
Library    Collections
Resource        ../../_utils/init.robot


*** Keywords ***
Assert Salary Is 10000
    [Arguments]    ${request_salary}
    Should Be Equal As Strings    ${request_salary}    10000
