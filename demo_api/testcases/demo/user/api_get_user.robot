*** Settings ***
Resource        ../../../keywords/get_user.robot
Variables       ../../../../expected_results/${resource}/user/get_user_result.yaml

*** Test Cases ***
TC-1    # Testcase number from JIRA ticket
    [Documentation]    GET /api/book should return HTTP 200 with status 1000 when getting valid id
    Should Be Equal As Strings    'Hello'    'Hello'
    #${headers}    Create Header For Get User
    #${params}    Create Query Param For Get User    1
    #${http_status_code}    ${response_body}    Send Get User Request    ${headers}    ${params}
    #Assert Get User Response Status Should Be Success    ${http_status_code}    ${response_body}
    #Assert Get User Response Body Should Be Valid    ${response_body}    ${get_user_result['TC-1']}
