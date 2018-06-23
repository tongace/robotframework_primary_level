*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    ${LOCAL_URL}   ${BROWSER}
Test Setup    Go To    ${LOCAL_URL}
Suite Teardown    Close Browser
Test Template    login Steps
Resource    resource_p.robot

*** Test Cases ***
Login Succcess    SORA    AOI    Welcome
    [Documentation]    Test Case Number 1
Login Fail with User and Password are blank value    ${EMPTY}    ${EMPTY}    Error
    [Documentation]    Test Case Number 2
Login Fail with User is blank value    ${EMPTY}    1234    Error
    [Documentation]    Test Case Number 3
Login Fail with Password is Blank    Admin    ${EMPTY}    Error
Login Fail with Wrong User name and Password    Patrick    Viera    Error
