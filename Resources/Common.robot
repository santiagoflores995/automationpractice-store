*** Settings ***
Library        BuiltIn
Library        Selenium2Library

***Variables ***
${BROWSER}                          chrome
${HOME_URL}                         http://automationpractice.com
${HEADER_LOGO_DIV}                  xpath=//div[@id='header_logo']
${HOME_SLIDER_DIV}                  xpath=//div[@id='slider_row']
${PATH_ADD_TO_CART_BUTTON}          /../../div[@class='button-container']/a[@title='Add to cart']
${PRODUCT_ADDED_SUCCESSFULLY_I}     xpath=//h2/i[@class='icon-ok']
${CLOSE_MODAL_SPAN}                 xpath=//span[@class='cross']
${HEADER_CART_A}                    xpath=//a[@title='View my shopping cart']
${REMOVE_ITEM_CART_SPAN}            xpath=//a[@class='ajax_cart_block_remove_link']
${EMPTY_CART_SPAN}                  xpath=//span[@class='ajax_cart_no_product' and text()='(empty)']
${PATH_QUICK_VIEW_SPAN}             /../../../div/div/a/span[text()="Quick view"]

*** Keywords ***
Open Browser To Home Page
    Open Browser  ${HOME_URL}  ${BROWSER}
    Maximize Browser Window
    Wait Until Element is Visible  ${HOME_SLIDER_DIV}

Go To Home Page
    Wait Until Element is Visible  ${HEADER_LOGO_DIV}
    Click Element  ${HEADER_LOGO_DIV}
    Wait Until Element is Visible  ${HOME_SLIDER_DIV}

Add Product By Title
    [Arguments]  ${product}
    ${title_locator}=  Get Product Title Locator By Name  ${product}
    Wait Until Element is Visible  ${title_locator}
    Mouse over  ${title_locator}
    ${add_to_cart_locator}=  Catenate    SEPARATOR=  ${title_locator}   ${PATH_ADD_TO_CART_BUTTON}
    Wait Until Element is Visible  ${add_to_cart_locator}
    Click Element  ${add_to_cart_locator}
    ${item_added_locator}=  Get Item Added to Cart Locator By Name  ${product}
    Wait Until Element is Visible  ${item_added_locator}
    Wait Until Element is Visible  ${PRODUCT_ADDED_SUCCESSFULLY_I}
    Wait Until Element is Visible  ${CLOSE_MODAL_SPAN}
    Click Element  ${CLOSE_MODAL_SPAN}

Remove Item From Header Cart
    [Arguments]  ${product}
    Wait Until Element is Visible  ${HEADER_CART_A}
    Mouse Over  ${HEADER_CART_A}
    ${item_cart_locator}=  Get Item In Cart Locator By Name  ${product}
    Wait Until Element is Visible  ${item_cart_locator}
    Wait Until Element is Visible  ${REMOVE_ITEM_CART_SPAN}
    Click Element  ${REMOVE_ITEM_CART_SPAN}
    Wait Until Page Contains Element  ${EMPTY_CART_SPAN}

Get Product Title Locator By Name
    [Arguments]  ${product}
    [Return]  xpath=//div[contains(@class,'right-block')]/h5/a[@title='${product}']

Get Item Added to Cart Locator By Name
    [Arguments]  ${product}
    [Return]  xpath=//span[@id="layer_cart_product_title" and text()='${product}']

Get Item In Cart Locator By Name
    [Arguments]  ${product}
    [Return]  xpath=//a[@class="cart_block_product_name" and @title='${product}']