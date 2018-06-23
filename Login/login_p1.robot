*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
Login Succcess
    Open Browser    http://localhost:7272/html   chrome
    Input Text    username_field    SORA
    Input Text    password_field    AOI
    Click Button    login_button
    Wait Until Page Contains    Welcome
    Capture Page Screenshot
    Close Browser

Login Fail with User and Password are blank value
    [Documentation]    Test Case Number 2
    Open Browser    http://localhost:7272/html   chrome
    Input Text    username_field    ${EMPTY}
    Input Text    password_field    ${EMPTY}
    Click Button    login_button
    Wait Until Page Contains    Error
    Capture Page Screenshot
    Close Browser
*** Keywords ***