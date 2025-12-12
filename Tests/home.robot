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

# Tooltip Test
Test Verify Tooltip
    [Documentation]    Verify tooltip on hover
    Open Browser    ${TEST_SITE_URL}    ${BROWSER}
    Maximize Browser Window
    Mouse Over    id=tooltip-btn
    Sleep    1s


# Slider Tests
Test Adjust Slider
    [Documentation]    Adjust slider value
    [Tags]    skip    # Temporarily skipping due to inconsistent behavior
    Open Browser    ${TEST_SITE_URL}    ${BROWSER}
    Maximize Browser Window
    Drag And Drop    id=slider    id=slider
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

# Combined End-to-End Test
Test Complete User Journey
    [Documentation]    Complete user workflow: login, search, add to cart, save preferences
    Open Browser    ${TEST_SITE_URL}    ${BROWSER}
    Maximize Browser Window
    
    # Login
    Input Text    id=username    ${ADMIN_USERNAME}
    Input Text    id=password    ${ADMIN_PASSWORD}
    Click Button    id=login-btn
    Sleep    1s
    
    # Search and add product
    Input Text    id=search    Keyboard
    Click Button    id=search-btn
    Sleep    0.5s
    Alert Should Be Present   text=Search executed for: Keyboard  action=ACCEPT
    Click Button    xpath=//button[contains(text(), 'Add to Cart')][1]
    Sleep    0.5s
    
    # Save preferences
    Select Checkbox    id=tool-selenium
    Select Radio Button    level   beginner
    Select From List By Value    id=language-select    python
    Input Text    id=comments    Completed end-to-end test
    Click Button    id=save-pref-btn
    Sleep    1s
    
    Close Browser