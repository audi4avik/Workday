*** Settings ***
Documentation    this file holds the test setup and teardown steps
Library    SeleniumLibrary
Library    ../Library/webdriversync.py

*** Keywords ***
Start Test Suite
    set global variable     ${rootFolder}      ${EXECDIR}

Begin Test
    [Arguments]     ${browser}      ${workdayUrl}
#    open browser    about:blank     ${browser}
    IF    "${browser}"=="chrome"
        ${webdriver_path}=   webdriversync.get chromedriver
    ELSE IF    "${browser}"=="edge"
        ${webdriver_path}=   webdriversync.get edgedriver
    ELSE
        log    Stay tuned! More browser support coming soon.
    END
#    create webdriver    chrome    executable_path=${webdriver_path}
    open browser    about:blank     browser=${browser}    executable_path=${webdriver_path}
    maximize browser window
    go to    ${workdayUrl}

End Test
    run keyword if test failed      log    Test has failed. Please check detailed log.
    run keyword if test passed      log    Test passed successfully.
    close all browsers

End Test Suite
    Log    Test Suite Has Ended