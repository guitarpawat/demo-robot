*** Settings ***
Library     SeleniumLibrary
Library     ../../../../_lib/csvLibrary.py
Resource        ../../../keywords/web.robot

*** Variables ***
${xpath_name_placeholder}    //div[@id="name"]/p[1]
${xpath_name_value}    //div[@id="name"]/p[2]
${xpath_age_value}    //div[@id="surname"]/p[2]

*** Test Cases ***
Test-001 Verify Content and Export Csv

    #Open Website
    Open Browser    http://localhost:3000    Chrome

    # Waiting Website to load information
    Wait Until Element Is Visible    ${xpath_name_placeholder}    20

    # Get Value from Website
    ${name_web}=    Get Text    ${xpath_name_value}
    ${age_web}=    Get Text    ${xpath_age_value}

    # Assert Response
    Should Be Equal As Strings    ${name_web}    Bob
    Should Be Equal As Strings    ${age_web}    20

    # Export Csv file from website
    ${csv}      Export File Csv From Website

    # Verify Csv
    Verify Header Name And Row Value    ${csv}

    [Teardown]  Close all browsers