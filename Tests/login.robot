*** Settings ***
Library   SeleniumLibrary
Library   Collections
Library   OperatingSystem
Library   String
Library   BuiltIn
Resource    ../resources/Keywords.resource

# Suite Setup and Teardown
Suite Setup    Open Browser    ${TEST_SITE_URL}   ${BROWSER}     options=add_argument("--start-maximized")
Suite Teardown    Close All Browsers
*** Variables ***
${TEST_SITE_URL}    https://grachtbijams.github.io/playwrightJS/res/testsite.html
${BROWSER}    chrome
${ADMIN_USERNAME}    admin
${ADMIN_PASSWORD}    password123


*** Test Cases ***

# Login Tests
Test Valid Login
    [Documentation]    Test successful login with valid credentials
    Go To    ${TEST_SITE_URL}
    Input Text    id=username    ${ADMIN_USERNAME}
    Input Text    id=password    ${ADMIN_PASSWORD}
    Click Button    id=login-btn
    Sleep    1s
    Page Should Contain    Login successful!

Test Invalid Login
    [Documentation]    Test login with invalid credentials
    Go To    ${TEST_SITE_URL}
    Input Text    id=username    invalid_user
    Input Text    id=password    wrong_password
    Click Button    id=login-btn
    Sleep    1s
    Page Should Contain    Invalid credentials.

Test Empty Login Fields
    [Documentation]    Test login with empty fields
    Go To    ${TEST_SITE_URL}
    Click Button    id=login-btn
    Sleep    1s
    Page Should Contain    Invalid credentials.
