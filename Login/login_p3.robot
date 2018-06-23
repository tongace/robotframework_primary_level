*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    ${LOCAL_URL}   ${BROWSER}
Test Setup    Go To    ${LOCAL_URL}
Suite Teardown    Close Browser
Test Template    login Steps
Resource    resource_p.robot

*** Variables ***
${LOCAL_URL}    http://localhost:7272/html
${BROWSER}      chrome

*** Test Cases ***
Login Succcess    SORA    AOI    Welcome
    [Documentation]    Test Case Number 1
Login Fail with User and Password are blank value    ${EMPTY}    ${EMPTY}    Error
    [Documentation]    Test Case Number 2
Login Fail with User is blank value    ${EMPTY}    1234    Error
    [Documentation]    Test Case Number 3

# *** Keywords ***
# login Steps
#     [Arguments]    ${USER_NAME}     ${PASSWORD}    ${EXPECTED_RESULT}
#     กรอกข้อมูลในการ login    ${USER_NAME}     ${PASSWORD}
#     กดปุ่ม login
#     ตรวจสอบผลการ login    ${EXPECTED_RESULT}
# กรอกข้อมูลในการ login
#     [Arguments]    ${USER_NAME}     ${PASSWORD}
#     Input Text    username_field    ${USER_NAME}
#     Input Text    password_field    ${PASSWORD}
# กดปุ่ม login
#     Click Button    login_button
# ตรวจสอบผลการ login
#     [Arguments]    ${EXPECTED_RESULT}
#     Wait Until Page Contains    ${EXPECTED_RESULT}
#     Capture Page Screenshot