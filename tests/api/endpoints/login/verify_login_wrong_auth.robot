*** Settings ***
Resource    ../../../../testdata/variables/import.resource
Resource    ../../../../keywords/validations.robot

Library    RequestsLibrary
Library    ../../../../lib/json_validate_schema.py

Test Template    Custom Test Template

*** Test Cases ***                                    USERNAME            PASSWORD
Verify Login With Wrong Password Returns 401           admin               wrongPass

Verify Login With Wrong User Returns 401               guest                masterPass

Verify Login With Empty Data Returns 401               ${EMPTY}            ${EMPTY}

Verify Login With Wrong User And Password Returns 401    guest        wrongPass


*** Keywords ***
Custom Test Template
    [Arguments]    ${username}        ${password}
    Log To Console    \nSending Request To ${GLOBAL_ENDPOINT_LOGIN}
    &{jsonBody}    Create Dictionary    username=${username}    password=${password}
    ${response}    POST    ${GLOBAL_ENDPOINT_LOGIN}    json=${jsonBody}    expected_status=401
    Validate Schema    input_json=${response.json()}   referenceSchemaPath=${GLOBAL_SCHEMA_ERROR}