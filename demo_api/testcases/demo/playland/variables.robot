*** Test Cases ***
Test Local Variable Assignment 1
    Local Variable Assignment 1
    
Test Local Variable Assignment 2
    There Is A Local Variable Set Inside This Keyword
    Log To Console    From outside keyword: ${local_var}
    Log To Console    It is impossible to reach this line!

Test Test Variable Assignment
    Assign Test Variable
    Log To Console    ${test_var}

Test Suite Variable Assignment 1
    Set Suite Variable    ${suite_var}    Hello from test1
    Log To Console    Test1: ${suite_var}

Test Suite Variable Assignment 2
    Log To Console    Test2: ${suite_var}


*** Keywords ***
Local Variable Assignment 1
    ${hello1}    Set Variable    Hello, world!
    Log To Console    hello1: ${hello1}
    ${hello2}=   Set Variable    Hello, world!
    Log To Console    hello2: ${hello2}
    ${hello3}    Single Return Value Keyword
    Log To Console    hello3: ${hello3}
    ${hello4}=    Single Return Value Keyword
    Log To Console    hello4: ${hello4}
    ${hello5}    ${hello6}    Multiple Return Value Keyword
    Log To Console    hello5: ${hello5}
    Log To Console    hello6: ${hello6}
    ${hello7}    ${hello8}=   Multiple Return Value Keyword
    Log To Console    hello7: ${hello7}
    Log To Console    hello8: ${hello8}

Single Return Value Keyword
    [Return]    hello

Multiple Return Value Keyword
    [Return]    hello    world
    
There Is A Local Variable Set Inside This Keyword
    ${local_var}    Set Variable    This is local variable
    Log To Console    From inside keyword: ${local_var}

Assign Test Variable
    Set Test Variable    ${test_var}    It works!