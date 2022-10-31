*** Settings ***
Documentation           Noona Test Automation for Correct Page Display and Invalid Login Error Message
Library                 SeleniumLibrary
Resource                ../Resources/Resources.robot
Test Setup              HOMEPAGE
Test Teardown           CLOSE BROWSER WINDOW

*** Test Cases ***
VERIFY LOGIN PAGE IS DISPLAYED CORRECTLY
    LOGIN DISPLAY
    VALIDATION OF CORRECT LOGIN DISPLAY

INVALID LOGIN
    INVALID LOGIN CREDENTIALS SHOULD RETURN THE RIGHT ERROR MESSAGE

