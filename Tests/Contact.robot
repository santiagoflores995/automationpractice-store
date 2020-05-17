*** Settings ***

Documentation  A test suite with tests for the Contact form validations.
Resource        ../resources/Common.robot
Resource        ../resources/PO/Contact_PO.robot
Suite Setup     Open Browser To Home Page
Test Setup      Go To Contact Us Page
Suite Teardown  Close Browser
Default Tags    contact

***Variables ***
${INVALID_EMAIL_ERROR}              Invalid email address.
${BLANK_MESSAGE_ERROR}              The message cannot be blank.
${SELECT_SUBJECT_ERROR}             Please select a subject from the list provided. 
${WEBMASTER_TEXT}                   Webmaster
${VALID_EMAIL}                      test@test.com
${INVALID_EMAIL}                    test@test
${TESTING_TEXT}                     testing...

*** Test Cases ***
Valid Inputs
    Select Subject Heading Option  ${WEBMASTER_TEXT}
    Input Email  ${VALID_EMAIL}
    Input Order Reference  ${TESTING_TEXT}
    Input Message  ${TESTING_TEXT}
    Send Message
    Check That Email Was Sent Succesfuly

Invalid Inputs
    Send Invalid Email  ${INVALID_EMAIL}  ${INVALID_EMAIL_ERROR}
    Send Empty Message  ${BLANK_MESSAGE_ERROR}
    Send Empty Subject Heading  ${SELECT_SUBJECT_ERROR}