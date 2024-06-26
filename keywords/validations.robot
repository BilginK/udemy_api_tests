*** Settings ***
Library    ../lib/json_validate_schema.py

*** Keywords ***
Validate Schema
    [Arguments]    ${input_json}    ${referenceSchemaPath}
    Log To Console  Validating the JSON Schema!
    Validate Json Schema    input_json=${input_json}    reference_schema_path=${referenceSchemaPath}

