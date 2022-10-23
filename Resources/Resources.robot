*** Settings ***
Library     SeleniumLibrary

*** Variables ***

${LOGIN_URL}          https://demo.patient.noonatest.com/patient/#/login
${BROWSER}            chrome
${EMAIL_INPUT}        //input[@id='email']
${PWD_INPUT}          //input[@id="pwd"]
${EMAIL}               noona@noonatest.com
${PWD}                 123456
${LOGIN}               //div[text()="Log in"]


*** Keywords ***
Homepage
    Open Browser                        ${LOGIN_URL}      ${BROWSER}
    Maximize Browser Window

Login_display
     Wait Until Element Is Enabled      ${EMAIL_INPUT}
     Wait Until Element Is Visible      ${EMAIL_INPUT}
     Wait Until Element Is Enabled       ${PWD_INPUT}
     Wait Until Element Is Visible      ${PWD_INPUT}
     Sleep    2
     Input Text                         ${EMAIL_INPUT}    ${EMAIL}
     Input Text                         ${PWD_INPUT}      ${PWD}
     Sleep    3
     Clear Element Text                 ${EMAIL_INPUT}
     Clear Element Text                 ${PWD_INPUT}


Validation_of_Correct_Login_Display
    Page Should Contain                 VN: 7 Date of manufacture: 2022-10-17
    Page Should Contain Element         //*[@id="login-page"]/div[2]/nh-email-and-password/nh-login-section/div/div/div[1]/div
    Click Element                       //*[@id="login-page"]/div[4]/nh-ce-mark/div/div[2]/ds-button/button/div/div
    Page Should Contain                 © 2022 Varian Medical Systems, Inc.
    Page Should Contain                 07.05.02
    Click Element                       //*[@id="close-modal"]/button/div
    Close Browser


InvalidLogin credentials should return the right error message
    Open Browser                        ${LOGIN_URL}      ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible       ${EMAIL_INPUT}
    Input Text                          ${EMAIL_INPUT}    ${EMAIL}
    Input Text                          ${PWD_INPUT}      ${PWD}
    Sleep                               3
    Wait Until Element Is Visible       ${LOGIN}
    Click Element                       ${LOGIN}
    Sleep                               8
    Page Should Contain                 Incorrect username or password. If you have forgotten your password, please click Problems logging in -link.
    Close Browser