*** Settings ***
Library    Collections
Library    RequestsLibrary

*** Variables ***
${base-url}     https://rahulshettyacademy.com
${book_id}
${book_name}    RobotFramework
*** Test Cases ***
Play around with dictionary
   [Tags]      API
   &{data}=  Create Dictionary       name=rahulshetty    course=robot    website=rahulshettyacademy.com
   Log    ${data}
   Dictionary Should Contain Key      ${data}     name
   Log    ${data}[name]
   ${url}=      Get From Dictionary    ${data}      website
   log     ${url}

Add Book into Library Database
    [Tags]      API
    &{body}=    Create Dictionary    name=${book_name}   isbn=20      aisle=20      author=Piyush
    ${response}=    POST        ${base-url}/Library/Addbook.php     json=${body}    expected_status=200
    Log     ${response.json()}
    Dictionary Should Contain Key      ${response.json()}   ID
    ${book_id}=      Get From Dictionary    ${response.json()}      ID
    Set Global Variable    ${book_id}
    Log    ${book_id}
    Should Be Equal As Strings    successfully added    ${response.json()}[Msg]

Get the book detail whivch we have added
    [Tags]      API
    ${get_resp}=    GET    ${base-url}/Library/GetBook.php      params=ID=${book_id}    expected_status=200
    Log     ${get_resp.json()}
    Should Be Equal As Strings    ${book_name}      ${get_resp.json()}[0][book_name]

Delete the book from database
    &{delete_req}=  Create Dictionary    ID=${book_id}
    ${delete_resp}=     POST   ${base-url}/Library/DeleteBook.php   json=${delete_req}      expected_status=200
    log      ${delete_resp.json()}
    Should Be Equal As Strings    book is successfully deleted      ${delete_resp.json()}[msg]