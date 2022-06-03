*** Settings ***
Documentation    this file holds the test setup and teardown steps
Library    SeleniumLibrary

*** Keywords ***
Start Test Suite
    Set Global Variable     ${rootFolder}      ${EXECDIR}

Begin Test
    [Arguments]     ${browser}      ${workdayUrl}
    open browser    about:blank     ${browser}
    maximize browser window
    go to    ${workdayUrl}

End Test
    close all browsers

End Test Suite
    Log    Test Suite Has Ended