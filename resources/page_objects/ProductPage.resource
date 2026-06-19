*** Settings ***
Variables    ../locators/ProductPageLocators.py
Resource    ../base_keywords.resource

*** Keywords ***
Product Page Should Be Loaded
    Wait Until Element Is Visible    ${PROD_PAGE_TITLE}    15s
    ${title}=    Get Text    ${PROD_PAGE_TITLE}
    Log    Trang sản phẩm: ${title}    console=True

Get Product Count
    ${count}=    Get Element Count    ${PROD_TABLE_ROWS}
    Log    Số sản phẩm: ${count}    console=True
    RETURN    ${count}

Search Product
    [Arguments]    ${keyword}
    Type Text    ${PROD_SEARCH_INPUT}    ${keyword}
    Press Keys    ${PROD_SEARCH_INPUT}    ENTER
    Sleep    2s
    Log    Đã tìm kiếm "${keyword}"    console=True

Open Create Product Modal
    Click Element    ${PROD_CREATE_BTN}
    Sleep    1s
    Wait Until Element Is Visible    ${PROD_MODAL_FORM}    10s
    Log    Modal tạo sản phẩm đã mở    console=True

Close Product Modal
    Click Element    ${PROD_CANCEL_BTN}
    Sleep    1s
    Wait Until Element Is Not Visible    ${PROD_MODAL_FORM}    10s
    Log    Đã đóng modal    console=True

Fill Create Product Form
    [Arguments]    ${name}    ${unit}    ${price}
    Type Text    ${PROD_F_NAME}    ${name}
    Type Text    ${PROD_F_UNIT}    ${unit}
    Type Text    ${PROD_F_PRICE}    ${price}
    Log    Đã nhập thông tin sản phẩm: ${name}    console=True

Submit Product Form
    Click Element    ${PROD_SUBMIT_BTN}
    Sleep    3s
    Log    Đã submit form sản phẩm    console=True
