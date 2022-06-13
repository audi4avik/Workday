*** Settings ***
Documentation    This is the test suite for claiming automated shifts on Workday
Resource    ../Resources/Common.robot
Resource    ../Input/InputData.robot
Resource    ../Resources/WorkdayKeywords.robot

Suite Setup       Common.Start Test Suite
Test Setup        Common.Begin Test     ${browser}      ${workdayUrl}
Test Teardown     Common.End Test
Suite Teardown    Common.End Test Suite

*** Test Cases ***
TC_01 Automate Shift Claim For This Week And Validate
    [Documentation]    This is TC_01 to automate shift claim for current week
    [Tags]    tw
    WorkdayKeywords.Proceed To Claim Shift For Current Week

TC_02 Automate Shift Claim For Last Week And Validate
    [Documentation]    This is TC_02 to automate shift claim for previous week
    [Tags]    lw
    WorkdayKeywords.Proceed To Claim Shift For Last Week

TC_03 Retrieve Remaining Time Off Balnace
    [Documentation]    This is TC_03 to retrieve time off balance remaining 
    [Tags]    balance
    WorkdayKeywords.Retrieve Current Time Off Balance

TC_04 Automate Record Of Absence
    [Documentation]    This is TC_04 to request different types of time off
    [Tags]    toff
    WorkdayKeywords.Record Vacation Or Time Off

#ToDo - Integrate Script with jenkins for Every Monday Run
#ToDo - Check for ChromeDriver mismtach before starting the test 
