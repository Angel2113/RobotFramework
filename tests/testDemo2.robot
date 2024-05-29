*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    Collections
Resource   resouce_file.resource
Test Setup       Open the browser with the login url
Test Teardown    Close Browser

*** Test Cases ***
Validate Unsuccessful Login
    Fill the login Form    ${user_name}    ${invalid_password}
    wait until element is displayed    ${Error_Message_Login}
    verify error message is correct

Validate Cards displayed
    Fill The Login Form    ${user_name}    ${valid_password}
    wait until element is displayed    ${Shop_page_load}
    Verify Card titles in the shop page
    Select the Card    BlackBerry

Select the Form and navigate to Child window
    Fill the Login Details and select the Admin User option    ${user_name}    ${valid_password}


*** Keywords ***
Fill the login Form
    [Arguments]    ${user_name}    ${password}
    Input Text    id:username    ${user_name}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn

wait until element is displayed
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

verify error message is correct
    ${result}=    Get Text    css:.alert-danger
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

Verify Card titles in the shop page
    @{ExpectedList}    Create List    iphone X     Samsung Note 8    Nokia Edge    Blackberry
    ${elements}    Get Webelements    css:.card-title
    @{currentList}    Create List
    FOR    ${element}    IN    @{elements}
        LOG    ${element.text}
        Append To List    ${currentList}    ${element.text}
    END
    Lists Should Be Equal    ${currentList}    ${ExpectedList}

Select the Card
    [Arguments]    ${cardName}
    ${elements}    Get Webelements    css:.card-title
    ${index}       Set Variable    1
    FOR    ${element}    IN    @{elements}
        Exit For Loop If    '${cardName}' == '${element.text}'
        ${index}    Set Variable    Convert To Number    ${index} + 1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button

Fill the Login Details and select the Admin User option
    [Arguments]    ${user_name}    ${password}
    Input Text        id:username    ${user_name}
    Input Password    id:password    ${password}
    Click Element     css:input[value='user']
    Wait Until Element Is Visible    css:.modal-body
    Click Button    id:okayBtn
    Select From List By Value    css:select.form-control    teach
    Select Checkbox    terms
    Checkbox Should Be Selected    terms

