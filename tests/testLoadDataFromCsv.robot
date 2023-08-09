*** Settings ***
Documentation   to validate a login form
Library    SeleniumLibrary
Library    DataDriver   file=resources/data.csv     encoding=utf_8      dialect=unix
Test Teardown    Close Browser
Test Template    Validate successful login

*** Variables ***
${error_message_login}    css:.alert-danger

*** Test Cases ***  username    password
Login with user ${username} and password ${password}        xyc     12345

*** Keywords ***
Validate successful login
    [Arguments]    ${username}     ${password}
    Open the browser with the Mortgage payment url
    Fill the login Form      ${username}     ${password}
    wait until it checks and display error message
    verify error message is correct


Open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    [Arguments]    ${username}     ${password}
    Input Text    id:username       ${username}
    Input Password    id:password   ${password}
    Click Button    signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${error_message_login}

verify error message is correct
    ${result}=  Get Text    ${error_message_login}
    Should Be Equal As Strings    ${result}     Incorrect username/password.
