*** Settings ***
Documentation    This is the custom keyword library for workday shift claim
Resource    ../Input/InputData.robot
Resource    ./PO/LoginPage.robot
Resource    ./PO/HomePage.robot
Resource    ./PO/TimeDashboardPage.robot
Resource    ./PO/TimeEntryPage.robot
Resource    ./PO/TimeReviewPage.robot
Resource    ./PO/TimeSubmitPage.robot
Resource    ./PO/TimeOffBalancePage.robot
Resource    ./PO/AbsenceCalendarPage.robot

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

Record Vacation Or Time Off
    Successfully Login To Workday Portal
    Proceed To Time & Absence Dashboard
    Proceed To Vacation And Time Off Page
    Record Absence Days In Calendar
#    Submit And Verify Records


# Lower level Keywords for PO pages
# Common Login Steps
Successfully Login To Workday Portal
    InputData.Retrieve User Details
    LoginPage.Login To Workday
    HomePage.Verify Home Page Loaded

# Steps related to Time Dashboard
Proceed To Time & Absence Dashboard
    HomePage.Click On Time And Absence Link
    TimeDashboardPage.Verify Time Dashboard Page Loaded

# Steps for Shift Claiming
Proceed To Time Entry Page
    TimeDashboardPage.Click On Enter Time
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
    TimeDashboardPage.Click On Time Off Remaining Balance Link
    TimeOffBalancePage.Verify Time Off Balance Page Loaded

Retrieve And Store Time Off Balance
    TimeOffBalancePage.Retrieve Time Off Balance Summary
    TimeOffBalancePage.Write Data Into Excel Sheet

# Steps for Requesting Time Off
Proceed To Vacation And Time Off Page
    TimeDashboardPage.Click On Vacation & Time Off Calendar
    AbsenceCalendarPage.Verify Absence Calendar Loaded

Record Absence Days In Calendar
    AbsenceCalendarPage.Select Date Or Date Range And Proceed

Submit And Verify Records
    AbsenceCalendarPage.Request Absence For Approval
#    AbsenceCalendarPage.Confirm Absence Data


    


