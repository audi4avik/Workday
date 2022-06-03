*** Settings ***
Documentation    This holds the objects for Time Entry Page
Library    SeleniumLibrary
Library    ExcelLibrary
Library    Collections

*** Variables ***
${timepgTitle} =        //span[@title='Time']
${thisWeekLink} =       //span[contains(text(),'This Week')]
${lastWeekLink} =       //span[contains(text(),'Last Week')]
${entrypgTitle} =       //span[text()='Enter Time by Type']
${searchType} =         //div[@data-automation-id='multiSelectContainer']//input[@placeholder='Search']
${selectTimeType} =     //div[@data-automation-id='promptOption'][@data-automation-label='Time Entry Codes']
${selectShift} =        //div[@data-automation-id='promptOption']
${inputDay} =           //input[@data-automation-id='numericInput']
${btnOk} =              //button[@title='OK']
${btnAutoFill} =        //button[@title='Auto-fill from Prior Week']

*** Keywords ***
Verify Time Entry Page Loaded
    wait until element is visible   ${timepgTitle}      timeout=15s

Select Last Week To Enter Time
    click element    ${lastWeekLink}

Select This Week To Enter Time
    click element    ${thisWeekLink}

Enter Time For Each Day
    wait until element is visible    ${entrypgTitle}    timeout=15s
    click element    ${searchType}
    open excel document    filename=${rootFolder}\\Input\\UserDetails.xlsx    doc_id=docid
    ${shiftNumber}  read excel cell     row_num=2   col_num=1   sheet_name=shiftDetails
    ${dailyShift}     read excel row      row_num=2	    col_offset=1    max_num=8    sheet_name=shiftDetails
    close all excel documents
    set selenium speed    0.5
    wait until element is visible    ${selectTimeType}     timeout=10s
    click element    ${selectTimeType}
    wait until element is visible    ${selectShift}\[contains(text(),'${shiftNumber}')]
    click element    ${selectShift}\[contains(text(),'${shiftNumber}')]
    # Tab through Monday - Friday for shift claim
    FOR    ${i}     IN RANGE    0   7
        input text    (${inputDay})[${i}+1]   ${dailyShift}[${i}]
        press keys    (${inputDay})[${i}+1]   TAB
    END
    set selenium speed    0
    click element     ${btnOk}





