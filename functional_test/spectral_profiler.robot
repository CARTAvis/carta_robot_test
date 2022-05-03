*** Settings ***
Documentation     Check the features in the spectral profiler
Resource          ../resource.robot

*** Test Cases ***
Region Spectral Profile
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   M17_SWex.fits
    Load Region File    region_001.crtf
    Sleep    5
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    //*[@id="root"]/div/div[15]/div/div[1]/div[1]/div[2]
    Click Element    xpath://*[contains(text(), "Styling")]
    Repeat Keyword    6    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_1"]/div/div[2]/div/div/div[2]/button[1]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div[1]/div[1]/div[3]
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    //*[@id="root"]/div/div[14]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[4]
    Capture Element Screenshot    //*[@id="root"]/div/div[15]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    polygon_profile.png
    Click Element    //*[@id="root"]/div/div[14]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[4]
    Capture Element Screenshot    //*[@id="root"]/div/div[15]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    ellipse_profile.png
    Click Element    //*[@id="root"]/div/div[14]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[4]
    Capture Element Screenshot    //*[@id="root"]/div/div[15]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    rectangle_profile.png
    Click Element    //*[@id="root"]/div/div[14]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]
    Capture Element Screenshot    //*[@id="root"]/div/div[15]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    point_profile.png
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



