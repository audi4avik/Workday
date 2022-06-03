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

*** Keywords ***
Login To Workday
    wait until element is visible    ${pageTitle}
    element text should be    ${pageTitle}      Sign in with w3id
    click element    ${w3credsOption}
    wait until element is visible    ${loginPgTitle}

    ${userData} =    get slice from list    ${userData}
    ${userPwd}       get file     ${userData}[2]

    input text        ${inputEmail}     ${userData}[1]
    input password    ${inputPwd}       ${userPwd}
    click element     ${loginBtn}
    sleep    5s