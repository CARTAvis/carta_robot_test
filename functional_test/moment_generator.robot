*** Settings ***
Documentation     Test moment map generator functionalities 
Resource          ../resource.robot

*** Test Cases ***
Generate A Moment Image From FITS Cube
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Mouse Over    ${VIEWER_DIV}
    Click Element    //*[@id="SpectralProfilerButton"]
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
    Click Element    //*[@id="SpectralProfilerButton"]
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
    Click Element    //*[@id="SpectralProfilerButton"]
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
    Click Element    //*[@id="SpectralProfilerButton"]
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
    Click Element    //*[@id="SpectralProfilerButton"]
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
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    # set mask mode to include
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[8]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[8]/div/div/select/option[2]
    # set mask range from value to 0.03
    Press Keys    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[9]/div/div/div[1]/div/div/div/input    DELETE
    Input Text    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[9]/div/div/div[1]/div/div/div/input    0.03
    # select all kinds of moments
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[11]/div/div/div/div/div/button
    Click Element    xpath://*[contains(text(), "-1: Mean value of the spectrum")]
    Click Element    xpath://*[contains(text(), "0: Integrated value of the spectrum")]
    Click Element    xpath://*[contains(text(), "1: Intensity weighted coordinate")]
    Click Element    xpath://*[contains(text(), "2: Intensity weighted dispersion of the coordinate")]
    Click Element    xpath://*[contains(text(), "3: Median value of the spectrum")]
    Click Element    xpath://*[contains(text(), "4: Median coordinate")]
    Click Element    xpath://*[contains(text(), "5: Standard deviation about the mean of the spectrum")]
    Click Element    xpath://*[contains(text(), "6: Root mean square of the spectrum")]
    Click Element    xpath://*[contains(text(), "7: Absolute mean deviation of the spectrum")]
    Click Element    xpath://*[contains(text(), "8: Maximum value of the spectrum")]
    Click Element    xpath://*[contains(text(), "9: Coordinate of the maximum value of the spectrum")]
    Click Element    xpath://*[contains(text(), "10: Minimum value of the spectrum")]
    Click Element    xpath://*[contains(text(), "11: Coordinate of the minimum value of the spectrum")]
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=10
    #Sleep    5
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    ${SPECTRAL_PROFILER_CLOSE_BUTTON}
    # create a statistics widget and dock it to the panel with the X spatial profiler
    Drag And Drop    //*[@id="StatisticsWidgetButton"]    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[1]/div[1]
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.minimum_coord
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE_DOCKED}    8    2    3.025600051880e+1 km/s
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    moment_11_${key}.png
    Click Element    xpath://*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.minimum
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE_DOCKED}    8    2    2.420960962772e-1 Jy/beam
    Capture Element Screenshot    ${VIEWER_DIV}    moment_10_${key}.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.maximum_coord
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE_DOCKED}    8    2    3.025600051880e+1 km/s
    Capture Element Screenshot    ${VIEWER_DIV}    moment_9_${key}.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.maximum
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE_DOCKED}    8    2    4.446276426315e-1 Jy/beam
    Capture Element Screenshot    ${VIEWER_DIV}    moment_8_${key}.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.abs_mean_dev
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE_DOCKED}    8    2    1.477163285017e-1 Jy/beam
    Capture Element Screenshot    ${VIEWER_DIV}    moment_7_${key}.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.rms
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE_DOCKED}    8    2    2.927759885788e-1 Jy/beam
    Capture Element Screenshot    ${VIEWER_DIV}    moment_6_${key}.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.standard_deviation
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE_DOCKED}    8    2    1.882859319448e-1 Jy/beam
    Capture Element Screenshot    ${VIEWER_DIV}    moment_5_${key}.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.median_coord
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE_DOCKED}    8    2    3.025600051880e+1 km/s
    Capture Element Screenshot    ${VIEWER_DIV}    moment_4_${key}.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.median
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE_DOCKED}    8    2    2.901065945625e-1 Jy/beam
    Capture Element Screenshot    ${VIEWER_DIV}    moment_3_${key}.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.weighted_dispersion_coord
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE_DOCKED}    8    2    5.907100677490e+0 km/s
    Capture Element Screenshot    ${VIEWER_DIV}    moment_2_${key}.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.weighted_coord
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE_DOCKED}    8    2    3.025600051880e+1 km/s
    Capture Element Screenshot    ${VIEWER_DIV}    moment_1_${key}.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.integrated
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE_DOCKED}    8    2    8.415695428848e-1 Jy/beam.km/s
    Capture Element Screenshot    ${VIEWER_DIV}    moment_0_${key}.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.average
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE_DOCKED}    8    2    2.551147937775e-1 Jy/beam
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
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    # use the image dropdown to explicitly select M17_SWex.fits
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select/option[2]
    Element Should Contain    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/label/span    M17
    # use the region dropdown to explicitly select Region 4
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select/option[7]
    Element Should Contain    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/label/span/span    Region 4
    # use the coordinate dropdown to select radio velocity as the reference 
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[4]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[4]/div/div/select/option[1]
    # set velocity range from 15 to 25
    Press Keys    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[6]/div/div/div[1]/div/div/div/input    DELETE
    Input Text    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[6]/div/div/div[1]/div/div/div/input    15
    Press Keys    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[6]/div/div/div[2]/div/div/div/input    DELETE
    Input Text    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[6]/div/div/div[2]/div/div/div/input    25
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    #Sleep    2
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    ${SPECTRAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${FILE_HEADER_DIALOG_BUTTON}
    # switch to the file information tab
    Click Element    //*[@id="bp3-tab-title_file-info-tabs_image-file"]
    # verify file info context
    Element Should Contain    //*[@id="root"]/div/div[6]/div[1]/div/div[2]/div/div[2]/div/div[2]/div/div    M17_SWex.fits.moment.integrated
    Element Should Contain    //*[@id="root"]/div/div[6]/div[1]/div/div[2]/div/div[2]/div/div[2]/div/div    [116, 128, 1, 1]
    [Teardown]    Kill carta_backend And Close Browser


Generate Moment Images From Unmatched Cubes
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Append Image    M17_SWex.hdf5
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    #Sleep    2
    # use the image dropdown to explicitly select M17_SWex.fits
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select/option[2]
    Element Should Be Enabled    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    #Sleep    2
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    ${SPECTRAL_PROFILER_CLOSE_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.integrated
    Click Element    xpath://*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.hdf5.moment.integrated
    [Teardown]    Kill carta_backend And Close Browser


Generate Moment Images From Matched Cubes
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    # create an ellipse region at the image view center via the region shortcut button
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[4]/a
    Click Element    ${VIEWER_DIV}
    Append Image    M17_SWex.hdf5
    # trigger image matching
    Mouse Over    //*[@id="image-panel-1-0"]/div[8]/div/div/canvas
    Click Element    //*[@id="image-panel-1-0"]/div[9]/span[9]/span/a
    Click Element    xpath://*[contains(text(), "Spectral (VRAD) and spatial")]
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    #Sleep    2
    # use the image dropdown to explicitly select M17_SWex.fits
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select/option[2]
    Element Should Be Enabled    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    #Sleep    2
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    ${SPECTRAL_PROFILER_CLOSE_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits.moment.integrated
    Click Element    xpath://*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.hdf5.moment.integrated
    [Teardown]    Kill carta_backend And Close Browser


Generate A Moment Image With A Region Mask FITS
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Load Region File    region_001.crtf
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    # use the region dropdown to select Region 2
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select
    # Cursor region
    Element Should be Disabled    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select/option[3]
    # Region 1
    Element Should be Disabled    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select/option[4]
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select/option[5]
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
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    # use the image dropdown to select M17_SWex.fits
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select/option[2]
    # use the region dropdown to select Region 3
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select/option[6]
    # move the dialog so that the generate button is clickable in the view
    Drag And Drop By Offset    //*[@id="root"]/div/div[18]/div[2]/div[1]/div[1]    0    50
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    ${SPECTRAL_PROFILER_CLOSE_BUTTON}
    #Sleep    2
    Capture Element Screenshot    ${VIEWER_DIV}    moment_ellipse_mask_${key}.png
    PNG Two Pixels Should Have Matched RGBA    moment_ellipse_mask_${key}.png    228,74,236,66
    PNG Two Pixels Should Not Have Matched RGBA    moment_ellipse_mask_${key}.png    228,74,236,74
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    # use the image dropdown to select M17_SWex.fits
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select/option[2]
    # use the region dropdown to select Region 4
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select/option[7]
    # move the dialog so that the generate button is clickable in the view
    Drag And Drop By Offset    //*[@id="root"]/div/div[18]/div[2]/div[1]/div[1]    0    50
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
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    # use the region dropdown to select Region 2
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select
    # Cursor region
    Element Should be Disabled    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select/option[3]
    # Region 1
    Element Should be Disabled    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select/option[4]
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select/option[5]
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
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    # use the image dropdown to select M17_SWex.fits
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select/option[2]
    # use the region dropdown to select Region 3
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select/option[6]
    # move the dialog so that the generate button is clickable in the view
    Drag And Drop By Offset    //*[@id="root"]/div/div[18]/div[2]/div[1]/div[1]    0    50
    Click Element    ${MOMENT_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    ${SPECTRAL_PROFILER_CLOSE_BUTTON}
    #Sleep    2
    Capture Element Screenshot    ${VIEWER_DIV}    moment_ellipse_mask_${key}.png
    PNG Two Pixels Should Have Matched RGBA    moment_ellipse_mask_${key}.png    228,74,236,66
    PNG Two Pixels Should Not Have Matched RGBA    moment_ellipse_mask_${key}.png    228,74,236,74
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    ${MOMENT_GENERATOR_BUTTON}
    # use the image dropdown to select M17_SWex.fits
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select/option[2]
    # use the region dropdown to select Region 4
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select/option[7]
    # move the dialog so that the generate button is clickable in the view
    Drag And Drop By Offset    //*[@id="root"]/div/div[18]/div[2]/div[1]/div[1]    0    50
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


# TODO: load two images and create a moment image from each