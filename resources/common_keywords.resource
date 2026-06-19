*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Variables    locators/LoginPageLocators.py
Variables    locators/HomePageLocators.py
Resource    base_keywords.resource

*** Variables ***
${BASE_URL}       ${EMPTY}
${BROWSER}        Edge
${ADMIN_USER}     adminweb
${ADMIN_PASS}     12345678.
${DRIVER_PATH}    ${EMPTY}
${HEADLESS}       ${FALSE}

*** Keywords ***
Open Browser To App
    [Arguments]    ${url}    ${browser}=Edge    ${driver_path}=${EMPTY}
    IF    '${HEADLESS}' == 'true'
        ${options}=    Evaluate    getattr(selenium.webdriver, '${browser}Options')()    selenium
        Call Method    ${options}    add_argument    --headless
        IF    "${driver_path}" != "${EMPTY}"
            Open Browser    ${url}    browser=${browser}    options=${options}    executable_path=${driver_path}
        ELSE
            Open Browser    ${url}    browser=${browser}    options=${options}
        END
    ELSE
        IF    "${driver_path}" != "${EMPTY}"
            Open Browser    ${url}    browser=${browser}    executable_path=${driver_path}
        ELSE
            Open Browser    ${url}    browser=${browser}
        END
    END
    Maximize Browser Window
    Set Window Size    1280    900
    Set Selenium Implicit Wait    10s
    Set Selenium Timeout    30s
    Register Keyword To Run On Failure    NONE

Login As Admin
    [Arguments]    ${username}=${ADMIN_USER}    ${password}=${ADMIN_PASS}
    Delete All Cookies
    Go To    ${BASE_URL}
    Sleep    3s
    Type Text    ${LOGIN_USERNAME_INPUT}    ${username}
    Type Text    ${LOGIN_PASSWORD_INPUT}    ${password}
    Click Element    ${LOGIN_SUBMIT_BTN}
    Sleep    5s


Close Browser After Suite
    Close All Browsers
    Sleep    2s
