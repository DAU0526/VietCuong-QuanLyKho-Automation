*** Settings ***
Suite Setup    Open Browser And Login
Suite Teardown    Close Browser After Suite
Resource    ../resources/common_keywords.resource

*** Keywords ***
Open Browser And Login
    Open Browser To App    ${BASE_URL}    ${BROWSER}    ${DRIVER_PATH}
    Login As Admin
