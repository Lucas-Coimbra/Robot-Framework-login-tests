*** Settings ***
Resource    ../pages/login_page.robot

Test Setup    Open the website
Test Teardown    Close the Browser

*** Test Cases ***
TC01 - Login successful with valid credentials
    [Tags]    TC01
    Type the username student
    Type the password Password123
    Click Submit button
    Check if login was successful

TC02: Login with an invalid username and validation of the error message.
    [Tags]    TC02
    Type the username Error1
    Type the password Password123
    Click Submit button
    Validate error message    ${Text_Username_Error}

TC03: Login with invalid password and validation of the error message.
    [Tags]    TC03
    Type the username student
    Type the password eRROR123
    Click Submit button
    Validate error message    ${Text_Password_Error}
