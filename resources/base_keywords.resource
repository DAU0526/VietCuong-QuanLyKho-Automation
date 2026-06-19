*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${STEP_DELAY}    2s

*** Keywords ***
Log Step
    [Arguments]    ${number}    ${description}
    Log    ===========================================================    console=True
    Log    BƯỚC ${number}: ${description}    console=True
    Log    ===========================================================    console=True
    Sleep    ${STEP_DELAY}

Click Element
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    10s
    SeleniumLibrary.Click Element    ${locator}
    Sleep    0.5s

Type Text
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}    10s
    Clear Element Text    ${locator}
    Input Text    ${locator}    ${text}
    Sleep    0.3s
Get Element Count Safe
    [Arguments]    ${locator}
    ${count}=    Get Element Count    ${locator}
    RETURN    ${count}

Page Should Contain Title
    [Arguments]    ${expected_title}
    ${title}=    Get Title
    Should Contain    ${title}    ${expected_title}
