*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    ${LOCAL_URL}   ${BROWSER}
Test Setup    Go To    ${LOCAL_URL}
Suite Teardown    Close Browser

*** Variables ***
${LOCAL_URL}    http://localhost:7272/html
${BROWSER}      chrome

*** Test Cases ***
Login Succcess
    [Documentation]    Test Case Number 1
    กรอกข้อมูลในการ login    SORA    AOI
    กดปุ่ม login
    ตรวจสอบผลการ login    Welcome
Login Fail with User and Password are blank value
    [Documentation]    Test Case Number 2
    กรอกข้อมูลในการ login    ${EMPTY}    ${EMPTY}
    กดปุ่ม login
    ตรวจสอบผลการ login    Error

Login Fail with User is blank value
    [Documentation]    Test Case Number 3
    กรอกข้อมูลในการ login    ${EMPTY}    1234
    กดปุ่ม login
    ตรวจสอบผลการ login    Error

*** Keywords ***
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