*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    Collections
Test Teardown    Close Browser

*** Variables ***
${Error_Message_Login}        css:.alert-danger

*** Test Cases ***
Validate Unsuccessful Login
    Open the browser with the login url
    Fill the login Form
    wait until it check and displayed error message
    verify error message is correct

*** Keywords ***
Open the browser with the login url
    Create Webdriver    Chrome
    Go To    https://www.rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    Input Text    id:username    correo@gmail.com
    Input Password    id:password    12345
    Click Button    id:signInBtn

wait until it check and displayed error message
    Wait Until Element Is Visible    ${Error_Message_Login}

verify error message is correct
    ${result}=    Get Text    css:.alert-danger
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

