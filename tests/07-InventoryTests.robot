*** Settings ***
Resource    ../resources/page_objects/InventoryPage.resource

*** Test Cases ***
Danh sach kiem ke
    Go To    ${BASE_URL}/inventory/audits/
    Sleep    3s
    Wait Until Element Is Visible    ${INV_PAGE_TITLE}    15s

Danh sach hao hut
    Go To    ${BASE_URL}/inventory/losses/
    Sleep    3s
    Wait Until Element Is Visible    ${INV_PAGE_TITLE}    15s

Chenh lech kho
    Go To    ${BASE_URL}/inventory/discrepancy/
    Sleep    3s
