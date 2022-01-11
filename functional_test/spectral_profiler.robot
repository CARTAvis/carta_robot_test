*** Settings ***
Documentation     Check the features in the spectral profiler
Resource          ../resource.robot

*** Test Cases ***
Region Spectral Profile
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   xpath://*[contains(text(), "M17_SWex.fits")]
    Load Region File    xpath://*[contains(text(), "region_001.crtf")]
    Sleep    5
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[1]/div[2]
    Click Element    xpath://*[contains(text(), "Styling")]
    Repeat Keyword    6    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_1"]/div/div[2]/div/div/div[2]/button[1]
    Click Element    //*[@id="root"]/div/div[14]/div[2]/div[1]/div[1]/div[3]
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/table/tbody/tr[5]
    Capture Element Screenshot    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    polygon_profile.png
    Click Element    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/table/tbody/tr[4]
    Capture Element Screenshot    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    ellipse_profile.png
    Click Element    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/table/tbody/tr[3]
    Capture Element Screenshot    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    rectangle_profile.png
    Click Element    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/table/tbody/tr[2]
    Capture Element Screenshot    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    point_profile.png
    Set Selenium Speed    0.02
    #PNG Pixel XY Should Match RGBA    polygon_profile.png    476,61,16,107,163,255
    #PNG Pixel XY Should Match RGBA    ellipse_profile.png    477,153,16,107,163,255
    #PNG Pixel XY Should Match RGBA    point_profile.png    477,90,16,107,163,255
    #PNG Pixel XY Should Match RGBA    rectangle_profile.png    477,58,16,107,163,255
    PNG Images Should Be Different    polygon_profile.png    ellipse_profile.png
    PNG Images Should Be Different    polygon_profile.png    point_profile.png
    PNG Images Should Be Different    polygon_profile.png    rectangle_profile.png
    PNG Images Should Be Different    ellipse_profile.png    point_profile.png
    PNG Images Should Be Different    ellipse_profile.png    rectangle_profile.png
    PNG Images Should Be Different    point_profile.png    rectangle_profile.png
    Remove Files    polygon_profile.png    ellipse_profile.png    point_profile.png    rectangle_profile.png
    [Teardown]    Kill carta_backend And Close Browser



