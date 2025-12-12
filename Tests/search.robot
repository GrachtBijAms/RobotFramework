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
${BROWSER}    firefox


*** Test Cases ***

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