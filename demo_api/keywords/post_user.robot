*** Settings ***
Library    String
Library    Collections
Resource        ../../_utils/init.robot

*** Keywords ***
Send Post User Request
    [Documentation]    Send request to POST /api/user
    [Arguments]    ${headers}    ${body}
    ${url}    Set Variable    ${demo_ms_url}/api/user
    ${http_status_code}    ${response_body}    Send Post Request    ${url}    ${headers}    ${body}
    [Return]    ${http_status_code}    ${response_body}

Create Header For Post User
    [Arguments]    ${correlationId}=${None}    ${content_type}=application/json    ${accept_language}=th
    IF    '${correlationId}' == '${None}'
        ${correlationId}    Generate Random String    16
    END
    ${headers}    Create Dictionary    correlationId=${correlationId}    content-type=${content_type}    accept-language=${accept_language}
    [Return]    ${headers}

Create Body For Post User
    [Arguments]    ${id}    ${name}=${None}    ${money}=${None}    ${hobbies}=${None}    ${favouriteFoods}=${None}    ${additionalInfo}=${None}
    ${body}    Create Dictionary    id=${id}    name=${name}    money=${money}    hobbies=${hobbies}    favouriteFoods=${favouriteFoods}    additionalInfo=${additionalInfo}
    [Return]    ${body}

Assert Post User Response Status Should Be Success
    [Arguments]    ${http_status_code}    ${response_body}
    log    ${response_body}
    Should Be Equal As Strings    ${http_status_code}    200
    Should Be Equal As Strings    ${response_body}[status]    1003
    Should Be Equal As Strings    ${response_body}[data]    Data will be reviewed before able to retrieve with this API
