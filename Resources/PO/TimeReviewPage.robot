*** Settings ***
Documentation    This holds the objects for Time Entry Review Page
Library    SeleniumLibrary

*** Variables ***
${headingSummary} =     //span[@title='Summary']
${reviewPgHeading} =    //h1/span[@data-automation-id='pageHeaderTitleText']
${btnReview} =          //button[@title='Review']

*** Keywords ***
Validate The Review Page Loaded
    wait until element is visible    ${headingSummary}      timeout=15s
    element text should be    ${reviewPgHeading}        Enter My Time

Review The Time Entered
    scroll element into view    ${btnReview}
    click button       ${btnReview}


