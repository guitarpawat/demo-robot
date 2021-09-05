*** Settings ***
Library         String
Library         Collections
Resource        ../../_utils/init.robot

*** Keywords ***
Send Get User Request
    [Documentation]    Send request to GET /api/user
    [Arguments]    ${headers}    ${params}
    ${url}    Set Variable    ${demo_api_url}/api/user
    ${http_status_code}    ${response_body}    Send Get Request    ${url}    ${headers}    params=${params}
    [Return]    ${http_status_code}    ${response_body}

Create Header For Get User
    [Arguments]    ${correlationId}=${None}    ${content_type}=application/json    ${accept_language}=th
    ${req_correlationId}=    Run Keyword If    '${correlationId}'=='${None}'
    ...    Generate Random String    16
    ...    ELSE    ${correlationId}
    ${headers}    Create Dictionary    correlationId=${req_correlationId}    content-type=${content_type}    accept-language=${accept_language}
    [Return]    ${headers}

Create Query Param For Get User
    [Arguments]    ${id}
    ${params}    Create Dictionary    id=${id}
    [Return]    ${params}

Assert Get User Response Status Should Be Success
    [Arguments]    ${http_status_code}    ${response_body}
    log    ${response_body}
    Should Be Equal As Strings    ${http_status_code}    200
    Should Be Equal As Strings    ${response_body}[status]    1000

Assert Get User Response Body Should Be Valid
    [Arguments]    ${response_body}    ${expected_body}
    Should Be Equal As Integers    ${response_body}[data][id]    ${expected_body}[id]
    Should Be Equal As Strings     ${response_body}[data][name]    ${expected_body}[name]
    IF    ${response_body['data']['money']} == ${None}
        Should Be Equal As Strings    ${response_body}[data][money]    ${None}
    ELSE
        Should Be Equal As Numbers    ${response_body}[data][money]    ${expected_body}[money]
    END
    IF    ${response_body}[data][hobbies] == ${None}
        Should Be Equal As Strings    ${response_body}[data][hobbies]    ${None}
    ELSE
        Lists Should Be Equal         ${response_body}[data][hobbies]    ${expected_body}[hobbies]
    END
    IF    ${response_body}[data][favouriteFoods] == ${None}
        Should Be Equal As Strings    ${response_body}[data][favouriteFoods]    ${None}
    ELSE
        Lists Should Be Equal         ${response_body}[data][favouriteFoods]    ${expected_body}[favouriteFoods]
    END
    IF    ${response_body}[data][additionalInfo] == ${None}
        Should Be Equal As Strings    ${response_body}[data][additionalInfo]    ${None}
    ELSE
         ${req_additional_info}    Evaluate    json.loads('''${response_body}[data][additionalInfo]''')    json
         Dictionaries Should Be Equal    ${req_additional_info}    ${expected_body}[additionalInfo]
    END