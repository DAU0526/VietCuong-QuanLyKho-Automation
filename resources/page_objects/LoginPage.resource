*** Settings ***
Variables    ../locators/LoginPageLocators.py
Resource    ../base_keywords.resource

*** Keywords ***
Login Should Fail
    [Arguments]    ${username}    ${password}
    Type Text    ${LOGIN_USERNAME_INPUT}    ${username}
    Type Text    ${LOGIN_PASSWORD_INPUT}    ${password}
    Click Element    ${LOGIN_SUBMIT_BTN}
    Wait Until Location Does Not Contain    /dashboard/    10s
    Location Should Not Contain    /dashboard/

Verify Login Page Is Visible
    Wait Until Element Is Visible    ${LOGIN_FORM}    10s
