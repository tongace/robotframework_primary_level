*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    ${LOCAL_URL}   ${BROWSER}
Suite Teardown    Close Browser
Test Template    Login Steps

*** Variables ***
${LOCAL_URL}    http://localhost:7272/html
${BROWSER}      chrome

*** Test Cases ***
Login All
    [Template]    Login Steps
        SORA    AOI    Welcome
        ${EMPTY}    ${EMPTY}    Error
        ${EMPTY}    1234    Error

*** Keywords ***
Login Steps
    [Arguments]    ${USER_NAME}     ${PASSWORD}    ${EXPECTED_RESULT}
    Go To    ${LOCAL_URL}
    กรอกข้อมูลในการ login    ${USER_NAME}     ${PASSWORD}
    กดปุ่ม login
    ตรวจสอบผลการ login    ${EXPECTED_RESULT}
กรอกข้อมูลในการ login
    [Arguments]    ${USER_NAME}     ${PASSWORD}
    Input Text    username_field    ${USER_NAME}
    Input Text    password_field    ${PASSWORD}
กดปุ่ม login
    Click Button    login_button
ตรวจสอบผลการ login
    [Arguments]    ${EXPECTED_RESULT}
    Wait Until Page Contains    ${EXPECTED_RESULT}
    Capture Page Screenshot