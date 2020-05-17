*** Settings ***
Library        BuiltIn
Library        Selenium2Library

***Variables ***
${SUCCESSFULY_SENT_P}               xpath=//p[text()='Your message has been successfully sent to our team.']
${CONTACT_LINK_DIV}                 xpath=//div[@id='contact-link']
${CONTACT_PAGE_H1}                  xpath=//h1[@class='page-heading bottom-indent']
${SUBJECT_HEADING_DIV}              xpath=//select[@id='id_contact']
${EMAIL_INPUT}                      xpath=//input[@id='email']
${ORDER_REFERENCE_INPUT}            xpath=//input[@id='id_order']
${MESSAGE_TEXTAREA}                 xpath=//textarea[@id='message']
${SEND_BUTTON}                      xpath=//button[@id='submitMessage']



*** Keywords ***
Go To Contact Us Page
    Wait Until Element is Visible  ${CONTACT_LINK_DIV}
    Click Element  ${CONTACT_LINK_DIV}
    Wait Until Element is Visible  ${CONTACT_PAGE_H1}

Select Subject Heading Option
    [Arguments]  ${option}
    Wait Until Page Contains Element  ${SUBJECT_HEADING_DIV}
    Click Element  ${SUBJECT_HEADING_DIV}
    ${OPTION_LOCATOR}=  Get Option Locator By Name  ${option}
    Wait Until Element is Visible  ${OPTION_LOCATOR}
    Click Element  ${OPTION_LOCATOR}

Input Email
    [Arguments]  ${email}
    Wait Until Element is Visible  ${EMAIL_INPUT}
    Input Text  ${EMAIL_INPUT}  ${email}

Input Order Reference
    [Arguments]  ${text}
    Wait Until Element is Visible  ${ORDER_REFERENCE_INPUT}
    Input Text  ${ORDER_REFERENCE_INPUT}  ${text}

Input Message
    [Arguments]  ${text}
    Wait Until Element is Visible  ${MESSAGE_TEXTAREA}
    Input Text  ${MESSAGE_TEXTAREA}  ${text}

Send Message
    Wait Until Element is Visible  ${SEND_BUTTON}
    Click Element  ${SEND_BUTTON}

Check That Email Was Sent Succesfuly
    Wait Until Element is Visible  ${SUCCESSFULY_SENT_P}

Send Invalid Email
    [Arguments]  ${input}  ${error}
    Input Email  ${input}
    Send Message
    Check For Error Message  ${error}

Send Empty Message
    [Arguments]  ${error}
    Input Email  ${VALID_EMAIL}
    Send Message
    Check For Error Message  ${error}

Send Empty Subject Heading
    [Arguments]  ${error}   
    Input Message  ${TESTING_TEXT}
    Send Message
    Check For Error Message  ${error}

Check For Error Message
    [Arguments]  ${message}
    ${error_locator}=  Get Error Locator By Message  ${message}
    Wait Until Element is Visible  ${error_locator}

Get Option Locator By Name
    [Arguments]  ${option_text}
    [Return]  xpath=//option[text()='${option_text}']

Get Error Locator By Message
    [Arguments]  ${message}
    [Return]  xpath=//div[@class='alert alert-danger']/ol/li[contains(text(),'${message}')]