*** Settings ***
Documentation     Check the features in the spectral profiler
Resource          ../resource.robot

*** Test Cases ***
Region Spectral Profile
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   M17_SWex.fits
    Load Region File    region_001.crtf
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[2]
    Click Element    xpath://*[contains(text(), "Styling")]
    Repeat Keyword    6    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_1"]/div/div[2]/div/div/div[2]/button[1]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[4]
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    polygon_profile.png
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[4]
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    ellipse_profile.png
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[4]
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    rectangle_profile.png
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    point_profile.png
    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    polygon_profile.png    476,61,509,18
    PNG Two Pixels Should Not Have Matched RGBA    polygon_profile.png    476,61,476,30
    PNG Two Pixels Should Have Matched RGBA    ellipse_profile.png    477,153,541,17
    PNG Two Pixels Should Not Have Matched RGBA    ellipse_profile.png    477,153,477,32
    PNG Two Pixels Should Have Matched RGBA    point_profile.png    477,90,541,17
    PNG Two Pixels Should Not Have Matched RGBA    point_profile.png    477,90,510,21
    PNG Two Pixels Should Have Matched RGBA    rectangle_profile.png    477,58,541,17
    PNG Two Pixels Should Not Have Matched RGBA    rectangle_profile.png    477,58,486,21
    PNG Images Should Be Different    polygon_profile.png    ellipse_profile.png
    PNG Images Should Be Different    polygon_profile.png    point_profile.png
    PNG Images Should Be Different    polygon_profile.png    rectangle_profile.png
    PNG Images Should Be Different    ellipse_profile.png    point_profile.png
    PNG Images Should Be Different    ellipse_profile.png    rectangle_profile.png
    PNG Images Should Be Different    point_profile.png    rectangle_profile.png
    Remove Files    polygon_profile.png    ellipse_profile.png    point_profile.png    rectangle_profile.png
    [Teardown]    Kill carta_backend And Close Browser



Spectral Profile Visualization From Multiple Regions
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   M17_SWex.fits
    Load Region File    region_001.crtf
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[2]
    Click Element    xpath://*[contains(text(), "Styling")]
    Repeat Keyword    6    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_1"]/div/div[2]/div/div/div[2]/button[1]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[1]/div[2]/span[1]/label
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[1]/div[2]/span[2]/span/a
    # this is a hacky way to click elements that cannot be located...
    Click Element At Coordinates    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]    -60    -30
    Click Element At Coordinates    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]    -60    0
    Click Element At Coordinates    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]    -60    30
    Click Element At Coordinates    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]    -60    60
    
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[1]/div[2]/span[2]/span/a
    Sleep    1
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    check.png
    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check.png    373,108,473,63
    PNG Two Pixels Should Have Matched RGBA    check.png    378,100,476,90
    PNG Two Pixels Should Have Matched RGBA    check.png    378,87,476,101
    PNG Two Pixels Should Have Matched RGBA    check.png    476,76,542,67
    PNG Two Pixels Should Not Have Matched RGBA    check.png    373,108,538,33
    PNG Two Pixels Should Not Have Matched RGBA    check.png    378,100,538,33
    PNG Two Pixels Should Not Have Matched RGBA    check.png    378,87,538,33
    PNG Two Pixels Should Not Have Matched RGBA    check.png    476,76,538,33
    Mouse Over    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div/div[1]    Cursor: (86.748221 GHz, 1.25e-2), M17_SWex.fits, Region 1, Statistic Sum, Cooridnate Current
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div/div[2]    Cursor: (86.748221 GHz, 9.34e-3), M17_SWex.fits, Region 2, Statistic Mean, Cooridnate Current
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div/div[3]    Cursor: (86.748221 GHz, 4.58e-3), M17_SWex.fits, Region 3, Statistic Mean, Cooridnate Current
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div/div[4]    Cursor: (86.748221 GHz, 1.69e-2), M17_SWex.fits, Region 4, Statistic Mean, Cooridnate Current
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser




Spectral Profile Visualization From Multiple Statistics
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   M17_SWex.fits
    Load Region File    region_001.crtf
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[2]
    Click Element    xpath://*[contains(text(), "Styling")]
    Repeat Keyword    6    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_1"]/div/div[2]/div/div/div[2]/button[1]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[4]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[1]/div[3]/span[1]/label
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[1]/div[3]/span[2]/span/a
    # this is a hacky way to click elements that cannot be located...
    Click Element At Coordinates    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]    20    90
    Click Element At Coordinates    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]    20    30
    Click Element At Coordinates    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]    20    0
    
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[1]/div[3]/span[2]/span/a
    Sleep    1
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    check.png
    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check.png    511,16,545,20
    PNG Two Pixels Should Have Matched RGBA    check.png    511,25,545,29
    PNG Two Pixels Should Have Matched RGBA    check.png    511,36,545,38
    PNG Two Pixels Should Have Matched RGBA    check.png    511,110,545,101
    PNG Two Pixels Should Not Have Matched RGBA    check.png    511,16,511,75
    PNG Two Pixels Should Not Have Matched RGBA    check.png    511,25,511,75
    PNG Two Pixels Should Not Have Matched RGBA    check.png    511,36,511,75
    PNG Two Pixels Should Not Have Matched RGBA    check.png    511,110,511,75
    Mouse Over    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div/div[1]    Cursor: (86.748221 GHz, 1.69e-2), M17_SWex.fits, Region 4, Statistic Mean, Cooridnate Current
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div/div[2]    Cursor: (86.748221 GHz, 6.57e-2), M17_SWex.fits, Region 4, Statistic RMS, Cooridnate Current
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div/div[3]    Cursor: (86.748221 GHz, 6.34e-2), M17_SWex.fits, Region 4, Statistic StdDev, Cooridnate Current
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div/div[4]    Cursor: (86.748221 GHz, -6.15e-2), M17_SWex.fits, Region 4, Statistic Min, Cooridnate Current
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser



Spectral Profile Visualization From Multiple Images
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   HD163296_13CO_2-1_subimage.fits
    Append Image    HD163296_C18O_2-1_subimage.fits
    Append Image    HD163296_CO_2_1_subimage.fits
    Load Region File    region_003.crtf
    # matching cubes
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div/span[1]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div/span[2]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[13]/div/span[1]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[13]/div/span[2]
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[2]
    Click Element    xpath://*[contains(text(), "Styling")]
    Repeat Keyword    6    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_1"]/div/div[2]/div/div/div[2]/button[1]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[1]/div[1]/span[1]/label
    Sleep    1
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    check.png
    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check.png    568,19,593,46
    PNG Two Pixels Should Have Matched RGBA    check.png    567,77,595,86
    PNG Two Pixels Should Have Matched RGBA    check.png    564,108,599,110
    PNG Two Pixels Should Not Have Matched RGBA    check.png    568,19,585,68
    PNG Two Pixels Should Not Have Matched RGBA    check.png    567,77,585,68
    PNG Two Pixels Should Not Have Matched RGBA    check.png    564,108,585,68
    Mouse Over    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div/div[1]    Cursor: (-2.972 km/s, -5.99e-4), HD163296_13CO_2-1_subimage.fits, Region 2, Statistic Mean, Cooridnate Current
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div/div[2]    Cursor: (-8.971 km/s, -9.48e-5), HD163296_C18O_2-1_subimage.fits, Region 2, Statistic Mean, Cooridnate Current
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div/div[3]    Cursor: (-8.834 km/s, 9.46e-4), HD163296_CO_2_1_subimage.fits, Region 2, Statistic Mean, Cooridnate Current
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser


Single Spectral Profile Intensity Unit Conversion
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   M17_SWex.fits
    Mouse Over    ${VIEWER_DIV}
    Drag And Drop    //*[@id="SpectralProfilerButton"]    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[3]/div[1]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[2]/div[1]/div/div/div[2]/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[3]/div[1]/ul[2]/li[4]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[2]/div[2]/div/div/div/div    Data: (86.748221 GHz, -1.09e-2)

    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_0"]/div[3]/div
    Click Element    xpath://*[contains(text(), "mJy/beam")]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[2]/div[2]/div/div/div/div    Data: (86.748221 GHz, -1.09e+1)

    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_0"]/div[3]/div
    Click Element    xpath://*[contains(text(), "uJy/beam")]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[2]/div[2]/div/div/div/div    Data: (86.748221 GHz, -1.09e+4)

    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_0"]/div[3]/div
    Click Element    xpath://*[contains(text(), "MJy/sr")]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[2]/div[2]/div/div/div/div    Data: (86.748221 GHz, -1.34e+2)

    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_0"]/div[3]/div
    Click Element    xpath://*[contains(text(), "Jy/arcsec^2")]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[2]/div[2]/div/div/div/div    Data: (86.748221 GHz, -3.14e-3)

    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_0"]/div[3]/div
    Click Element    xpath://*[contains(text(), "mJy/arcsec^2")]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[2]/div[2]/div/div/div/div    Data: (86.748221 GHz, -3.14e+0)

    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_0"]/div[3]/div
    Click Element    xpath://*[contains(text(), "uJy/arcsec^2")]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[2]/div[2]/div/div/div/div    Data: (86.748221 GHz, -3.14e+3)

    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_0"]/div[3]/div
    Click Element    xpath://*[contains(text(), "mK")]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[2]/div[2]/div/div/div/div    Data: (86.748221 GHz, -5.77e+2)
    [Teardown]    Kill carta_backend And Close Browser


Single Spectral Profile Smoothing
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   M17_SWex.fits
    Load Region File    region_001.crtf
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[2]
    Click Element    xpath://*[contains(text(), "Styling")]
    Repeat Keyword    6    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_1"]/div/div[2]/div/div/div[2]/button[1]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[4]
    # click the smoothing button
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[1]/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div/div/div
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div/div/div/select/option[2]
    Repeat Keyword    3    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div[4]/div/div/div[2]/button[1]
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div[6]/div/label
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div[7]/div/div/div[2]/button[1]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div[1]/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    check_boxcar.png

    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[1]/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div/div/div
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div/div/div/select/option[3]
    Repeat Keyword    3    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div[7]/div/div/div[2]/button[1]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div[1]/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    check_gaussian.png

    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[1]/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div/div/div
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div/div/div/select/option[4]
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div[7]/div/div/div[2]/button[1]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div[1]/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    check_hanning.png

    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[1]/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div/div/div
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div/div/div/select/option[5]
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div[7]/div/div/div[2]/button[1]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div[1]/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    check_binning.png

    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[1]/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div/div/div
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div/div/div/select/option[6]
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div[7]/div/div/div[2]/button[1]
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div[8]/div/div/div[2]/button[1]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div[1]/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    check_Savitzky-Golay.png

    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[1]/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div/div/div
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div/div/div/select/option[7]
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div[7]/div/div/div[2]/button[1]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div[1]/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    check_decimation.png

    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[1]/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div/div/div
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div/div/div/select/option[1]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div[1]/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    check_original.png

    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check_boxcar.png    410,40,544,17
    PNG Two Pixels Should Have Matched RGBA    check_boxcar.png    410,74,544,61
    PNG Two Pixels Should Not Have Matched RGBA    check_boxcar.png    410,40,410,74
    PNG Two Pixels Should Have Matched RGBA    check_gaussian.png    410,40,544,17
    PNG Two Pixels Should Have Matched RGBA    check_gaussian.png    410,101,544,90
    PNG Two Pixels Should Not Have Matched RGBA    check_gaussian.png    410,40,410,101
    PNG Two Pixels Should Have Matched RGBA    check_hanning.png    410,40,544,17
    PNG Two Pixels Should Have Matched RGBA    check_hanning.png    410,83,544,70
    PNG Two Pixels Should Not Have Matched RGBA    check_hanning.png    410,40,410,83
    PNG Two Pixels Should Have Matched RGBA    check_binning.png    410,40,544,17
    PNG Two Pixels Should Have Matched RGBA    check_binning.png    410,108,510,61
    PNG Two Pixels Should Not Have Matched RGBA    check_binning.png    410,40,410,108
    PNG Two Pixels Should Have Matched RGBA    check_Savitzky-Golay.png    410,40,544,17
    PNG Two Pixels Should Have Matched RGBA    check_Savitzky-Golay.png    410,81,544,67
    PNG Two Pixels Should Not Have Matched RGBA    check_Savitzky-Golay.png    410,40,410,81
    PNG Two Pixels Should Have Matched RGBA    check_decimation.png    394,50,558,53
    PNG Two Pixels Should Have Matched RGBA    check_decimation.png    443,40,509,18
    PNG Two Pixels Should Not Have Matched RGBA    check_decimation.png    394,50,443,40
    PNG Two Pixels Should Have Matched RGBA    check_original.png    410,40,544,17
    PNG Two Pixels Should Not Have Matched RGBA    check_original.png    410,40,480,58
    Remove Files    check_boxcar.png    check_gaussian.png    check_hanning.png    check_binning.png    check_Savitzky-Golay.png    check_decimation.png    check_original.png
    [Teardown]    Kill carta_backend And Close Browser



Multiple Spectral Profiles Smoothing
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   HD163296_13CO_2-1_subimage.fits
    Append Image    HD163296_C18O_2-1_subimage.fits
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div/span[1]/a
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div/span[2]/a
    Load Region File    region_003.crtf
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[1]/div[1]/span[1]/label
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[2]
    Click Element    xpath://*[contains(text(), "Styling")]
    Repeat Keyword    4    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_1"]/div/div[3]/div/div/div[2]/button[1]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div[1]/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    check.png
    # apply smoothing
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[1]/a
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div/div/div
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div/div/div/select/option[5]
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div[4]/div/label
    Repeat Keyword    2  Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_2"]/div/div[5]/div/div/div[2]/button[1]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div[1]/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    check2.png

    Set Selenium Speed    0.02
    PNG Images Should Be Different    check.png    check2.png
    PNG Two Pixels Should Have Matched RGBA    check2.png    381,17,428,44
    PNG Two Pixels Should Have Matched RGBA    check2.png    365,35,407,57
    PNG Two Pixels Should Have Matched RGBA    check2.png    381,17,365,35
    PNG Two Pixels Should Not Have Matched RGBA    check2.png    381,17,406,98
    PNG Two Pixels Should Not Have Matched RGBA    check2.png    365,35,406,98
    PNG Two Pixels Should Have Matched RGBA    check2.png    361,120,392,121
    PNG Two Pixels Should Have Matched RGBA    check2.png    355,137,397,113
    PNG Two Pixels Should Have Matched RGBA    check2.png    361,120,355,137
    PNG Two Pixels Should Not Have Matched RGBA    check2.png    361,120,406,98
    PNG Two Pixels Should Not Have Matched RGBA    check2.png    355,137,406,98
    PNG Two Pixels Should Not Have Matched RGBA    check2.png    381,17,361,120
    PNG Two Pixels Should Not Have Matched RGBA    check2.png    365,35,355,137
    Remove Files    check.png    check2.png
    [Teardown]    Kill carta_backend And Close Browser


Spectral Profile Fitting Guess Then Fit
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[1]/a
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[2]/td[2]/div/div[1]/label[1]
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[3]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[3]/td[2]/div/div/input    63
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[3]/td[3]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[3]/td[3]/div/div/input    43
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[2]/td[2]/div/div[1]/label[1]
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[3]/div/a[2]
    Click Element    //*[@id="SpectralProfilerButton"]
    Sleep    0.5
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    check.png
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[3]/a    # profile fitting button
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[3]/div/div/span/a    # auto detect button
    Set Selenium Speed    0.02
    Element Should Contain    //*[@id="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[4]/div/div    detected 5 components.
    Element Attribute Value Should Be    //*[@id="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[5]/div/div/div[1]/div[1]/input    value    5
    Element Attribute Value Should Be    //*[@id="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[6]/div/div/div/div/input    value    349.47310991224464
    Element Attribute Value Should Be    //*[@id="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[7]/div/div/div/div/input    value    0.17664572759531438
    Element Attribute Value Should Be    //*[@id="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[8]/div/div/div/div/input    value    0.004394980985239272
    Set Selenium Speed    0.2
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]    # close fitting dialog
    Sleep    0.5
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    check2.png
    Set Selenium Speed    0.02
    PNG Images Should Be Different    check.png    check2.png
    PNG Two Pixels Should Not Have Matched RGBA    check2.png    100,80,200,80
    PNG Two Pixels Should Have Matched RGBA    check2.png    200,80,413,80
    PNG Two Pixels Should Have Matched RGBA    check2.png    413,80,545,80
    PNG Two Pixels Should Have Matched RGBA    check2.png    545,80,589,80
    PNG Two Pixels Should Not Have Matched RGBA    check2.png    589,80,747,80
    PNG Two Pixels Should Not Have Matched RGBA    check2.png    747,80,100,80    
    Set Selenium Speed    0.2
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[3]/a    # profile fitting button
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[3]/div/div/span/a
    Scroll Element Into View    //*[@id="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[2]/a[2]
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[2]/a[2]    # fit button
    Set Selenium Speed    0.02
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Component #1
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Center \= 349.387533 (GHz)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Center Error \= 0.000084 (0.000%)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Amplitude \= 0.190430 (Jy/beam)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Amplitude Error \= 0.006077 (3.191%)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    FWHM \= 0.005394 (GHz)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    FWHM Error \= 0.000199 (3.685%)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Integral \= 0.001093 (Jy/beam * GHz)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Integral Error ~\= 0.000035 (3.191%)

    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Component #2
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Center \= 349.421432 (GHz)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Center Error \= 0.000071 (0.000%)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Amplitude \= 0.208667 (Jy/beam)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Amplitude Error \= 0.006609 (3.167%)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    FWHM \= 0.004561 (GHz)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    FWHM Error \= 0.000167 (3.657%)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Integral \= 0.001013 (Jy/beam * GHz)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Integral Error ~\= 0.000032 (3.167%)

    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Component #3
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Center \= 349.441466 (GHz)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Center Error \= 0.000090 (0.000%)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Amplitude \= 0.215326 (Jy/beam)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Amplitude Error \= 0.005998 (2.786%)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    FWHM \= 0.005877 (GHz)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    FWHM Error \= 0.000233 (3.967%)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Integral \= 0.001347 (Jy/beam * GHz)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Integral Error ~\= 0.000044 (3.248%)

    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Component #4
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Center \= 349.448644 (GHz)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Center Error \= 0.000075 (0.000%)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Amplitude \= 0.212583 (Jy/beam)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Amplitude Error \= 0.007165 (3.371%)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    FWHM \= 0.003906 (GHz)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    FWHM Error \= 0.000181 (4.622%)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Integral \= 0.000884 (Jy/beam * GHz)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Integral Error ~\= 0.000037 (4.206%)

    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Component #5
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Center \= 349.473138 (GHz)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Center Error \= 0.000068 (0.000%)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Amplitude \= 0.205475 (Jy/beam)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Amplitude Error \= 0.006969 (3.392%)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    FWHM \= 0.004102 (GHz)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    FWHM Error \= 0.000161 (3.916%)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Integral \= 0.000897 (Jy/beam * GHz)
    Element Should Contain    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div    Integral Error ~\= 0.000030 (3.392%)
    Set Selenium Speed    0.2
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]    # close fitting dialog
    Sleep    0.5
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    check3.png
    Set Selenium Speed    0.02    
    PNG Images Should Be Different    check.png    check3.png
    PNG Images Should Be Different    check2.png    check3.png
    PNG Two Pixels Should Not Have Matched RGBA    check3.png    180,32,195,32
    PNG Two Pixels Should Have Matched RGBA    check3.png    195,32,413,21
    PNG Two Pixels Should Have Matched RGBA    check3.png    413,21,542,16
    PNG Two Pixels Should Have Matched RGBA    check3.png    542,16,587,16
    PNG Two Pixels Should Have Matched RGBA    check3.png    587,16,746,23
    PNG Two Pixels Should Have Matched RGBA    check3.png    746,23,207,143
    Set Selenium Speed    0.2
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[3]/a    # profile fitting button
    Scroll Element Into View    //*[@id="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[2]/a[1]
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[2]/a[1]    # reset button
    Set Selenium Speed    0.02
    Element Attribute Value Should Be    //*[@id="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[4]/div/div/div/div[1]/input    value    1
    Element Attribute Value Should Be    //*[@id="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[5]/div/div/div/div/input    value    0
    Element Attribute Value Should Be    //*[@id="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[6]/div/div/div/div/input    value    0
    Element Attribute Value Should Be    //*[@id="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[7]/div/div/div/div/input    value    0
    Element Should Contain    //*[@id="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[9]/div/div/div[1]/pre/div    ${EMPTY}
    Set Selenium Speed    0.2
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[3]    # close fitting dialog
    Sleep    0.5
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    check4.png
    Sleep    5
    PNG Images Should Be Identical    check.png    check4.png
    Remove Files    check.png    check2.png    check3.png    check4.png
    [Teardown]    Kill carta_backend And Close Browser








# TODO: add multi-profile test for polarization when the bug is fixed.