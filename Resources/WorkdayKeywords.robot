*** Settings ***
Documentation    This is the custom keyword library for workday shift claim
Resource    ../Input/InputData.robot
Resource    ./PO/LoginPage.robot
Resource    ./PO/HomePage.robot
Resource    ./PO/TimeDashboard.robot
Resource    ./PO/TimeEntryPage.robot
Resource    ./PO/TimeReviewPage.robot
Resource    ./PO/TimeSubmitPage.robot
Resource    ./PO/TimeOffBalancePage.robot

*** Keywords ***
# high level keywords
Proceed To Claim Shift For Current Week
    Successfully Login To Workday Portal
    Proceed To Time & Absence Dashboard
    Proceed To Time Entry Page
    Enter Shift Claim For This Week
    Submit And Verify Shift Claim

Proceed To Claim Shift For Last Week
    Successfully Login To Workday Portal
    Proceed To Time & Absence Dashboard
    Proceed To Time Entry Page
    Enter Shift Claim For Last Week
    Submit And Verify Shift Claim

Retrieve Current Time Off Balance
    Successfully Login To Workday Portal
    Proceed To Time & Absence Dashboard
    Proceed To Time Off Balance Summary Page
    Retrieve And Store Time Off Balance


# Lower level Keywords for PO pages
# Common Login Steps
Successfully Login To Workday Portal
    InputData.Retrieve User Details
    LoginPage.Login To Workday
    HomePage.Verify Home Page Loaded

# Steps related to Time Dashboard
Proceed To Time & Absence Dashboard
    HomePage.Click On Time And Absence Link
    TimeDashboard.Verify Time Dashboard Page Loaded

# Steps for Shift Claiming
Proceed To Time Entry Page
    TimeDashboard.Click On Enter Time
    TimeEntryPage.Verify Time Entry Page Loaded

Enter Shift Claim For This Week
    TimeEntryPage.Select This Week To Enter Time
    TimeEntryPage.Enter Time For Each Day

Enter Shift Claim For Last Week
    TimeEntryPage.Select Last Week To Enter Time
    TimeEntryPage.Enter Time For Each Day

Submit And Verify Shift Claim
    TimeReviewPage.Validate The Review Page Loaded
    TimeReviewPage.Review The Time Entered
    TimeSubmitPage.Submit The Shift Claims
    #TimeSubmitPage.Send To Approver And Capture Evidence

# Steps for Time off Balance
Proceed To Time Off Balance Summary Page
    TimeDashboard.Click On Time Off Remaining Balance Link
    TimeOffBalancePage.Verify Time Off Balance Page Loaded

Retrieve And Store Time Off Balance
    TimeOffBalancePage.Retrieve Time Off Balance Summary
    TimeOffBalancePage.Write Data Into Excel Sheet


