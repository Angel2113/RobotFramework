*** Settings ***
Library    RequestsLibrary
Library    Collections


*** Variables ***
${base_url}    https://rahulshettyacademy.com
${book_id}


*** Test Cases ***
Add Book into Library DataBase
    [Tags]    API
    &{req_body}    Create Dictionary    name=RobotFramework    isbn=984353    aisle=324353    author=AutorName
    ${response}=    POST    ${base_url}/Library/Addbook.php    json=${req_body}    expected_status=200
    log    ${response.json()}
    Dictionary Should Contain Key    ${response.json()}    ID
    ${book_id}    Get From Dictionary    ${response.json()}    ID
    Set Global Variable    ${book_id}
    log    ${book_id}
    

Get the book details
    [Tags]    API
    ${get_response}=    GET    ${base_url}/Library/GetBook.php    params=ID=${book_id}    expected_status=200
    Log     ${get_response.json()}

Delete the book from database
    [Tags]    API
    &{delete_req}=    Create Dictionary    ID=${book_id}
    ${delete_resp}=    POST    ${base_url}/Library/DeleteBook.php    json=${delete_req}    expected_status=200
    Log    ${delete_resp.json()}
    Should Be Equal As Strings    book is successfully deleted    ${delete_resp.json()}[msg]    