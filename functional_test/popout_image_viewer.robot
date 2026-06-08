*** Settings ***
Documentation     Check the features in the popout image viewer
Resource          ../resource.robot



*** Test Cases ***
Popout And Restore Image Viewer
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   S255_CH3CN_subcube.fits
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[contains(text(), "tab10")]
    # popout image viewer
    Click Element    data:testid:image-view-header-popout-button
    Switch Window    NEW
    ${platform}=    Evaluate    sys.platform    sys
    IF    '${platform}' == 'darwin'
    Set Window Size    800    800
    ELSE
    Set Window Size    800    768
    END
    Sleep    1
    Click Element    data:testid:zoom-to-fit-button
    Mouse Out    data:testid:image-view-content
    Sleep    1
    ${key}=    Generate Random String    8
    Capture Page Screenshot    popout_image_viewer_${key}.png
    Switch Window    MAIN
    Capture Page Screenshot    main_browser_${key}.png
    Switch Window    NEW
    # need to use JS to close the popout window so that the viewer can be restored to the main window
    Execute JavaScript	window.close()
    Switch Window    MAIN
    Sleep    1
    Click Element    data:testid:zoom-to-fit-button
    Mouse Out    data:testid:image-view-content
    Sleep    1
    Capture Page Screenshot    main_browser_restored_${key}.png
    # verify screenshots
    PNG Pixel XY Should Match RGBA    popout_image_viewer_${key}.png    488,370,23,190,207,255
    PNG Pixel XY Should Match RGBA    main_browser_${key}.png    720,340,19,124,189,255
    PNG Pixel XY Should Match RGBA    main_browser_restored_${key}.png    446,313,23,190,207,255
    PNG Images Should Be Different    main_browser_${key}.png    main_browser_restored_${key}.png
    
    Remove Files    popout_image_viewer_${key}.png    main_browser_${key}.png    main_browser_restored_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Popout Image Viewer - layout
    [Setup]    Setup carta_backend And Open Browser To CARTA
    # enable popout image viewer
    Click Element    data:testid:image-view-header-popout-button
    Switch Window    NEW
    ${platform}=    Evaluate    sys.platform    sys
    IF    '${platform}' == 'darwin'
    Set Window Size    800    800
    ELSE
    Set Window Size    800    768
    END
    Sleep    1
    Switch Window    MAIN
    Load Initial Image   S255_CH3CN_subcube.fits
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[contains(text(), "tab10")]    
    Append Image    IRCp10216_sci.spw0.cube.IQUV.manual.pbcor.fits
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[contains(text(), "tab10")]
    
    # apply zoom to fit
    Switch Window    NEW
    Mouse Over    id:image-panel-0-0
    Click Element    data:testid:zoom-to-1x-fit-button
    Mouse Over    id:image-panel-1-0
    Click Element    data:testid:zoom-to-fit-button
    Mouse Out    id:image-panel-1-0
    Sleep    1
    
    ${key}=    Generate Random String    8
    Capture Page Screenshot    popout_image_viewer_layout_multipanel_view_${key}.png
    # switch to single panel view
    Click Element    data:testid:image-view-header-multipanel-view-switch
    Sleep    1
    Click Element    data:testid:zoom-to-fit-button
    Mouse Out    data:testid:image-view-content
    Sleep    1
    Capture Page Screenshot    popout_image_viewer_layout_single_panel_view_${key}.png
    # enable channel map view
    Click Element    data:testid:image-view-header-channel-map-button
    Switch Window    MAIN
    # enable channel map view widget
    Click Element    id:ChannelMapControlButton
    Input Text    //*[@id="numericInput-3"]    3    clear=True
    Input Text    //*[@id="numericInput-4"]    3    clear=True
    Sleep    1
    Switch Window    NEW
    Click Element    data:testid:zoom-to-fit-button
    Mouse Out    data:testid:image-view-content
    Sleep    1
    Capture Page Screenshot    popout_image_viewer_layout_channel_map_view_${key}.png
    # switch back to multi-panel view
    Click Element    data:testid:image-view-header-multipanel-view-switch
    Click Element    data:testid:image-view-header-multipanel-view-switch
    Sleep    2
    Capture Page Screenshot    popout_image_viewer_layout_multipanel_view_2_${key}.png
    # zoom and pan in the popout viewer
    Click Element    id:image-panel-0-0
    Click Element    data:testid:zoom-in-button
    Drag And Drop By Offset    id:image-panel-1-0    100    100
    Mouse Out    id:image-panel-1-0
    Sleep    1
    Capture Page Screenshot    popout_image_viewer_layout_multipanel_view_2_zoom_pan_${key}.png

    # verify screenshots
    PNG Two Pixels Should Have Matched RGBA    popout_image_viewer_layout_multipanel_view_${key}.png    246,353,608,334
    PNG Pixel XY Should Match RGBA    popout_image_viewer_layout_single_panel_view_${key}.png    487,371,23,190,207,255
    PNG Two Pixels Should Have Matched RGBA    popout_image_viewer_layout_channel_map_view_${key}.png    190,140,668,543
    PNG Images Should Be Different    popout_image_viewer_layout_multipanel_view_${key}.png    popout_image_viewer_layout_multipanel_view_2_${key}.png
    PNG Images Should Be Different    popout_image_viewer_layout_multipanel_view_2_${key}.png    popout_image_viewer_layout_multipanel_view_2_zoom_pan_${key}.png

    Remove Files    popout_image_viewer_layout_multipanel_view_${key}.png    popout_image_viewer_layout_single_panel_view_${key}.png    popout_image_viewer_layout_channel_map_view_${key}.png    popout_image_viewer_layout_multipanel_view_2_${key}.png    popout_image_viewer_layout_multipanel_view_2_zoom_pan_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Popout Image Viewer - rendering modes
    [Setup]    Setup carta_backend And Open Browser To CARTA
    # enable popout image viewer
    Click Element    data:testid:image-view-header-popout-button
    Switch Window    NEW
    IF    '${platform}' == 'darwin'
    Set Window Size    800    800
    ELSE
    Set Window Size    800    768
    END
    Sleep    1
    Switch Window    MAIN
    # raster rendering mode
    Load Initial Image   dice_one.fits
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[contains(text(), "tab10")]
    # contour rendering mode
    Click Element    data:testid:contour-dialog-button
    Input Text    css:[data-testid="contour-config-level-input-form"] input    0.6
    Click Element    //*[contains(text(), "Styling")]
    Input Text    data:testid:contour-thickness-input    5
    Click Element    ${CONTOUR_CONFIG_DIALOG_APPLY_BUTTON}
    Click Element    ${CONTOUR_CONFIG_DIALOG_CLOSE_BUTTON}
    # vector rendering mode
    Click Element    data:testid:vector-dialog-button
    Click Element    ${VECTOR_FIELD_RENDERING_STYLING_TAB}
    Input Text    ${VECTOR_FIELD_RENDERING_LINE_THICKNESS_INPUT}    5
    Click Element    ${VECTOR_FIELD_RENDERING_APPLY_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}
    # catalog rendering
    Click Element    data:testid:online-data-query-dialog-button
    Click Element    //a[contains(., "Query")]
    Wait Until Page Does Not Contain    Online Data Query    timeout=30 
    Click Element    ${CATALOG_WIDGET_PLOT_BUTTON}
    Click Element    data:testid:catalog-size-button
    Click Element    data:testid:catalog-settings-shape-dropdown
    Click Element    data:testid:catalog-settings-shape-circle-filled

    # switch to the popout viewer and capture screenshots
    Switch Window    NEW
    Click Element    data:testid:zoom-to-fit-button
    Mouse Out    data:testid:image-view-content
    Sleep    1
    ${key}=    Generate Random String    8
    Capture Page Screenshot    check_${key}.png
    # raster
    PNG Pixel XY Should Match RGBA    check_${key}.png    410,334,23,190,207,255
    # contour
    PNG Pixel XY Should Match RGBA    check_${key}.png    464,330,35,133,81,255
    # vector
    PNG Pixel XY Should Match RGBA    check_${key}.png    397,335,35,133,81,255
    # catalog
    PNG Pixel XY Should Match RGBA    check_${key}.png    47,617,0,163,150,255

    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Popout Image Viewer - multicolor blending
    [Setup]    Setup carta_backend And Open Browser To CARTA
    # enable popout image viewer
    Click Element    data:testid:image-view-header-popout-button
    Load Initial Image    disk_0.fits
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[normalize-space(text())='Red'] 
    Append Image    disk_1.fits
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[normalize-space(text())='Green'] 
    Append Image    disk_2.fits
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[normalize-space(text())='Blue'] 
    Click Element    data:testid:image-list-0-matching-xy
    # enable multi-color blending
    Click Element    //*[contains(text(), "File")]
    Click Element    //*[contains(text(), "Multi-Color Blending")]
    # switch to the popout viewer and capture screenshots
    Switch Window    NEW
    Sleep    1
    ${key}=    Generate Random String    8
    Capture Page Screenshot    check_${key}.png

    # change color theme
    Switch Window    MAIN
    Click Element    //*[normalize-space(text())='Apply color set']
    Click Element    //*[normalize-space(text())='CMY']
    Switch Window    NEW
    Sleep    1
    Capture Page Screenshot    check2_${key}.png
    
    PNG Pixel XY Should Match RGBA    check_${key}.png    575,255,255,0,0,255
    PNG Images Should Be Different    check_${key}.png    check2_${key}.png

    Remove Files    check_${key}.png    check2_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Popout Image Viewer - animator
    [Setup]    Setup carta_backend And Open Browser To CARTA
    # enable popout image viewer
    Click Element    data:testid:image-view-header-popout-button
    Load Initial Image    M17_SWex.fits
    Switch Window    NEW
    Sleep    1
    ${key}=    Generate Random String    8
    Capture Page Screenshot    initial_${key}.png
    Switch Window    MAIN
    Click Element    //*[contains(text(), "Animator")]
    Repeat Keyword    3    Click Element    ${ANIMATOR_SPINBOX_DOWN}
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Wait Until Element Contains    ${ANIMATOR_SLIDER_HANDLE}    5    timeout=10
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Switch Window    NEW
    Sleep    1
    Capture Page Screenshot    final_${key}.png
    PNG Images Should Be Different    initial_${key}.png    final_${key}.png

    Remove Files    initial_${key}.png    final_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Popout Image Viewer - region analytics
    [Setup]    Setup carta_backend And Open Browser To CARTA
    # enable popout image viewer
    Click Element    data:testid:image-view-header-popout-button
    Load Initial Image    S255_CH3CN_subcube.fits
    # create a region using the region button in the main window
    Click Element    data:testid:rectangle-region-shortcut-button
    Switch Window    NEW
    Drag And Drop By Offset    data:testid:image-view-content   100    100
    Switch Window    MAIN
    ${key}=    Generate Random String    8
    # check region spectral profile
    Click Element    id:SpectralProfilerButton
    Capture Element Screenshot    data:testid:spectral-profiler-0-plot    spectral_profile_before_${key}.png
    Click Element    data:testid:spectral-profiler-0-header-close-button
    # check region statistics
    Click Element    id:StatisticsWidgetButton
    Wait Until Page Does Not Contain    No stats data
    # just to check if the table is updated
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    e+1 Jy/beam
    Click Element    data:testid:stats-0-header-close-button
    # check region histogram
    Click Element    id:HistogramWidgetButton
    Capture Element Screenshot    data:testid:histogram-0-plot    histogram_before_${key}.png
    Click Element    data:testid:histogram-0-header-close-button

    # switch to the popout viewer and modify the region
    Switch Window    NEW
    Click Element    data:testid:image-view-content
    Drag And Drop By Offset    data:testid:image-view-content   150    150

    # switch back to the main window and check if the region analytics are updated
    Switch Window    MAIN

    # check region spectral profile
    Click Element    id:SpectralProfilerButton
    Capture Element Screenshot    data:testid:spectral-profiler-0-plot    spectral_profile_after_${key}.png
    Click Element    data:testid:spectral-profiler-0-header-close-button
    # check region statistics
    Click Element    id:StatisticsWidgetButton
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    3    2    e-1 Jy/beam
    Click Element    data:testid:stats-0-header-close-button
    # check region histogram
    Click Element    id:HistogramWidgetButton
    Capture Element Screenshot    data:testid:histogram-0-plot    histogram_after_${key}.png
    Click Element    data:testid:histogram-0-header-close-button

    # remove rectangel region
    Click Element    //*[contains(text(), "Region List")]
    Click Element    //*[contains(text(), "Region 1")]
    Press Keys    None    DELETE

    # spatial profiler
    Switch Window    NEW
    Mouse Over    data:testid:image-view-content
    Double Click Element    data:testid:toolbar-region-creating-button
    Click Element    //*[normalize-space(text())='Line']
    Drag And Drop By Offset    data:testid:image-view-content   100    100
    Switch Window    MAIN
    Capture Element Screenshot    data:testid:spatial-profiler-0-plot    spatial_profile_before_${key}.png
    Switch Window    NEW
    Click Element    data:testid:image-view-content
    Drag And Drop By Offset    data:testid:image-view-content   -100    100
    Switch Window    MAIN
    Capture Element Screenshot    data:testid:spatial-profiler-0-plot    spatial_profile_after_${key}.png

    # verify the screenshots
    PNG Images Should Be Different    spectral_profile_before_${key}.png    spectral_profile_after_${key}.png
    PNG Images Should Be Different    histogram_before_${key}.png    histogram_after_${key}.png
    PNG Images Should Be Different    spatial_profile_before_${key}.png    spatial_profile_after_${key}.png

    Remove Files    spectral_profile_before_${key}.png    spectral_profile_after_${key}.png    histogram_before_${key}.png    histogram_after_${key}.png    spatial_profile_before_${key}.png    spatial_profile_after_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Popout Image Viewer - interactive PV
    [Setup]    Setup carta_backend And Open Browser To CARTA
    # enable popout image viewer
    Click Element    data:testid:image-view-header-popout-button
    Load Initial Image    S255_CH3CN_subcube.fits
    Click Element    data:testid:line-region-shortcut-button
    Switch Window    NEW
    Drag And Drop By Offset    data:testid:image-view-content   100    -100

    # enable interactive PV
    Switch Window    MAIN
    Click Element    id:PVGeneratorButton
    Click Element    ${PV_GENERATOR_PV_CUT_REGION_DROPDOWN}
    Click Element    //*[@data-testid="pv-generator-pv-cut-region-dropdown"]/option[contains(text(), "Region 1")]
    Click Element    //a[contains(., "Start preview")]
    Sleep    1
    # capture a screenshot of the interactive PV image
    ${key}=    Generate Random String    8
    Capture Element Screenshot    data:testid:pv-generator-0-pv-preview-0-content    before_${key}.png

    # update PV cut
    Switch Window    NEW
    Drag And Drop By Offset    data:testid:image-view-content   50    50

    # switch back to the main window and check if the interactive PV is updated
    Switch Window    MAIN
    Sleep    1
    Click Element    data:testid:pv-generator-0-pv-preview-0-content
    Capture Element Screenshot    data:testid:pv-generator-0-pv-preview-0-content    after_${key}.png

    # verify the screenshots
    PNG Images Should Be Different    before_${key}.png    after_${key}.png
    
    Remove Files    before_${key}.png    after_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Popout Image Viewer - image fitting
    [Setup]    Setup carta_backend And Open Browser To CARTA
    # enable popout image viewer
    Click Element    data:testid:image-view-header-popout-button
    Load Initial Image    dice_one.fits
    # capture a screenshot of the original image
    Switch Window    NEW
    Sleep    1
    ${key}=    Generate Random String    8
    Capture Page Screenshot    original_${key}.png


    # enable image fitting dialog and trigger fitting
    Switch Window    MAIN
    Click Element    data:testid:fitting-dialog-button
    Click Element    data:testid:image-fitting-fit-button
    Sleep    1
    Element Should Contain    data:testid:image-fitting-result-tab    Component #1:

    # switch to the popout viewer and capture a screenshot of the fitted image
    Switch Window    NEW
    Sleep    1
    ${key}=    Generate Random String    8
    Capture Page Screenshot    fitted_${key}.png

    # verify the screenshots
    PNG Images Should Be Different    original_${key}.png    fitted_${key}.png

    Remove Files    original_${key}.png    fitted_${key}.png
    [Teardown]    Kill carta_backend And Close Browser
