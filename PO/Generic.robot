*** Settings ***
Documentation    A resource file with reusable keywords and variables.
...
...              The system specific keywords created here from our own
...              domain specific language. They utilize keywords provided
...              by the imported seleniumLibrary.
Library          SeleniumLibrary

*** Variables ***
${user_name}     diptisonwane
${password}     123456
${url}       https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***

Open the browser with the Mortgage payment url
    Create Webdriver  Chrome
    Go To       ${url}

Close browser session
    Close Browser