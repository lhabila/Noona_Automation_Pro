*** Settings ***
Documentation       Automation for Correct Login Page Display
Library             SeleniumLibrary
Resource            ../Resources/Resources.robot

*** Test Cases ***
Verify_Login_Page_is_Displayed_Correctly
    Homepage
    Login_display
    Validation_of_Correct_Login_Display


    
0