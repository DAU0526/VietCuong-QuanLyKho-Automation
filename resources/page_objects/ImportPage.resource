*** Settings ***
Variables    ../locators/ImportPageLocators.py
Resource    ../base_keywords.resource

*** Keywords ***
Import Page Should Be Loaded
    Wait Until Element Is Visible    ${IMPORT_PAGE_TITLE}    15s
    ${title}=    Get Text    ${IMPORT_PAGE_TITLE}
    Log    Trang nhập kho: ${title}    console=True

Get Import Receipt Count
    ${count}=    Get Element Count    ${IMPORT_TABLE_ROWS}
    Log    Số phiếu nhập: ${count}    console=True
    RETURN    ${count}

Click Import Filter Tab
    [Arguments]    ${index}=0
    ${tabs}=    Get WebElements    ${IMPORT_FILTER_TABS}
    ${count}=    Get Length    ${tabs}
    IF    ${count} > 0
        Click Element    ${tabs[${index}]}
        Sleep    2s
        Log    Đã click filter tab index ${index}    console=True
    END

Search Import
    [Arguments]    ${keyword}
    Type Text    ${IMPORT_SEARCH_INPUT}    ${keyword}
    Press Keys    ${IMPORT_SEARCH_INPUT}    ENTER
    Sleep    2s
    Log    Đã tìm kiếm "${keyword}"    console=True
