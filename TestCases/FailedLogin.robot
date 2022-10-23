*** Settings ***
Documentation           Automation of Failed Login Display Message
Library                 SeleniumLibrary
Resource                ../Resources/Resources.robot

*** Test Cases ***
Invalid_login
    InvalidLogin credentials should return the right error message