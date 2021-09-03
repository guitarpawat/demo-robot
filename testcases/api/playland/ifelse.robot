*** Test Cases ***
Basic Boolean Evaluation
    ${hi}    Set Variable    hello
    ${answer}    Set Variable    42
    Run Keyword If    '${hi}' == 'hello'
    ...    Log To Console    hi is 'hello'
    ...    ELSE
    ...    Log To Console    hi is not 'hello'
    Run Keyword If    ${answer} > 42
    ...    Log To Console    answer is more than 42
    ...    ELSE IF    ${answer} < 42
    ...    Log To Console    answer is less than 42
    ...    ELSE
    ...    Log To Console    answer is equals to 42
    Run Keyword If    '${hi}' == 'hello' and ${answer} == 42
    ...    Log To Console    This test works perfectly

Basic Boolean Evaluation 2
    ${hi}    Set Variable    hello
    ${answer}    Set Variable    42
    Run Keyword If    '${hi}' == 'hello' and ${answer} == 42
    ...    Run Keywords
    ...    Log To Console    hi is 'hello'
    ...    AND    Log To Console    and answer is also equals to 42

Basic Boolean Evaluation 3
    ${answer}    Set Variable    42
    IF    ${answer} > 42
        Log To Console    answer is more than 42
    ELSE IF    ${answer} < 42
        Log To Console    answer is less than 42
    ELSE
        Log To Console    answer is equals to 42
        Log To Console    More keywords without `Run Keywords`
    END