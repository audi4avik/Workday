*** Settings ***
Documentation    This is the object repo for TimeOffBalance page
Library     SeleniumLibrary
Library     DateTime
Library     Collections
Library     ExcelLibrary


*** Variables ***
${popupHeader} =    //div[contains(@class, 'wd-popup')]//span[text()='Time Off Balance']
${popupOkBtn} =     //div[contains(@class, 'wd-popup')]//button[@title='OK']
${balanceLabel} =   //label[text()='Balance As Of Date']
${dateTxt} =        //li//div[@data-automation-id='textView']
${balanceTable} =   //div[@data-testid='tableWrapper']
${balanceCell} =   //table[@data-automation-id='table']/tbody/tr/td
@{writeData} =



*** Keywords ***
Verify Time Off Balance Page Loaded
    wait until element is visible       ${popupHeader}      timeout=10s
    click element    ${popupOkBtn}
    wait until element is visible    ${balanceTable}    timeout=10s

Retrieve Time Off Balance Summary
    ${systemDate}   get current date    result_format=%m/%d/%Y
    ${workdayDate}     get text    ${dateTxt}
    should be equal as strings    ${systemDate}     ${workdayDate}

    FOR    ${i}     IN RANGE    2    7
        ${cellData}    get text    (${balanceCell})[${i}]
        append to list    ${writeData}      ${cellData}
    END

Write Data Into Excel Sheet
    open excel document    filename=${rootFolder}\\Input\\UserDetails.xlsx    doc_id=docid
    write excel row    row_num=2    row_data=${writeData}    sheet_name=vacation
    save excel document     filename=${rootFolder}\\Input\\UserDetails.xlsx
    close all excel documents

