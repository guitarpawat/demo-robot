*** Settings ***
Resource        ../../../keywords/post_user.robot

*** Test Cases ***
TC-2    # Testcase number from JIRA ticket
    [Documentation]    POST /api/book should return HTTP 200 and status 1003
    ${headers}    Create Header For Post User
    ${body}    Create Body For Post User    5    Jardet
    Log To Console    \n${body}
    ${http_status_code}    ${response_body}    Send Post User Request    ${headers}    ${body}
    Assert Post User Response Status Should Be Success    ${http_status_code}    ${response_body}