*** Settings ***
Documentation     Check various rendering at pixel level
Resource          ../resource.robot

*** Test Cases ***
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
    Element Should Contain    id:bp6-tab-title_onlineQueryDialogTabs_0    Catalog
    Element Should Contain    id:bp6-tab-panel_onlineQueryDialogTabs_0    No file loaded
    Element Should Contain    id:bp6-tab-title_onlineQueryDialogTabs_1    HiPS Survey
    Click Element    id:bp6-tab-title_onlineQueryDialogTabs_1
    Element Should Contain    id:bp6-tab-panel_onlineQueryDialogTabs_1    Query by object
    Click Element    data:testid:online-data-query-dialog-header-close-button
    # region config dialog
    Load Image    cosmos_spitzer3.6micron.fits
    #   create a rectangle region
    Click Element    ${RECTANGLE_REGION_SHORTCUT_BUTTON}
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    Press Keys    None    DELETE
    Element Should Contain    data:testid:region-dialog    No region selected
    Element Should Contain    data:testid:region-dialog    Select a region using the list or image view
    Click Element    data:testid:region-dialog-header-close-button
    # catalog histogram and scatter plot widgets
    #   refer to catalog_widget.robot to save testing time
    [Teardown]    Kill carta_backend And Close Browser


Standard Coordinate Grid And Orthogonal Offset Grid Rendering
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    model.fits
    Append Image    model_imregrid_galactic.fits
    Mouse Over    ${VIEWER_DIV}
    Click Element    ${VIEWER_10_MATCH_BUTTON}
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
    Click Element    //*[contains(text(), "IMG")]
    Click Element    //*[normalize-space(text())='OK']
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    grid_img_${key}.png
    Click Element    ${VIEWER_10_WCS_BUTTON}
    Click Element    //*[contains(text(), "GAL")]
    Click Element    ${VIEWER_10_MATCH_BUTTON}
    Click Element    //*[contains(text(), "Spatial only")]
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    grid_gal_${key}.png
    

    Click Element    ${VIEWER_10_WCS_BUTTON}
    Click Element    //*[contains(text(), "Offset")]
    Mouse Out    ${VIEWER_DIV}

    # change FOV and the origin of the offset grid
    Click Element    ${VIEWER_SETTINGS_DIALOG}
    Clear Input Field    id:numericInput-30
    Input Text     id:numericInput-30    70.0    clear=True
    Clear Input Field    id:numericInput-31
    Input Text     id:numericInput-31    0.0    clear=True
    Clear Input Field    id:numericInput-32
    Input Text     id:numericInput-32    10deg    clear=True
    Clear Input Field    id:numericInput-34
    Input Text     id:numericInput-34    70.0    clear=True
    Clear Input Field    id:numericInput-35
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
    Click Element    //*[contains(text(), "IMG")]
    Click Element    //*[normalize-space(text())='OK']
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    grid_img_offset_${key}.png
    Click Element    ${VIEWER_10_WCS_BUTTON}
    Click Element At Coordinates    ${VIEWER_10_WCS_BUTTON}    0    -235
    Click Element    ${VIEWER_10_MATCH_BUTTON}
    Click Element    //*[contains(text(), "Spatial only")]
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

    PNG Two Pixels Should Have Matched RGBA    grid_img_${key}.png    134,186,520,315
    PNG Two Pixels Should Not Have Matched RGBA    grid_img_${key}.png    134,186,620,149 

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

    PNG Two Pixels Should Have Matched RGBA    grid_img_offset_${key}.png    190,216,569,217
    PNG Two Pixels Should Not Have Matched RGBA    grid_img_offset_${key}.png    190,216,571,215
    PNG Two Pixels Should Have Matched RGBA    grid_img_offset_${key}.png    190,216,667,314

    PNG Two Pixels Should Have Matched RGBA    grid_wcs_2_${key}.png    190,217,569,217
    PNG Two Pixels Should Not Have Matched RGBA    grid_wcs_2_${key}.png    190,217,572,217
    PNG Two Pixels Should Have Matched RGBA    grid_wcs_2_${key}.png    190,217,573,300

    Remove Files    grid_wcs_${key}.png    grid_fk5_${key}.png    grid_fk4_${key}.png    grid_ecl_${key}.png    grid_gal_${key}.png    grid_icrs_${key}.png    grid_wcs_2_${key}.png    grid_img_${key}.png
    Remove Files    grid_wcs_offset_${key}.png    grid_fk5_offset_${key}.png    grid_fk4_offset_${key}.png    grid_ecl_offset_${key}.png    grid_gal_offset_${key}.png    grid_icrs_offset_${key}.png    grid_img_offset_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


AST Rendering XY Labels
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    pixel_shader_test.fits
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    Set Selenium Speed    0
    OCR Test    check_${key}.png    296 447 461 467 "Right ascension (ICRS)"
    OCR Test    check_${key}.png    2 148 21 279 "Declination (ICRS)" --rotation 90
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Polar Offset Coordinate Grid Rendering 
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    gaussian_equal_distance.fits
    Click Element    data:testid:grid-button
    # make grid line thicker
    Click Element    data:testid:image-view-header-settings-button
    Click Element    //*[normalize-space(text())='Grids']
    Input Text    id:numericInput-14    3    clear=True
    Click Element    //*[normalize-space(text())='Grids']
    Click Element    data:testid:image-view-floating-settings-0-header-close-button
    Click Element    data:testid:overlay-coordinate-button
    Click Element    //*[contains(text(), "Offset")]
    Click Element    //*[contains(text(), "Pole")]
    # change FOV and the origin of the offset grid
    Click Element    ${VIEWER_SETTINGS_DIALOG}
    Clear Input Field    id:numericInput-30
    Input Text    id:numericInput-30    14:40:00    clear=True
    Clear Input Field    id:numericInput-31
    Input Text    id:numericInput-31    -30:00:00    clear=True
    Clear Input Field    id:numericInput-32
    Input Text    id:numericInput-32    30deg    clear=True
    Clear Input Field    id:numericInput-34
    Input Text    id:numericInput-34    14:40:00    clear=True    
    Clear Input Field    id:numericInput-35
    Input Text    id:numericInput-35    -30:00:00    clear=True   
    Click Element    id:numericInput-30
    Click Element    ${VIEWER_SETTINGS_DIALOG_CLOSE_BUTTON} 
    # change to tab10 colormap
    Change Raster Colormap    tab10

    # take screenshot and perform pixel checks
    Mouse Out    ${VIEWER_DIV}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    grid_polar_offset_wcs_${key}.png

    Click Element    data:testid:overlay-coordinate-button
    Click Element    //*[contains(text(), "FK5")]
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    grid_polar_offset_fk5_${key}.png

    Click Element    data:testid:overlay-coordinate-button
    Click Element    //*[contains(text(), "FK4")]
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    grid_polar_offset_fk4_${key}.png

    Click Element    data:testid:overlay-coordinate-button
    Click Element    //*[contains(text(), "GAL")]
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    grid_polar_offset_gal_${key}.png

    Click Element    data:testid:overlay-coordinate-button
    Click Element    //*[contains(text(), "ECL")]
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    grid_polar_offset_ecl_${key}.png

    Click Element    data:testid:overlay-coordinate-button
    Click Element    //*[contains(text(), "ICRS")]
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    grid_polar_offset_icrs_${key}.png

    Click Element    data:testid:overlay-coordinate-button
    Click Element    //*[contains(text(), "IMG")]
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    grid_polar_offset_img_${key}.png

    Click Element    data:testid:overlay-coordinate-button
    Click Element    //*[contains(text(), "Offset")]
    Click Element    //*[contains(text(), "WCS")]
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    grid_polar_offset_disabled_${key}.png

    # verify screenshots
    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    grid_polar_offset_wcs_${key}.png    380,217,33,93,176,255
    PNG Pixel XY Should Match RGBA    grid_polar_offset_wcs_${key}.png    394,113,33,93,176,255
    PNG Pixel XY Should Match RGBA    grid_polar_offset_wcs_${key}.png    346,133,33,93,176,255
    PNG Pixel XY Should Match RGBA    grid_polar_offset_wcs_${key}.png    308,176,33,93,176,255
    PNG Pixel XY Should Match RGBA    grid_polar_offset_wcs_${key}.png    289,230,33,93,176,255
    PNG Pixel XY Should Match RGBA    grid_polar_offset_wcs_${key}.png    296,281,33,93,176,255
    PNG Pixel XY Should Match RGBA    grid_polar_offset_wcs_${key}.png    325,316,33,93,176,255
    PNG Pixel XY Should Match RGBA    grid_polar_offset_wcs_${key}.png    370,324,33,93,176,255
    PNG Pixel XY Should Match RGBA    grid_polar_offset_wcs_${key}.png    417,304,33,93,176,255
    PNG Pixel XY Should Match RGBA    grid_polar_offset_wcs_${key}.png    456,261,33,93,176,255
    PNG Pixel XY Should Match RGBA    grid_polar_offset_wcs_${key}.png    474,207,33,93,176,255
    PNG Pixel XY Should Match RGBA    grid_polar_offset_wcs_${key}.png    467,156,33,93,176,255
    PNG Pixel XY Should Match RGBA    grid_polar_offset_wcs_${key}.png    438,122,33,93,176,255
    OCR Test    grid_polar_offset_wcs_${key}.png    300 445 465 468 "Offset colatitude (deg)"
    OCR Test    grid_polar_offset_wcs_${key}.png    1 142 24 300 "Offset longitude (deg)" --rotation 90

    PNG Images Should Be Identical    grid_polar_offset_wcs_${key}.png    grid_polar_offset_fk5_${key}.png
    PNG Images Should Be Different    grid_polar_offset_wcs_${key}.png    grid_polar_offset_fk4_${key}.png
    PNG Images Should Be Different    grid_polar_offset_wcs_${key}.png    grid_polar_offset_gal_${key}.png
    PNG Images Should Be Different    grid_polar_offset_wcs_${key}.png    grid_polar_offset_ecl_${key}.png
    PNG Images Should Be Identical    grid_polar_offset_wcs_${key}.png    grid_polar_offset_icrs_${key}.png
    PNG Images Should Be Different    grid_polar_offset_wcs_${key}.png    grid_polar_offset_img_${key}.png
    OCR Test    grid_polar_offset_img_${key}.png    290 448 466 468 "X offset coordinate (pixel)"
    OCR Test    grid_polar_offset_img_${key}.png    1 128 24 306 "Y offset coordinate (pixel)" --rotation 90
    PNG Images Should Be Different    grid_polar_offset_wcs_${key}.png    grid_polar_offset_disabled_${key}.png

    # check source positions
    PNG Pixel XY Should Match RGBA    grid_polar_offset_disabled_${key}.png    378,214,23,190,207,255 
    PNG Pixel XY Should Match RGBA    grid_polar_offset_disabled_${key}.png    438,122,23,190,207,255    

    Remove Files    grid_polar_offset_wcs_${key}.png    grid_polar_offset_fk5_${key}.png    grid_polar_offset_fk4_${key}.png    grid_polar_offset_gal_${key}.png    grid_polar_offset_ecl_${key}.png    grid_polar_offset_icrs_${key}.png    grid_polar_offset_img_${key}.png    grid_polar_offset_disabled_${key}.png
    [Teardown]    Kill carta_backend And Close Browser