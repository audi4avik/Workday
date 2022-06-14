*** Settings ***
Documentation    This page holds the objects for Absence Calendar
Library    SeleniumLibrary
Library    String
Library    Collections
Library    ExcelLibrary

*** Variables ***
${absencePgHeading} =    //h1/span[@title='Absence Calendar']
${calendarMonth} =      //h2[@data-automation-id='dateRangeTitle']
${dateRangeBtn} =       //button[@title='Select Date Range']
${reqAbsenceBtn} =      //button//span[contains(@title,'Request Absence')]
${absTypePopUpHeader} =       //div[contains(@class,'wd-popup-content')]//h2/span[@title='Select Absence Type']
${cnfAbsDate} =       //div[contains(@class,'wd-popup-content')]//div[@data-automation-id='textView']
${absTypeSearch} =    //div[contains(@class,'wd-popup-content')]//input
${typeVacation&Sick} =      //div[@data-automation-id='activeListContainer']//div[text()='Vacation & Sick']
${multiSelectHeader} =       //div[@data-automation-id='promptTitle']
${multiSelectOption} =      //div[@data-automation-type='singleSelectPrompt']//div[@data-automation-id='promptOption']
${absTypeNxtBtn} =      //div[contains(@class,'wd-popup-content')]//span[@title='Next']

*** Keywords ***
Verify Absence Calendar Loaded
    wait until element is visible    ${absencePgHeading}    timeout=20s
    element text should be      ${absencePgHeading}     Absence Calendar

Select Date Or Date Range And Proceed
    open excel document    filename=${rootFolder}\\Input\\UserDetails.xlsx    doc_id=docid
    ${absenceData}      read excel row      row_num=2       col_offset=5    max_num=4    sheet_name=vacation
    set test variable    ${absenceData}
    close all excel documents

    run keyword if    '${absenceData}[0]' == '1'      Request Absence For One Day
    ...    ELSE IF    '${absenceData}[0]' > '1'       Request Absence With Date Range
    ...    ELSE       log    All work and no play makes a very dull employee!

# Absence request for Single day keywords
Request Absence For One Day
    # Try regex at https://pythex.org/ | Add extra '\' before any special char pattern matching
    ${absenceMonth}     remove string using regexp     ${absenceData}[1]       \\s\\d+\\W
    ${displayedMonth}   get text            ${calendarMonth}
    run keyword if    '${displayedMonth}' == '${absenceMonth}'       Select Date From Calendar
    ...     ELSE      Select Month And Then Select Date

Select Date From Calendar
    execute javascript    window.scrollTo(0, document.body.scrollHeight)
    scroll element into view    //div[contains(@aria-label,'${absenceData}[1]')]
    click element    //div[contains(@aria-label,'${absenceData}[1]')]
    sleep    2s

Select Month And Then Select Date


Request Absence With date Range

Request Absence For Approval
    click element    ${reqAbsenceBtn}
    # Automating through the elements of Pop Up box: Absence Type
    wait until element is visible    ${absTypePopUpHeader}      timeout=5s
    element should contain      ${cnfAbsDate}      ${absenceData}[1]      ignore_case=True
    click element    ${absTypeSearch}
    wait until element is visible    ${typeVacation&Sick}
    click element    ${typeVacation&Sick}
    wait until element is visible    ${multiSelectHeader}
    element text should be    ${multiSelectHeader}      Vacation & Sick
    click element    ${multiSelectOption}\[contains(text(), '${absenceData}[3]')]
    click element    ${absTypeNxtBtn}
    sleep    2s

Confirm And Submit Absence Data




