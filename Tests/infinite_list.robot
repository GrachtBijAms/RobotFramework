*** Settings ***
Library   SeleniumLibrary
Library   Collections
Library   OperatingSystem
Library   String
Library   BuiltIn
Resource    ../resources/Keywords.resource

*** Variables ***
${TEST_SITE_URL}    https://grachtbijams.github.io/playwrightJS/res/testsite.html
${BROWSER}    chrome
${ADMIN_USERNAME}    admin
${ADMIN_PASSWORD}    password123


*** Test Cases ***

# Infinite List Test
Test Load More Items
    [Documentation]    Load more items in infinite list
    Open Browser    ${TEST_SITE_URL}    ${BROWSER}
    Maximize Browser Window
    Click Button    xpath=//button[contains(text(), 'Load More')]
    Sleep    1s
    Close Browser
