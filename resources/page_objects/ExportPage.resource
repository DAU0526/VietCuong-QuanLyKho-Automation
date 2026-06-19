*** Settings ***
Variables    ../locators/ExportPageLocators.py
Resource    ../base_keywords.resource

*** Keywords ***
Export Page Should Be Loaded
    Wait Until Element Is Visible    ${EXPORT_PAGE_TITLE}    15s
    ${title}=    Get Text    ${EXPORT_PAGE_TITLE}
    Log    Trang xuất kho: ${title}    console=True

Get Export Receipt Count
    ${count}=    Get Element Count    ${EXPORT_TABLE_ROWS}
    Log    Số phiếu xuất: ${count}    console=True
    RETURN    ${count}

Click Export Filter Tab
    [Arguments]    ${index}=0
    ${tabs}=    Get WebElements    ${EXPORT_FILTER_TABS}
    ${count}=    Get Length    ${tabs}
    IF    ${count} > 0
        Click Element    ${tabs[${index}]}
        Sleep    2s
        Log    Đã click filter tab index ${index}    console=True
    END

Search Export
    [Arguments]    ${keyword}
    Type Text    ${EXPORT_SEARCH_INPUT}    ${keyword}
    Press Keys    ${EXPORT_SEARCH_INPUT}    ENTER
    Sleep    2s
    Log    Đã tìm kiếm "${keyword}"    console=True
