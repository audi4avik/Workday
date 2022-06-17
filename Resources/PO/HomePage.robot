*** Settings ***
Documentation    This page holds the objects for Workday Home Page/dashboard
Library    SeleniumLibrary
Library    DateTime

*** Variables ***
${pageHeading} =    //h1[@data-automation-id='landingPageWelcomeCardHeading']
${iconBenefit} =    //div[@role='link'][@title='Benefits']
${iconTime} =       //div[@role='link'][@title='Time & Absence (Time Off)']

*** Keywords ***
Verify Home Page Loaded
    element should contain    ${pageHeading}    ${userData}[0]
    # Get current date time for further usage i.e. generate screenshot name
    ${ssTime}    get current date    result_format=%Y%m%d%H%M%S      exclude_millis=yes
    set test variable    ${ssTime}


Click On Time And Absence Link
    scroll element into view    ${iconBenefit}
    click element    ${iconTime}
