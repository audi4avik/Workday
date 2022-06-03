*** Settings ***
Documentation    This holds the objects for Time Entry Review Page
Library    SeleniumLibrary
Library    DateTime

*** Variables ***
${btnSubmit} =      //button[@title='Submit']

*** Keywords ***
Submit The Shift Claims
    wait until page contains element    ${btnSubmit}
    execute javascript    window.scrollTo(0, document.body.scrollHeight)
    # get current date for unique screenshot get session id
    ${timestamp}    get current date    result_format=%Y%m%d%H%M%S      exclude_millis=yes
    capture page screenshot    ${OUTPUT_DIR}${/}Screenshot${/}SubmitPageCapture_${timestamp}.png

Send To Approver And Capture Evidence

# ToDo --> Download pdf and mail to user