*** Settings ***
Resource    ../resources/common_keywords.resource

*** Test Cases ***
Dashboard
    Go To    ${BASE_URL}/dashboard/
    Sleep    2s

Danh muc
    Go To    ${BASE_URL}/categories/
    Sleep    2s

Don vi va quy doi
    Go To    ${BASE_URL}/units/
    Sleep    2s

Tai khoan
    Go To    ${BASE_URL}/accounts/
    Sleep    2s
