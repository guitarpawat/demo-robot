*** Settings ***
Library    RequestsLibrary

*** Keywords ***
Send Get Request
    [Documentation]    Create and send GET request to API
    [Arguments]    ${url}    ${headers}    ${params}=${None}    ${timeout}=30
    ${response}    GET    ${url}    ${params}    anything    anything    headers=${headers}    timeout=${timeout}
    log    ${response}
    [Return]    ${response.status_code}    ${response.json()}
