*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser With Chromium
Suite Teardown    Close Browser

*** Variables ***
${URL}      http://localhost:7272/Registration.html

*** Keywords ***
Open Browser With Chromium
    ${options}=    Evaluate    __import__('selenium').webdriver.ChromeOptions()
    Evaluate    setattr($options, 'binary_location', '/usr/bin/chromium-browser') or None
    Create WebDriver    Chrome    options=${options}

*** Test Cases ***
UAT-Lab04-001 Open Workshop Registration Page
    Go To    ${URL}
    Page Should Contain    Workshop Registration
    Capture Page Screenshot


UAT-Lab04-001 Register Success
    Input Text    id=firstname      Somyod
    Input Text    id=lastname       Sodsai
    Input Text    id=organization   CS KKU
    Input Text    id=email          somyod@kkumail.com
    Input Text    id=phone          091-001-1234

    Click Button    Register

    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.

    Capture Page Screenshot

