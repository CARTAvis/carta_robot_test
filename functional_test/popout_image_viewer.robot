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
    Set Window Size    800    800
    Sleep    2
    ${key}=    Generate Random String    8
    Capture Page Screenshot    popout_image_viewer_${key}.png
    Switch Window    MAIN
    Capture Page Screenshot    main_browser_${key}.png

    Switch Window    NEW
    # need to use JS to close the popout window so that the viewer can be restored to the main window
    Execute JavaScript	window.close()
    Switch Window    MAIN
    Sleep    2
    Capture Page Screenshot    main_browser_restored_${key}.png
    # verify screenshots
    PNG Pixel XY Should Match RGBA    popout_image_viewer_${key}.png    460,360,23,190,207,255
    PNG Pixel XY Should Match RGBA    main_browser_${key}.png    720,340,19,124,189,255
    PNG Pixel XY Should Match RGBA    main_browser_restored_${key}.png    446,315,23,190,207,255
    PNG Images Should Be Different    main_browser_${key}.png    main_browser_restored_${key}.png
    
    Remove Files    popout_image_viewer_${key}.png    main_browser_${key}.png    main_browser_restored_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Popout Image Viewer - layout
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   S255_CH3CN_subcube.fits
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[contains(text(), "tab10")]    
    Append Image    IRCp10216_sci.spw0.cube.IQUV.manual.pbcor.fits
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[contains(text(), "tab10")]
    # enable popout image viewer
    Click Element    data:testid:image-view-header-popout-button
    Switch Window    NEW
    Sleep    2
    ${key}=    Generate Random String    8
    Capture Page Screenshot    popout_image_viewer_layout_multipanel_view_${key}.png
    # switch to single panel view
    Click Element    data:testid:image-view-header-multipanel-view-switch
    Sleep    2
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
    PNG Two Pixels Should Have Matched RGBA    popout_image_viewer_layout_multipanel_view_${key}.png    352,46,732,46
    PNG Pixel XY Should Match RGBA    popout_image_viewer_layout_single_panel_view_${key}.png    385,209,23,190,207,255
    PNG Two Pixels Should Have Matched RGBA    popout_image_viewer_layout_channel_map_view_${key}.png    158,86,612,332
    PNG Images Should Be Identical    popout_image_viewer_layout_multipanel_view_${key}.png    popout_image_viewer_layout_multipanel_view_2_${key}.png
    PNG Images Should Be Different    popout_image_viewer_layout_multipanel_view_2_${key}.png    popout_image_viewer_layout_multipanel_view_2_zoom_pan_${key}.png

    Remove Files    popout_image_viewer_layout_multipanel_view_${key}.png    popout_image_viewer_layout_single_panel_view_${key}.png    popout_image_viewer_layout_channel_map_view_${key}.png    popout_image_viewer_layout_multipanel_view_2_${key}.png    popout_image_viewer_layout_multipanel_view_2_zoom_pan_${key}.png
    [Teardown]    Kill carta_backend And Close Browser

