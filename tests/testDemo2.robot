*** Settings ***
Documentation   to validate a login form
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${error_message_login}    css:.alert-danger

*** Test Cases ***
Validate successful login
    Open the browser with the Mortgage payment url
    Fill the login Form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
Open the browser with the Mortgage payment url
    Create Webdriver    Edge
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    Input Text    id:username   diptisonwane
    Input Password    id:password   dipti123
    Click Button    signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${error_message_login}

verify error message is correct
    ${result}=  Get Text    ${error_message_login}
    Should Be Equal As Strings    ${result}     Incorrect username/password.
