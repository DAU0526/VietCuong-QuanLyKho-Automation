*** Settings ***
Resource    ../resources/page_objects/ImportPage.resource
Resource    ../resources/page_objects/ExportPage.resource

*** Test Cases ***
Danh sach phieu nhap kho
    Go To    ${BASE_URL}/import/
    Sleep    3s
    Wait Until Element Is Visible    ${IMPORT_PAGE_TITLE}    15s

Tim kiem phieu nhap
    Go To    ${BASE_URL}/import/
    Sleep    2s
    Type Text    ${IMPORT_SEARCH_INPUT}    PN
    Press Keys    ${IMPORT_SEARCH_INPUT}    ENTER
    Sleep    2s

Danh sach phieu xuat kho
    Go To    ${BASE_URL}/export/
    Sleep    3s
    Wait Until Element Is Visible    ${EXPORT_PAGE_TITLE}    15s

Loc phieu xuat
    Go To    ${BASE_URL}/export/
    Sleep    2s
    ${tabs}=    Get WebElements    ${EXPORT_FILTER_TABS}
    ${count}=    Get Length    ${tabs}
    IF    ${count} > 0
        Click Element    ${tabs[0]}
        Sleep    2s
    END
