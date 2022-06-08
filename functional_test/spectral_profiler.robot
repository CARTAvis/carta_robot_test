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
    Pass Execution    Skip until a CI bug is fixed...
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
    PNG Pixel XY Should Match RGBA    check.png    476,63,194,48,48,255
    PNG Pixel XY Should Match RGBA    check.png    476,75,99,77,191,255
    PNG Pixel XY Should Match RGBA    check.png    476,90,117,47,117,255
    PNG Pixel XY Should Match RGBA    check.png    476,101,125,81,37,255
    Mouse Over    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div/div[1]    Cursor: (86.748221 GHz, 1.25e-2), M17_SWex.fits, Region 1, Statistic Sum, Cooridnate Current
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div/div[2]    Cursor: (86.748221 GHz, 9.34e-3), M17_SWex.fits, Region 2, Statistic Mean, Cooridnate Current
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div/div[3]    Cursor: (86.748221 GHz, 4.58e-3), M17_SWex.fits, Region 3, Statistic Mean, Cooridnate Current
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div/div[4]    Cursor: (86.748221 GHz, 1.69e-2), M17_SWex.fits, Region 4, Statistic Mean, Cooridnate Current
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser


