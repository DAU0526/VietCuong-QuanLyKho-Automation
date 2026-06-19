*** Settings ***
Resource    ../resources/page_objects/OrderPage.resource

*** Test Cases ***
Xem danh sach don hang
    Go To    ${BASE_URL}/sales/
    Sleep    3s
    Wait Until Element Is Visible    ${ORDER_PAGE_TITLE}    15s

Loc don hang theo trang thai
    Go To    ${BASE_URL}/sales/
    Sleep    2s
    ${count}=    Get Element Count    ${ORDER_FILTER_TABS}
    FOR    ${i}    IN RANGE    ${count}
        ${tabs}=    Get WebElements    ${ORDER_FILTER_TABS}
        Click Element    ${tabs[${i}]}
        Sleep    1s
    END

Xem bao cao don hang
    Go To    ${BASE_URL}/sales/report/
    Sleep    3s
