*** Settings ***
Documentation    This page holds the objects for Workday Home Page/dashboard
Library    SeleniumLibrary


*** Variables ***
${pageHeading} =    //h1[@data-automation-id='landingPageWelcomeCardHeading']
${iconBenefit} =    //div[@role='link'][@title='Benefits']
${iconTime} =       //div[@role='link'][@title='Time & Absence (Time Off)']

*** Keywords ***
Verify Home Page Loaded
    wait until element is visible    ${pageHeading}     timeout=20s
    element should contain    ${pageHeading}    ${userData}[0]

Click On Time And Absence Link
    scroll element into view    ${iconBenefit}
    click element    ${iconTime}
