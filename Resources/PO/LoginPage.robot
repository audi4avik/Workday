*** Settings ***
Documentation    This page holds the objects for Workday Login Page
Library     SeleniumLibrary
Library     OperatingSystem
Library     Collections

*** Variables ***
${pageTitle} =      //p[@id='title']
${w3credsOption} =  //label[text()='Use your w3id and password']
${loginPgTitle} =   //p[text()='Sign in with your w3id credentials']
${inputEmail} =     id=user-name-input
${inputPwd} =       id=password-input
${loginBtn} =       //button[@id='login-button']
${errorMsg} =       //div[@id='login-error-message']/p[text()='Your w3id or password was entered incorrectly.']
${wdDownTime} =     //h2[contains(text(),'Workday is currently unavailable')]
${homeHeading} =    //h1[@data-automation-id='landingPageWelcomeCardHeading']

*** Keywords ***
Login To Workday
    wait for condition    return document.readyState == "complete"
    # Check for Workday Downtime
    ${proceedFlag}    run keyword and return status   element should not be visible    ${wdDownTime}
    IF    ${proceedFlag}== False
        fail    Workday maintenance is going on. Please try after sometime.
    ELSE
        wait until element is visible    ${pageTitle}
        element text should be    ${pageTitle}      Sign in with w3id
    END

    click element    ${w3credsOption}
    wait until element is visible    ${loginPgTitle}

    ${userData}    get slice from list    ${userData}
    ${userPwd}     get file     ${userData}[2]

    input text        ${inputEmail}     ${userData}[1]
    input password    ${inputPwd}       ${userPwd}
    click element     ${loginBtn}

    # Flag login error
    ${proceedLogin}   run keyword and return status   page should not contain element    ${errorMsg}

    # Handle situation based on flag
    IF    ${proceedLogin}== False
        fail    Please check the Input Data for ID/Password issues.
    ELSE
        wait until element is visible    ${homeHeading}     timeout=30s
        log    Login to Workday is successful
    END
