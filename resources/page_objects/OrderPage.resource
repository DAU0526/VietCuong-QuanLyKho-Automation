*** Settings ***
Variables    ../locators/OrderPageLocators.py
Resource    ../base_keywords.resource

*** Keywords ***
Order Page Should Be Loaded
    Wait Until Element Is Visible    ${ORDER_PAGE_TITLE}    15s
    ${title}=    Get Text    ${ORDER_PAGE_TITLE}
    Log    Trang đơn hàng: ${title}    console=True

Get Order Count
    ${count}=    Get Element Count    ${ORDER_TABLE_ROWS}
    Log    Số đơn hàng: ${count}    console=True
    RETURN    ${count}

Click Filter Tab By Index
    [Arguments]    ${index}=0
    ${tabs}=    Get WebElements    ${ORDER_FILTER_TABS}
    ${count}=    Get Length    ${tabs}
    IF    ${count} > 0
        Click Element    ${tabs[${index}]}
        Sleep    2s
        Log    Đã click filter tab index ${index}    console=True
    END
