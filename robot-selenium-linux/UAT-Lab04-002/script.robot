*** Settings ***
Library    SeleniumLibrary
Suite Setup       Open Browser With Chromium
Suite Teardown    Close Browser

*** Variables ***
${URL}    http://localhost:7272/Registration.html

*** Keywords ***
Open Browser With Chromium
    ${options}=    Evaluate    __import__('selenium').webdriver.ChromeOptions()
    Evaluate    setattr($options, 'binary_location', '/usr/bin/chromium-browser') or None
    Create WebDriver    Chrome    options=${options}

*** Test Cases ***
UAT-Lab04-001 Open Workshop Registration Page(1)
    Go To    ${URL}

    Page Should Contain    Workshop Registration
    Capture Page Screenshot

UAT-Lab04-002 Missing First Name
    Go To    ${URL}

    Input Text    id=lastname       Sodsai
    Input Text    id=organization   CS KKU
    Input Text    id=email          somyod@kkumail.com
    Input Text    id=phone          091-001-1234

    Click Button    Register

    Page Should Contain    Please enter your first name!!
    Capture Page Screenshot



UAT-Lab04-001 Open Workshop Registration Page(2)
    Go To    ${URL}

    Page Should Contain    Workshop Registration
    Capture Page Screenshot

UAT-Lab04-002 Missing Last Name
    Go To    ${URL}

    Input Text    id=firstname      Somyod
    Input Text    id=organization   CS KKU
    Input Text    id=email          somyod@kkumail.com
    Input Text    id=phone          091-001-1234

    Click Button    Register

    Page Should Contain    Please enter your last name!!
    Capture Page Screenshot



UAT-Lab04-001 Open Workshop Registration Page(3)
    Go To    ${URL}

    Page Should Contain    Workshop Registration
    Capture Page Screenshot

UAT-Lab04-002 Missing first and Last Name
    Go To    ${URL}

    Input Text    id=organization   CS KKU
    Input Text    id=email          somyod@kkumail.com
    Input Text    id=phone          091-001-1234

    Click Button    Register

    Page Should Contain    Please enter your name!!
    Capture Page Screenshot



UAT-Lab04-002 Missing Email
    Go To    ${URL}

    Input Text    id=firstname      Somyod
    Input Text    id=lastname       Sodsai
    Input Text    id=organization   CS KKU
    Input Text    id=phone          091-001-1234

    Click Button    Register

    Page Should Contain    Please enter your email!!
    Capture Page Screenshot


UAT-Lab04-001 Open Workshop Registration Page(4)
    Go To    ${URL}

    Page Should Contain    Workshop Registration
    Capture Page Screenshot

UAT-Lab04-002 Missing phone number
    Go To    ${URL}

    Input Text    id=firstname      Somyod
    Input Text    id=lastname       Sodsai
    Input Text    id=organization   CS KKU
    Input Text    id=email          somyod@kkumail.com

    Click Button    Register

    Page Should Contain    Please enter your phone number!!
    Capture Page Screenshot



UAT-Lab04-001 Open Workshop Registration Page(5)
    Go To    ${URL}

    Page Should Contain    Workshop Registration
    Capture Page Screenshot

UAT-Lab04-002 invalid phone number
    Go To    ${URL}

    Input Text    id=firstname      Somyod
    Input Text    id=lastname       Sodsai
    Input Text    id=organization   CS KKU
    Input Text    id=email          somyod@kkumail.com
    Input Text    id=phone          1234

    Click Button    Register

    Page Should Contain    Please enter a valid phone number
    Capture Page Screenshot