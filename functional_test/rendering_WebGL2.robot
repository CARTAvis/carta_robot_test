*** Settings ***
Documentation     Check various rendering at pixel level
Resource          ../resource.robot

*** Test Cases ***
Raster Image Rendering
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    pixel_shader_test.fits
    Change Raster Colormap    tab10
    #Sleep    0.5
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    # test pixel shader
    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    check_${key}.png    76,212,31,119,180,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    136,212,255,127,14,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    196,212,44,160,44,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    256,212,214,39,40,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    318,212,148,103,189,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    380,212,140,86,75,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    440,212,227,119,194,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    502,212,127,127,127,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    562,212,188,189,34,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    626,212,23,190,207,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    688,212,19,124,189,255
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser

Contour Image Rendering
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    small_gaussian.fits
    Change Raster Colormap    nipy_spectral
    Click Element    data:testid:contour-dialog-button
    Input Text    css:[data-testid="contour-config-level-input-form"] input    0.6
    Click Element    //*[contains(text(), "Styling")]
    Input Text    data:testid:contour-thickness-input    5
    Click Element    ${CONTOUR_CONFIG_DIALOG_APPLY_BUTTON}
    Click Element    ${CONTOUR_CONFIG_DIALOG_CLOSE_BUTTON}
    #Sleep    0.5
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    # test contour shader
    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    check_${key}.png    379,196,35,133,81,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    367,200,35,133,81,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    362,205,35,133,81,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    358,217,35,133,81,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    362,229,35,133,81,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    367,234,35,133,81,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    379,238,35,133,81,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    391,234,35,133,81,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    396,229,35,133,81,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    400,217,35,133,81,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    396,205,35,133,81,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    392,200,35,133,81,255
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Catalog Image Overlay Rendering
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    model.fits
    Load Catalog File  model_fits_fk4.xml
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_X_DROPDOWN}
    Click Element    //a[contains(., "RA_d")]
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_Y_DROPDOWN}
    Click Element    //a[contains(., "DEC_d")]
    Click Element    ${CATALOG_WIDGET_PLOT_BUTTON}
    Click Element    //a[contains(., "Size")]
    Click Element    data:testid:catalog-settings-shape-dropdown
    Click Element    data:testid:catalog-settings-shape-circle-filled
    Click Element    data:testid:catalog-overlay-component-0-floating-settings-0-header-close-button
    Click Element    data:testid:catalog-overlay-component-0-header-close-button
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    Set Selenium Speed    0
    # catalog points
    PNG Pixel XY Should Match RGBA    check_${key}.png    122,167,0,163,150,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    99,213,0,163,150,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    78,260,0,163,150,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    621,161,0,163,150,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    657,197,0,163,150,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    691,234,0,163,150,255
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Vector Field Rendering With A Stokes Continuum Cube
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HL_Tau_StokesIQUV_clean.pbcor.fits
    Mouse Over    ${VIEWER_DIV}
    Repeat Keyword    2    Click Element    ${VIEWER_00_ZOOM_IN_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_DIALOG_BUTTON}
    # with pixel averaging toggle enabled, set averaging width (px) to 6
    Clear Input Field    ${VECTOR_FIELD_RENDERING_AVERAGING_WIDTH_INPUT}
    Input Text    ${VECTOR_FIELD_RENDERING_AVERAGING_WIDTH_INPUT}    6
    Click Element    ${VECTOR_FIELD_RENDERING_STYLING_TAB}
    Input Text    ${VECTOR_FIELD_RENDERING_LINE_THICKNESS_INPUT}    2
    Input Text    ${VECTOR_FIELD_RENDERING_LINE_LENGTH_MAX_INPUT}    40
    # apply a 90 degree offset
    Press Keys    ${VECTOR_FIELD_RENDERING_ROTATION_OFFSET_INPUT}    ARROW_LEFT+9
    Click Element    ${VECTOR_FIELD_RENDERING_CONFIGURATION_TAB}
    Click Element    ${VECTOR_FIELD_RENDERING_APPLY_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_computed_PI_PA_${key}.png
    # enable and apply a threshold then re-render
    Click Element    ${VECTOR_FIELD_RENDERING_DIALOG_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_THRESHOLD_TOGGLE}
    Click Element    ${VECTOR_FIELD_RENDERING_THRESHOLD_OPTION_DROPDOWN}
    Click Element    //*[@id="bp6-tab-panel_undefined_0"]/div/div[5]/div/div/select/option[2]
    Press Keys    ${VECTOR_FIELD_RENDERING_THRESHOLD_INPUT}    0.005
    Click Element    ${VECTOR_FIELD_RENDERING_APPLY_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    check_computed_PI_PA_with_threshold_${key}.png
    # enable and apply debiasing then re-render
    Click Element    ${VECTOR_FIELD_RENDERING_DIALOG_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_DEBIASING_TOGGLE}
    Press Keys    ${VECTOR_FIELD_RENDERING_STOKES_Q_ERROR_INPUT}    0.0001
    Press Keys    ${VECTOR_FIELD_RENDERING_STOKES_U_ERROR_INPUT}    0.0001
    Click Element    ${VECTOR_FIELD_RENDERING_APPLY_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    check_computed_PI_PA_with_threshold_with_debiasing_${key}.png
    # render computed angle-only field
    Click Element    ${VECTOR_FIELD_RENDERING_DIALOG_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_INTENSITY_SOURCE_DROPDOWN}
    Click Element    ${VECTOR_FIELD_RENDERING_INTENSITY_SOURCE_DROPDOWN_NONE}
    Click Element    ${VECTOR_FIELD_RENDERING_APPLY_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    check_computed_PA_with_threshold_with_debiasing_${key}.png
    # render computed intensity-only field
    Click Element    ${VECTOR_FIELD_RENDERING_DIALOG_BUTTON} 
    Click Element    ${VECTOR_FIELD_RENDERING_INTENSITY_SOURCE_DROPDOWN}
    Click Element    ${VECTOR_FIELD_RENDERING_INTENSITY_SOURCE_DROPDOWN_COMPUTED_PI}
    Click Element    ${VECTOR_FIELD_RENDERING_ANGULAR_SOURCE_DROPDOWN}
    Click Element    ${VECTOR_FIELD_RENDERING_ANGULAR_SOURCE_DROPDOWN_NONE}
    Click Element    ${VECTOR_FIELD_RENDERING_APPLY_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    check_computed_PI_with_threshold_with_debiasing_${key}.png
    # clear vector field rendering
    Click Element    ${VECTOR_FIELD_RENDERING_DIALOG_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLEAR_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    check_cleared_${key}.png
    # verify screenshots
    Set Selenium Speed    0
    PNG Images Should Be Different    check_cleared_${key}.png    check_computed_PI_PA_${key}.png
    PNG Images Should Be Different    check_computed_PI_PA_${key}.png    check_computed_PI_PA_with_threshold_${key}.png
    #PNG Images Should Be Different    check_computed_PI_PA_with_threshold_${key}.png    check_computed_PI_PA_with_threshold_with_debiasing_${key}.png
    PNG Images Should Be Different    check_computed_PI_PA_with_threshold_with_debiasing_${key}.png    check_computed_PA_with_threshold_with_debiasing_${key}.png
    PNG Images Should Be Different    check_computed_PA_with_threshold_with_debiasing_${key}.png    check_computed_PI_with_threshold_with_debiasing_${key}.png
    PNG Images Should Be Different    check_computed_PI_with_threshold_with_debiasing_${key}.png    check_cleared_${key}.png

    # check check_computed_PI_PA_${key}.png
    PNG Two Pixels Should Have Matched RGBA    check_computed_PI_PA_${key}.png    421,211,410,230
    PNG Two Pixels Should Have Matched RGBA    check_computed_PI_PA_${key}.png    421,211,351,306
    PNG Two Pixels Should Have Matched RGBA    check_computed_PI_PA_${key}.png    421,211,376,200
    PNG Two Pixels Should Have Matched RGBA    check_computed_PI_PA_${key}.png    421,211,217,359
    PNG Two Pixels Should Not Have Matched RGBA    check_computed_PI_PA_${key}.png    421,211,214,362
    
    # check check_computed_PI_PA_with_threshold_${key}.png
    PNG Two Pixels Should Have Matched RGBA    check_computed_PI_PA_with_threshold_${key}.png    421,211,410,230
    PNG Two Pixels Should Have Matched RGBA    check_computed_PI_PA_with_threshold_${key}.png    421,211,351,306
    PNG Two Pixels Should Have Matched RGBA    check_computed_PI_PA_with_threshold_${key}.png    421,211,376,200
    PNG Two Pixels Should Not Have Matched RGBA    check_computed_PI_PA_with_threshold_${key}.png    421,211,217,359
    PNG Two Pixels Should Not Have Matched RGBA    check_computed_PI_PA_with_threshold_${key}.png   421,211,214,362

    # check check_computed_PI_PA_with_threshold_with_debiasing_${key}.png
    PNG Two Pixels Should Have Matched RGBA    check_computed_PI_PA_with_threshold_with_debiasing_${key}.png    421,211,410,230
    PNG Two Pixels Should Have Matched RGBA    check_computed_PI_PA_with_threshold_with_debiasing_${key}.png    421,211,351,306
    PNG Two Pixels Should Not Have Matched RGBA    check_computed_PI_PA_with_threshold_with_debiasing_${key}.png    421,211,376,200
    PNG Two Pixels Should Not Have Matched RGBA    check_computed_PI_PA_with_threshold_with_debiasing_${key}.png    421,211,217,359
    PNG Two Pixels Should Not Have Matched RGBA    check_computed_PI_PA_with_threshold_with_debiasing_${key}.png   421,211,214,362

    # check check_computed_PA_with_threshold_with_debiasing_${key}.png
    PNG Two Pixels Should Have Matched RGBA    check_computed_PA_with_threshold_with_debiasing_${key}.png    426,224,405,256
    PNG Two Pixels Should Have Matched RGBA    check_computed_PA_with_threshold_with_debiasing_${key}.png    426,224,303,353
    PNG Two Pixels Should Not Have Matched RGBA    check_computed_PA_with_threshold_with_debiasing_${key}.png    426,224,214,362
    
    # check check_computed_PI_with_threshold_with_debiasing_${key}.png
    PNG Two Pixels Should Have Matched RGBA    check_computed_PI_with_threshold_with_debiasing_${key}.png    353,217,359,223
    PNG Two Pixels Should Have Matched RGBA    check_computed_PI_with_threshold_with_debiasing_${key}.png    353,217,395,121
    PNG Two Pixels Should Not Have Matched RGBA    check_computed_PI_with_threshold_with_debiasing_${key}.png    353,217,395,124
    PNG Two Pixels Should Not Have Matched RGBA    check_computed_PI_with_threshold_with_debiasing_${key}.png    353,217,356,180

    Remove Files    check_computed_PI_PA_${key}.png    check_computed_PI_PA_with_threshold_${key}.png    check_computed_PI_PA_with_threshold_with_debiasing_${key}.png    
    Remove Files    check_computed_PA_with_threshold_with_debiasing_${key}.png    check_computed_PI_with_threshold_with_debiasing_${key}.png    check_cleared_${key}.png
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
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_pixel_as_PI_with_threshold_${key}.png
    # verify screenshots
    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_pixel_as_PI_with_threshold_${key}.png    383,221,388,226
    PNG Two Pixels Should Have Matched RGBA    check_pixel_as_PI_with_threshold_${key}.png    383,221,398,198
    PNG Two Pixels Should Not Have Matched RGBA    check_pixel_as_PI_with_threshold_${key}.png    383,221,383,198

    Remove files    check_pixel_as_PI_with_threshold_${key}.png
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
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_pixel_as_PA_with_threshold_${key}.png
    # verify screenshots
    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_pixel_as_PA_with_threshold_${key}.png    417,232,433,242
    PNG Two Pixels Should Have Matched RGBA    check_pixel_as_PA_with_threshold_${key}.png    417,232,341,229
    PNG Two Pixels Should Have Matched RGBA    check_pixel_as_PA_with_threshold_${key}.png    417,232,350,245
    PNG Two Pixels Should Not Have Matched RGBA    check_pixel_as_PA_with_threshold_${key}.png    417,232,328,229

    Remove files    check_pixel_as_PA_with_threshold_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Vector Field Rendering With A Stokes Line Cube
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    IRCp10216_sci.spw0.cube.IQUV.manual.pbcor.subimage.fits
    Click Element    ${VECTOR_FIELD_RENDERING_DIALOG_BUTTON}
    # disable pixel averaging by setting averaging width (px) to 1
    Clear Input Field    ${VECTOR_FIELD_RENDERING_AVERAGING_WIDTH_INPUT}
    Input Text    ${VECTOR_FIELD_RENDERING_AVERAGING_WIDTH_INPUT}    1
    Click Element    ${VECTOR_FIELD_RENDERING_STYLING_TAB}
    Input Text    ${VECTOR_FIELD_RENDERING_LINE_THICKNESS_INPUT}    2
    Click Element    ${VECTOR_FIELD_RENDERING_APPLY_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_channel_0_${key}.png
    Click Element    //*[contains(text(), "Animator")]
    Repeat Keyword    5    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    check_channel_5_${key}.png
    PNG Images Should Be Different    check_channel_0_${key}.png    check_channel_5_${key}.png
    Remove files    check_channel_0_${key}.png    check_channel_5_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Multicolor Rendering
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    disk_0.fits
    Change Raster Colormap    Red
    Append Image    disk_1.fits
    Change Raster Colormap    Green
    Append Image    disk_2.fits
    Change Raster Colormap    Blue
    # enable spatial matching and adjust zoom level
    Click Element    ${IMAGE_LIST_SECOND_MATCHING_XY}
    Mouse Over    ${VIEWER_DIV}
    Click Element    ${IMAGE_LIST_THIRD_MATCHING_XY}
    Mouse Over    ${VIEWER_10_CANVAS}
    Click Element    ${VIEWER_10_ZOOM_TO_FIT_BUTTON}
    # enable multicolor blending
    Click Element    //*[contains(text(), "File")]
    Click Element    //*[contains(text(), "Multi-Color Blending")]

    Mouse Out    ${VIEWER_DIV}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_rgb_${key}.png

    # close the 2nd image
    Click Element    ${VIEWER_10_CANVAS}
    Click Element    //*[contains(text(), "File")]
    Click Element    //*[contains(text(), "Close Image")]
    Click Element    //*[contains(text(), "OK")]
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_rgb_remove_layer_${key}.png

    # Append a new image
    Append Image    disk_1.fits
    Change Raster Colormap    Green
    Click Element    ${IMAGE_LIST_FOURTH_MATCHING_XY}

    # join the new image into the blending image
    Click Element    ${VIEWER_01_CANVAS}
    Click Element    //*[normalize-space(text())='Add layer']
    Click Element At Coordinates    //*[normalize-space(text())='Add layer']    0    -30
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_rgb_add_layer_${key}.png

    # change alpha value
    #Sleep    90
    # set the red channel alpha from 1.0 to 0.5
    Repeat Keyword    5    Click Element    //*[@id="root"]/div/div[16]/div/div[6]/div/div/div/div[2]/div/div/span[1]/div/div[2]/button[2]
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_rgb_reduce_alpha_${key}.png

    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    check_rgb_${key}.png    568,290,255,0,0,255    # Red
    PNG Pixel XY Should Match RGBA    check_rgb_${key}.png    610,373,0,255,0,255    # Green
    PNG Pixel XY Should Match RGBA    check_rgb_${key}.png    527,373,0,0,255,255    # Blue
    PNG Pixel XY Should Match RGBA    check_rgb_${key}.png    541,333,255,0,255,255    # Magenta
    PNG Pixel XY Should Match RGBA    check_rgb_${key}.png    595,333,255,255,0,255    # Yellow
    PNG Pixel XY Should Match RGBA    check_rgb_${key}.png    568,377,0,255,255,255    # Cyan
    PNG Pixel XY Should Match RGBA    check_rgb_${key}.png    568,340,255,255,255,255    # White
    PNG Pixel XY Should Match RGBA    check_rgb_${key}.png    568,260,0,0,0,255    # Black

    PNG Pixel XY Should Match RGBA    check_rgb_remove_layer_${key}.png    190,289,255,0,0,255    # Red
    PNG Pixel XY Should Match RGBA    check_rgb_remove_layer_${key}.png    150,370,0,0,255,255    # Blue
    PNG Pixel XY Should Match RGBA    check_rgb_remove_layer_${key}.png    225,370,0,0,0,255    # Black

    PNG Pixel XY Should Match RGBA    check_rgb_add_layer_${key}.png    190,289,255,0,0,255    # Red
    PNG Pixel XY Should Match RGBA    check_rgb_add_layer_${key}.png    150,370,0,0,255,255    # Blue
    PNG Pixel XY Should Match RGBA    check_rgb_add_layer_${key}.png    225,370,0,255,0,255    # Green

    PNG Pixel XY Should Match RGBA    check_rgb_reduce_alpha_${key}.png    191,295,128,0,0,255    # reduced Red
    PNG Pixel XY Should Match RGBA    check_rgb_reduce_alpha_${key}.png    166,332,128,0,255,255    # reduced Magenta
    PNG Pixel XY Should Match RGBA    check_rgb_reduce_alpha_${key}.png    207,332,128,255,0,255    # reduced Yellow
    PNG Pixel XY Should Match RGBA    check_rgb_reduce_alpha_${key}.png    191,342,128,255,255,255    # reduced White

    Remove files    check_rgb_${key}.png    check_rgb_remove_layer_${key}.png    check_rgb_add_layer_${key}.png    check_rgb_reduce_alpha_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Layer Management With Multicolor Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    # ubuntu CI workaround, otherwise files cannot be selected correctly for an unknown reason
    Set Selenium Speed    1.0
    Input Text    ${FILE_FILTER}    gaussian_
    Wait Until Element Contains    ${FILE_LIST}    gaussian_0.fits
    Sleep    0.2
    # select three images and load as a RGB-blended image
    ${platform}=    Evaluate    sys.platform    sys
    IF    '${platform}' == 'darwin'
    Click Element    //*[normalize-space(text())='gaussian_0.fits']
    Click Element    //*[normalize-space(text())='gaussian_1.fits']    modifier=COMMAND
    Click Element    //*[normalize-space(text())='gaussian_2.fits']    modifier=COMMAND
    ELSE
    Click Element    //*[normalize-space(text())='gaussian_0.fits']
    Click Element    //*[normalize-space(text())='gaussian_1.fits']    modifier=CTRL
    Click Element    //*[normalize-space(text())='gaussian_2.fits']    modifier=CTRL
    END
    Set Selenium Speed    0.2
    Click Element    //*[normalize-space(text())='Load with RGB blending']
    Wait Until Page Does Not Contain Element    ${PROGRESS_CLOUD} 

    Click Element    ${VIEWER_00_CANVAS}
    Click Element    ${VIEWER_00_ZOOM_TO_FIT_BUTTON}
    Click Element    data:testid:contour-dialog-button
    Input Text    css:[data-testid="contour-config-level-input-form"] input    0.002
    Click Element    //*[contains(text(), "Styling")]
    Input Text    data:testid:contour-thickness-input    3
    Click Element    ${CONTOUR_CONFIG_DIALOG_APPLY_BUTTON}
    Click Element    ${CONTOUR_CONFIG_DIALOG_CLOSE_BUTTON}

    Click Element    ${VIEWER_01_CANVAS}
    Click Element    data:testid:contour-dialog-button
    Input Text    css:[data-testid="contour-config-level-input-form"] input    0.002
    Click Element    //*[contains(text(), "Styling")]
    Input Text    data:testid:contour-thickness-input    3
    Click Element    ${CONTOUR_CONFIG_DIALOG_APPLY_BUTTON}
    Click Element    ${CONTOUR_CONFIG_DIALOG_CLOSE_BUTTON}

    Click Element    ${VIEWER_10_CANVAS}
    Click Element    ${VECTOR_FIELD_RENDERING_DIALOG_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_ANGULAR_SOURCE_DROPDOWN}
    Click Element    ${VECTOR_FIELD_RENDERING_ANGULAR_SOURCE_DROPDOWN_NONE}
    Click Element    ${VECTOR_FIELD_RENDERING_THRESHOLD_TOGGLE}
    Press Keys    ${VECTOR_FIELD_RENDERING_THRESHOLD_INPUT}    0.002
    Click Element    ${VECTOR_FIELD_RENDERING_APPLY_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}
    
    Click Element    ${VIEWER_11_CANVAS}
    Repeat Keyword    2    Click Element    ${VIEWER_11_ZOOM_IN_BUTTON}

    Mouse Out    ${VIEWER_DIV}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_full_${key}.png
    
    # TODO: create testid of layer control buttons
    # hide then show R of image 0
    Click Element    //*[@id="root"]/div/div[16]/div/div[9]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[2]/div/span[1]
    Capture Element Screenshot    ${VIEWER_DIV}    check_hide_R_image0_${key}.png
    Click Element    //*[@id="root"]/div/div[16]/div/div[9]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[2]/div/span[1]

    # hide then show C of image 0
    Click Element    //*[@id="root"]/div/div[16]/div/div[9]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[2]/div/span[2]
    Capture Element Screenshot    ${VIEWER_DIV}    check_hide_C_image0_${key}.png
    Click Element    //*[@id="root"]/div/div[16]/div/div[9]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[2]/div/span[2]

    # hide then show R of image 1
    Click Element    //*[@id="root"]/div/div[16]/div/div[9]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[7]/div/span[1]
    Capture Element Screenshot    ${VIEWER_DIV}    check_hide_R_image1_${key}.png
    Click Element    //*[@id="root"]/div/div[16]/div/div[9]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[7]/div/span[1]

    # hide then show V of image 1
    Click Element    //*[@id="root"]/div/div[16]/div/div[9]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[7]/div/span[2]
    Capture Element Screenshot    ${VIEWER_DIV}    check_hide_V_image1_${key}.png
    Click Element    //*[@id="root"]/div/div[16]/div/div[9]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[7]/div/span[2]

    # hide then show R of image 2
    Click Element    //*[@id="root"]/div/div[16]/div/div[9]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[12]/div/span[1]
    Capture Element Screenshot    ${VIEWER_DIV}    check_hide_R_image2_${key}.png
    Click Element    //*[@id="root"]/div/div[16]/div/div[9]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[12]/div/span[1]

    # hide then show C of image 2
    Click Element    //*[@id="root"]/div/div[16]/div/div[9]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[12]/div/span[2]
    Capture Element Screenshot    ${VIEWER_DIV}    check_hide_C_image2_${key}.png
    Click Element    //*[@id="root"]/div/div[16]/div/div[9]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[12]/div/span[2]

    # hide then show R of image 3 (multicolor image)
    Click Element    //*[@id="root"]/div/div[16]/div/div[9]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[17]/div/span[1]
    Capture Element Screenshot    ${VIEWER_DIV}    check_hide_R_image3_${key}.png
    Click Element    //*[@id="root"]/div/div[16]/div/div[9]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[17]/div/span[1]

    # hide then show C of image 3 (multicolor image)
    Click Element    //*[@id="root"]/div/div[16]/div/div[9]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[17]/div/span[2]
    Capture Element Screenshot    ${VIEWER_DIV}    check_hide_C_image3_${key}.png
    Click Element    //*[@id="root"]/div/div[16]/div/div[9]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[17]/div/span[2]

    # hide then show V of image 3 (multicolor image)
    Click Element    //*[@id="root"]/div/div[16]/div/div[9]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[17]/div/span[3]
    Capture Element Screenshot    ${VIEWER_DIV}    check_hide_V_image3_${key}.png
    Click Element    //*[@id="root"]/div/div[16]/div/div[9]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[17]/div/span[3]

    Set Selenium Speed    0
    # full
    # upper contour in each panel
    PNG Pixel XY Should Match RGBA    check_full_${key}.png    190,80,35,133,81,255
    PNG Pixel XY Should Match RGBA    check_full_${key}.png    570,80,35,133,81,255
    PNG Pixel XY Should Match RGBA    check_full_${key}.png    190,316,35,133,81,255
    PNG Pixel XY Should Match RGBA    check_full_${key}.png    570,316,35,133,81,255
    # bottom-left contour in each panel
    PNG Pixel XY Should Match RGBA    check_full_${key}.png    117,118,35,133,81,255
    PNG Pixel XY Should Match RGBA    check_full_${key}.png    496,118,35,133,81,255
    PNG Pixel XY Should Match RGBA    check_full_${key}.png    117,353,35,133,81,255
    PNG Pixel XY Should Match RGBA    check_full_${key}.png    496,353,35,133,81,255
    # bottom-right vector in each panel
    PNG Pixel XY Should Match RGBA    check_full_${key}.png    245,126,35,133,81,255
    PNG Pixel XY Should Match RGBA    check_full_${key}.png    624,126,35,133,81,255
    PNG Pixel XY Should Match RGBA    check_full_${key}.png    245,361,35,133,81,255
    PNG Pixel XY Should Match RGBA    check_full_${key}.png    624,361,35,133,81,255

    # hide then show R of image 0
    PNG Pixel XY Should Match RGBA    check_hide_R_image0_${key}.png    200,100,246,247,249,255
    PNG Pixel XY Should Match RGBA    check_hide_R_image0_${key}.png    570,350,0,194,191,255

    # hide then show C of image 0
    PNG Two Pixels Should Not Have Matched RGBA    check_hide_C_image0_${key}.png    190,80,570,80
    PNG Two Pixels Should Not Have Matched RGBA    check_hide_C_image0_${key}.png    190,80,190,316
    PNG Two Pixels Should Not Have Matched RGBA    check_hide_C_image0_${key}.png    190,80,570,316

    # hide then show R of image 1
    PNG Pixel XY Should Match RGBA    check_hide_R_image1_${key}.png    570,100,246,247,249,255
    PNG Pixel XY Should Match RGBA    check_hide_R_image1_${key}.png    570,350,198,0,191,255

    # hide then show V of image 1
    PNG Two Pixels Should Not Have Matched RGBA    check_hide_V_image1_${key}.png    245,126,624,126
    PNG Two Pixels Should Not Have Matched RGBA    check_hide_V_image1_${key}.png    245,126,245,361
    PNG Two Pixels Should Not Have Matched RGBA    check_hide_V_image1_${key}.png    245,126,624,361

    # hide then show R of image 2
    PNG Pixel XY Should Match RGBA    check_hide_R_image2_${key}.png    200,330,246,247,249,255
    PNG Pixel XY Should Match RGBA    check_hide_R_image2_${key}.png    580,330,219,184,0,255

    # hide then show C of image 2
    PNG Two Pixels Should Not Have Matched RGBA    check_hide_C_image2_${key}.png    117,118,496,118
    PNG Two Pixels Should Not Have Matched RGBA    check_hide_C_image2_${key}.png    117,118,117,353
    PNG Two Pixels Should Not Have Matched RGBA    check_hide_C_image2_${key}.png    117,118,496,353

    # hide then show R of image 3 (multicolor image)
    PNG Pixel XY Should Match RGBA    check_hide_R_image3_${key}.png    580,330,246,247,249,255

    # hide then show C of image 3 (multicolor image)
    PNG Two Pixels Should Not Have Matched RGBA    check_hide_C_image3_${key}.png    190,80,570,316
    PNG Two Pixels Should Not Have Matched RGBA    check_hide_C_image3_${key}.png    117,118,496,353

    # hide then show V of image 3 (multicolor image)
    PNG Two Pixels Should Not Have Matched RGBA    check_hide_V_image3_${key}.png    245,126,624,361

    Remove Files    check_full_${key}.png
    Remove Files    check_hide_R_image0_${key}.png    check_hide_C_image0_${key}.png
    Remove Files    check_hide_R_image1_${key}.png    check_hide_V_image1_${key}.png
    Remove Files    check_hide_R_image2_${key}.png    check_hide_C_image2_${key}.png
    Remove Files    check_hide_R_image3_${key}.png    check_hide_C_image3_${key}.png    check_hide_V_image3_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Tile Rendering with Different MIP
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    multiscale_pattern_5120x5120.fits
    Append Image    downsampled_2x2.fits
    Append Image    downsampled_4x4.fits
    Append Image    downsampled_8x8.fits
    # match all the images spatially
    Click Element    data:testid:image-list-0-matching-xy
    # enable raster config matching for all images using the shortcut
    Click Element    data:testid:image-list-0-matching-r
    # set image zoom level to 1:1
    Mouse Over    ${VIEWER_11_CANVAS}
    Click Element    //*[@id="image-panel-1-1"]/div[8]/span[7]/a
    # change colormap
    Change Raster Colormap    tab10
    # take screenshot and perform pixel checks
    Mouse Out    ${VIEWER_DIV}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    tile_mip_${key}.png
    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    tile_mip_${key}.png    189,99,140,86,75,255
    PNG Two Pixels Should Have Matched RGBA    tile_mip_${key}.png    189,99,568,99
    PNG Two Pixels Should Have Matched RGBA    tile_mip_${key}.png    189,99,189,334
    PNG Two Pixels Should Have Matched RGBA    tile_mip_${key}.png    189,99,568,334
    Remove Files    tile_mip_${key}.png
    [Teardown]    Kill carta_backend And Close Browser
