*** Settings ***
Documentation    This page holds the objects for Workday Home Page/dashboard
Library    SeleniumLibrary
Library    DateTime

*** Variables ***
${topApps} =        //h2[text()='Your Top Apps']
${iconBenefit} =    //button//span[text()='Benefits']
${iconTime} =       //button//span[contains(text(),'Time & Absence')]

*** Keywords ***
Verify Home Page Loaded
    location should be    ${workdayUrl}
    # Get current date time for further usage i.e. generate screenshot name
    ${ssTime}    get current date    result_format=%Y%m%d%H%M%S      exclude_millis=yes
    set test variable    ${ssTime}


Click On Time And Absence Link
    wait until element is visible    ${topApps}     timeout=15s
    scroll element into view    ${iconBenefit}
    click element    ${iconTime}
