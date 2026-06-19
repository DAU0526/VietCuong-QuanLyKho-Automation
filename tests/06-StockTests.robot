*** Settings ***
Resource    ../resources/page_objects/StockPage.resource

*** Test Cases ***
Xem danh sach ton kho
    Go To    ${BASE_URL}/stock/
    Sleep    3s
    Wait Until Element Is Visible    ${STOCK_PAGE_TITLE}    15s

Tim kiem ton kho
    Go To    ${BASE_URL}/stock/
    Sleep    2s
    Type Text    ${STOCK_SEARCH_INPUT}    Xi mang
    Press Keys    ${STOCK_SEARCH_INPUT}    ENTER
    Sleep    2s
