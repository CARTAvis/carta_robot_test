*** Settings ***
Documentation     Test moment map generator functionalities 
Resource          ../resource.robot

*** Test Cases ***
Generate A Moment Image From FITS Cube
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Mouse Over    ${VIEWER_DIV}
    Click Element    id:SpectralProfilerButton
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    ${SPECTRAL_PROFILER_CLOSE_BUTTON}
    #Sleep    2
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    test_${key}.png
    PNG Two Pixels Should Have Matched RGBA    test_${key}.png    529,160,542,158
    PNG Two Pixels Should Not Have Matched RGBA    test_${key}.png    150,158,542,158
    Remove Files    test_${key}.png
    [Teardown]    Kill carta_backend And Close Browser

Generate A Moment Image From CASA Cube
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.image
    Mouse Over    ${VIEWER_DIV}
    Click Element    id:SpectralProfilerButton
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    ${SPECTRAL_PROFILER_CLOSE_BUTTON}
    #Sleep    2
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    test_${key}.png
    PNG Two Pixels Should Have Matched RGBA    test_${key}.png    529,160,542,158
    PNG Two Pixels Should Not Have Matched RGBA    test_${key}.png    150,158,542,158
    Remove Files    test_${key}.png
    [Teardown]    Kill carta_backend And Close Browser

Generate A Moment Image From MIRIAD Cube
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.miriad
    Mouse Over    ${VIEWER_DIV}
    Click Element    id:SpectralProfilerButton
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    ${SPECTRAL_PROFILER_CLOSE_BUTTON}
    #Sleep    2
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    test_${key}.png
    PNG Two Pixels Should Have Matched RGBA    test_${key}.png    529,160,542,158
    PNG Two Pixels Should Not Have Matched RGBA    test_${key}.png    150,158,542,158
    Remove Files    test_${key}.png
    [Teardown]    Kill carta_backend And Close Browser

Generate A Moment Image From HDF5 Cube
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.hdf5
    Mouse Over    ${VIEWER_DIV}
    Click Element    id:SpectralProfilerButton
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    ${SPECTRAL_PROFILER_CLOSE_BUTTON}
    #Sleep    2
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    test_${key}.png
    PNG Two Pixels Should Have Matched RGBA    test_${key}.png    529,160,542,158
    PNG Two Pixels Should Not Have Matched RGBA    test_${key}.png    150,158,542,158
    Remove Files    test_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Generate A Moment Image From Cube With PerPlaneBeam
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    IRCp10216_sci.spw0.cube.IQUV.manual.pbcor.subimage.fits
    Mouse Over    ${VIEWER_DIV}
    Click Element    id:SpectralProfilerButton
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    ${SPECTRAL_PROFILER_CLOSE_BUTTON}
    #Sleep    2
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    test_${key}.png
    PNG Two Pixels Should Have Matched RGBA    test_${key}.png    198,208,577,208
    PNG Two Pixels Should Not Have Matched RGBA    test_${key}.png    180,263,595,208
    Remove Files    test_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Generate All Moment Images
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    Mouse Over    ${VIEWER_DIV}
    Click Element    id:SpectralProfilerButton
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    # set mask mode to include
    Click Element    data:testid:moment-generator-mask-dropdown
    Click Element    //option[contains(text(), "Include")]
    # set mask range from value to 0.03
    Press Keys    data:testid:moment-generator-mask-range-from-input    DELETE
    Input Text    data:testid:moment-generator-mask-range-from-input    0.03
    # select all kinds of moments
    Click Element    data:testid:moment-generator-clear-select-button
    Click Element    //*[contains(text(), "-1: Mean value of the spectrum")]
    Click Element    //*[contains(text(), "0: Integrated value of the spectrum")]
    Click Element    //*[contains(text(), "1: Intensity weighted coordinate")]
    Click Element    //*[contains(text(), "2: Intensity weighted dispersion of the coordinate")]
    Click Element    //*[contains(text(), "3: Median value of the spectrum")]
    Click Element    //*[contains(text(), "4: Median coordinate")]
    Click Element    //*[contains(text(), "5: Standard deviation about the mean of the spectrum")]
    Click Element    //*[contains(text(), "6: Root mean square of the spectrum")]
    Click Element    //*[contains(text(), "7: Absolute mean deviation of the spectrum")]
    Click Element    //*[contains(text(), "8: Maximum value of the spectrum")]
    Click Element    //*[contains(text(), "9: Coordinate of the maximum value of the spectrum")]
    Click Element    //*[contains(text(), "10: Minimum value of the spectrum")]
    Click Element    //*[contains(text(), "11: Coordinate of the minimum value of the spectrum")]
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=10
    #Sleep    5
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    ${SPECTRAL_PROFILER_CLOSE_BUTTON}
    # create a statistics widget and dock it to the panel with the X spatial profiler
    Drag And Drop    StatisticsWidgetButton    ${X_SPATIAL_PROFILER_TAB}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.minimum_coord
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    3.025600051880e+1 km/s
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    moment_11_${key}.png
    Click Element    //*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.minimum
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    2.420960962772e-1 Jy/beam
    Capture Element Screenshot    ${VIEWER_DIV}    moment_10_${key}.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.maximum_coord
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    3.025600051880e+1 km/s
    Capture Element Screenshot    ${VIEWER_DIV}    moment_9_${key}.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.maximum
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    4.446276426315e-1 Jy/beam
    Capture Element Screenshot    ${VIEWER_DIV}    moment_8_${key}.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.abs_mean_dev
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    1.477163285017e-1 Jy/beam
    Capture Element Screenshot    ${VIEWER_DIV}    moment_7_${key}.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.rms
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    2.927759885788e-1 Jy/beam
    Capture Element Screenshot    ${VIEWER_DIV}    moment_6_${key}.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.standard_deviation
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    1.882859319448e-1 Jy/beam
    Capture Element Screenshot    ${VIEWER_DIV}    moment_5_${key}.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.median_coord
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    3.025600051880e+1 km/s
    Capture Element Screenshot    ${VIEWER_DIV}    moment_4_${key}.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.median
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    2.901065945625e-1 Jy/beam
    Capture Element Screenshot    ${VIEWER_DIV}    moment_3_${key}.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.weighted_dispersion_coord
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    5.907100677490e+0 km/s
    Capture Element Screenshot    ${VIEWER_DIV}    moment_2_${key}.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.weighted_coord
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    3.025600051880e+1 km/s
    Capture Element Screenshot    ${VIEWER_DIV}    moment_1_${key}.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.integrated
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    8.415695428848e-1 Jy/beam.km/s
    Capture Element Screenshot    ${VIEWER_DIV}    moment_0_${key}.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.average
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    8    2    2.551147937775e-1 Jy/beam
    Capture Element Screenshot    ${VIEWER_DIV}    moment_-1_${key}.png
    #Sleep    1
    Set Selenium Speed    0
    PNG Images Should Be Different    moment_-1_${key}.png    moment_0_${key}.png
    PNG Images Should Be Different    moment_-1_${key}.png    moment_1_${key}.png
    PNG Images Should Be Different    moment_-1_${key}.png    moment_2_${key}.png
    PNG Images Should Be Different    moment_-1_${key}.png    moment_3_${key}.png
    PNG Images Should Be Different    moment_-1_${key}.png    moment_4_${key}.png
    PNG Images Should Be Different    moment_-1_${key}.png    moment_5_${key}.png
    PNG Images Should Be Different    moment_-1_${key}.png    moment_6_${key}.png
    PNG Images Should Be Different    moment_-1_${key}.png    moment_7_${key}.png
    PNG Images Should Be Different    moment_-1_${key}.png    moment_8_${key}.png
    PNG Images Should Be Different    moment_-1_${key}.png    moment_9_${key}.png
    PNG Images Should Be Different    moment_-1_${key}.png    moment_10_${key}.png
    PNG Images Should Be Different    moment_-1_${key}.png    moment_11_${key}.png
    Set Selenium Speed    ${DELAY}
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    Remove Files    moment_*_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Generate A Moment Image With Custom Parameters
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Load Region File    region_001.crtf
    Append Image    S255_CH3CN_subcube.fits
    Click Element    id:SpectralProfilerButton
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    # use the image dropdown to explicitly select M17_SWex.fits
    Click Element    data:testid:moment-generator-image-dropdown
    Click Element    //*[@data-testid="moment-generator-image-dropdown"]/option[contains(text(), "0: M17_SWex.fits")]
    Element Should Contain    data:testid:moment-generator-file-info    M17
    # use the region dropdown to explicitly select Region 4
    Click Element    data:testid:moment-generator-region-dropdown
    Click Element    //*[@data-testid="moment-generator-region-dropdown"]/option[contains(text(), "Region 4")]
    Element Should Contain    data:testid:moment-generator-region-info    Region 4
    # use the coordinate dropdown to select radio velocity as the reference 
    Click Element    css:[data-testid="moment-generator-tab"] [data-testid="spectral-profiler-coordinate-dropdown"]
    Click Element    //*[@data-testid="moment-generator-tab"]//option[contains(text(), "Radio velocity (km/s)")]
    # set velocity range from 15 to 25
    Press Keys    data:testid:moment-generator-spectral-range-from-input    DELETE
    Input Text    data:testid:moment-generator-spectral-range-from-input    15
    Press Keys    data:testid:moment-generator-spectral-range-to-input    DELETE
    Input Text    data:testid:moment-generator-spectral-range-to-input    25
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    #Sleep    2
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    ${SPECTRAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${FILE_HEADER_DIALOG_BUTTON}
    # switch to the file information tab
    Click Element    data:testid:file-information-tab-title
    # verify file info context
    Element Should Contain    ${FILE_INFO_TEXT}    M17_SWex.fits.moment.integrated
    Element Should Contain    ${FILE_INFO_TEXT}    [116, 128, 1, 1]
    [Teardown]    Kill carta_backend And Close Browser


Generate Moment Images From Unmatched Cubes
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Append Image    M17_SWex.hdf5
    Click Element    id:SpectralProfilerButton
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    #Sleep    2
    # use the image dropdown to explicitly select M17_SWex.fits
    Click Element    data:testid:moment-generator-image-dropdown
    Click Element    //*[@data-testid="moment-generator-image-dropdown"]/option[contains(text(), "0: M17_SWex.fits")]
    Element Should Be Enabled    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    #Sleep    2
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    ${SPECTRAL_PROFILER_CLOSE_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.integrated
    Click Element    //*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.hdf5.moment.integrated
    [Teardown]    Kill carta_backend And Close Browser


Generate Moment Images From Matched Cubes
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    # create an ellipse region at the image view center via the region shortcut button
    Click Element    ${ELLIPSE_REGION_SHORTCUT_BUTTON}
    Click Element    ${VIEWER_DIV}
    Append Image    M17_SWex.hdf5
    # trigger image matching
    Mouse Over    ${VIEWER_10_CANVAS}
    Click Element    ${VIEWER_10_MATCH_BUTTON}
    Click Element    //*[contains(text(), "Spectral (VRAD) and spatial")]
    Click Element    id:SpectralProfilerButton
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    #Sleep    2
    # use the image dropdown to explicitly select M17_SWex.fits
    Click Element    data:testid:moment-generator-image-dropdown
    Click Element    //*[@data-testid="moment-generator-image-dropdown"]/option[contains(text(), "0: M17_SWex.fits")]
    Element Should Be Enabled    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    #Sleep    2
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    ${SPECTRAL_PROFILER_CLOSE_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.integrated
    Click Element    //*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.hdf5.moment.integrated
    [Teardown]    Kill carta_backend And Close Browser


Generate A Moment Image With A Region Mask FITS
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Load Region File    region_001.crtf
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    Click Element    id:SpectralProfilerButton
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    # use the region dropdown to select Region 2
    Click Element    data:testid:moment-generator-region-dropdown
    # Cursor region
    Element Should be Disabled    //*[@data-testid="moment-generator-region-dropdown"]/option[contains(text(), "Cursor")]
    # Region 1
    Element Should be Disabled    //*[@data-testid="moment-generator-region-dropdown"]/option[contains(text(), "Region 1")]
    Click Element    //*[@data-testid="moment-generator-region-dropdown"]/option[contains(text(), "Region 2")]
    Click Element    ${MOMENT_GENERATOR_AUTO_MATCHING_TOGGLE}
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    ${SPECTRAL_PROFILER_CLOSE_BUTTON}
    #Sleep    2
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    moment_rectangle_mask_${key}.png
    PNG Two Pixels Should Have Matched RGBA    moment_rectangle_mask_${key}.png    403,186,410,186
    PNG Two Pixels Should Not Have Matched RGBA    moment_rectangle_mask_${key}.png    403,178,410,186
    Click Element    id:SpectralProfilerButton
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    # use the image dropdown to select M17_SWex.fits
    Click Element    data:testid:moment-generator-image-dropdown
    Click Element    //*[@data-testid="moment-generator-image-dropdown"]/option[contains(text(), "0: M17_SWex.fits")]
    # use the region dropdown to select Region 3
    Click Element    data:testid:moment-generator-region-dropdown
    Click Element    //*[@data-testid="moment-generator-region-dropdown"]/option[contains(text(), "Region 3")]
    # move the dialog so that the generate button is clickable in the view
    Drag And Drop By Offset    data:testid:spectral-profiler-0-floating-settings-0-header-title    0    50
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    ${SPECTRAL_PROFILER_CLOSE_BUTTON}
    #Sleep    2
    Capture Element Screenshot    ${VIEWER_DIV}    moment_ellipse_mask_${key}.png
    PNG Two Pixels Should Have Matched RGBA    moment_ellipse_mask_${key}.png    228,74,236,66
    PNG Two Pixels Should Not Have Matched RGBA    moment_ellipse_mask_${key}.png    228,74,236,74
    Click Element    id:SpectralProfilerButton
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    # use the image dropdown to select M17_SWex.fits
    Click Element    data:testid:moment-generator-image-dropdown
    Click Element    //*[@data-testid="moment-generator-image-dropdown"]/option[contains(text(), "0: M17_SWex.fits")]
    # use the region dropdown to select Region 4
    Click Element    data:testid:moment-generator-region-dropdown
    Click Element    //*[@data-testid="moment-generator-region-dropdown"]/option[contains(text(), "Region 4")]
    # move the dialog so that the generate button is clickable in the view
    Drag And Drop By Offset    data:testid:spectral-profiler-0-floating-settings-0-header-title    0    50
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    ${SPECTRAL_PROFILER_CLOSE_BUTTON}
    #Sleep    2
    Capture Element Screenshot    ${VIEWER_DIV}    moment_polygon_mask_${key}.png
    PNG Two Pixels Should Have Matched RGBA    moment_polygon_mask_${key}.png    451,102,451,103
    PNG Two Pixels Should Not Have Matched RGBA    moment_polygon_mask_${key}.png    451,102,200,102
    Remove Files    moment_rectangle_mask_${key}.png    moment_ellipse_mask_${key}.png    moment_polygon_mask_${key}.png
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    [Teardown]    Kill carta_backend And Close Browser


Generate A Moment Image With A Region Mask HDF5
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.hdf5
    Load Region File    region_001.crtf
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    Click Element    id:SpectralProfilerButton
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    # use the region dropdown to select Region 2
    Click Element    data:testid:moment-generator-region-dropdown
    # Cursor region
    Element Should be Disabled    //*[@data-testid="moment-generator-region-dropdown"]/option[contains(text(), "Cursor")]
    # Region 1
    Element Should be Disabled    //*[@data-testid="moment-generator-region-dropdown"]/option[contains(text(), "Region 1")]
    Click Element    //*[@data-testid="moment-generator-region-dropdown"]/option[contains(text(), "Region 2")]
    Click Element    ${MOMENT_GENERATOR_AUTO_MATCHING_TOGGLE}
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    ${SPECTRAL_PROFILER_CLOSE_BUTTON}
    #Sleep    2
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    moment_rectangle_mask_${key}.png
    PNG Two Pixels Should Have Matched RGBA    moment_rectangle_mask_${key}.png    403,186,410,186
    PNG Two Pixels Should Not Have Matched RGBA    moment_rectangle_mask_${key}.png    403,178,410,186
    Click Element    id:SpectralProfilerButton
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    # use the image dropdown to select M17_SWex.fits
    Click Element    data:testid:moment-generator-image-dropdown
    Click Element    //*[@data-testid="moment-generator-image-dropdown"]/option[contains(text(), "0: M17_SWex.hdf5")]
    # use the region dropdown to select Region 3
    Click Element    data:testid:moment-generator-region-dropdown
    Click Element    //*[@data-testid="moment-generator-region-dropdown"]/option[contains(text(), "Region 3")]
    # move the dialog so that the generate button is clickable in the view
    Drag And Drop By Offset    data:testid:spectral-profiler-0-floating-settings-0-header-title    0    50
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    ${SPECTRAL_PROFILER_CLOSE_BUTTON}
    #Sleep    2
    Capture Element Screenshot    ${VIEWER_DIV}    moment_ellipse_mask_${key}.png
    PNG Two Pixels Should Have Matched RGBA    moment_ellipse_mask_${key}.png    228,74,236,66
    PNG Two Pixels Should Not Have Matched RGBA    moment_ellipse_mask_${key}.png    228,74,236,74
    Click Element    id:SpectralProfilerButton
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    # use the image dropdown to select M17_SWex.fits
    Click Element    data:testid:moment-generator-image-dropdown
    Click Element    //*[@data-testid="moment-generator-image-dropdown"]/option[contains(text(), "0: M17_SWex.hdf5")]
    # use the region dropdown to select Region 4
    Click Element    data:testid:moment-generator-region-dropdown
    Click Element    //*[@data-testid="moment-generator-region-dropdown"]/option[contains(text(), "Region 4")]
    # move the dialog so that the generate button is clickable in the view
    Drag And Drop By Offset    data:testid:spectral-profiler-0-floating-settings-0-header-title    0    50
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    ${SPECTRAL_PROFILER_CLOSE_BUTTON}
    #Sleep    2
    Capture Element Screenshot    ${VIEWER_DIV}    moment_polygon_mask_${key}.png
    PNG Two Pixels Should Have Matched RGBA    moment_polygon_mask_${key}.png    451,102,451,103
    PNG Two Pixels Should Not Have Matched RGBA    moment_polygon_mask_${key}.png    451,102,200,102
    Remove Files    moment_rectangle_mask_${key}.png    moment_ellipse_mask_${key}.png    moment_polygon_mask_${key}.png
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    [Teardown]    Kill carta_backend And Close Browser


Generate Moment Images With A Custom Rest Frequency
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Image    S255_CH3CN_subcube.fits
    Click Element    data:testid:ellipse-region-shortcut-button
    Click Element At Coordinates    ${VIEWER_DIV}    60    10
    # enable the moment generator dialog
    Click Element    id:SpectralProfilerButton
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    # apply a new custom rest frequency for NH2CHO at 349.4795473 GHz
    Double Click Element    id:numericInput-11
    Input Text    id:numericInput-11    349.4795473    clear=False
    # use the coordinate dropdown to select radio velocity as the reference 
    Click Element    css:[data-testid="moment-generator-tab"] [data-testid="spectral-profiler-coordinate-dropdown"]
    Click Element    //*[@data-testid="moment-generator-tab"]//option[contains(text(), "Radio velocity (km/s)")]
    # set velocity range from 15 to 25
    Press Keys    data:testid:moment-generator-spectral-range-from-input    DELETE
    Input Text    data:testid:moment-generator-spectral-range-from-input    0
    Press Keys    data:testid:moment-generator-spectral-range-to-input    DELETE
    Input Text    data:testid:moment-generator-spectral-range-to-input    15
    # set mask mode to include
    Click Element    data:testid:moment-generator-mask-dropdown
    Click Element    //option[contains(text(), "Include")]
    # set mask range from value to 0.03
    Press Keys    data:testid:moment-generator-mask-range-from-input    DELETE
    Input Text    data:testid:moment-generator-mask-range-from-input    0.05
    # select moment 0, 1, and 2
    Click Element    data:testid:moment-generator-clear-select-button
    Click Element    //*[contains(text(), "0: Integrated value of the spectrum")]
    Click Element    //*[contains(text(), "1: Intensity weighted coordinate")]
    Click Element    //*[contains(text(), "2: Intensity weighted dispersion of the coordinate")]
    # generate moment images
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    ${SPECTRAL_PROFILER_CLOSE_BUTTON}    
    # check the moment 2 image
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    0.0011296000655354591
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    2.3289730491042175   
    # check the moment 1 image
    Click Element    ${VIEWER_01_CANVAS} 
    # apply jet color for velocity image rendering
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[contains(text(), "jet")]
    # check the new clip min and max
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    3.5962982066050144
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    9.133099871367225   
    # get a screenshot to verify rendering
    Mouse Out    ${VIEWER_DIV}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    moment1_${key}.png
    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    moment1_${key}.png    220,345,134,255,112,255
    Remove Files    moment1_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


# TODO: load two images and create a moment image from each