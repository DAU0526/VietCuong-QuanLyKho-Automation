*** Settings ***
Resource    ../resources/page_objects/ProductPage.resource

*** Test Cases ***
Xem danh sach san pham
    Go To    ${BASE_URL}/product/
    Sleep    3s
    Wait Until Element Is Visible    ${PROD_PAGE_TITLE}    15s

Tim kiem san pham
    Go To    ${BASE_URL}/product/
    Sleep    2s
    Type Text    ${PROD_SEARCH_INPUT}    Xi mang
    Press Keys    ${PROD_SEARCH_INPUT}    ENTER
    Sleep    2s

Mo modal tao san pham
    Go To    ${BASE_URL}/product/
    Sleep    2s
    Click Element    ${PROD_CREATE_BTN}
    Sleep    1s
    Wait Until Element Is Visible    ${PROD_MODAL_FORM}    10s
    Click Element    ${PROD_CANCEL_BTN}
    Sleep    1s
