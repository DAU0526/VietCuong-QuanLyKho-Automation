*** Settings ***
Variables    ../locators/InventoryPageLocators.py
Resource    ../base_keywords.resource

*** Keywords ***
Audit Page Should Be Loaded
    Wait Until Element Is Visible    ${INV_PAGE_TITLE}    15s
    ${title}=    Get Text    ${INV_PAGE_TITLE}
    Log    Trang kiểm kê: ${title}    console=True

Get Audit Count
    ${count}=    Get Element Count    ${INV_AUDIT_TABLE_ROWS}
    Log    Số phiếu kiểm kê: ${count}    console=True
    RETURN    ${count}

Loss Page Should Be Loaded
    Wait Until Element Is Visible    ${INV_PAGE_TITLE}    15s
    ${title}=    Get Text    ${INV_PAGE_TITLE}
    Log    Trang hao hụt: ${title}    console=True

Discrepancy Page Should Be Loaded
    Wait Until Element Is Visible    ${INV_PAGE_TITLE}    15s
    ${title}=    Get Text    ${INV_PAGE_TITLE}
    Log    Trang chênh lệch kho: ${title}    console=True
