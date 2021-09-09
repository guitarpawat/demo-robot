*** Settings ***
Resource        ../../_utils/init.robot

*** Variables ***
${xpath_button_download_csv}    //a[@id="load-csv"]

*** Keywords ***
Export File Csv From Website
    Remove File    ~/Downloads/demo.csv
    Click Element    ${xpath_button_download_csv}
    Wait Until Created    ~/Downloads/demo.csv    60
    OperatingSystem.Copy File    ~/Downloads/demo.csv    ${CURDIR}/demo.csv
    ${csv}=    read csv file    ${CURDIR}/demo.csv
    [Return]    ${csv}

Verify Header Name And Row Value
    [Arguments]    ${csv}
    ${csv[0][0]}    Remove String    ${csv[0][0]}    \ufeff

    Should Be Equal As Strings    ${csv[0][0]}    header1
    Should Be Equal As Strings    ${csv[0][1]}    header2
    Should Be Equal As Strings    ${csv[0][2]}    header3

    Should Be Equal As Strings    ${csv[1][0]}    row11
    Should Be Equal As Strings    ${csv[1][1]}    row12
    Should Be Equal As Strings    ${csv[1][2]}    row13