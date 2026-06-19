*** Settings ***
Resource    ../resources/common_keywords.resource

*** Test Cases ***
Bao cao ton kho
    Go To    ${BASE_URL}/reports/stock/
    Sleep    3s
