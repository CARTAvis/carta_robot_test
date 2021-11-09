*** Settings ***
Documentation     Load multiple images and match them
Resource          ../resource.robot

*** Test Cases ***
Match Images Spatially And Spectrally
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   ${FITS_M17_SWex}
    Sleep    1
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    Sleep    3
    Append Image  ${CASA_M17_SWex}
    Sleep    1
    Mouse Over    ${VIEWER_DIV}
    Sleep    1
    Click Element    //*[@id="image-panel-0-0"]/div[8]/span[5]/a
    Sleep    1
    Mouse Over    ${VIEWER_DIV}
    Mouse Out    ${VIEWER_DIV}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    casa_zoomed_unmatched.png
    Sleep    1
    Click Element    xpath://*[contains(text(), "Animator")]
    Click Element At Coordinates    //*[@id="root"]/div/div[14]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[1]/div[1]/div[1]    -50    0
    Mouse Over    ${VIEWER_DIV}
    Mouse Out    ${VIEWER_DIV}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    fits_initial_unmatched.png
    Sleep    1
    Click Element At Coordinates    //*[@id="root"]/div/div[14]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[1]/div[1]/div[1]    50    0
    Sleep    1
    Mouse Over    ${VIEWER_DIV}
    Sleep    1
    Click Element    //*[@id="image-panel-0-0"]/div[8]/span[9]/span/a  
    Click Element    xpath://*[contains(text(), "Spectral (VRAD) and Spatial")]
    Sleep    1
    Mouse Over    ${VIEWER_DIV}
    Mouse Out    ${VIEWER_DIV}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    matched.png
    Sleep    1
    PNG Images Should Be Identical    fits_initial_unmatched.png    matched.png
    Sleep    1
    PNG Images Should Be Different    casa_zoomed_unmatched.png    fits_initial_unmatched.png
    Sleep    1
    Click Element    //*[@id="root"]/div/div[14]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[2]
    Sleep    1
    Mouse Over    ${VIEWER_DIV}
    Mouse Out    ${VIEWER_DIV}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    casa_new_channel.png
    Sleep    1
    Click Element At Coordinates    //*[@id="root"]/div/div[14]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[1]/div[1]/div[1]    -50    0
    Sleep    1
    Mouse Over    ${VIEWER_DIV}
    Mouse Out    ${VIEWER_DIV}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    fits_new_channel.png
    Sleep    1
    PNG Images Should Be Identical    casa_new_channel.png    fits_new_channel.png
    Remove Files    casa_zoomed_unmatched.png    fits_initial_unmatched.png    matched.png    casa_new_channel.png    fits_new_channel.png
    Sleep    1
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    Sleep    3
    [Teardown]    Kill carta_backend And Close Browser






