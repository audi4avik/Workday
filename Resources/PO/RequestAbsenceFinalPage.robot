*** Settings ***
Documentation    This page holds the objects to confirm and submit absence request
Library    SeleniumLibrary
Library    String

*** Variables ***
${reqAbsPgHeader} =     css=h1>span[title='Request Absence']
${totalAbsence} =       //ul//li//div[@data-automation-id='textView']
${submitAbsenceBtn} =   css=button[title='Submit']
${absencePgHeading} =    //h1/span[@title='Absence Calendar']


*** Keywords ***
Confirm And Submit Absence Data
    wait until element is visible    ${reqAbsPgHeader}      timeout=10s
    set selenium speed    0.5 seconds
    ${dayCount}     get text    ${totalAbsence}
    ${dayCount}     remove string using regexp    ${dayCount}       [^\\d]
    IF    ${dayCount} == 1
        log    Absence request is ready to be submitted for 1 day
    ELSE
        log    Absence request ready to be submitted for multiple days
    END
    click element    ${submitAbsenceBtn}

    # After submission flow goes back to Absence Calendar Page
    wait until element is visible       ${absencePgHeading}     timeout=10 seconds
    execute javascript    window.scrollTo(0, document.body.scrollHeight)
    scroll element into view    //div[contains(@aria-label,'${absenceData}[1]')]
    capture page screenshot    ${OUTPUT_DIR}${/}Screenshot${/}AbsenceConfirmationCapture_${ssTime}.png