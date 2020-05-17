*** Settings ***
Library        BuiltIn
Library        Selenium2Library

***Variables ***

*** Keywords ***
Go To Category
    [Arguments]  ${category_name}
    ${category_locator}=  Get Category Locator By Name  ${category_name}
    Wait Until Element is Visible  ${category_locator}
    Click Element  ${category_locator}
    ${category_span_locator}=  Get Category Span Locator By Name  ${category_name}
    Wait Until Element is Visible  ${category_span_locator}

Get Category Locator By Name
    [Arguments]  ${category}
    [Return]  xpath=//div[@id='block_top_menu']/ul/li/a[@title='${category}']

Get Category Span Locator By Name
    [Arguments]  ${category}
    [Return]  xpath=//span[contains(text(),'${category}')]