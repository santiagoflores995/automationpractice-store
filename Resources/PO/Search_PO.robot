*** Settings ***
Library        BuiltIn
Library        Selenium2Library

***Variables ***
${SEARCH_BAR_INPUT}                 xpath=//input[contains(@placeholder,'Search')]
${SEARCH_BUTTON}                    xpath=//button[@name='submit_search']
${FOUND_RESULTS_SPAN}               xpath=//span[contains(text(),'results have been found.')]



*** Keywords ***
Search For Keyword
    [Arguments]  ${keyword} 
    Wait Until Element is Visible  ${SEARCH_BAR_INPUT}
    Input Text  ${SEARCH_BAR_INPUT}  ${keyword}
    Click Element  ${SEARCH_BUTTON}
    Wait Until Element is Visible  ${FOUND_RESULTS_SPAN}