*** Settings ***
Library    Collections
Library    Process
Library    ../../../../_lib/data/employee/employee.py
Library    ../../../../_lib/data/employee/employee_backup.py
Resource   ../../../../_utils/init.robot
Variables  ${path_testdata}/playland/postgres.yaml


Suite Setup         Run Keywords     CREATE EMPLOYEE TABLE
                    ...      AND     CREATE EMPLOYEE BACKUP TABLE
Suite Teardown      DROP EMPLOYEE TABLE


*** Test Cases ***
TCM-1
    [Documentation]    Test insert database
    [Setup]        INSERT EMPLOYEE    ${postgres_request.TCM_1.firstname}    ${postgres_request.TCM_1.lastname}    ${postgres_request.TCM_1.address}    ${postgres_request.TCM_1.salary}
    ${employee}     FIND EMPLOYEE    ${postgres_request.TCM_1.firstname}    ${postgres_request.TCM_1.lastname}
    log    ${employee[0]}
    [Teardown]     INSERT EMPLOYEE BACKUP    ${employee[0]}   ${employee[1]}   ${employee[2]}   ${employee[3]}