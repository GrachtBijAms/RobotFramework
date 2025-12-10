*** Settings ***
Library   SeleniumLibrary
Resource    ../resources/Keywords.resource

*** Variables ***
${PAGE_URL}    https://www.google.com
${BROWSER}    firefox

*** Test Cases ***
Example Test
    Log    Test Start
    Go to WebPage    ${PAGE_URL}    ${BROWSER}
    Close Browser 

 
 
Example Test 2
    Log    Test Start
    Open Browser   ${PAGE_URL}    ${BROWSER}
    Close Browser 