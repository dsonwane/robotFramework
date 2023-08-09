*** Settings ***
Documentation   to validate a login form
Library    SeleniumLibrary
Library     ../customLibraries/Shop.py
Test Setup    Open the browser with the Mortgage payment url
Test Teardown    Close browser session
Resource        ../PO/Generic.robot

*** Variables ***
${error_message_login}    css:.alert-danger

*** Test Cases ***
Validate successful login

    Fill the login Form
    wait until it checks and display error message
    verify error message is correct
    Hello World

*** Keywords ***

Fill the login Form
    Input Text    id:username   ${user_name}
    Input Password    id:password   ${password}
    Click Button    signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${error_message_login}

verify error message is correct
    ${result}=  Get Text    ${error_message_login}
    Should Be Equal As Strings    ${result}     Incorrect username/password.
