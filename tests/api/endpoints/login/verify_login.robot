*** Settings ***
Resource    ../../../../testdata/variables/import.resource

Library    RequestsLibrary

*** Test Cases ***
Verify Login Returns 200
    Log To Console    \nSending Request To ${GLOBAL_ENDPOINT_LOGIN}\n
    &{jsonBody}    Create Dictionary    username=admin    password=masterPass
    POST    url=${GLOBAL_ENDPOINT_LOGIN}    json=${jsonBody}    expected_status=200
    