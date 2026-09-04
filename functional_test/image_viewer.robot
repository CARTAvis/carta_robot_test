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
