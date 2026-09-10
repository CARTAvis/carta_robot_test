*** Settings ***
Documentation     Test image viewer settings
Resource          ../resource.robot

*** Test Cases ***
Image Viewer Settings - Pan and Zoom
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    spire500_ext.fits
    Change Raster Colormap    tab10
    Append Image    pacs160_js.fits
    Change Raster Colormap    tab10
    # enable spatial matching
    Mouse Over    ${VIEWER_10_CANVAS}
    Click Element    css:#image-panel-1-0 [data-testid="match-button"]
    Click Element    //*[contains(text(), "Spatial")]
    # enable viewer settings dialog
    Click Element    ${VIEWER_SETTINGS_DIALOG}
    # set a custom field center
    Clear Input Field    //*[@id="numericInput-3"]
    Input Text    //*[@id="numericInput-3"]    7:08:59.6718741073    clear=True
    Clear Input Field    //*[@id="numericInput-4"]
    Input Text    //*[@id="numericInput-4"]    -11:12:39.5779647306    clear=True
    # set a custom fov in ra
    Clear Input Field    //*[@id="numericInput-5"]
    Input Text    //*[@id="numericInput-5"]    3.2'    clear=True
    Press Keys    //*[@id="numericInput-5"]    RETURN
    # verify the fov changes
    ${fov_x}=    Get Element Attribute    //*[@id="numericInput-5"]    value
    ${fov_y}=    Get Element Attribute    //*[@id="numericInput-6"]    value
    Should Be Equal As Strings    ${fov_x}    3.2019458956'
    Should Be Equal As Strings    ${fov_y}    4.6054338865'
    # close viewer settings dialog
    Click Element    ${VIEWER_SETTINGS_DIALOG_CLOSE_BUTTON}
    # take screenshot for verification
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    test0_${key}.png
    PNG Pixel XY Should Match RGBA    test0_${key}.png    195,200,227,119,194,255
    PNG Pixel XY Should Match RGBA    test0_${key}.png    579,211,23,190,207,255
    # enable offset coordinates
    Click Element    ${VIEWER_SETTINGS_DIALOG}
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Pan and Zoom"]/div/div/div/div[6]/div/label
    # set new offset origin
    Clear Input Field    //*[@id="numericInput-57"]
    Input Text    //*[@id="numericInput-57"]    7:08:56.4326588482    clear=True
    Clear Input Field    //*[@id="numericInput-58"]
    Input Text    //*[@id="numericInput-58"]    -11:11:45.1705220787    clear=True
    Press Keys    //*[@id="numericInput-58"]    RETURN
    # enlarge tick values
    Click Element    //*[contains(text(), "Numbers")]
    Input Text    //*[@id="numericInput-44"]    24    clear=True
    # close viewer settings dialog
    Click Element    ${VIEWER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Mouse Over    ${VIEWER_10_CANVAS}
    Click Element    ${VIEWER_10_GRID_BUTTON}
    Mouse Out    ${VIEWER_DIV}
    # take screenshot for verification
    Capture Element Screenshot    ${VIEWER_DIV}    test1_${key}.png
    OCR Test    test1_${key}.png    627 420 668 445 "0.0"
    OCR Test    test1_${key}.png    403 105 429 145 "0.0" --rotation 90
    OCR Test    test1_${key}.png    465 444 683 469 "Offset coordinate (arcmin)"    # workaround due to OCR accuracy issue
    Remove Files    test0_${key}.png    test1_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Image Viewer Settings - Spatial-Spectral Conversion
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    CO_6_5_z20_cube_pv.fits
    # enable settings dialog and go to the conversion tab
    Click Element    ${VIEWER_SETTINGS_DIALOG}    
    Click Element    //*[contains(text(), "Conversion")]
    # enable rest frame conversion
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Conversion"]/div/div/div/div[4]/div[1]/div/label
    # switch to redshift mode
    Click Element    data:testid:image-view-settings-rest-frame-shift-mode-dropdown
    Click Element    //*[contains(text(), "Redshift (z)")]
    # set z = 20
    Press Keys    data:testid:image-view-settings-rest-frame-redshift-input    DELETE
    Input Text    data:testid:image-view-settings-rest-frame-redshift-input    20    
    # close the dialog and take a screenshot of the viewer
    Click Element    data:testid:image-view-floating-settings-0-header-close-button
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_velocity_${key}.png
    # enable settings dialog and go to the conversion tab
    Click Element    ${VIEWER_SETTINGS_DIALOG}    
    Click Element    //*[contains(text(), "Conversion")]
    # change spectral convention to frequency
    Click Element    data:testid:spectral-profiler-coordinate-dropdown
    Click Element    //*[contains(text(), "Frequency (GHz)")]
    # close the dialog and take a screenshot of the viewer
    Click Element    data:testid:image-view-floating-settings-0-header-close-button
    Capture Element Screenshot    ${VIEWER_DIV}    check_frequency_${key}.png

    # check screenshots
    OCR Test    check_velocity_${key}.png    3 77 25 360 "[LSRK] Radio velocity (kmls) (rest frame)" --rotation 90
    OCR Test    check_velocity_${key}.png    24 268 38 296 "200" --rotation 90
    OCR Test    check_frequency_${key}.png    3 85 25 350 "[LSRK] Frequency (GHz) (rest frame)" --rotation 90
    OCR Test    check_frequency_${key}.png    23 198 40 239 "691.5" --rotation 90
    Remove Files    check_velocity_${key}.png    check_frequency_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Zooming PV Image Independently
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    carta_pv.fits
    Change Raster Colormap    tab10

    # enable contour rendering
    Click Element    data:testid:contour-dialog-button
    Input Text    css:[data-testid="contour-config-level-input-form"] input    0.3
    Click Element    //*[contains(text(), "Styling")]
    Input Text    data:testid:contour-thickness-input    5
    Click Element    ${CONTOUR_CONFIG_DIALOG_APPLY_BUTTON}
    Click Element    ${CONTOUR_CONFIG_DIALOG_CLOSE_BUTTON}    

    # enable vector overlay rendering
    Click Element    ${VECTOR_FIELD_RENDERING_DIALOG_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_THRESHOLD_TOGGLE}
    Press Keys    ${VECTOR_FIELD_RENDERING_THRESHOLD_INPUT}    0.3
    Click Element    ${VECTOR_FIELD_RENDERING_STYLING_TAB}
    Input Text    ${VECTOR_FIELD_RENDERING_LINE_THICKNESS_INPUT}    5
    Input Text    ${VECTOR_FIELD_RENDERING_LINE_LENGTH_MAX_INPUT}    50
    Press Keys    data:testid:vector-field-rotation-offset-input    ARROW_LEFT+4
    Click Element    ${VECTOR_FIELD_RENDERING_APPLY_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}

    # add a text annotation to the pv image
    Click Element    data:testid:annotation-shortcut-dropdown
    Click Element    data:testid:annotation-shortcut-dropdown-text
    Click Element    ${VIEWER_DIV}

    # add a region to the pv image
    Click Element    ${RECTANGLE_REGION_SHORTCUT_BUTTON}
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    Click Element    //*[contains(text(), "Image")]
    Press Keys    //input[@placeholder="Width"]    DELETE
    Input Text    //input[@placeholder="Width"]    25
    Press Keys    //input[@placeholder="Height"]    DELETE
    Input Text    //input[@placeholder="Height"]    25
    Click Element    //*[contains(text(), "Styling")]
    Press Keys    data:testid:region-dialog-line-width-input    DELETE
    Input Text    data:testid:region-dialog-line-width-input    3
    Click Element    data:testid:region-dialog-header-close-button

    # changing zoom level of the pv image
    Mouse Over    ${VIEWER_DIV}
    Click Element    data:testid:pv-zoom-axis-button
    Click Element    //*[contains(text(), "X Axis")]
    Repeat Keyword    2    Click Element    data:testid:zoom-in-button
    Click Element    data:testid:pv-zoom-axis-button
    Click Element    //*[contains(text(), "Y Axis")]
    Click Element    data:testid:zoom-in-button

    # capture screenshot of the image viewer
    Mouse Out    ${VIEWER_DIV}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    
    # check screenshot
    # raster
    PNG Pixel XY Should Match RGBA    check_${key}.png    500,315,227,119,194,255
    # contour
    PNG Pixel XY Should Match RGBA    check_${key}.png    528,326,35,133,81,255
    # vector
    PNG Pixel XY Should Match RGBA    check_${key}.png    320,313,35,133,81,255
    # region control point
    PNG Pixel XY Should Match RGBA    check_${key}.png    204,210,255,255,255,255
    # region border
    PNG Pixel XY Should Match RGBA    check_${key}.png    210,209,46,230,214,255
    # text annotation
    PNG Pixel XY Should Match RGBA    check_${key}.png    465,253,255,186,1,255
    
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Image Viewer Settings - Customization for Publication
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Change Raster Colormap    tab10
    Append Image    HD163296_CO_2_1.mom1.fits
    # Match images
    Click Element    data:testid:image-list-0-matching-xy
    # enable settings dialog
    Click Element    data:testid:image-view-header-settings-button

    ## configure title
    Click Element    //*[normalize-space(text())='Title']
    # enable title
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Title"]/div/div/div/div[1]/div/label
    # enable custom text
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Title"]/div/div/div/div[3]/div/label
    Input Text    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Title"]/div/div/div/div[4]/div/div/div/div/input    HD163296 CO 2-1 Moment1
    # enable custom color
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Title"]/div/div/div/div[5]/div/label
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Title"]/div/div/div/div[6]/div/div/div/div/button
    Click Element    //*[@id="listbox-10"]/li[4]/a

    ## configure ticks
    Click Element    //*[normalize-space(text())='Ticks']
    # disable draw on all edges
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Ticks"]/div/div/div/div[1]/div/label
    # enable custom density
    Click Element   //*[@id="bp6-tab-panel_imageViewSettingsTabs_Ticks"]/div/div/div/div[2]/div/label
    Input Text    //*[@id="numericInput-30"]    5
    Input Text    //*[@id="numericInput-31"]    5
    # enable custom color
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Ticks"]/div/div/div/div[4]/div/label
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Ticks"]/div/div/div/div[5]/div/div/div/div/button
    Click Element    //*[@id="listbox-11"]/li[4]/a
    # set custom width
    Input Text    //*[@id="numericInput-11"]    5
    # set minor and major lengths
    Input Text    //*[@id="numericInput-12"]    4
    Input Text    //*[@id="numericInput-13"]    8
    
    ## configure grids
    Click Element    //*[normalize-space(text())='Grids']
    # enable WCS grid
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Grids"]/div/div/div/div[1]/div/label
    # enable custom color
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Grids"]/div/div/div/div[2]/div/label
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Grids"]/div/div/div/div[3]/div/div/div/div/button
    Click Element    //*[@id="listbox-12"]/li[3]/a
    # set custom width
    Input Text    //*[@id="numericInput-14"]    5
    # skip custom gap and pixel grid tests

    ## configure border
    Click Element    //*[normalize-space(text())='Border']
    # set custom color
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Border"]/div/div/div/div[2]/div/label
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Border"]/div/div/div/div[3]/div/div/div/div/button
    Click Element    //*[@id="listbox-13"]/li[5]/a
    # set custom width
    Input Text    //*[@id="numericInput-15"]    5

    ## configure numbers
    Click Element    //*[normalize-space(text())='Numbers']
    # set custom size
    Input Text    //*[@id="numericInput-17"]    18
    # set custom color
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Numbers"]/div/div/div/div[3]/div/label
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Numbers"]/div/div/div/div[4]/div/div/div/div/button
    Click Element    //*[@id="listbox-14"]/li[4]/a
    # set custom format - change RA to degrees, keep Dec as dms
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Numbers"]/div/div/div/div[5]/div/label
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Numbers"]/div/div/div/div[6]/div/div[1]/div/div
    Click Element    //*[normalize-space(text())='Degrees']
    # set custom precision
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Numbers"]/div/div/div/div[7]/div/label
    Scroll Element Into View    //*[normalize-space(text())='Precision']
    Input Text    //*[@id="numericInput-32"]    4

    ## configure labels
    Click Element    //*[normalize-space(text())='Labels']
    # set custom font size
    Input Text    //*[@id="numericInput-18"]    18
    # skip show/hide ra/dec reference toggle test
    # set custom text
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Labels"]/div/div/div/div[4]/div/label
    Input Text    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Labels"]/div/div/div/div[5]/div/div[1]/div/div/input    ABCDE
    Input Text    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Labels"]/div/div/div/div[5]/div/div[2]/div/div/input    XYZ
    # set custom color
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Labels"]/div/div/div/div[6]/div/label
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Labels"]/div/div/div/div[7]/div/div/div/div/button
    Click Element    //*[@id="listbox-15"]/li[4]/a

    ## configure colorbar
    Click Element    //*[normalize-space(text())='Colorbar']
    # set position to top
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Colorbar"]/div/div/div/div[3]/div/div
    Click Element    //*[normalize-space(text())='Top']
    # set width
    Input Text    //*[@id="numericInput-19"]    20
    # set offset
    Input Text    //*[@id="numericInput-20"]    10
    # set tick density
    Input Text    //*[@id="numericInput-21"]    2
    # set custom color
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Colorbar"]/div/div/div/div[7]/div/label
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Colorbar"]/div/div/div/div[8]/div/div/div/div/button
    Click Element    //*[@id="listbox-16"]/li[4]/a
    # set custom label
    Scroll Element Into View    //*[normalize-space(text())='Label font']
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Colorbar"]/div/div/div/div[9]/div/label
    Input Text    //*[@id="numericInput-22"]    18
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Colorbar"]/div/div/div/div[12]/div/label
    Input Text    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Colorbar"]/div/div/div/div[13]/div/div/div/div/input    Velocity
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Colorbar"]/div/div/div/div[14]/div/label
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Colorbar"]/div/div/div/div[15]/div/div/div/div/button
    Click Element    //*[@id="listbox-17"]/li[2]/a

    ## configure colorbar numbers
    Scroll Element Into View    //*[normalize-space(text())='Numbers custom precision']
    # set size
    Input Text    //*[@id="numericInput-23"]    18
    # set custom precision
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Colorbar"]/div/div/div/div[19]/div/label
    Input Text    //*[@id="numericInput-33"]    1
    # set custom color
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Colorbar"]/div/div/div/div[21]/div/label
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Colorbar"]/div/div/div/div[22]/div/div/div/div/button
    Click Element    //*[@id="listbox-18"]/li[3]/a

    ## configure colorbar ticks
    Scroll Element Into View    //*[normalize-space(text())='Ticks custom color']
    # set length
    Input Text    //*[@id="numericInput-24"]    10
    # set width
    Input Text    //*[@id="numericInput-25"]    5
    # set color
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Colorbar"]/div/div/div/div[26]/div/label
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Colorbar"]/div/div/div/div[27]/div/div/div/div/button
    Click Element    //*[@id="listbox-19"]/li[8]/a

    ## configure colorbar border
    Scroll Element Into View    //*[normalize-space(text())='Border custom color']
    # set width
    Input Text    //*[@id="numericInput-26"]    5
    # set color
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Colorbar"]/div/div/div/div[30]/div/label
    Scroll Element Into View    //*[normalize-space(text())='Border color']
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Colorbar"]/div/div/div/div[31]/div/div/div/div/button
    Click Element    //*[@id="listbox-20"]/li[8]/a


    ## configure beam
    Click Element    //*[normalize-space(text())='Beam']
    # set color
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Beam"]/div/div/div/div[3]/div/div/button
    Click Element    //*[@id="listbox-9"]/li[4]/a
    # set beam type
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Beam"]/div/div/div/div[4]/div/div
    Click Element    //*[normalize-space(text())='Solid']
    # set width
    Input Text    //*[@id="numericInput-27"]    3
    # set position x y
    Input Text    //*[@id="numericInput-28"]    10
    Input Text    //*[@id="numericInput-29"]    10

    # close settings dialog
    Click Element    data:testid:image-view-floating-settings-0-header-close-button

    # take screenshot
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png

    # verify screenshot context
    Set Selenium Speed    0
    # title in red
    OCR Test    check_${key}.png    465 2 720 25 "HD163296 CO 2-1 Moment1"
    PNG Pixel XY Should Match RGBA    check_${key}.png    482,13,172,47,51,255
    # ticks major in red
    PNG Pixel XY Should Match RGBA    check_${key}.png    357,396,172,47,51,255
    # ticks minor in red
    PNG Pixel XY Should Match RGBA    check_${key}.png    360,408,172,47,51,255
    # hidden ticks at top
    PNG Pixel XY Should Match RGBA    check_${key}.png    360,113,31,119,180,255
    # grids in green
    PNG Pixel XY Should Match RGBA    check_${key}.png    94,374,28,110,66,255
    # border in purple
    PNG Pixel XY Should Match RGBA    check_${key}.png    51,109,124,50,124,255
    # numbers in red
    OCR Test    check_${key}.png    398 424 480 443 "269.0910"
    OCR Test    check_${key}.png    407 269 426 400 --rotation 90 -- '-21.57.26.0000'    # special treatment due to the negative sign in -21
    PNG Pixel XY Should Match RGBA    check_${key}.png    435,438,172,47,51,255
    # labels in red
    OCR Test    check_${key}.png    178 446 247 466 "ABCDE"
    OCR Test    check_${key}.png    384 242 403 286 --rotation 90 -- 'XYZ'
    PNG Pixel XY Should Match RGBA    check_${key}.png    221,456,172,47,51,255
    # colorbar
    OCR Test    check_${key}.png    558 33 626 55 "Velocity"
    OCR Test    check_${key}.png    539 56 571 75 "5.0"
    PNG Pixel XY Should Match RGBA    check_${key}.png    555,71,28,110,66,255    # number in green
    PNG Pixel XY Should Match RGBA    check_${key}.png    347,80,115,128,145,255    # border in grey
    PNG Pixel XY Should Match RGBA    check_${key}.png    347,88,115,128,145,255    # ticks in grey
    # beam
    PNG Pixel XY Should Match RGBA    check_${key}.png    457,394,255,255,255,255    # cross in white
    PNG Pixel XY Should Match RGBA    check_${key}.png    462,391,172,47,51,255    # solid beam in red

    # TODO: should also save as a workspace and restore it to test if the image view is correctly restored, skip for now due to a bug

    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


