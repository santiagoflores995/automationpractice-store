*** Settings ***
Library        BuiltIn
Library        Selenium2Library
Resource        ../Common.robot

***Variables ***
${QUANTITY_INPUT}                   xpath=//input[@id="quantity_wanted"]
${SIZE_SELECT}                      xpath=//select[@id="group_1"]
${ADD_TO_CART_SPAN}                 xpath=//span[text()="Add to cart"]

*** Keywords ***
Go To Product Details Page
    [Arguments]  ${product} 
    ${title_locator}=  Get Product Title Locator By Name  ${product}
    Wait Until Element is Visible  ${title_locator}
    Click Element  ${title_locator}
    ${details_title_locator}=  Get Details Page Title Locator By Name  ${product}
    Wait Until Element is Visible  ${details_title_locator}

Add to Cart From Product Details
    [Arguments]  ${quantity}  ${color}  ${size}   
    Set Quantity  ${quantity}
    Set Size  ${size}
    Set Color  ${color}
    Click Element  ${ADD_TO_CART_SPAN}
    Wait Until Element is Visible  ${PRODUCT_ADDED_SUCCESSFULLY_I}
    Wait Until Element is Visible  ${CLOSE_MODAL_SPAN}
    Click Element  ${CLOSE_MODAL_SPAN}

Set Quantity
    [Arguments]  ${quantity}   
    Wait Until Element is Visible  ${QUANTITY_INPUT}
    Clear Element Text  ${QUANTITY_INPUT}
    Input text  ${QUANTITY_INPUT}  ${quantity}

Set Size
    [Arguments]  ${size}   
    Click Element  ${SIZE_SELECT} 
    ${size_option_locator}=  Get Size Option Locator by Size  ${size}
    Wait Until Element is Visible  ${size_option_locator}
    Click Element  ${size_option_locator} 

Set Color
    [Arguments]  ${color}   
    ${color_pick_locator}=  Get Color Pick Locator by Color  ${color}
    Wait Until Element is Visible  ${color_pick_locator}
    Click Element  ${color_pick_locator}

Get Details Page Title Locator By Name
    [Arguments]  ${product}
    [Return]  xpath=//h1[@itemprop="name" and text()='${product}']

Get Size Option Locator by Size
    [Arguments]  ${size}
    [Return]  xpath=//option[@title='${size}']

Get Color Pick Locator by Color
    [Arguments]  ${color}
    [Return]  xpath=//ul[@id='color_to_pick_list']/li/a[@title='${color}']