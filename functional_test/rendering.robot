*** Settings ***
Documentation     Check various rendering at pixel level
Resource          ../resource.robot

*** Test Cases ***
Raster Image Rendering
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    pixel_shader_test.fits
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[contains(text(), "tab10")]
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
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[contains(text(), "nipy_spectral")]
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


Region Canvas Rendering
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    pixel_shader_test.fits
    Click Element    ${RECTANGLE_REGION_SHORTCUT_BUTTON}
    Click Element    ${VIEWER_DIV}
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
    Click Element    //*[contains(text(), "Styling")]
    Press Keys    data:testid:region-dialog-line-width-input    DELETE
    Input Text    data:testid:region-dialog-line-width-input    3
    Click Element    data:testid:region-dialog-header-close-button
    #Sleep    0.5
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
    # set region inactive
    Set Selenium Speed    ${DELAY}
    Press Keys    ${VIEWER_DIV}    ESCAPE
    Mouse Out    ${VIEWER_DIV}
    #Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check2_${key}.png
    Set Selenium Speed    0
    # control points
    PNG Pixel XY Should Match RGBA    check2_${key}.png    348,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    348,217,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    348,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    380,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    410,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    410,217,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    410,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    380,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    379,172,207,68,70,255
    # rectangle sides
    PNG Pixel XY Should Match RGBA    check2_${key}.png    348,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    348,202,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    364,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    395,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    410,202,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    410,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    395,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    364,248,46,230,214,255    
    Remove Files    check_${key}.png    check2_${key}.png
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
    Click Element    //*[contains(text(), "Size")]
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
    # disable pixel averaging
    Click Element    ${VECTOR_FIELD_RENDERING_AVERAGING_TOGGLE}
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


GUI Initialization
    [Setup]    Setup carta_backend And Open Browser To CARTA
    # close file browser dialog
    Click Element    data:testid:file-browser-dialog-header-close-button
    # region / annotation shortcut buttons
    Element Attribute Value Should Be    ${POINT_REGION_SHORTCUT_BUTTON}    disabled    true
    Element Attribute Value Should Be    ${LINE_REGION_SHORTCUT_BUTTON}    disabled    true
    Element Attribute Value Should Be    ${RECTANGLE_REGION_SHORTCUT_BUTTON}    disabled    true
    Element Attribute Value Should Be    ${ELLIPSE_REGION_SHORTCUT_BUTTON}    disabled    true
    Element Attribute Value Should Be    ${POLYGON_REGION_SHORTCUT_BUTTON}    disabled    true
    Element Attribute Value Should Be    ${POLYLINE_REGION_SHORTCUT_BUTTON}    disabled    true
    Element Attribute Value Should Be    data:testid:annotation-shortcut-dropdown    disabled    true
    # region list widget
    Click Element    id:RegionListWidgetButton
    Element Should Contain    data:testid:region-list-1-header-title    Region List
    Element Should Contain    data:testid:region-list-1-content    No file loaded
    Click Element    data:testid:region-list-1-header-close-button
    # log widget
    Click Element    id:LogWidgetButton
    Element Should Contain    data:testid:log-0-header-title    Log
    Element Should Contain    data:testid:log-0-content    AST library loaded
    Element Should Contain    data:testid:log-0-content    Compute module loaded
    Click Element    data:testid:log-0-header-close-button
    # spatial profiler widget
    Click Element    id:SpatialProfilerButton
    Element Should Contain    data:testid:spatial-profiler-2-header-title    X Profile: Cursor
    Click Element    data:testid:spatial-profiler-2-header-settings-button
    Element Should Contain    data:testid:spatial-profiler-2-floating-settings-0-header-title    X Spatial Profile Settings: Cursor
    Element Should Contain    data:testid:spatial-profiler-2-floating-settings-0-content    Styling
    Click Element    data:testid:spatial-profiler-2-floating-settings-0-header-close-button
    Click Element    data:testid:spatial-profiler-2-header-close-button
    # spectral profiler widget
    Click Element    id:SpectralProfilerButton
    Element Should Contain    data:testid:spectral-profiler-0-header-title    Z Profile
    Element Should Contain    data:testid:spectral-profiler-0-content    Image
    Click Element    data:testid:spectral-profiler-0-header-settings-button
    Element Should Contain    data:testid:spectral-profiler-0-floating-settings-0-header-title    Z Profile Settings
    Element Should Contain    data:testid:spectral-profiler-0-floating-settings-0-content    Conversion
    Click Element    data:testid:spectral-profiler-0-floating-settings-0-header-close-button
    Mouse Out    ${SPECTRAL_PROFILER_PLOT}
    Click Element    data:testid:spectral-profiler-0-header-close-button
    # statistics widget
    Click Element    id:StatisticsWidgetButton
    Element Should Contain    data:testid:stats-0-header-title    Statistics
    Element Should Contain    data:testid:stats-0-content    No stats data
    Click Element    data:testid:stats-0-header-close-button
    # histogram widget
    Click Element    id:HistogramWidgetButton
    Element Should Contain    data:testid:histogram-0-header-title    Histogram
    Element Should Contain    data:testid:histogram-0-content    No file loaded
    Click Element    data:testid:histogram-0-header-settings-button
    Element Should Contain    data:testid:histogram-0-floating-settings-0-header-title    Histogram Settings
    Element Should Contain    data:testid:histogram-0-floating-settings-0-content    Configuration
    Click Element    data:testid:histogram-0-floating-settings-0-header-close-button
    Click Element    data:testid:histogram-0-header-close-button
    # animator widget
    Click Element    id:AnimatorWidgetButton
    Element Should Contain    data:testid:animator-1-header-title    Animator
    Element Should Contain    data:testid:animator-1-content    No file loaded
    Click Element    data:testid:animator-1-header-close-button
    # render config widget
    Click Element    id:RenderConfigurationWidgetButton
    Element Should Contain    data:testid:render-config-1-header-title    Render Configuration
    Element Should Contain    data:testid:render-config-1-content    No file loaded
    Click Element    data:testid:render-config-1-header-settings-button
    Element Should Contain    data:testid:render-config-1-floating-settings-0-header-title    Render Configuration Settings
    Element Should Contain    data:testid:render-config-1-floating-settings-0-content    Line color (Primary)
    Click Element    data:testid:render-config-1-floating-settings-0-header-close-button
    Click Element    data:testid:render-config-1-header-close-button
    # Stokes analysis widget
    Click Element    id:StokesAnalysisWidgetButton
    Element Should Contain    data:testid:stokes-0-header-title    Stokes Analysis
    Element Should Contain    data:testid:stokes-0-content    Image
    Click Element    data:testid:stokes-0-header-settings-button
    Element Should Contain    data:testid:stokes-0-floating-settings-0-header-title    Stokes Analysis Settings
    Element Should Contain    data:testid:stokes-0-floating-settings-0-content    Conversion
    Click Element    data:testid:stokes-0-floating-settings-0-header-close-button
    Click Element    data:testid:stokes-0-header-close-button
    # image list widget
    Click Element    id:ImageListWidgetButton
    Element Should Contain    data:testid:layer-list-1-header-title    Image List
    Element Should Contain    data:testid:layer-list-1-content    No file loaded
    Click Element    data:testid:layer-list-1-header-settings-button
    Element Should Contain    data:testid:layer-list-1-floating-settings-0-header-title    Image List Settings
    Element Should Contain    data:testid:layer-list-1-floating-settings-0-content    Matching
    Click Element    data:testid:layer-list-1-floating-settings-0-header-close-button
    Click Element    data:testid:layer-list-1-header-close-button
    # catalog widget
    Click Element    id:CatalogWidgetButton
    Element Should Contain    data:testid:catalog-overlay-component-0-header-title    Catalog
    Element Should Contain    data:testid:catalog-overlay-component-0-content    No catalog file loaded
    Click Element    data:testid:catalog-overlay-component-0-header-settings-button
    Element Should Contain    data:testid:catalog-overlay-component-0-floating-settings-0-header-title    Catalog Settings
    Element Should Contain    data:testid:catalog-overlay-component-0-floating-settings-0-content    Major
    Click Element    data:testid:catalog-overlay-component-0-floating-settings-0-header-close-button
    Click Element    data:testid:catalog-overlay-component-0-header-close-button
    # spectral line query widget
    Click Element    id:SpectralLineQueryWidgetButton
    Element Should Contain    data:testid:spectral-line-query-0-header-title    Spectral Line Query
    Element Should Contain    data:testid:spectral-line-query-0-content    Range
    Click Element    data:testid:spectral-line-query-0-header-close-button
    # cursor info widget
    Click Element    id:CursorInfoWidgetButton
    Element Should Contain    data:testid:cursor-info-0-header-title    Cursor Info
    Element Should Contain    data:testid:cursor-info-0-content    No file loaded
    Click Element    data:testid:cursor-info-0-header-close-button
    # pv generator widget
    Click Element    id:PVGeneratorButton
    Element Should Contain    data:testid:pv-generator-0-header-title    PV Generator
    Element Should Contain    data:testid:pv-generator-0-content    PV cut
    Click Element    data:testid:pv-generator-0-header-close-button
    # file header dialog
    Element Attribute Value Should Be    data:testid:file-info-dialog-button    aria-disabled    true
    # preferences dialog
    Click Element    data:testid:preference-dialog-button
    Element Should Contain    data:testid:preference-dialog    Preferences
    Element Should Contain    data:testid:preference-dialog    Global
    Click Element    data:testid:preference-dialog-header-close-button
    # contour config dialog
    Element Attribute Value Should Be    data:testid:contour-dialog-button    aria-disabled    true
    # vector overlay dialog
    Element Attribute Value Should Be    data:testid:vector-dialog-button    aria-disabled    true
    # image fitting dialog
    Element Attribute Value Should Be    data:testid:fitting-dialog-button    aria-disabled    true
    # online data query dialog
    Click Element    data:testid:online-data-query-dialog-button
    Element Should Contain    data:testid:online-data-query-dialog    Online Data Query
    Element Should Contain    id:bp5-tab-title_onlineQueryDialogTabs_0    Catalog
    Element Should Contain    id:bp5-tab-panel_onlineQueryDialogTabs_0    No file loaded
    Element Should Contain    id:bp5-tab-title_onlineQueryDialogTabs_1    HiPS survey
    Click Element    id:bp5-tab-title_onlineQueryDialogTabs_1
    Element Should Contain    id:bp5-tab-panel_onlineQueryDialogTabs_1    Query by object
    Click Element    data:testid:online-data-query-dialog-header-close-button
    # region config dialog
    Load Image    cosmos_spitzer3.6micron.fits
    #   create a rectangle region
    Click Element    ${RECTANGLE_REGION_SHORTCUT_BUTTON}
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    Press Keys    None    DELETE
    Element Should Contain    data:testid:region-dialog    No region selected
    Element Should Contain    data:testid:region-dialog    Region not supported
    Click Element    data:testid:region-dialog-header-close-button
    # catalog histogram and scatter plot widgets
    #   refer to catalog_widget.robot to save testing time
    [Teardown]    Kill carta_backend And Close Browser


Coordinate Grid Rendering
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    model.fits
    Append Image    model_imregrid_galactic.fits
    Mouse Over    ${VIEWER_DIV}
    Click Element    css:#image-panel-1-0 [data-testid="match-button"]
    Click Element    //*[contains(text(), "Spatial only")]
    Click Element    ${VIEWER_10_ZOOM_TO_FIT_BUTTON}
    Click Element    ${VIEWER_10_GRID_BUTTON}
    # make grid line thicker
    Click Element    data:testid:image-view-header-settings-button
    Click Element    //*[normalize-space(text())='Grids']
    Input Text    id:numericInput-14    3    clear=True
    Click Element    //*[normalize-space(text())='Grids']
    Click Element    data:testid:image-view-floating-settings-0-header-close-button
    Mouse Out    ${VIEWER_DIV}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    grid_wcs_${key}.png
    Click Element    ${VIEWER_10_WCS_BUTTON}
    Click Element    //*[contains(text(), "FK5")]
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    grid_fk5_${key}.png
    Click Element    ${VIEWER_10_WCS_BUTTON}
    Click Element    //*[contains(text(), "FK4")]
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    grid_fk4_${key}.png
    Click Element    ${VIEWER_10_WCS_BUTTON}
    Click Element    //*[contains(text(), "ECL")]
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    grid_ecl_${key}.png    
    Click Element    ${VIEWER_10_WCS_BUTTON}
    Click Element    //*[contains(text(), "ICRS")]
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    grid_icrs_${key}.png
    Click Element    ${VIEWER_10_WCS_BUTTON}
    Click Element    //*[contains(text(), "GAL")]
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    grid_gal_${key}.png

    Click Element    ${VIEWER_10_WCS_BUTTON}
    Click Element    //*[contains(text(), "Offset")]
    Mouse Out    ${VIEWER_DIV}

    # change FOV and the origin of the offset grid
    Click Element    ${VIEWER_SETTINGS_DIALOG}
    Double Click Element    id:numericInput-30
    Press Keys    None    DELETE
    Input Text     id:numericInput-30    70.0    clear=True
    Double Click Element    id:numericInput-31
    Press Keys    None    DELETE
    Input Text     id:numericInput-31    0.0    clear=True
    Double Click Element    id:numericInput-32
    Press Keys    None    DELETE
    Double Click Element    id:numericInput-32
    Press Keys    None    DELETE    
    Input Text     id:numericInput-32    10deg    clear=True
    Double Click Element    id:numericInput-34
    Press Keys    None    DELETE
    Input Text     id:numericInput-34    70.0    clear=True    
    Double Click Element    id:numericInput-35
    Press Keys    None    DELETE
    Input Text     id:numericInput-35    0.0    clear=True   
    Double Click Element    id:numericInput-30
    Click Element    ${VIEWER_SETTINGS_DIALOG_CLOSE_BUTTON} 

    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    grid_gal_offset_${key}.png
    Click Element    ${VIEWER_10_WCS_BUTTON}
    Click Element    //*[contains(text(), "FK5")]
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    grid_fk5_offset_${key}.png
    Click Element    ${VIEWER_10_WCS_BUTTON}
    Click Element    //*[contains(text(), "FK4")]
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    grid_fk4_offset_${key}.png
    Click Element    ${VIEWER_10_WCS_BUTTON}
    Click Element    //*[contains(text(), "ECL")]
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    grid_ecl_offset_${key}.png    
    Click Element    ${VIEWER_10_WCS_BUTTON}
    Click Element    //*[contains(text(), "ICRS")]
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    grid_icrs_offset_${key}.png
    Click Element    ${VIEWER_10_WCS_BUTTON}
    Click Element At Coordinates    ${VIEWER_10_WCS_BUTTON}    0    -220
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    grid_wcs_offset_${key}.png
    Click Element    ${VIEWER_10_WCS_BUTTON}
    Click Element    //*[contains(text(), "Offset")]
    Click Element    ${VIEWER_10_WCS_BUTTON}
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    grid_wcs_2_${key}.png

    # verify screenshots
    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    grid_wcs_${key}.png    93,315,472,315
    PNG Two Pixels Should Not Have Matched RGBA    grid_wcs_${key}.png    93,315,472,318

    PNG Two Pixels Should Have Matched RGBA    grid_fk5_${key}.png    237,397,569,400
    PNG Two Pixels Should Not Have Matched RGBA    grid_fk5_${key}.png    237,397,570,402

    PNG Two Pixels Should Have Matched RGBA    grid_fk4_${key}.png    187,400,566,400
    PNG Two Pixels Should Not Have Matched RGBA    grid_fk4_${key}.png    187,400,568,404

    PNG Two Pixels Should Have Matched RGBA    grid_ecl_${key}.png    59,126,438,125
    PNG Two Pixels Should Not Have Matched RGBA    grid_ecl_${key}.png    59,126,440,128

    PNG Two Pixels Should Have Matched RGBA    grid_icrs_${key}.png    190,400,569,400
    PNG Two Pixels Should Not Have Matched RGBA    grid_icrs_${key}.png    190,400,571,403

    PNG Two Pixels Should Have Matched RGBA    grid_gal_${key}.png    93,316,472,316
    PNG Two Pixels Should Not Have Matched RGBA    grid_gal_${key}.png    93,316,473,320 

    PNG Two Pixels Should Have Matched RGBA    grid_gal_offset_${key}.png    190,217,569,217
    PNG Two Pixels Should Not Have Matched RGBA    grid_gal_offset_${key}.png    190,217,572,217
    PNG Two Pixels Should Have Matched RGBA    grid_gal_offset_${key}.png    190,217,573,300

    PNG Two Pixels Should Have Matched RGBA    grid_fk5_offset_${key}.png    189,217,568,217
    PNG Two Pixels Should Not Have Matched RGBA    grid_fk5_offset_${key}.png    189,217,571,218
    PNG Two Pixels Should Have Matched RGBA    grid_fk5_offset_${key}.png    189,217,550,343

    PNG Two Pixels Should Have Matched RGBA    grid_fk4_offset_${key}.png    189,217,568,217
    PNG Two Pixels Should Not Have Matched RGBA    grid_fk4_offset_${key}.png    189,217,571,218
    PNG Two Pixels Should Have Matched RGBA    grid_fk4_offset_${key}.png    189,217,550,343

    PNG Two Pixels Should Have Matched RGBA    grid_ecl_offset_${key}.png    189,217,568,217
    PNG Two Pixels Should Not Have Matched RGBA    grid_ecl_offset_${key}.png    189,217,571,219
    PNG Two Pixels Should Have Matched RGBA    grid_ecl_offset_${key}.png    189,217,523,329

    PNG Two Pixels Should Have Matched RGBA    grid_icrs_offset_${key}.png    189,217,568,217
    PNG Two Pixels Should Not Have Matched RGBA    grid_icrs_offset_${key}.png    189,217,571,218
    PNG Two Pixels Should Have Matched RGBA    grid_icrs_offset_${key}.png    189,217,551,343

    PNG Two Pixels Should Have Matched RGBA    grid_wcs_offset_${key}.png    190,217,569,217
    PNG Two Pixels Should Not Have Matched RGBA    grid_wcs_offset_${key}.png    190,217,572,217
    PNG Two Pixels Should Have Matched RGBA    grid_wcs_offset_${key}.png    190,217,536,343

    PNG Two Pixels Should Have Matched RGBA    grid_wcs_2_${key}.png    190,217,569,217
    PNG Two Pixels Should Not Have Matched RGBA    grid_wcs_2_${key}.png    190,217,572,217
    PNG Two Pixels Should Have Matched RGBA    grid_wcs_2_${key}.png    190,217,573,300

    Remove Files    grid_wcs_${key}.png    grid_fk5_${key}.png    grid_fk4_${key}.png    grid_ecl_${key}.png    grid_gal_${key}.png    grid_icrs_${key}.png    grid_wcs_2_${key}.png
    Remove Files    grid_wcs_offset_${key}.png    grid_fk5_offset_${key}.png    grid_fk4_offset_${key}.png    grid_ecl_offset_${key}.png    grid_gal_offset_${key}.png    grid_icrs_offset_${key}.png
    [Teardown]    Kill carta_backend And Close Browser

Multicolor Rendering
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    disk_0.fits
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[normalize-space(text())='Red'] 
    Append Image    disk_1.fits
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[normalize-space(text())='Green'] 
    Append Image    disk_2.fits
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[normalize-space(text())='Blue'] 
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
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[normalize-space(text())='Green'] 
    Click Element    ${IMAGE_LIST_FOURTH_MATCHING_XY}

    # join the new image into the blending image
    Click Element    ${VIEWER_01_CANVAS}
    Click Element    //*[normalize-space(text())='Add layer']
    Click Element At Coordinates    //*[normalize-space(text())='Add layer']    0    -30
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_rgb_add_layer_${key}.png

    # change alpha value
    Click Element    css:div.alpha-picker.alpha-slider
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
    Click Element    //*[normalize-space(text())='Load with RGB blending']
    Wait Until Page Does Not Contain Element    ${PROGRESS_CLOUD} 

    Click Element    ${VIEWER_00_CANVAS}
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
    Click Element    //*[@id="root"]/div/div[16]/div/div/div[3]/div[5]/div[2]/div[1]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[2]/div/span[1]
    Capture Element Screenshot    ${VIEWER_DIV}    check_hide_R_image0_${key}.png
    Click Element    //*[@id="root"]/div/div[16]/div/div/div[3]/div[5]/div[2]/div[1]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[2]/div/span[1]

    # hide then show C of image 0
    Click Element    //*[@id="root"]/div/div[16]/div/div/div[3]/div[5]/div[2]/div[1]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[2]/div/span[2]
    Capture Element Screenshot    ${VIEWER_DIV}    check_hide_C_image0_${key}.png
    Click Element    //*[@id="root"]/div/div[16]/div/div/div[3]/div[5]/div[2]/div[1]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[2]/div/span[2]

    # hide then show R of image 1
    Click Element    //*[@id="root"]/div/div[16]/div/div/div[3]/div[5]/div[2]/div[1]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[7]/div/span[1]
    Capture Element Screenshot    ${VIEWER_DIV}    check_hide_R_image1_${key}.png
    Click Element    //*[@id="root"]/div/div[16]/div/div/div[3]/div[5]/div[2]/div[1]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[7]/div/span[1]

    # hide then show V of image 1
    Click Element    //*[@id="root"]/div/div[16]/div/div/div[3]/div[5]/div[2]/div[1]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[7]/div/span[2]
    Capture Element Screenshot    ${VIEWER_DIV}    check_hide_V_image1_${key}.png
    Click Element    //*[@id="root"]/div/div[16]/div/div/div[3]/div[5]/div[2]/div[1]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[7]/div/span[2]

    # hide then show R of image 2
    Click Element    //*[@id="root"]/div/div[16]/div/div/div[3]/div[5]/div[2]/div[1]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[12]/div/span[1]
    Capture Element Screenshot    ${VIEWER_DIV}    check_hide_R_image2_${key}.png
    Click Element    //*[@id="root"]/div/div[16]/div/div/div[3]/div[5]/div[2]/div[1]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[12]/div/span[1]

    # hide then show C of image 2
    Click Element    //*[@id="root"]/div/div[16]/div/div/div[3]/div[5]/div[2]/div[1]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[12]/div/span[2]
    Capture Element Screenshot    ${VIEWER_DIV}    check_hide_C_image2_${key}.png
    Click Element    //*[@id="root"]/div/div[16]/div/div/div[3]/div[5]/div[2]/div[1]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[12]/div/span[2]

    # hide then show R of image 3 (multicolor image)
    Click Element    //*[@id="root"]/div/div[16]/div/div/div[3]/div[5]/div[2]/div[1]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[17]/div/span[1]
    Capture Element Screenshot    ${VIEWER_DIV}    check_hide_R_image3_${key}.png
    Click Element    //*[@id="root"]/div/div[16]/div/div/div[3]/div[5]/div[2]/div[1]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[17]/div/span[1]

    # hide then show C of image 3 (multicolor image)
    Click Element    //*[@id="root"]/div/div[16]/div/div/div[3]/div[5]/div[2]/div[1]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[17]/div/span[2]
    Capture Element Screenshot    ${VIEWER_DIV}    check_hide_C_image3_${key}.png
    Click Element    //*[@id="root"]/div/div[16]/div/div/div[3]/div[5]/div[2]/div[1]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[17]/div/span[2]

    # hide then show V of image 3 (multicolor image)
    Click Element    //*[@id="root"]/div/div[16]/div/div/div[3]/div[5]/div[2]/div[1]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[17]/div/span[3]
    Capture Element Screenshot    ${VIEWER_DIV}    check_hide_V_image3_${key}.png
    Click Element    //*[@id="root"]/div/div[16]/div/div/div[3]/div[5]/div[2]/div[1]/div/div/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[17]/div/span[3]

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

