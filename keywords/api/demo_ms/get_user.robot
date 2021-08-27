*** Settings ***
Library    String
Library    Collections
Resource    ${CURDIR}../../../../keywords/common/request.robot
Variables    ${CURDIR}../../../../resources/config/${env}/env_config.yaml

*** Keywords ***
Send Get User Request
    [Documentation]    Send request to GET /api/user
    [Arguments]    ${headers}    ${params}
    ${url}    Set Variable    ${demo_ms_url}/api/user
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
    Should Be Equal As Strings    ${response_body['status']}    1000

Assert Get User Response Body Should Be Valid
    [Arguments]    ${response_body}    ${expected_body}
    Should Be Equal As Integers    ${response_body['data']['id']}    ${expected_body['id']}
    Should Be Equal As Strings    ${response_body['data']['name']}    ${expected_body.name}
    Should Be Equal As Numbers    ${response_body['data']['money']}    ${expected_body.money}
    Should Be Equal As Strings    ${response_body['data']['hobbies'][0]['name']}    ${expected_body['hobbies'][0]['name']}
    Should Be Equal As Strings    ${response_body['data']['hobbies'][0]['isOutdoor']}    ${expected_body['hobbies'][0]['isOutdoor']}
    Should Be Equal As Strings    ${response_body['data']['hobbies'][1]['name']}    ${expected_body['hobbies'][1]['name']}
    Should Be Equal As Strings    ${response_body['data']['hobbies'][1]['isOutdoor']}    ${expected_body['hobbies'][1]['isOutdoor']}
    FOR    ${food}    IN    @{response_body['data']['favouriteFoods']}
        List Should Contain Value    ${expected_body['favouriteFoods']}    ${food}
    END
    ${req_food_length}    Get Length    ${response_body['data']['favouriteFoods']}
    ${exp_food_length}    Get Length    ${expected_body['favouriteFoods']}
    Should Be Equal As Integers    ${req_food_length}    ${exp_food_length}
    ${req_additional_info}    Evaluate    json.loads('''${response_body['data']['additionalInfo']}''')    json
    Should Be Equal As Strings    ${req_additional_info['field1']}    ${expected_body['additionalInfo']['field1']}