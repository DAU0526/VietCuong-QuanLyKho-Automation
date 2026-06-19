*** Settings ***
Variables    ../locators/StockPageLocators.py
Resource    ../base_keywords.resource

*** Keywords ***
Stock Page Should Be Loaded
    Wait Until Element Is Visible    ${STOCK_PAGE_TITLE}    15s
    ${title}=    Get Text    ${STOCK_PAGE_TITLE}
    Log    Trang tồn kho: ${title}    console=True

Get Stock Count
    ${count}=    Get Element Count    ${STOCK_TABLE_ROWS}
    Log    Số sản phẩm tồn kho: ${count}    console=True
    RETURN    ${count}

Search Stock
    [Arguments]    ${keyword}
    Type Text    ${STOCK_SEARCH_INPUT}    ${keyword}
    Press Keys    ${STOCK_SEARCH_INPUT}    ENTER
    Sleep    2s
    Log    Đã tìm kiếm "${keyword}"    console=True
