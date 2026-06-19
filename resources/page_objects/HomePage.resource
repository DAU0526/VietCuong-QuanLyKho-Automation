*** Settings ***
Variables    ../locators/HomePageLocators.py
Resource    ../base_keywords.resource

*** Keywords ***
Dashboard Should Be Loaded
    Wait Until Element Is Visible    ${HOME_PAGE_TITLE}    15s
    Log    Dashboard đã load    console=True

Get Stat Cards Count
    ${count}=    Get Element Count    ${HOME_STAT_CARDS}
    Log    Số thống kê: ${count}    console=True
    RETURN    ${count}

Get Quick Actions Count
    ${count}=    Get Element Count    ${HOME_QUICK_ACTIONS}
    Log    Số thao tác nhanh: ${count}    console=True
    RETURN    ${count}

Open User Profile Popup
    Click Element    ${HOME_USER_POPUP_TOGGLE}
    Wait Until Element Is Visible    ${HOME_USER_POPUP_CLOSE}    10s

Close User Profile Popup
    Click Element    ${HOME_USER_POPUP_CLOSE}
    Wait Until Element Is Not Visible    ${HOME_USER_POPUP_CLOSE}    10s

Click Logout
    Click Element    ${HOME_LOGOUT_LINK}
    Wait Until Location Does Not Contain    /dashboard/    10s
