*** Settings ***
Documentation    This page holds the objects for Time & Absence Dashboard
Library    SeleniumLibrary

*** Variables ***
${timeHeading} =    //span[text()='Time & Absence Dashboard']
${enterTimeLink} =  //div[@data-automation-id='menuItem'][@aria-label='Enter Time']
${timeBalanceLink} =    (//div[@data-automation-id='promptOption'][contains(@title,'My Vacation/Time Off Balance')])[2]

*** Keywords ***
Verify Time Dashboard Page Loaded
    wait until element is visible   ${enterTimeLink}    timeout=15s
    element text should be    ${timeHeading}    Time & Absence Dashboard

Click On Enter Time
#    scroll element into view    ${initLOALink}
    click element    ${enterTimeLink}
    ${timeTabs}     get window handles
    switch window    ${timeTabs}[1]

Click On Time Off Remaining Balance Link
    click element    ${timeBalanceLink}
    ${timeTabs}     get window handles
    switch window    ${timeTabs}[1]