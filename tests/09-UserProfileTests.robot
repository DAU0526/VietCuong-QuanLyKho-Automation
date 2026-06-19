*** Settings ***
Resource    ../resources/page_objects/HomePage.resource

*** Test Cases ***
Xem popup profile
    Go To    ${BASE_URL}/dashboard/
    Sleep    2s
    Click Element    ${HOME_USER_POPUP_TOGGLE}
    Sleep    2s
    Execute JavaScript    document.querySelector('[data-user-close]').click()
    Sleep    2s
