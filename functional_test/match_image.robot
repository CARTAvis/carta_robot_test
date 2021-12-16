*** Settings ***
Documentation     Load multiple images and match them
Resource          ../resource.robot

*** Test Cases ***
Match Images Spatially And Spectrally
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   xpath://*[contains(text(), "M17_SWex.fits")]
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    Append Image  xpath://*[contains(text(), "M17_SWex.image")]
    Mouse Over    ${VIEWER_DIV}
    Click Element    //*[@id="image-panel-0-0"]/div[8]/span[5]/a
    Mouse Over    ${VIEWER_DIV}
    Mouse Out    ${VIEWER_DIV}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    casa_zoomed_unmatched.png
    Click Element    xpath://*[contains(text(), "Animator")]
    Click Element At Coordinates    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[1]/div[1]/div[1]    -50    0
    Mouse Over    ${VIEWER_DIV}
    Mouse Out    ${VIEWER_DIV}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    fits_initial_unmatched.png
    Click Element At Coordinates    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[1]/div[1]/div[1]    50    0
    Mouse Over    ${VIEWER_DIV}
    Click Element    //*[@id="image-panel-0-0"]/div[8]/span[9]/span/a  
    Click Element    xpath://*[contains(text(), "Spectral (VRAD) and Spatial")]
    Mouse Over    ${VIEWER_DIV}
    Mouse Out    ${VIEWER_DIV}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    matched.png
    PNG Images Should Be Identical    fits_initial_unmatched.png    matched.png
    PNG Images Should Be Different    casa_zoomed_unmatched.png    fits_initial_unmatched.png
    Click Element    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[2]
    Mouse Over    ${VIEWER_DIV}
    Mouse Out    ${VIEWER_DIV}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    casa_new_channel.png
    Click Element At Coordinates    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[1]/div[1]/div[1]    -50    0
    Mouse Over    ${VIEWER_DIV}
    Mouse Out    ${VIEWER_DIV}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    fits_new_channel.png
    PNG Images Should Be Identical    casa_new_channel.png    fits_new_channel.png
    Remove Files    casa_zoomed_unmatched.png    fits_initial_unmatched.png    matched.png    casa_new_channel.png    fits_new_channel.png
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    Sleep    1
    [Teardown]    Kill carta_backend And Close Browser



Match Wide-Field Images Spatially
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   xpath://*[contains(text(), "Gaussian2.fits")]
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[1]/a
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[2]/td[2]/div/div[1]/label[1]
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[3]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[3]/td[2]/div/div/input    465.5
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[3]/td[3]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[3]/td[3]/div/div/input    483
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[2]/td[2]/div/div[1]/label[1]
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[3]/div/a[2]
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/table/tbody/tr[2]/td[2]
    Append Image  xpath://*[contains(text(), "Gaussian_SE2.fits")]
    Mouse Over    ${VIEWER_DIV}
    Click Element    //*[@id="image-panel-1-0"]/div[8]/span[9]/span/a
    Mouse Out    //*[@id="image-panel-1-0"]/div[8]/span[9]/span/a
    Sleep    0.5
    Click Element    xpath://*[contains(text(), "Spatial only")]
    Repeat Keyword    3    Click Element    //*[@id="image-panel-1-0"]/div[8]/span[5]/a
    Click Element    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/table/tbody/tr[2]/td[4]
    Press Keys    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/table/tbody/tr[2]/td[4]    DELETE
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    matched_multipanel.png
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    matched_2nd_image.png
    Click Element    xpath://*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    matched_1st_image.png
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    Sleep    0.5
    Set Selenium Speed    0.02
    PNG Pixel XY Should Match RGBA    matched_1st_image.png    379,217,252,254,164,255
    PNG Pixel XY Should Match RGBA    matched_2nd_image.png    379,217,252,254,164,255
    PNG Pixel XY Should Match RGBA    matched_multipanel.png    190,217,252,254,164,255
    PNG Pixel XY Should Match RGBA    matched_multipanel.png    570,217,252,254,164,255
    #Remove Files    matched_multipanel.png    matched_2nd_image.png    matched_1st_image.png
    [Teardown]    Kill carta_backend And Close Browser    


