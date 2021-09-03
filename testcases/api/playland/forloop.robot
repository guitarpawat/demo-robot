*** Test Cases ***
Test For Loop Over Dictionary
    ${dict}    Create Dictionary    a=ant    b=bird    c=cat    d=dog
    FOR    ${key}    ${val}    IN    &{dict}
        Log To Console   The key is '${key}' and value is '${val}'
        # Some other keyword
    END

Test For Loop Over List
    ${list}    Create List    ant    bird    cat    dog
    FOR    ${val}    IN    @{list}
        Log To Console   The value is '${val}'
        # Some other keyword
    END