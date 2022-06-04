*** Settings ***
Documentation    this file holds the test setup and teardown steps
Library    SeleniumLibrary

*** Keywords ***
Start Test Suite
    set global variable     ${rootFolder}      ${EXECDIR}

Begin Test
    [Arguments]     ${browser}      ${workdayUrl}
    open browser    about:blank     ${browser}
    maximize browser window
    go to    ${workdayUrl}

End Test
    run keyword if test failed      log    Test has failed. Please check detailed log.
    run keyword if test passed      log    Test passed successfully.
    close all browsers

End Test Suite
    Log    Test Suite Has Ended