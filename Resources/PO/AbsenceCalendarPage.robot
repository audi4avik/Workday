*** Settings ***
Documentation    This page holds the objects for Absence Calendar
Library    SeleniumLibrary
Library    String
Library    Collections
Library    ExcelLibrary

*** Variables ***
${absencePgHeading} =    //h1/span[@title='Absence Calendar']
${calendarMonth} =  //h2[@data-automation-id='dateRangeTitle']
${singleDay} =      //div[contains(@aria-label,'${absenceData}[1]')]
${dateRangeBtn} =   //button[@title='Select Date Range']

*** Keywords ***
Verify Absence Calendar Loaded
    wait until element is visible    ${absencePgHeading}    timeout=20s
    element text should be      ${absencePgHeading}     Absence Calendar

Select Date Or Date Range And Proceed
    open excel document    filename=${rootFolder}\\Input\\UserDetails.xlsx    doc_id=docid
    ${absenceData}      read excel row      row_num=2       col_offset=5    max_num=3    sheet_name=vacation
    set test variable    ${absenceData}
    close all excel documents

    run keyword if    '${absenceData}[0]' == '1'      Request Absence For One Day
    ...    ELSE IF    '${absenceData}[0]' > '1'       Request Absence With Date Range
    ...    ELSE       log    All work and no play makes a very dull employee!

# Absence request for Signle day keywords
Request Absence For One Day
    ${absenceMonth}     remove string using regexp     ${absenceData}[1]       \\s.\d\b.\s
    ${displayedMonth}   get text            ${calendarMonth}
    run keyword if    '${displayedMonth}' == '${absenceMonth}'       Select Date From Calendar
    ...     ELSE      Select Month And Then Select Date

Select Date From Calendar
    scroll element into view    ${singleDay}
    click element    ${singleDay}
    sleep    2s

Select Month And Then Select Date

Request Absence With date Range

Request Absence For Approval