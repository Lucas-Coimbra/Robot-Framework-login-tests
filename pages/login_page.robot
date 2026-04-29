*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/config.robot

*** Variables ***
${Input_Username}    //input[@id="username"]
${Input_Password}    //input[@id="password"]
${Button_Submit}     //button[@id="submit"]
${Button_LogOut}     //a[contains(text(),"Log out")]
${Message_Error}     //div[@id="error"]

*** Keywords ***
Open the website
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    0.5
    
Type the username ${username}
    Input Text    ${Input_Username}    ${username}

Type the password ${password}
    Input Text    ${Input_Password}    ${password}

Click Submit button
    Click Element    ${Button_Submit}

Check if login was successful
    Wait Until Element Is Visible    ${Button_LogOut}    timeout=10s
    Element Should Be Visible        ${Button_LogOut}

Close the Browser
    Close Browser

Validate error message
    [Arguments]    ${expected_message}
    Wait Until Element Is Visible    ${Message_Error}    timeout=5s
    Element Text Should Be           ${Message_Error}    ${expected_message}
