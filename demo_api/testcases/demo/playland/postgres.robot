*** Settings ***
Library    Collections
Library    Process
Library    ../../../../_lib/data/employee/employee.py
Resource   ../../../../_utils/init.robot


*** Test Cases ***
Test get data from database
    ${xxxx}     Test select
    Write to console    INFO    ${xxxx}
