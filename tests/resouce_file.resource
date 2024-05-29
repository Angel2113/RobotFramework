*** Settings ***
Documentation    A resource file with reusable keywords and variables.
...              Another line
Library          SeleniumLibrary
Library          OperatingSystem


*** Variables ***
${Error_Message_Login}        css:.alert-danger
${user_name}                  rahulshettyacademy
${invalid_password}           12345
${valid_password}             learning
${url}                        https://www.rahulshettyacademy.com/loginpagePractise/
${Shop_page_load}             css:.nav-link


*** Keywords ***
Open the browser with the login url
    Create Webdriver    Chrome
    Go To    ${url}