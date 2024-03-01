*** Settings ***
Documentation     Load multiple images and match them
Resource          ../resource.robot


*** Variables ***
${MAGIC_INDEX}    18


*** Test Cases ***
Match Images Spatially And Spectrally
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    Mouse Over    ${VIEWER_DIV}
    #Sleep    1
    Click Element    ${VIEWER_00_ZOOM_IN_BUTTON}
    Append Image    M17_SWex.image
    Mouse Over    ${VIEWER_DIV}
    #Sleep    1
    # match M17_SWex.image to M17_SWex.fits
    Click Element    //*[@id="image-panel-0-0"]/div[9]/span[9]/span/a
    Click Element    xpath://*[contains(text(), "Spectral (VRAD) and spatial")]
    Click Element    xpath://*[contains(text(), "Animator")]
    Repeat Keyword    5    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Mouse Over    ${VIEWER_DIV}
    #Sleep    0.5
    Mouse Out    ${VIEWER_DIV}
    #Sleep    1.0
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    casa_zoomed_matched_${key}.png
    #Sleep    0.5
    Click Element    ${ANIMATOR_IMAGE_RADIO_BUTTON}
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Mouse Over    ${VIEWER_DIV}
    #Sleep    0.5
    Mouse Out    ${VIEWER_DIV}
    #Sleep    1.0
    Capture Element Screenshot    ${VIEWER_DIV}    fits_zoomed_matched_${key}.png
    #Sleep    0.5
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    #Sleep    0.5
    Set Selenium Speed    0
    PNG Images Should Be Identical    fits_zoomed_matched_${key}.png    casa_zoomed_matched_${key}.png
    Remove Files    fits_zoomed_matched_${key}.png    casa_zoomed_matched_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Match Wide-Field Images Spatially
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    Gaussian2.fits
    # create a point region at the view center via the region shortcut button
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[1]/a
    Click Element    ${VIEWER_DIV}
    # edit the position of the point region in image coordinate in the region config dialog
    Double Click Element    ${VIEWER_DIV}
    Click Element    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[1]/label[1]
    Press Keys    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[3]/div/div[1]/div/input    DELETE
    Input Text    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[3]/div/div[1]/div/input    465.5
    Press Keys    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[3]/div/div[2]/div/input    DELETE
    Input Text    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[3]/div/div[2]/div/input    483
    Click Element    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[1]/label[1]
    Click Element    //*[@id="root"]/div/div[2]/div/div[1]/div[2]/div/div[1]/button
    # center the point region in the view by clicking the center button in the region list widget
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[2]
    Append Image    Gaussian_SE2.fits
    Mouse Over    ${VIEWER_DIV}
    #Sleep    1
    # match Gaussian_SE2.fits to Gaussian2.fits
    Click Element    //*[@id="image-panel-1-0"]/div[9]/span[9]/span/a
    #Sleep    0.5
    Mouse Out    //*[@id="image-panel-1-0"]/div[9]/span[9]/span/a
    #Sleep    0.5
    Click Element    xpath://*[contains(text(), "Spatial only")]
    # zoom in the image with the zoom-in button
    Repeat Keyword    3    Click Element    ${VIEWER_10_ZOOM_IN_BUTTON}
    # select the point region in the region list and delete it
    Click Element    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]
    Press Keys    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]    DELETE
    #Sleep    0.5
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    matched_multipanel_${key}.png
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    #Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    matched_2nd_image_${key}.png
    Click Element    xpath://*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    #Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    matched_1st_image_${key}.png
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    #Sleep    0.5
    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    matched_1st_image_${key}.png    379,217,252,254,164,255
    PNG Pixel XY Should Match RGBA    matched_2nd_image_${key}.png    379,217,252,254,164,255
    PNG Two Pixels Should Have Matched RGBA    matched_multipanel_${key}.png    190,217,570,217
    Remove Files    matched_multipanel_${key}.png    matched_2nd_image_${key}.png    matched_1st_image_${key}.png
    [Teardown]    Kill carta_backend And Close Browser    


Matched Region Canvas Rendering Multiple Panel View
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    pixel_shader_test.fits
    # create a rectangle region at view center via the shortcut button
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[3]/a
    Click Element    ${VIEWER_DIV}
    # enable region config dialog and set a new size and a new styling
    Double Click Element    ${VIEWER_DIV}
    Click Element    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[1]/label[1]
    Press Keys    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[3]/div/div[1]/div/input    DELETE
    Input Text    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[3]/div/div[1]/div/input    5
    Press Keys    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[3]/div/div[2]/div/input    DELETE
    Input Text    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[3]/div/div[2]/div/input    1
    Press Keys    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[4]/div/div[1]/div/input    DELETE
    Input Text    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[4]/div/div[1]/div/input    1
    Press Keys    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[4]/div/div[2]/div/input    DELETE
    Input Text    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[4]/div/div[2]/div/input    1
    Click Element    //*[@id="bp3-tab-title_regionDialogTabs_1"]
    Press Keys    //*[@id="bp3-tab-panel_regionDialogTabs_1"]/div/div[2]/div/div/div[1]/input    DELETE
    Input Text    //*[@id="bp3-tab-panel_regionDialogTabs_1"]/div/div[2]/div/div/div[1]/input    3
    Click Element    //*[@id="bp3-tab-title_regionDialogTabs_1"]
    Click Element    //*[@id="root"]/div/div[2]/div/div[1]/div[2]/div/div[1]/button
    Append Image    pixel_shader_test.fits
    # match the 2nd pixel_shader_test.fits to the 1st pixel_shader_test.fits
    Mouse Over    ${VIEWER_DIV}
    Click Element    ${VIEWER_10_MATCH_BUTTON}
    Mouse Out    ${VIEWER_10_MATCH_BUTTON}
    #Sleep    0.5
    Click Element    xpath://*[contains(text(), "Spatial only")]
    Mouse Out    ${VIEWER_DIV}
    #Sleep    0.5
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    Set Selenium Speed    0
    # control points left region
    PNG Pixel XY Should Match RGBA    check_${key}.png    159,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    159,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    159,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    189,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    220,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    220,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    220,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    189,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    189,171,255,255,255,255
    # rectangle sides left region
    PNG Pixel XY Should Match RGBA    check_${key}.png    159,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    159,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    174,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    205,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    220,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    220,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    205,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    174,186,46,230,214,255
    # control points right region
    PNG Pixel XY Should Match RGBA    check_${key}.png    538,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    538,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    538,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    568,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    599,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    599,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    599,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    568,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    568,171,255,255,255,255
    # rectangle sides right region
    PNG Pixel XY Should Match RGBA    check_${key}.png    538,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    538,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    553,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    584,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    599,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    599,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    584,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    553,186,46,230,214,255
    Set Selenium Speed    ${DELAY}
    Click Element    xpath://*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    #Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check2_${key}.png
    Set Selenium Speed    0
    # control points left region
    PNG Pixel XY Should Match RGBA    check2_${key}.png    159,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    159,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    159,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    189,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    220,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    220,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    220,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    189,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    189,171,255,255,255,255
    # rectangle sides left region
    PNG Pixel XY Should Match RGBA    check2_${key}.png    159,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    159,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    174,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    205,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    220,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    220,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    205,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    174,186,46,230,214,255
    # control points right region
    PNG Pixel XY Should Match RGBA    check2_${key}.png    538,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    538,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    538,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    568,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    599,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    599,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    599,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    568,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    568,171,255,255,255,255
    # rectangle sides right region
    PNG Pixel XY Should Match RGBA    check2_${key}.png    538,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    538,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    553,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    584,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    599,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    599,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    584,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    553,186,46,230,214,255
    Set Selenium Speed    ${DELAY}
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    #Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check3_${key}.png
    PNG Images Should Be Identical    check_${key}.png    check3_${key}.png
    # de-select the region
    Press Keys    ${VIEWER_DIV}    ESCAPE
    Mouse Out    ${VIEWER_DIV}
    #Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check4_${key}.png
    Set Selenium Speed    0
    # control points left region
    PNG Pixel XY Should Match RGBA    check4_${key}.png    159,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    159,217,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    159,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    189,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    220,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    220,217,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    220,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    189,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    189,171,207,68,70,255
    # rectangle sides left region
    PNG Pixel XY Should Match RGBA    check4_${key}.png    159,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    159,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    174,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    205,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    220,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    220,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    205,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    174,186,46,230,214,255
    # control points right region
    PNG Pixel XY Should Match RGBA    check4_${key}.png    538,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    538,217,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    538,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    568,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    599,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    599,217,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    599,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    568,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    568,171,207,68,70,255
    # rectangle sides right region
    PNG Pixel XY Should Match RGBA    check4_${key}.png    538,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    538,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    553,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    584,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    599,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    599,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    584,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4_${key}.png    553,186,46,230,214,255
    Remove Files    check_${key}.png    check2_${key}.png    check3_${key}.png    check4_${key}.png
    [Teardown]    Kill carta_backend And Close Browser




Matched Region Canvas Rendering Single Panel View
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    pixel_shader_test.fits
    # create a rectangle region at view center via the shortcut button
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[3]/a
    Click Element    ${VIEWER_DIV}
    # enable region config dialog and set a new size and a new styling
    Double Click Element    ${VIEWER_DIV}
    Click Element    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[1]/label[1]
    Press Keys    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[3]/div/div[1]/div/input    DELETE
    Input Text    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[3]/div/div[1]/div/input    5
    Press Keys    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[3]/div/div[2]/div/input    DELETE
    Input Text    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[3]/div/div[2]/div/input    1
    Press Keys    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[4]/div/div[1]/div/input    DELETE
    Input Text    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[4]/div/div[1]/div/input    1
    Press Keys    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[4]/div/div[2]/div/input    DELETE
    Input Text    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[4]/div/div[2]/div/input    1
    Click Element    //*[@id="bp3-tab-title_regionDialogTabs_1"]
    Press Keys    //*[@id="bp3-tab-panel_regionDialogTabs_1"]/div/div[2]/div/div/div[1]/input    DELETE
    Input Text    //*[@id="bp3-tab-panel_regionDialogTabs_1"]/div/div[2]/div/div/div[1]/input    3
    Click Element    //*[@id="bp3-tab-panel_regionDialogTabs_1"]/div/div[2]/label
    Click Element    //*[@id="root"]/div/div[2]/div/div[1]/div[2]/div/div[1]/button
    Append Image    pixel_shader_test.fits
    Mouse Over    ${VIEWER_DIV}
    Click Element    ${VIEWER_10_MATCH_BUTTON}
    Mouse Out    ${VIEWER_10_MATCH_BUTTON}
    #Sleep    0.5
    Click Element    xpath://*[contains(text(), "Spatial only")]
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    Mouse Out    ${VIEWER_DIV}
    # this sleep is necessary for an unknown reason to make the test work... [TODO: investigate this] 
    Sleep    0.5
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    # test region canvas rendering
    Set Selenium Speed    0
    # control points
    PNG Pixel XY Should Match RGBA    check_${key}.png    348,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    348,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    348,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    380,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    410,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    410,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    410,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    380,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    379,172,255,255,255,255
    # rectangle sides
    PNG Pixel XY Should Match RGBA    check_${key}.png    348,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    348,202,46,230,214,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    364,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    395,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    410,202,46,230,214,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    410,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    395,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    364,248,46,230,214,255
    Set Selenium Speed    ${DELAY}
    Click Element    xpath://*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    #Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check2_${key}.png
    # test region canvas rendering
    Set Selenium Speed    0
    # control points
    PNG Pixel XY Should Match RGBA    check2_${key}.png    348,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    348,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    348,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    380,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    410,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    410,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    410,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    380,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    379,172,255,255,255,255
    # rectangle sides
    PNG Pixel XY Should Match RGBA    check2_${key}.png    348,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    348,202,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    364,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    395,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    410,202,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    410,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    395,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    364,248,46,230,214,255
    Set Selenium Speed    ${DELAY}
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    #Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check3_${key}.png
    # test region canvas rendering
    Set Selenium Speed    0
    # control points
    PNG Pixel XY Should Match RGBA    check3_${key}.png    348,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check3_${key}.png    348,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check3_${key}.png    348,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check3_${key}.png    380,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check3_${key}.png    410,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check3_${key}.png    410,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check3_${key}.png    410,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check3_${key}.png    380,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check3_${key}.png    379,172,255,255,255,255
    # rectangle sides
    PNG Pixel XY Should Match RGBA    check3_${key}.png    348,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check3_${key}.png    348,202,46,230,214,255
    PNG Pixel XY Should Match RGBA    check3_${key}.png    364,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check3_${key}.png    395,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check3_${key}.png    410,202,46,230,214,255
    PNG Pixel XY Should Match RGBA    check3_${key}.png    410,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check3_${key}.png    395,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check3_${key}.png    364,248,46,230,214,255
    Set Selenium Speed    ${DELAY}
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    Remove Files    check_${key}.png    check2_${key}.png    check3_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Match Contours Spatially
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    small_gaussian.fits
    Append Image    Gaussian2.fits
    Click Element    xpath://*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Click Element    ${CONTOUR_CONFIG_DIALOG_BUTTON}
    # set a contour level of 0.5
    Input Text    //*[@id="bp3-tab-panel_undefined_0"]/div/div[3]/div/div/div/div/input    0.5
    # go to the styling tab and set the thickness to 5
    Click Element    //*[@id="bp3-tab-title_undefined_2"]
    Input Text    //*[@id="bp3-tab-panel_undefined_2"]/div/div[1]/div/div/div[1]/input    5
    Click Element    ${CONTOUR_CONFIG_DIALOG_APPLY_BUTTON}
    Click Element    ${CONTOUR_CONFIG_DIALOG_CLOSE_BUTTON}
    #Sleep    1
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    # use the match button in the Gaussian2.fits panel to match to small_gaussian.fits
    Mouse Over    ${VIEWER_10_CANVAS}
    Click Element    //*[@id="image-panel-1-0"]/div[9]/span[9]/span/a
    Mouse Over    xpath://*[contains(text(), "Spatial only")]
    Click Element    xpath://*[contains(text(), "Spatial only")]
    Mouse Out    ${VIEWER_DIV}
    #Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    check2_${key}.png
    Click Element    ${CONTOUR_CONFIG_DIALOG_BUTTON}
    # set a contour level of 0.5
    Input Text    //*[@id="bp3-tab-panel_undefined_0"]/div/div[3]/div/div/div/div/input    0.5
    # go to the styling tab and set the thickness to 5
    Click Element    //*[@id="bp3-tab-title_undefined_2"]
    Input Text    //*[@id="bp3-tab-panel_undefined_2"]/div/div[1]/div/div/div[1]/input    5
    Click Element    ${CONTOUR_CONFIG_DIALOG_APPLY_BUTTON}
    Click Element    ${CONTOUR_CONFIG_DIALOG_CLOSE_BUTTON}
    #Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    check3_${key}.png
    Mouse Over    ${VIEWER_10_CANVAS}
    Click Element    ${VIEWER_10_ZOOM_TO_FIT_BUTTON}
    Mouse Out    ${VIEWER_DIV}
    #Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    check4_${key}.png
    Set Selenium Speed    0
    PNG Images Should Be Different    check_${key}.png    check2_${key}.png
    PNG Images Should Be Different    check_${key}.png    check3_${key}.png
    PNG Images Should Be Different    check_${key}.png    check4_${key}.png
    PNG Images Should Be Different    check2_${key}.png    check4_${key}.png
    PNG Images Should Be Different    check3_${key}.png    check4_${key}.png
    PNG Two Pixels Should Have Matched RGBA    check2_${key}.png    190,184,569,184
    PNG Two Pixels Should Have Matched RGBA    check2_${key}.png    166,195,545,195
    PNG Two Pixels Should Have Matched RGBA    check2_${key}.png    156,218,535,218
    PNG Two Pixels Should Have Matched RGBA    check2_${key}.png    166,240,545,240
    PNG Two Pixels Should Have Matched RGBA    check2_${key}.png    190,252,569,252
    PNG Two Pixels Should Have Matched RGBA    check2_${key}.png    213,240,592,240
    PNG Two Pixels Should Have Matched RGBA    check2_${key}.png    224,218,603,218
    PNG Two Pixels Should Have Matched RGBA    check2_${key}.png    213,195,592,195
    PNG Two Pixels Should Have Matched RGBA    check3_${key}.png    190,177,569,177
    PNG Two Pixels Should Have Matched RGBA    check3_${key}.png    162,188,541,188
    PNG Two Pixels Should Have Matched RGBA    check3_${key}.png    149,218,528,218
    PNG Two Pixels Should Have Matched RGBA    check3_${key}.png    162,247,541,247
    PNG Two Pixels Should Have Matched RGBA    check3_${key}.png    190,258,569,258
    PNG Two Pixels Should Have Matched RGBA    check3_${key}.png    218,247,597,247
    PNG Two Pixels Should Have Matched RGBA    check3_${key}.png    230,218,609,218
    PNG Two Pixels Should Have Matched RGBA    check3_${key}.png    218,188,597,188
    PNG Two Pixels Should Have Matched RGBA    check4_${key}.png    108,148,489,148
    PNG Two Pixels Should Have Matched RGBA    check4_${key}.png    108,148,248,298
    PNG Two Pixels Should Have Matched RGBA    check4_${key}.png    248,298,630,293
    Remove Files    check_${key}.png    check2_${key}.png    check3_${key}.png    check4_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Match Catalog Image Overlay Spatially
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    model.fits
    Load Catalog File  model_fits_fk4.xml
    # click the RA dropdown and select RA_d column
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div/div[1]/div[2]/div/div[3]/div[2]/div/div[1]/div/span/span/div/button
    Click Element    xpath:/html/body/div[7]/div/div/div/div/div/ul/li[3]
    # click the DEC dropdown and select DEC_d column (tricky to select it so a work-around is applied)
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div/div[1]/div[2]/div/div[3]/div[2]/div/div[2]/div/span/span/div/button
    Click Element At Coordinates   //*[@id="root"]/div/div[${MAGIC_INDEX}]/div/div[1]/div[2]/div/div[3]/div[2]/div/div[2]/div/span/span/div/button    0    -150
    # render catalog overlay by clicking the Plot button
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div/div[1]/div[2]/div/div[3]/div[3]/div/a[4]
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div/div[1]/div[2]/div/div[1]/div[3]/a[1] 
    # change mark shape to filled circle
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div[1]/div[2]/div/div[2]/div/span/span/div/button
    Click Element At Coordinates   //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div[1]/div[2]/div/div[2]/div/span/span/div/button    0    50
    # change marker size to 5
    Input Text    //*[@id="bp3-tab-panel_catalogSettings_3"]/div/div[1]/div/span/div/div[1]/input    5
    # close the catalog settings dialog
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div[1]/div[1]/div[3]
    # close the catalog widget
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div/div[1]/div[1]/div[5]
    Append Image    model_imregrid_galactic.fits
    Mouse Over    ${VIEWER_10_CANVAS}
    # match model_imregrid_galactic.fits to model_fits_fk4.xml
    Click Element    //*[@id="image-panel-1-0"]/div[9]/span[9]/span/a
    Mouse Over    xpath://*[contains(text(), "Spatial only")]
    Click Element    xpath://*[contains(text(), "Spatial only")]
    Mouse Over    ${VIEWER_10_CANVAS}
    Click Element    ${VIEWER_10_ZOOM_TO_FIT_BUTTON}
    Mouse Out    ${VIEWER_DIV}
    #Sleep    1
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    Set Selenium Speed    0
    # matched catalog points
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    100,200,479,200
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    92,216,471,216
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    85,232,464,232
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    274,198,653,198
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    286,211,665,211
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    298,224,677,224
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Match Vector Field Overlay Spatially
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HL_Tau_StokesIQUV_clean.pbcor.fits
    Mouse Over    ${VIEWER_DIV}
    Repeat Keyword    2    Click Element    ${VIEWER_00_ZOOM_IN_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_DIALOG_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_THRESHOLD_TOGGLE}
    Press Keys    ${VECTOR_FIELD_RENDERING_THRESHOLD_INPUT}    0.01
    Click Element    ${VECTOR_FIELD_RENDERING_STYLING_TAB}
    Input Text    ${VECTOR_FIELD_RENDERING_LINE_THICKNESS_INPUT}    2
    Click Element    ${VECTOR_FIELD_RENDERING_CONFIGURATION_TAB}
    Click Element    ${VECTOR_FIELD_RENDERING_APPLY_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}
    Append Image    HL_tau_Stokes_hypercube_IQU.pbcor.fits
    # match HL_tau_Stokes_hypercube_IQU.pbcor.fits to the referene image HL_Tau_StokesIQUV_clean.pbcor.fits
    Mouse Over    ${VIEWER_10_CANVAS}
    Click Element    //*[@id="image-panel-1-0"]/div[9]/span[9]/span/a
    Click Element     xpath://*[contains(text(), "Spatial only")]
    # rendering a vector field from the 2nd image
    Click Element    ${VECTOR_FIELD_RENDERING_DIALOG_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_THRESHOLD_TOGGLE}
    Press Keys    ${VECTOR_FIELD_RENDERING_THRESHOLD_INPUT}    0.001
    Click Element    ${VECTOR_FIELD_RENDERING_STYLING_TAB}
    Input Text    ${VECTOR_FIELD_RENDERING_LINE_THICKNESS_INPUT}    2
    Input Text    ${VECTOR_FIELD_RENDERING_LINE_LENGTH_MAX_INPUT}    40
    # apply color-mapped rendering
    Click Element    ${VECTOR_FIELD_RENDERING_COLOR_MODE_DROPDOWN}
    Click Element    ${VECTOR_FIELD_RENDERING_COLOR_MODE_DROPDOWN_COLORMAPPED}
    Click Element    ${VECTOR_FIELD_RENDERING_APPLY_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    # verify screenshot
    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    230,220,609,220
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    222,216,601,216
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    230,220,601,216

    Remove files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Matching Vector And Contour From Secondary To Reference
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HL_Tau.POLI.fits
    Append Image    HL_Tau.POLA.fits
    # matching POLA to POLI
    Click Element    //*[@id="image-panel-1-0"]/div[9]/span[9]/span/a
    Mouse Over    xpath://*[contains(text(), "Spatial only")]
    Click Element    xpath://*[contains(text(), "Spatial only")]
    # zoom in
    Repeat Keyword    3    Click Element    ${VIEWER_10_ZOOM_IN_BUTTON}
    # trigger vector rendering using POLA (2nd image)
    Click Element    ${VECTOR_FIELD_RENDERING_DIALOG_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_INTENSITY_SOURCE_DROPDOWN}
    Click Element    ${VECTOR_FIELD_RENDERING_INTENSITY_SOURCE_DROPDOWN_NONE}
    Click Element    ${VECTOR_FIELD_RENDERING_STYLING_TAB}
    Input Text    ${VECTOR_FIELD_RENDERING_LINE_THICKNESS_INPUT}    2
    Click Element    ${VECTOR_FIELD_RENDERING_APPLY_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}
    # trigger contour rendering using POLA (2nd image)
    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[3]/a
    Input Text    //*[@id="bp3-tab-panel_undefined_0"]/div/div[3]/div/div/div/div/input    60
    Click Element    xpath://*[contains(text(), "Styling")]
    Input Text    //*[@id="bp3-tab-panel_undefined_2"]/div/div[1]/div/div/div[1]/input    2
    Click Element    //*[@id="root"]/div/div[4]/div[1]/div/div[2]/div/div[3]/div/a[2]
    Click Element    //*[@id="root"]/div/div[4]/div[1]/div/div[2]/div/div[1]/button
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    Set Selenium Speed    0
    # check vector rendering
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    274,252,653,252
    # check contour rendering
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    292,258,671,258
    Remove File    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser
