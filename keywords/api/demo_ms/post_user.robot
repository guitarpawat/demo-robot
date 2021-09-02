*** Settings ***
Library    String
Library    Collections
Resource    ${CURDIR}../../../../keywords/common/request.robot
Variables    ${CURDIR}../../../../resources/config/${env}/env_config.yaml

*** Keywords ***
Send Post User Request
    [Documentation]    Send request to GET /api/user
    [Arguments]    ${headers}    ${body}
    ${url}    Set Variable    ${demo_ms_url}/api/user
    ${http_status_code}    ${response_body}    Send Post Request    ${url}    ${headers}    ${body}
    [Return]    ${http_status_code}    ${response_body}

Create Header For Post User
    [Arguments]    ${correlationId}=${None}    ${content_type}=application/json    ${accept_language}=th
    ${req_correlationId}=    Run Keyword If    '${correlationId}'=='${None}'
    ...    Generate Random String    16
    ...    ELSE    ${correlationId}
    ${headers}    Create Dictionary    correlationId=${req_correlationId}    content-type=${content_type}    accept-language=${accept_language}
    [Return]    ${headers}

Create Body For Post User
    [Arguments]    ${id}
    ${body}    Create Dictionary    id=${id}
    [Return]    ${body}

Assert Post User Response Status Should Be Success
    [Arguments]    ${http_status_code}    ${response_body}
    log    ${response_body}
    Should Be Equal As Strings    ${http_status_code}    200
    Should Be Equal As Strings    ${response_body['status']}    1003
    Should Be Equal As Strings    ${response_body['data']}    Data will be reviewed before able to retrieve with this API