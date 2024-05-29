*** Settings ***
Documentation    To Validate the Login Form
Library    SeleniumLibrary
Library    String
Library    Collections
Resource    resouce_file.resource
Test Setup    Open the browser with the login url
Test Teardown    Close Browser

*** Variables ***


*** Test Cases ***
Validate Child window Functionality
    Select the link of Child window
    Verify the user switched to child window
    Grab the Email id in the Child Window
    Switch to Parent window and enter the Email

*** Keywords ***
Select the link of Child window
    Click Element    css:.blinkingText
    sleep    5
    

Verify the user switched to child window
    Switch Window    New
    Element Text Should Be    css:h1    Documents request
    
Grab the Email id in the Child Window
    ${text}=    Get Text    css:.red
    @{words}=    Split String    ${text}    at
    ${text_split}=    Get From List    ${words}    1
    @{words}=    Split String    ${text_split}
    

Switch to Parent window and enter the Email
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
