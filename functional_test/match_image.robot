*** Settings ***
Documentation     Load multiple images and match them
Resource          ../resource.robot

*** Test Cases ***
Match Images Spatially And Spectrally
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   ${FITS_M17_SWex}
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    Append Image  ${CASA_M17_SWex}
    Mouse Over    ${VIEWER_DIV}
    Click Element    //*[@id="image-panel-0-0"]/div[8]/span[5]/a
    Mouse Over    ${VIEWER_DIV}
    Mouse Out    ${VIEWER_DIV}
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    casa_zoomed_unmatched.png
    Click Element    xpath://*[contains(text(), "Animator")]
    Click Element At Coordinates    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[1]/div[1]/div[1]    -50    0
    Mouse Over    ${VIEWER_DIV}
    Mouse Out    ${VIEWER_DIV}
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    fits_initial_unmatched.png
    Click Element At Coordinates    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[1]/div[1]/div[1]    50    0
    Mouse Over    ${VIEWER_DIV}
    Click Element    //*[@id="image-panel-0-0"]/div[8]/span[9]/span/a  
    Click Element    xpath://*[contains(text(), "Spectral (VRAD) and Spatial")]
    Mouse Over    ${VIEWER_DIV}
    Mouse Out    ${VIEWER_DIV}
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    matched.png
    PNG Images Should Be Identical    fits_initial_unmatched.png    matched.png
    PNG Images Should Be Different    casa_zoomed_unmatched.png    fits_initial_unmatched.png
    Click Element    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[2]
    Mouse Over    ${VIEWER_DIV}
    Mouse Out    ${VIEWER_DIV}
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    casa_new_channel.png
    Click Element At Coordinates    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[1]/div[1]/div[1]    -50    0
    Mouse Over    ${VIEWER_DIV}
    Mouse Out    ${VIEWER_DIV}
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    fits_new_channel.png
    PNG Images Should Be Identical    casa_new_channel.png    fits_new_channel.png
    Remove Files    casa_zoomed_unmatched.png    fits_initial_unmatched.png    matched.png    casa_new_channel.png    fits_new_channel.png
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    Sleep    0.5
    [Teardown]    Kill carta_backend And Close Browser






