*** Settings ***
Resource    ../resources/common_keywords.resource
Resource    ../resources/page_objects/HomePage.resource

*** Test Cases ***
Dang nhap thanh cong
    Go To    ${BASE_URL}
    Sleep    2s
    Location Should Contain    /dashboard/

Dang nhap sai username
    Go To    ${BASE_URL}/logout/
    Sleep    2s
    Type Text    ${LOGIN_USERNAME_INPUT}    cuongbui
    Type Text    ${LOGIN_PASSWORD_INPUT}    ${ADMIN_PASS}
    Click Element    ${LOGIN_SUBMIT_BTN}
    Sleep    3s
    ${url}=    Get Location
    Should Not Contain    ${url}    /dashboard/

Dang nhap sai mat khau
    Type Text    ${LOGIN_USERNAME_INPUT}    ${ADMIN_USER}
    Type Text    ${LOGIN_PASSWORD_INPUT}    1111111
    Click Element    ${LOGIN_SUBMIT_BTN}
    Sleep    3s
    ${url}=    Get Location
    Should Not Contain    ${url}    /dashboard/

Dang xuat
    Type Text    ${LOGIN_USERNAME_INPUT}    ${ADMIN_USER}
    Type Text    ${LOGIN_PASSWORD_INPUT}    ${ADMIN_PASS}
    Click Element    ${LOGIN_SUBMIT_BTN}
    Sleep    5s
    Location Should Contain    /dashboard/
    Click Element    ${HOME_LOGOUT_LINK}
    Sleep    3s
    ${url}=    Get Location
    Should Not Contain    ${url}    /dashboard/
    Login As Admin
    Sleep    2s
    Location Should Contain    /dashboard/
