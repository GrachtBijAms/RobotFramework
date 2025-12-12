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


# Dynamic Content Tests
Test Load Dynamic Message
    [Documentation]    Load message with 2 second delay
    Open Browser    ${TEST_SITE_URL}    ${BROWSER}
    Maximize Browser Window
    Click Button    id=load-btn
    Page Should Contain    Loading...
    Sleep    2s
    Page Should Contain    Dynamic content loaded!

# Modal Popup Tests
Test Open Modal
    [Documentation]    Open and verify modal popup
    Click Button    id=open-modal-btn
    Sleep    1s
    Page Should Contain Element    id=modal-text    text=This is a modal dialog.

Test Close Modal
    [Documentation]    Close modal popup
    Click Button    id=open-modal-btn
    Sleep    0.5s
    Click Button    xpath=//button[contains(text(), 'Close')]


# Tabs Tests
Test Switch Between Tabs
    [Documentation]    Switch between different tabs
    Open Browser    ${TEST_SITE_URL}    ${BROWSER}
    Maximize Browser Window
    Click Button    xpath=//button[contains(text(), 'Products Tab')]
    Sleep    1s
    Click Button    xpath=//button[contains(text(), 'API Tab')]
    Sleep    1s
    Close Browser

# Tooltip Test
Test Verify Tooltip
    [Documentation]    Verify tooltip on hover
    Open Browser    ${TEST_SITE_URL}    ${BROWSER}
    Maximize Browser Window
    Mouse Over    id=tooltip-btn
    Sleep    1s


