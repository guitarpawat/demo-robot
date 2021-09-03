*** Settings ***
Library    Collections

*** Test Cases ***
Test Create Dictionary
    ${req_headers}    Create Dictionary    accept-language=th    correlationId=mock1    userId=205
    Log To Console    Dictionary: ${req_headers}

Dictionary Manipulation
    ${req_headers}    Create Dictionary    accept-language=th    correlationId=mock1    userId=205
    Length Should Be                    ${req_headers}    3
    Dictionary Should Contain Key       ${req_headers}    accept-language
    Dictionary Should Contain Value     ${req_headers}    mock1
    Dictionary Should Contain Item      ${req_headers}    userId    205
    Set To Dictionary                   ${req_headers}    content-type=application/json
    Remove From Dictionary              ${req_headers}    correlationId
    ${req_headers}    Create Dictionary    content-type=application/json    accept-language=th    userId=205
    Dictionaries Should Be Equal        ${req_headers}    ${req_headers}
    Should Be Equal As Strings    ${req_headers}[content-type]    application/json

Test Create List
    ${fruits}    Create List    Apple    Grape    Orange    Kiwi
    Log To Console    List: ${fruits}

List Manipulation
    ${fruits}    Create List    Apple    Grape    Orange    Kiwi
    Length Should Be            ${fruits}    4
    List Should Contain Value   ${fruits}    Grape
    Append To List              ${fruits}    Lemon
    Remove Values From List     ${fruits}    Kiwi
    ${another_fruits}    Create List    Apple    Grape    Orange    Lemon
    Lists Should Be Equal       ${fruits}    ${another_fruits}
    Should Be Equal As Strings    ${fruits}[0]    Apple