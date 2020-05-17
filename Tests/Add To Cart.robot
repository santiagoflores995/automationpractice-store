*** Settings ***

Documentation  A test suite with tests for the Add To Cart functionality.
Resource        ../resources/Common.robot
Resource        ../resources/PO/Contact_PO.robot
Resource        ../resources/PO/Search_PO.robot
Resource        ../resources/PO/Details_PO.robot
Resource        ../resources/PO/Category_PO.robot
Suite Setup     Open Browser To Home Page
Suite Teardown  Close Browser
Default Tags    cart

***Variables ***
${CHIFFON_SEARCH_KEYWORD}           Chiffon
${SEARCHED_PRODUCT_TITLE}           Printed Chiffon Dress
${TSHIRTS_CATEGORY_TITLE}           T-shirts
${CATEGORY_PRODUCT_TITLE}           Faded Short Sleeve T-shirts
${HOME_PRODUCT_TITLE}               Blouse
${PRODUCT_DETAILS_QUANTITY}         3   
${PRODUCT_DETAILS_SIZE}             M
${PRODUCT_DETAILS_COLOR}            White
				
*** Test Cases ***
Add Product Directly From Search Page
    Search For Keyword  ${CHIFFON_SEARCH_KEYWORD}
    Add Product By Title  ${SEARCHED_PRODUCT_TITLE}
    Remove Item From Header Cart  ${SEARCHED_PRODUCT_TITLE}

Add Product Directly From Category Page 
    Go To Category  ${TSHIRTS_CATEGORY_TITLE}
    Add Product By Title  ${CATEGORY_PRODUCT_TITLE}
    Remove Item From Header Cart  ${CATEGORY_PRODUCT_TITLE}

Add Product Directly From Home Page
    Go To Home Page
    Add Product By Title  ${HOME_PRODUCT_TITLE}
    Remove Item From Header Cart  ${HOME_PRODUCT_TITLE}

Add Product From Product Details Page   
    Go To Home Page
    Go To Product Details Page  ${HOME_PRODUCT_TITLE}
    Add to Cart From Product Details  ${PRODUCT_DETAILS_QUANTITY}  ${PRODUCT_DETAILS_COLOR}  ${PRODUCT_DETAILS_SIZE}
    Remove Item From Header Cart  ${HOME_PRODUCT_TITLE}