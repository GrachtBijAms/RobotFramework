*** Settings ***
Documentation    Keywords for the the Robot Framework
Library    SeleniumLibrary

*** Keywords ***
Go to WebPage
    [Arguments]    ${page_url}    ${browser}      
    Open Browser    ${page_url}    ${browser}
    Maximize Browser Window