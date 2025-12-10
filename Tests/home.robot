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

# Product Search Tests
Test Search Products By Keyword
    [Documentation]    Search for products using keyword
    Go To    ${TEST_SITE_URL}
    Input Text    id=search    Keyboard
    Click Button    id=search-btn
    Sleep    1s
    Alert Should Be Present   text=Search executed for: Keyboard  action=ACCEPT 

Test Clear Search
    [Documentation]    Test clearing search results
    Open Browser    ${TEST_SITE_URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=search    Mouse
    Click Button    id=search-btn
    Sleep    0.5s
    Alert Should Be Present   text=Search executed for: Mouse  action=ACCEPT 
    Click Button    id=clear-search-btn

Test Sort Products By Price
    [Documentation]    Sort products by price
    Click Button    id=sort-price-btn
    Sleep    1s

Test Add Product To Cart
    [Documentation]    Add products to shopping cart
    Open Browser    ${TEST_SITE_URL}    ${BROWSER}
    Maximize Browser Window
    Click Button    xpath=//button[contains(text(), 'Add to Cart')][1]
    Sleep    1s

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
    Open Browser    ${TEST_SITE_URL}    ${BROWSER}
    Maximize Browser Window
    Drag And Drop    id=slider    id=slider
    Sleep    1s
    Close Browser

# Shopping Cart Tests
Test Clear Shopping Cart
    [Documentation]    Clear all items from shopping cart
    Open Browser    ${TEST_SITE_URL}    ${BROWSER}
    Maximize Browser Window
    Click Button    id=clear-cart-btn
    Sleep    1s
    Close Browser

Test View Cart Items Count
    [Documentation]    Verify cart items count
    Open Browser    ${TEST_SITE_URL}    ${BROWSER}
    Maximize Browser Window
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

# Infinite List Test
Test Load More Items
    [Documentation]    Load more items in infinite list
    Open Browser    ${TEST_SITE_URL}    ${BROWSER}
    Maximize Browser Window
    Click Button    xpath=//button[contains(text(), 'Load More')]
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