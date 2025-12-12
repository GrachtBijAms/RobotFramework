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
 

# Preferences Tests
Test Save Preferences
    [Documentation]    Save user preferences
    Open Browser    ${TEST_SITE_URL}    ${BROWSER}
    Maximize Browser Window
    Select Checkbox    id=tool-selenium
    Select Checkbox    id=tool-playwright
    Select Radio Button    level   intermediate
    Select From List By Value    id=language-select    python
    Input Text    id=comments    This is a test comment
    Click Button    id=save-pref-btn
    Sleep    1s

Test Unselect Preferences
    [Documentation]    Test unchecking preference options
    Open Browser    ${TEST_SITE_URL}    ${BROWSER}
    Maximize Browser Window
    Select Checkbox    id=tool-cypress
    Unselect Checkbox    id=tool-cypress
    Sleep    1s

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


# Multi-step Wizard Tests
Test Navigate Through Wizard Steps
    [Documentation]    Navigate through multi-step wizard
    Open Browser    ${TEST_SITE_URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=wiz-first-name    John
    Input Text    id=wiz-last-name    Doe
    Click Button    id=wiz-next-btn
    Sleep    1s
    Click Button    id=wiz-prev-btn
    Sleep    1s
    Close Browser

# End of Test Cases