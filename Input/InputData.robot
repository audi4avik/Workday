*** Settings ***
Documentation    This file holds all the variables related to the test run
Library    ExcelLibrary

*** Variables ***
${browser} =        edge
${workdayUrl} =     https://wd5.myworkday.com/ibm/d/home.htmld

*** Keywords ***
#Retrieve user login details from excel file
Retrieve User Details
    ${rootFolder}   get variable value      ${rootFolder}
    open excel document    filename=${rootFolder}\\Input\\UserDetails.xlsx   doc_id=docid
    ${userData}     read excel row      row_num=2	    sheet_name=loginDetails
    close all excel documents
    set suite variable    ${userData}