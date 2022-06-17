*** Settings ***
Documentation    This holds the objects for Time Entry Review Page
Library    SeleniumLibrary

*** Variables ***
${btnSubmit} =      //button[@title='Submit']

*** Keywords ***
Submit The Shift Claims
    wait until page contains element    ${btnSubmit}
    execute javascript    window.scrollTo(0, document.body.scrollHeight)
    capture page screenshot    ${OUTPUT_DIR}${/}Screenshot${/}SubmitPageCapture_${ssTime}.png

Send To Approver And Capture Evidence

# ToDo --> Download pdf and mail to user