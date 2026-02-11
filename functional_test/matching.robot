*** Settings ***
Documentation     Load multiple images and match them
Resource          ../resource.robot


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
    Click Element    css:#image-panel-0-0 [data-testid="match-button"]
    Click Element    //*[contains(text(), "Spectral (VRAD) and spatial")]
    Click Element    //*[contains(text(), "Animator")]
    Repeat Keyword    5    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Element Contains    ${VIEWER_CURSOR_INFO_BAR}    14.2200 km/s
    Sleep    0.2
    Mouse Over    ${VIEWER_DIV}
    #Sleep    0.5
    Mouse Out    ${VIEWER_DIV}
    Sleep    1.0
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
    Click Element    ${POINT_REGION_SHORTCUT_BUTTON}
    Click Element    ${VIEWER_DIV}
    # edit the position of the point region in image coordinate in the region config dialog
    Double Click Element    ${VIEWER_DIV}
    Click Element    //*[contains(text(), "Image")]
    Press Keys    //input[@placeholder="X Coordinate"]    DELETE
    Input Text    //input[@placeholder="X Coordinate"]    465.5
    Press Keys    //input[@placeholder="Y Coordinate"]    DELETE
    Input Text    //input[@placeholder="Y Coordinate"]    483
    Click Element    data:testid:region-dialog-header-close-button
    # center the point region in the view by clicking the center button in the region list widget
    Click Element    //*[contains(text(), "Region List")]
    Click Element    data:testid:region-list-table-row-2-center-cell
    Append Image    Gaussian_SE2.fits
    Mouse Over    ${VIEWER_DIV}
    #Sleep    1
    # match Gaussian_SE2.fits to Gaussian2.fits
    Click Element    ${VIEWER_10_MATCH_BUTTON}
    #Sleep    0.5
    Mouse Out    ${VIEWER_10_MATCH_BUTTON}
    #Sleep    0.5
    Click Element    //*[contains(text(), "Spatial only")]
    # zoom in the image with the zoom-in button
    Repeat Keyword    3    Click Element    ${VIEWER_10_ZOOM_IN_BUTTON}
    # select the point region in the region list and delete it
    Press Keys    data:testid:region-list-table-row-2    DELETE
    #Sleep    0.5
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    matched_multipanel_${key}.png
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    #Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    matched_2nd_image_${key}.png
    Click Element    //*[contains(text(), "Animator")]
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
    Click Element    ${RECTANGLE_REGION_SHORTCUT_BUTTON}
    Click Element    ${VIEWER_DIV}
    # enable region config dialog and set a new size and a new styling
    Double Click Element    ${VIEWER_DIV}
    Click Element    //*[contains(text(), "Image")]
    Press Keys    (//input[@placeholder="X Coordinate"])[1]    DELETE
    Input Text    (//input[@placeholder="X Coordinate"])[1]    5
    Press Keys    (//input[@placeholder="Y Coordinate"])[1]    DELETE
    Input Text    (//input[@placeholder="Y Coordinate"])[1]    1
    Press Keys    //input[@placeholder="Width"]    DELETE
    Input Text    //input[@placeholder="Width"]    1
    Press Keys    //input[@placeholder="Height"]    DELETE
    Input Text    //input[@placeholder="Height"]    1
    Click Element    data:testid:region-dialog-styling-tab-title
    Press Keys    data:testid:region-dialog-line-width-input    DELETE
    Input Text    data:testid:region-dialog-line-width-input    3
    Click Element    data:testid:region-dialog-header-close-button
    Append Image    pixel_shader_test.fits
    # match the 2nd pixel_shader_test.fits to the 1st pixel_shader_test.fits
    Mouse Over    ${VIEWER_DIV}
    Click Element    ${VIEWER_10_MATCH_BUTTON}
    Mouse Out    ${VIEWER_10_MATCH_BUTTON}
    #Sleep    0.5
    Click Element    //*[contains(text(), "Spatial only")]
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
    Click Element    //*[contains(text(), "Animator")]
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
    Click Element    ${RECTANGLE_REGION_SHORTCUT_BUTTON}
    Click Element    ${VIEWER_DIV}
    # enable region config dialog and set a new size and a new styling
    Double Click Element    ${VIEWER_DIV}
    Click Element    //*[contains(text(), "Image")]
    Press Keys    (//input[@placeholder="X Coordinate"])[1]    DELETE
    Input Text    (//input[@placeholder="X Coordinate"])[1]    5
    Press Keys    (//input[@placeholder="Y Coordinate"])[1]    DELETE
    Input Text    (//input[@placeholder="Y Coordinate"])[1]    1
    Press Keys    //input[@placeholder="Width"]    DELETE
    Input Text    //input[@placeholder="Width"]    1
    Press Keys    //input[@placeholder="Height"]    DELETE
    Input Text    //input[@placeholder="Height"]    1
    Click Element    data:testid:region-dialog-styling-tab-title
    Press Keys    data:testid:region-dialog-line-width-input    DELETE
    Input Text    data:testid:region-dialog-line-width-input    3
    Click Element    data:testid:region-dialog-header-close-button
    Append Image    pixel_shader_test.fits
    Mouse Over    ${VIEWER_DIV}
    Click Element    ${VIEWER_10_MATCH_BUTTON}
    Mouse Out    ${VIEWER_10_MATCH_BUTTON}
    #Sleep    0.5
    Click Element    //*[contains(text(), "Spatial only")]
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
    Click Element    //*[contains(text(), "Animator")]
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
    Click Element    //*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Click Element    ${CONTOUR_CONFIG_DIALOG_BUTTON}
    # set a contour level of 0.5
    Input Text    css:[data-testid="contour-config-level-input-form"] input    0.5
    # go to the styling tab and set the thickness to 5
    Click Element    data:testid:contour-dailog-styling-tab-title
    Input Text    data:testid:contour-thickness-input    5
    Click Element    ${CONTOUR_CONFIG_DIALOG_APPLY_BUTTON}
    Click Element    ${CONTOUR_CONFIG_DIALOG_CLOSE_BUTTON}
    #Sleep    1
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    # use the match button in the Gaussian2.fits panel to match to small_gaussian.fits
    Mouse Over    ${VIEWER_10_CANVAS}
    Click Element    ${VIEWER_10_MATCH_BUTTON}
    Mouse Over    //*[contains(text(), "Spatial only")]
    Click Element    //*[contains(text(), "Spatial only")]
    Mouse Out    ${VIEWER_DIV}
    #Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    check2_${key}.png
    Click Element    ${CONTOUR_CONFIG_DIALOG_BUTTON}
    # set a contour level of 0.5
    Input Text    css:[data-testid="contour-config-level-input-form"] input    0.5
    # go to the styling tab and set the thickness to 5
    Click Element    data:testid:contour-dailog-styling-tab-title
    Input Text    data:testid:contour-thickness-input    5
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
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_X_DROPDOWN}
    Click Element    //a[contains(., "RA_d")]
    # click the DEC dropdown and select DEC_d column
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_Y_DROPDOWN}
    Click Element    //a[contains(., "DEC_d")]
    # render catalog overlay by clicking the Plot button
    Click Element    ${CATALOG_WIDGET_PLOT_BUTTON}
    Click Element    //*[contains(text(), "Size")]
    # change mark shape to filled circle
    Click Element    data:testid:catalog-settings-shape-dropdown
    Click Element    data:testid:catalog-settings-shape-circle-filled
    # change marker size to 5
    Input Text    data:testid:catalog-settings-size-input    5
    # close the catalog settings dialog
    Click Element    data:testid:catalog-overlay-component-0-floating-settings-0-header-close-button
    # close the catalog widget
    Click Element    data:testid:catalog-overlay-component-0-header-close-button
    Append Image    model_imregrid_galactic.fits
    Mouse Over    ${VIEWER_10_CANVAS}
    # match model_imregrid_galactic.fits to model_fits_fk4.xml
    Click Element    ${VIEWER_10_MATCH_BUTTON}
    Mouse Over    //*[contains(text(), "Spatial only")]
    Click Element    //*[contains(text(), "Spatial only")]
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
    Click Element    ${VECTOR_FIELD_RENDERING_THRESHOLD_OPTION_DROPDOWN}
    Click Element    //*[@id="bp5-tab-panel_undefined_0"]/div/div[5]/div/div/select/option[2]
    Press Keys    ${VECTOR_FIELD_RENDERING_THRESHOLD_INPUT}    0.01
    Click Element    ${VECTOR_FIELD_RENDERING_STYLING_TAB}
    Input Text    ${VECTOR_FIELD_RENDERING_LINE_THICKNESS_INPUT}    2
    Click Element    ${VECTOR_FIELD_RENDERING_CONFIGURATION_TAB}
    Click Element    ${VECTOR_FIELD_RENDERING_APPLY_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}
    Append Image    HL_tau_Stokes_hypercube_IQU.pbcor.fits
    # match HL_tau_Stokes_hypercube_IQU.pbcor.fits to the referene image HL_Tau_StokesIQUV_clean.pbcor.fits
    Mouse Over    ${VIEWER_10_CANVAS}
    Click Element    ${VIEWER_10_MATCH_BUTTON}
    Click Element     //*[contains(text(), "Spatial only")]
    # rendering a vector field from the 2nd image
    Click Element    ${VECTOR_FIELD_RENDERING_DIALOG_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_THRESHOLD_TOGGLE}
    Click Element    ${VECTOR_FIELD_RENDERING_THRESHOLD_OPTION_DROPDOWN}
    Click Element    //*[@id="bp5-tab-panel_undefined_0"]/div/div[5]/div/div/select/option[2]
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
    Click Element    ${VIEWER_10_MATCH_BUTTON}
    Mouse Over    //*[contains(text(), "Spatial only")]
    Click Element    //*[contains(text(), "Spatial only")]
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
    Click Element    ${CONTOUR_CONFIG_DIALOG_BUTTON}
    Input Text    css:[data-testid="contour-config-level-input-form"] input    60
    Click Element    data:testid:contour-dailog-styling-tab-title
    Input Text    data:testid:contour-thickness-input    2
    Click Element    ${CONTOUR_CONFIG_DIALOG_APPLY_BUTTON}
    Click Element    ${CONTOUR_CONFIG_DIALOG_CLOSE_BUTTON}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    Set Selenium Speed    0
    # check vector rendering
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    274,252,653,252
    # check contour rendering
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    292,258,671,258
    Remove File    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser
