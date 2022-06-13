*** Settings ***
Documentation    This page holds the objects for Time & Absence Dashboard
Library    SeleniumLibrary

*** Variables ***
${timeHeading} =        //span[text()='Time & Absence Dashboard']
${enterTimeLink} =      //div[@data-automation-id='menuItem'][@aria-label='Enter Time']
${timeBalanceLink} =    (//div[@data-automation-id='promptOption'][contains(@title,'My Vacation/Time Off Balance')])[2]
${offCalendarLink} =    (//div[@data-automation-id='promptOption'][contains(@title,'Vacation/Time off Calendar')])[2]

*** Keywords ***
Verify Time Dashboard Page Loaded
    wait until element is visible   ${enterTimeLink}    timeout=15s
    element text should be    ${timeHeading}    Time & Absence Dashboard

Click On Enter Time
    click element    ${enterTimeLink}
    Switch To Next Tab

Click On Time Off Remaining Balance Link
    click element    ${timeBalanceLink}
    Switch To Next Tab

Click On Vacation & Time Off Calendar
    click element   ${offCalendarLink}
    Switch To Next Tab

Switch To Next Tab
    ${timeTabs}     get window handles
    switch window    ${timeTabs}[1]