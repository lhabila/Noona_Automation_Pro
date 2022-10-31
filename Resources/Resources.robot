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
HOMEPAGE
    Open Browser                        ${LOGIN_URL}      ${BROWSER}
    Maximize Browser Window

CLOSE BROWSER WINDOW
    Close Browser

LOGIN DISPLAY
     Wait Until Element Is Enabled      ${EMAIL_INPUT}
     Input Text                         ${EMAIL_INPUT}    ${EMAIL}
     Wait Until Element Is Enabled       ${PWD_INPUT}
     Input Text                         ${PWD_INPUT}      ${PWD}
     Clear Element Text                 ${EMAIL_INPUT}
     Clear Element Text                 ${PWD_INPUT}

VALIDATION OF CORRECT LOGIN DISPLAY
    Page Should Contain                 VN: 7 Date of manufacture: 2022-10-17
    Page Should Contain Element         //*[@id="login-page"]/div[2]/nh-email-and-password/nh-login-section/div/div/div[1]/div
    Click Element                       //*[@id="login-page"]/div[4]/nh-ce-mark/div/div[2]/ds-button/button/div/div
    Page Should Contain                 © 2022 Varian Medical Systems, Inc.
    Page Should Contain                 07.05.02
    Click Element                       //*[@id="close-modal"]/button/div


INVALID LOGIN CREDENTIALS SHOULD RETURN THE RIGHT ERROR MESSAGE
    Wait Until Element Is Enabled       ${EMAIL_INPUT}
    Input Text                          ${EMAIL_INPUT}    ${EMAIL}
    Input Text                          ${PWD_INPUT}      ${PWD}
    Wait Until Element Is Enabled       ${LOGIN}
    Click Element                       ${LOGIN}
    Wait Until Page Contains            Incorrect username or password. If you have forgotten your password, please click Problems logging in -link.
