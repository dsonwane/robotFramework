*** Settings ***
Documentation     A test case with hello world message
Library    OperatingSystem


*** Variables ***
${message}      Hello World

*** Test Cases ***
My test
    [Documentation]    Example test
    Log    ${message}
    My keyword      ${CURDIR}

Another test
    Should Be Equal As Strings    ${message}    Hello World

*** Keywords ***
My keyword
    [Arguments]    ${path}
    Directory Should Exist    ${path}