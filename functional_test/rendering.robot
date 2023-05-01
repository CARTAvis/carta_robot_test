*** Settings ***
Documentation     Check various rendering at pixel level
Resource          ../resource.robot

*** Test Cases ***
Raster Image Rendering
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    pixel_shader_test.fits
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    xpath://*[contains(text(), "tab10")]
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    # test pixel shader
    Set Selenium Speed    0.02
    PNG Pixel XY Should Match RGBA    check.png    76,212,31,119,180,255
    PNG Pixel XY Should Match RGBA    check.png    136,212,255,127,14,255
    PNG Pixel XY Should Match RGBA    check.png    196,212,44,160,44,255
    PNG Pixel XY Should Match RGBA    check.png    256,212,214,39,40,255
    PNG Pixel XY Should Match RGBA    check.png    318,212,148,103,189,255
    PNG Pixel XY Should Match RGBA    check.png    380,212,140,86,75,255
    PNG Pixel XY Should Match RGBA    check.png    440,212,227,119,194,255
    PNG Pixel XY Should Match RGBA    check.png    502,212,127,127,127,255
    PNG Pixel XY Should Match RGBA    check.png    562,212,188,189,34,255
    PNG Pixel XY Should Match RGBA    check.png    626,212,23,190,207,255
    PNG Pixel XY Should Match RGBA    check.png    688,212,19,124,189,255
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser

Contour Image Rendering
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    small_gaussian.fits
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    xpath://*[contains(text(), "nipy_spectral")]
    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[3]/a
    Input Text    //*[@id="bp3-tab-panel_undefined_0"]/div/div[3]/div/div/div/div/input    0.6
    Click Element    xpath://*[contains(text(), "Styling")]
    Input Text    //*[@id="bp3-tab-panel_undefined_2"]/div/div[1]/div/div/div[1]/input    5
    Click Element    //*[@id="root"]/div/div[4]/div[1]/div/div[2]/div/div[3]/div/a[2]
    Click Element    //*[@id="root"]/div/div[4]/div[1]/div/div[2]/div/div[1]/button
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    # test contour shader
    Set Selenium Speed    0.02
    PNG Pixel XY Should Match RGBA    check.png    379,196,15,153,96,255
    PNG Pixel XY Should Match RGBA    check.png    367,200,15,153,96,255
    PNG Pixel XY Should Match RGBA    check.png    362,205,15,153,96,255
    PNG Pixel XY Should Match RGBA    check.png    358,217,15,153,96,255
    PNG Pixel XY Should Match RGBA    check.png    362,229,15,153,96,255
    PNG Pixel XY Should Match RGBA    check.png    367,234,15,153,96,255
    PNG Pixel XY Should Match RGBA    check.png    379,238,15,153,96,255
    PNG Pixel XY Should Match RGBA    check.png    391,234,15,153,96,255
    PNG Pixel XY Should Match RGBA    check.png    396,229,15,153,96,255
    PNG Pixel XY Should Match RGBA    check.png    400,217,15,153,96,255
    PNG Pixel XY Should Match RGBA    check.png    396,205,15,153,96,255
    PNG Pixel XY Should Match RGBA    check.png    392,200,15,153,96,255
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser


Region Canvas Rendering
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    pixel_shader_test.fits
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[3]/a
    Click Element    ${VIEWER_DIV}
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
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    # test region canvas rendering
    Set Selenium Speed    0.02
    # control points
    PNG Pixel XY Should Match RGBA    check.png    348,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    348,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    348,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    380,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    410,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    410,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    410,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    380,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    379,172,255,255,255,255
    # rectangle sides
    PNG Pixel XY Should Match RGBA    check.png    348,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    348,202,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    364,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    395,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    410,202,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    410,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    395,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    364,248,46,230,214,255
    # set region inactive
    Set Selenium Speed    0.2
    Press Keys    ${VIEWER_DIV}    ESCAPE
    Mouse Out    ${VIEWER_DIV}
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check2.png
    Set Selenium Speed    0.02
    # control points
    PNG Pixel XY Should Match RGBA    check2.png    348,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    348,217,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    348,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    380,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    410,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    410,217,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    410,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    380,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    379,172,207,68,70,255
    # rectangle sides
    PNG Pixel XY Should Match RGBA    check2.png    348,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    348,202,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    364,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    395,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    410,202,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    410,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    395,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    364,248,46,230,214,255    
    Remove Files    check.png    check2.png
    [Teardown]    Kill carta_backend And Close Browser


Catalog Image Overlay Rendering
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    model.fits
    Load Catalog File  model_fits_fk4.xml
    Click Element    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[3]/div[2]/div/div[1]/div/span/span/div/button
    Click Element    xpath:/html/body/div[8]/div/div/div/div/div/ul/li[3]
    Click Element    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[3]/div[2]/div/div[2]/div/span/span/div/button
    Click Element At Coordinates   //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[3]/div[2]/div/div[2]/div/span/span/div/button    0    -150
    Click Element    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[3]/div[3]/div/a[4]
    Click Element    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[1]/div[3]/a[1]
    Click Element    //*[@id="root"]/div/div[18]/div[2]/div[1]/div[2]/div/div[2]/div/span/span/div/button
    Click Element At Coordinates   //*[@id="root"]/div/div[18]/div[2]/div[1]/div[2]/div/div[2]/div/span/span/div/button    0    50
    Click Element    //*[@id="root"]/div/div[18]/div[2]/div[1]/div[1]/div[3]
    Click Element    //*[@id="root"]/div/div[18]/div/div[1]/div[1]/div[5]
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    Set Selenium Speed    0.02
    # catalog points
    PNG Pixel XY Should Match RGBA    check.png    122,167,0,179,164,255
    PNG Pixel XY Should Match RGBA    check.png    99,213,0,179,164,255
    PNG Pixel XY Should Match RGBA    check.png    78,260,0,179,164,255
    PNG Pixel XY Should Match RGBA    check.png    621,161,0,179,164,255
    PNG Pixel XY Should Match RGBA    check.png    657,197,0,179,164,255
    PNG Pixel XY Should Match RGBA    check.png    691,234,0,179,164,255
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser


Vector Field Rendering With A Stokes Continuum Cube
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HL_Tau_StokesIQUV_clean.pbcor.fits
    Mouse Over    ${VIEWER_DIV}
    Repeat Keyword    2    Click Element    ${VIEWER_00_ZOOM_IN_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_DIALOG_BUTTON}
    # with pixel averaging toggle enabled, set averaging width (px) to 6
    Input Text    ${VECTOR_FIELD_RENDERING_AVERAGING_WIDTH_INPUT}    6
    Click Element    ${VECTOR_FIELD_RENDERING_STYLING_TAB}
    Input Text    ${VECTOR_FIELD_RENDERING_LINE_THICKNESS_INPUT}    2
    Input Text    ${VECTOR_FIELD_RENDERING_LINE_LENGTH_MAX_INPUT}    40
    # apply a 90 degree offset
    Press Keys    ${VECTOR_FIELD_RENDERING_ROTATION_OFFSET_INPUT}    ARROW_LEFT+9
    Click Element    ${VECTOR_FIELD_RENDERING_CONFIGURATION_TAB}
    Click Element    ${VECTOR_FIELD_RENDERING_APPLY_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    check_computed_PI_PA.png
    # enable and apply a threshold then re-render
    Click Element    ${VECTOR_FIELD_RENDERING_DIALOG_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_THRESHOLD_TOGGLE}
    Press Keys    ${VECTOR_FIELD_RENDERING_THRESHOLD_INPUT}    0.005
    Click Element    ${VECTOR_FIELD_RENDERING_APPLY_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    check_computed_PI_PA_with_threshold.png
    # enable and apply debiasing then re-render
    Click Element    ${VECTOR_FIELD_RENDERING_DIALOG_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_DEBIASING_TOGGLE}
    Press Keys    ${VECTOR_FIELD_RENDERING_STOKES_Q_ERROR_INPUT}    0.0001
    Press Keys    ${VECTOR_FIELD_RENDERING_STOKES_U_ERROR_INPUT}    0.0001
    Click Element    ${VECTOR_FIELD_RENDERING_APPLY_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    check_computed_PI_PA_with_threshold_with_debiasing.png
    # render computed angle-only field
    Click Element    ${VECTOR_FIELD_RENDERING_DIALOG_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_INTENSITY_SOURCE_DROPDOWN}
    Click Element    ${VECTOR_FIELD_RENDERING_INTENSITY_SOURCE_DROPDOWN_NONE}
    Click Element    ${VECTOR_FIELD_RENDERING_APPLY_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    check_computed_PA_with_threshold_with_debiasing.png
    # render computed intensity-only field
    Click Element    ${VECTOR_FIELD_RENDERING_DIALOG_BUTTON} 
    Click Element    ${VECTOR_FIELD_RENDERING_INTENSITY_SOURCE_DROPDOWN}
    Click Element    ${VECTOR_FIELD_RENDERING_INTENSITY_SOURCE_DROPDOWN_COMPUTED_PI}
    Click Element    ${VECTOR_FIELD_RENDERING_ANGULAR_SOURCE_DROPDOWN}
    Click Element    ${VECTOR_FIELD_RENDERING_ANGULAR_SOURCE_DROPDOWN_NONE}
    Click Element    ${VECTOR_FIELD_RENDERING_APPLY_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    check_computed_PI_with_threshold_with_debiasing.png
    # clear vector field rendering
    Click Element    ${VECTOR_FIELD_RENDERING_DIALOG_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLEAR_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    check_cleared.png
    # verify screenshots
    Set Selenium Speed    0.02
    PNG Images Should Be Different    check_cleared.png    check_computed_PI_PA.png
    PNG Images Should Be Different    check_computed_PI_PA.png    check_computed_PI_PA_with_threshold.png
    #PNG Images Should Be Different    check_computed_PI_PA_with_threshold.png    check_computed_PI_PA_with_threshold_with_debiasing.png
    PNG Images Should Be Different    check_computed_PI_PA_with_threshold_with_debiasing.png    check_computed_PA_with_threshold_with_debiasing.png
    PNG Images Should Be Different    check_computed_PA_with_threshold_with_debiasing.png    check_computed_PI_with_threshold_with_debiasing.png
    PNG Images Should Be Different    check_computed_PI_with_threshold_with_debiasing.png    check_cleared.png

    # check check_computed_PI_PA.png
    PNG Two Pixels Should Have Matched RGBA    check_computed_PI_PA.png    421,211,410,230
    PNG Two Pixels Should Have Matched RGBA    check_computed_PI_PA.png    421,211,351,306
    PNG Two Pixels Should Have Matched RGBA    check_computed_PI_PA.png    421,211,376,200
    PNG Two Pixels Should Have Matched RGBA    check_computed_PI_PA.png    421,211,217,359
    PNG Two Pixels Should Not Have Matched RGBA    check_computed_PI_PA.png    421,211,214,362
    
    # check check_computed_PI_PA_with_threshold.png
    PNG Two Pixels Should Have Matched RGBA    check_computed_PI_PA_with_threshold.png    421,211,410,230
    PNG Two Pixels Should Have Matched RGBA    check_computed_PI_PA_with_threshold.png    421,211,351,306
    PNG Two Pixels Should Have Matched RGBA    check_computed_PI_PA_with_threshold.png    421,211,376,200
    PNG Two Pixels Should Not Have Matched RGBA    check_computed_PI_PA_with_threshold.png    421,211,217,359
    PNG Two Pixels Should Not Have Matched RGBA    check_computed_PI_PA_with_threshold.png   421,211,214,362

    # check check_computed_PI_PA_with_threshold_with_debiasing.png
    PNG Two Pixels Should Have Matched RGBA    check_computed_PI_PA_with_threshold_with_debiasing.png    421,211,410,230
    PNG Two Pixels Should Have Matched RGBA    check_computed_PI_PA_with_threshold_with_debiasing.png    421,211,351,306
    PNG Two Pixels Should Not Have Matched RGBA    check_computed_PI_PA_with_threshold_with_debiasing.png    421,211,376,200
    PNG Two Pixels Should Not Have Matched RGBA    check_computed_PI_PA_with_threshold_with_debiasing.png    421,211,217,359
    PNG Two Pixels Should Not Have Matched RGBA    check_computed_PI_PA_with_threshold_with_debiasing.png   421,211,214,362

    # check check_computed_PA_with_threshold_with_debiasing.png
    PNG Two Pixels Should Have Matched RGBA    check_computed_PA_with_threshold_with_debiasing.png    426,224,405,256
    PNG Two Pixels Should Have Matched RGBA    check_computed_PA_with_threshold_with_debiasing.png    426,224,303,353
    PNG Two Pixels Should Not Have Matched RGBA    check_computed_PA_with_threshold_with_debiasing.png    426,224,214,362
    
    # check check_computed_PI_with_threshold_with_debiasing.png
    PNG Two Pixels Should Have Matched RGBA    check_computed_PI_with_threshold_with_debiasing.png    353,217,359,223
    PNG Two Pixels Should Have Matched RGBA    check_computed_PI_with_threshold_with_debiasing.png    353,217,395,121
    PNG Two Pixels Should Not Have Matched RGBA    check_computed_PI_with_threshold_with_debiasing.png    353,217,395,124
    PNG Two Pixels Should Not Have Matched RGBA    check_computed_PI_with_threshold_with_debiasing.png    353,217,356,180

    Remove Files    check_computed_PI_PA.png    check_computed_PI_PA_with_threshold.png    check_computed_PI_PA_with_threshold_with_debiasing.png    
    Remove Files    check_computed_PA_with_threshold_with_debiasing.png    check_computed_PI_with_threshold_with_debiasing.png    check_cleared.png
    [Teardown]    Kill carta_backend And Close Browser


Vector Field Rendering With A POLI Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HL_Tau.POLI.fits
    Mouse Over    ${VIEWER_DIV}
    Repeat Keyword    2    Click Element    ${VIEWER_00_ZOOM_IN_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_DIALOG_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_ANGULAR_SOURCE_DROPDOWN}
    Click Element    ${VECTOR_FIELD_RENDERING_ANGULAR_SOURCE_DROPDOWN_NONE}
    Click Element    ${VECTOR_FIELD_RENDERING_THRESHOLD_TOGGLE}
    Press Keys    ${VECTOR_FIELD_RENDERING_THRESHOLD_INPUT}    0.0001
    Click Element    ${VECTOR_FIELD_RENDERING_APPLY_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    check_pixel_as_PI_with_threshold.png
    # verify screenshots
    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check_pixel_as_PI_with_threshold.png    383,221,388,226
    PNG Two Pixels Should Have Matched RGBA    check_pixel_as_PI_with_threshold.png    383,221,398,198
    PNG Two Pixels Should Not Have Matched RGBA    check_pixel_as_PI_with_threshold.png    383,221,383,198

    Remove files    check_pixel_as_PI_with_threshold.png
    [Teardown]    Kill carta_backend And Close Browser


Vector Field Rendering With A POLA Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HL_Tau.POLA.fits
    Mouse Over    ${VIEWER_DIV}
    Repeat Keyword    2    Click Element    ${VIEWER_00_ZOOM_IN_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_DIALOG_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_INTENSITY_SOURCE_DROPDOWN}
    Click Element    ${VECTOR_FIELD_RENDERING_INTENSITY_SOURCE_DROPDOWN_NONE}
    Click Element    ${VECTOR_FIELD_RENDERING_STYLING_TAB}
    Input Text    ${VECTOR_FIELD_RENDERING_LINE_THICKNESS_INPUT}    2
    Click Element    ${VECTOR_FIELD_RENDERING_APPLY_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    check_pixel_as_PA_with_threshold.png
    # verify screenshots
    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check_pixel_as_PA_with_threshold.png    417,232,433,242
    PNG Two Pixels Should Have Matched RGBA    check_pixel_as_PA_with_threshold.png    417,232,341,229
    PNG Two Pixels Should Have Matched RGBA    check_pixel_as_PA_with_threshold.png    417,232,350,245
    PNG Two Pixels Should Not Have Matched RGBA    check_pixel_as_PA_with_threshold.png    417,232,328,229

    Remove files    check_pixel_as_PA_with_threshold.png
    [Teardown]    Kill carta_backend And Close Browser


Vector Field Rendering With A Stokes Line Cube
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    IRCp10216_sci.spw0.cube.IQUV.manual.pbcor.subimage.fits
    Click Element    ${VECTOR_FIELD_RENDERING_DIALOG_BUTTON}
    # disable pixel averaging
    Click Element    ${VECTOR_FIELD_RENDERING_AVERAGING_TOGGLE}
    Click Element    ${VECTOR_FIELD_RENDERING_STYLING_TAB}
    Input Text    ${VECTOR_FIELD_RENDERING_LINE_THICKNESS_INPUT}    2
    Click Element    ${VECTOR_FIELD_RENDERING_APPLY_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    check_channel_0.png
    Click Element    xpath://*[contains(text(), "Animator")]
    Repeat Keyword    5    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    check_channel_5.png
    PNG Images Should Be Different    check_channel_0.png    check_channel_5.png
    Remove files    check_channel_0.png    check_channel_5.png
    [Teardown]    Kill carta_backend And Close Browser
