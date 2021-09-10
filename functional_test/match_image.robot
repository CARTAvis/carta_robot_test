*** Settings ***
Documentation     Load multiple images and match them
Resource          ../resource.robot

*** Test Cases ***
Match Images Spatially
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Sleep     1
    Go To E2E QA Folder
    Load Initial Image   ${FITS_M17_SWex}
    Sleep    1
    Append Image  ${CASA_M17_SWex}
    Sleep    1
    Mouse Over    ${VIEWER_DIV}
    Sleep    1
    Click Element    //*[@id="root"]/div/div[11]/div[2]/div/div[1]/div[1]/div[2]/div/div/div/div[7]/span[4]/span/button
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    casa_zoomed_unmatched.png
    Sleep    1
    Click Element    xpath://*[contains(text(), "M17_SWex.fits")]
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    fits_initial_unmatched.png
    Sleep    1
    Click Element    xpath://*[contains(text(), "M17_SWex.image")]
    Sleep    1
    Mouse Over    ${VIEWER_DIV}
    Click Element    //*[@id="root"]/div/div[11]/div[2]/div/div[1]/div[1]/div[2]/div/div/div/div[7]/span[8]/span/span/span/button    
    Click Element    xpath://*[contains(text(), "Spectral (VRAD) and Spatial")]
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    matched.png
    Sleep    1
    Compare Images To Be Identical    fits_initial_unmatched.png    matched.png    0.0606135
    Sleep    1
    Compare Images To Be Different    casa_zoomed_unmatched.png    fits_initial_unmatched.png    0.295622
    Sleep    1
    Remove Files    casa_zoomed_unmatched.png    fits_initial_unmatched.png    matched.png
    Sleep    1
    
    [Teardown]    Kill carta_backend And Close Browser






