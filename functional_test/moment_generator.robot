*** Settings ***
Documentation     Test moment map generator functionalities 
Resource          ../resource.robot

*** Test Cases ***
Generate A Moment Image From FITS Cube
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Mouse Over    ${VIEWER_DIV}
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[2]/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[12]/span/a
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[5]
    Sleep    2
    Capture Element Screenshot    ${VIEWER_DIV}    test.png
    PNG Two Pixels Should Have Matched RGBA    test.png    529,160,542,158
    PNG Two Pixels Should Not Have Matched RGBA    test.png    150,158,542,158
    Remove Files    test.png
    [Teardown]    Kill carta_backend And Close Browser

Generate A Moment Image From CASA Cube
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.image
    Mouse Over    ${VIEWER_DIV}
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[2]/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[12]/span/a
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[5]
    Sleep    2
    Capture Element Screenshot    ${VIEWER_DIV}    test.png
    PNG Two Pixels Should Have Matched RGBA    test.png    529,160,542,158
    PNG Two Pixels Should Not Have Matched RGBA    test.png    150,158,542,158
    Remove Files    test.png
    [Teardown]    Kill carta_backend And Close Browser

Generate A Moment Image From MIRIAD Cube
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.miriad
    Mouse Over    ${VIEWER_DIV}
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[2]/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[12]/span/a
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[5]
    Sleep    2
    Capture Element Screenshot    ${VIEWER_DIV}    test.png
    PNG Two Pixels Should Have Matched RGBA    test.png    529,160,542,158
    PNG Two Pixels Should Not Have Matched RGBA    test.png    150,158,542,158
    Remove Files    test.png
    [Teardown]    Kill carta_backend And Close Browser

Generate A Moment Image From HDF5 Cube
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.hdf5
    Mouse Over    ${VIEWER_DIV}
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[2]/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[12]/span/a
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[5]
    Sleep    2
    Capture Element Screenshot    ${VIEWER_DIV}    test.png
    PNG Two Pixels Should Have Matched RGBA    test.png    529,160,542,158
    PNG Two Pixels Should Not Have Matched RGBA    test.png    150,158,542,158
    Remove Files    test.png
    [Teardown]    Kill carta_backend And Close Browser

Generate All Moment Images
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[2]/li[2]/span
    Mouse Over    ${VIEWER_DIV}
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[2]/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[8]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[8]/div/div/select/option[2]
    Press Keys    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[9]/div/div/div[1]/div/div/div/input    DELETE
    Input Text    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[9]/div/div/div[1]/div/div/div/input    0.03
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
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[12]/span/a
    Wait Until Page Does Not Contain    Generating Moments    timeout=10
    Sleep    5
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[5]
    Drag And Drop    //*[@id="StatisticsWidgetButton"]    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[1]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    M17_SWex.fits.moment.minimum_coord
    Table Cell Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div/div/div[2]/table    8    2    3.025600051880e+1 km/s
    Capture Element Screenshot    ${VIEWER_DIV}    moment_11.png
    Click Element    xpath://*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    M17_SWex.fits.moment.minimum
    Table Cell Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div/div/div[2]/table    8    2    2.420960962772e-1 Jy/beam
    Capture Element Screenshot    ${VIEWER_DIV}    moment_10.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    M17_SWex.fits.moment.maximum_coord
    Table Cell Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div/div/div[2]/table    8    2    3.025600051880e+1 km/s
    Capture Element Screenshot    ${VIEWER_DIV}    moment_9.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    M17_SWex.fits.moment.maximum
    Table Cell Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div/div/div[2]/table    8    2    4.446276426315e-1 Jy/beam
    Capture Element Screenshot    ${VIEWER_DIV}    moment_8.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    M17_SWex.fits.moment.abs_mean_dev
    Table Cell Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div/div/div[2]/table    8    2    1.477163285017e-1 Jy/beam
    Capture Element Screenshot    ${VIEWER_DIV}    moment_7.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    M17_SWex.fits.moment.rms
    Table Cell Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div/div/div[2]/table    8    2    2.927759885788e-1 Jy/beam
    Capture Element Screenshot    ${VIEWER_DIV}    moment_6.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    M17_SWex.fits.moment.standard_deviation
    Table Cell Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div/div/div[2]/table    8    2    1.882859319448e-1 Jy/beam
    Capture Element Screenshot    ${VIEWER_DIV}    moment_5.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    M17_SWex.fits.moment.median_coord
    Table Cell Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div/div/div[2]/table    8    2    3.025600051880e+1 km/s
    Capture Element Screenshot    ${VIEWER_DIV}    moment_4.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    M17_SWex.fits.moment.median
    Table Cell Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div/div/div[2]/table    8    2    2.901065945625e-1 Jy/beam
    Capture Element Screenshot    ${VIEWER_DIV}    moment_3.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    M17_SWex.fits.moment.weighted_dispersion_coord
    Table Cell Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div/div/div[2]/table    8    2    5.907100677490e+0 km/s
    Capture Element Screenshot    ${VIEWER_DIV}    moment_2.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    M17_SWex.fits.moment.weighted_coord
    Table Cell Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div/div/div[2]/table    8    2    3.025600051880e+1 km/s
    Capture Element Screenshot    ${VIEWER_DIV}    moment_1.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    M17_SWex.fits.moment.integrated
    Table Cell Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div/div/div[2]/table    8    2    8.415695428848e-1 Jy/beam.km/s
    Capture Element Screenshot    ${VIEWER_DIV}    moment_0.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    M17_SWex.fits.moment.average
    Table Cell Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div/div/div[2]/table    8    2    2.551147937775e-1 Jy/beam
    Capture Element Screenshot    ${VIEWER_DIV}    moment_-1.png
    Sleep    1
    Set Selenium Speed    0.01
    PNG Images Should Be Different    moment_-1.png    moment_0.png
    PNG Images Should Be Different    moment_-1.png    moment_1.png
    PNG Images Should Be Different    moment_-1.png    moment_2.png
    PNG Images Should Be Different    moment_-1.png    moment_3.png
    PNG Images Should Be Different    moment_-1.png    moment_4.png
    PNG Images Should Be Different    moment_-1.png    moment_5.png
    PNG Images Should Be Different    moment_-1.png    moment_6.png
    PNG Images Should Be Different    moment_-1.png    moment_7.png
    PNG Images Should Be Different    moment_-1.png    moment_8.png
    PNG Images Should Be Different    moment_-1.png    moment_9.png
    PNG Images Should Be Different    moment_-1.png    moment_10.png
    PNG Images Should Be Different    moment_-1.png    moment_11.png
    Set Selenium Speed    0.2
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[2]/li[2]/span
    Sleep    1
    Remove Files    moment_*.png
    [Teardown]    Kill carta_backend And Close Browser


Generate A Moment Image With Custom Parameters
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Load Region File    region_001.crtf
    Append Image    S255_CH3CN_subcube.fits
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[2]/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select/option[2]
    Element Should Contain    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/label/span    M17
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select/option[7]
    Element Should Contain    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/label/span/span    Region 4
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[4]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[4]/div/div/select/option[1]
    Press Keys    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[6]/div/div/div[1]/div/div/div/input    DELETE
    Input Text    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[6]/div/div/div[1]/div/div/div/input    15
    Press Keys    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[6]/div/div/div[2]/div/div/div/input    DELETE
    Input Text    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[6]/div/div/div[2]/div/div/div/input    25
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[12]/span/a
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Sleep    2
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[5]
    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[1]/a
    Click Element    //*[@id="bp3-tab-title_file-info-tabs_image-file"]
    Element Should Contain    //*[@id="root"]/div/div[6]/div[1]/div/div[2]/div/div[2]/div/div[2]/div/div    M17_SWex.fits.moment.integrated
    Element Should Contain    //*[@id="root"]/div/div[6]/div[1]/div/div[2]/div/div[2]/div/div[2]/div/div    [116, 128, 1, 1]
    [Teardown]    Kill carta_backend And Close Browser


Generate Moment Images From Unmatched Cubes
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Append Image    M17_SWex.hdf5
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[2]/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[12]/span/a
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Sleep    2
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select/option[2]
    Element Should Be Enabled    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[12]/span/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[12]/span/a
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Sleep    2
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[5]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    M17_SWex.fits.moment.integrated
    Click Element    xpath://*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    M17_SWex.hdf5.moment.integrated
    [Teardown]    Kill carta_backend And Close Browser


Generate Moment Images From Matched Cubes
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[4]/a
    Click Element    ${VIEWER_DIV}
    Append Image    M17_SWex.hdf5
    Mouse Over    //*[@id="image-panel-1-0"]/div[8]/div/div/canvas
    Click Element    //*[@id="image-panel-1-0"]/div[9]/span[9]/span/a
    Click Element    xpath://*[contains(text(), "Spectral (VRAD) and Spatial")]
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[2]/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[12]/span/a
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Sleep    2
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select/option[2]
    Element Should Be Enabled    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[12]/span/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[12]/span/a
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Sleep    2
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[5]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    M17_SWex.fits.moment.integrated
    Click Element    xpath://*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    M17_SWex.hdf5.moment.integrated
    [Teardown]    Kill carta_backend And Close Browser


Generate A Moment Image With A Region Mask FITS
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Load Region File    region_001.crtf
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[2]/li[2]
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[2]/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select
    Element Should be Disabled    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select/option[3]
    Element Should be Disabled    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select/option[4]
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select/option[5]
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[12]/span/a
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[5]
    Sleep    2
    Capture Element Screenshot    ${VIEWER_DIV}    moment_rectangle_mask.png
    PNG Two Pixels Should Have Matched RGBA    moment_rectangle_mask.png    403,186,410,186
    PNG Two Pixels Should Not Have Matched RGBA    moment_rectangle_mask.png    403,178,410,186
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[2]/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select/option[2]
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select/option[6]
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[12]/span/a
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[5]
    Sleep    2
    Capture Element Screenshot    ${VIEWER_DIV}    moment_ellipse_mask.png
    PNG Two Pixels Should Have Matched RGBA    moment_ellipse_mask.png    228,74,236,66
    PNG Two Pixels Should Not Have Matched RGBA    moment_ellipse_mask.png    228,74,236,74
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[2]/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select/option[2]
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select/option[7]
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[12]/span/a
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[5]
    Sleep    2
    Capture Element Screenshot    ${VIEWER_DIV}    moment_polygon_mask.png
    PNG Two Pixels Should Have Matched RGBA    moment_polygon_mask.png    451,102,451,103
    PNG Two Pixels Should Not Have Matched RGBA    moment_polygon_mask.png    451,102,200,102
    Remove Files    moment_rectangle_mask.png    moment_ellipse_mask.png    moment_polygon_mask.png
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[2]/li[2]
    Sleep    2
    [Teardown]    Kill carta_backend And Close Browser


Generate A Moment Image With A Region Mask HDF5
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.hdf5
    Load Region File    region_001.crtf
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[2]/li[2]
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[2]/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select
    Element Should be Disabled    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select/option[3]
    Element Should be Disabled    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select/option[4]
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select/option[5]
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[12]/span/a
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[5]
    Sleep    2
    Capture Element Screenshot    ${VIEWER_DIV}    moment_rectangle_mask.png
    PNG Two Pixels Should Have Matched RGBA    moment_rectangle_mask.png    403,186,410,186
    PNG Two Pixels Should Not Have Matched RGBA    moment_rectangle_mask.png    403,178,410,186
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[2]/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select/option[2]
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select/option[6]
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[12]/span/a
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[5]
    Sleep    2
    Capture Element Screenshot    ${VIEWER_DIV}    moment_ellipse_mask.png
    PNG Two Pixels Should Have Matched RGBA    moment_ellipse_mask.png    228,74,236,66
    PNG Two Pixels Should Not Have Matched RGBA    moment_ellipse_mask.png    228,74,236,74
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[2]/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[1]/div/div/select/option[2]
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[2]/div/div/select/option[7]
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[12]/span/a
    Wait Until Page Does Not Contain    Generating Moments    timeout=5
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[5]
    Sleep    2
    Capture Element Screenshot    ${VIEWER_DIV}    moment_polygon_mask.png
    PNG Two Pixels Should Have Matched RGBA    moment_polygon_mask.png    451,102,451,103
    PNG Two Pixels Should Not Have Matched RGBA    moment_polygon_mask.png    451,102,200,102
    Remove Files    moment_rectangle_mask.png    moment_ellipse_mask.png    moment_polygon_mask.png
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[2]/li[2]
    Sleep    2
    [Teardown]    Kill carta_backend And Close Browser


# TODO: load two images and create a moment image from each