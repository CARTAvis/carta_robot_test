*** Settings ***
Documentation     Test conversions of spectral conventions
Resource          ../resource.robot

*** Test Cases ***
Spectral Axis Conversion from FREQ
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    # set cursor position
    Mouse Over    ${VIEWER_DIV}
    # enable the spectral profiler widget
    Click Element    id:SpectralProfilerButton
    # switch channel by click
    Click Element    ${SPECTRAL_PROFILER_PLOT}
    # check default spectral unit (frequency)
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Cursor: (349.425009 GHz, 1.29e-1)
    # switch to different spectral units
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[1]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (-287.700 km/s, 1.29e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[2]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (-287700.185 m/s, 1.29e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[3]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (-287.424 km/s, 1.29e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[4]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (-287424.354 m/s, 1.29e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[5]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (349.425009 GHz, 1.29e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[6]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (349425.009 MHz, 1.29e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[7]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (349425009.287 kHz, 1.29e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[8]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (349425009287.017 Hz, 1.29e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[9]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (0.00085795936 m, 1.29e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[10]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (0.85795936 mm, 1.29e-1)    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[11]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (857.95936 um, 1.29e-1)    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[12]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (857959.362 nm, 1.29e-1)   
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[13]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (8579593.619 Angstrom, 1.29e-1)   
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[14]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (0.000000736094 m^2, 1.29e-1) 
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[15]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (0.73609427 mm^2, 1.29e-1) 
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[16]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (736094.267 um^2, 1.29e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[17]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (736094266672.881 nm^2, 1.29e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[18]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (73609426667288.125 Angstrom^2, 1.29e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[19]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (0.00085771267 m, 1.29e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[20]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (0.85771267 mm, 1.29e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[21]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (857.71267 um, 1.29e-1)                               
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[22]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (857712.67 nm, 1.29e-1)                             
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[23]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (8577126.704 Angstrom, 1.29e-1)            
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[24]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (0.000000735671 m^2, 1.29e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[25]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (0.73567103 mm^2, 1.29e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[26]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (735671.025 um^2, 1.29e-1)        
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[27]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (735671025033.546 nm^2, 1.29e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[28]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (73567102503354.563 Angstrom^2, 1.29e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[29]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (Channel 112, 1.29e-1)
    [Teardown]    Kill carta_backend And Close Browser


Spectral Axis Conversion from VRAD
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M100_combine_CO_cube.image.asVelo.fits
    # set cursor position
    Mouse Over    ${VIEWER_DIV}
    # enable the spectral profiler widget
    Click Element    id:SpectralProfilerButton
    # switch channel by click
    Click Element    ${SPECTRAL_PROFILER_PLOT}
    # check default spectral unit (frequency)
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Cursor: (1554.999 km/s, -1.18e-2)
    # switch to different spectral units
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[1]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (1554.999 km/s, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[2]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (1554999.483 m/s, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[3]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (1563.107 km/s, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[4]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (1563107.194 m/s, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[5]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (114.6733 GHz, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[6]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (114673.299 MHz, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[7]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (114673299.303 kHz, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[8]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (114673299303.228 Hz, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[9]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (0.0026143179 m, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[10]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (2.6143179 mm, -1.18e-2)    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[11]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (2614.3179 um, -1.18e-2)    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[12]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (2614317.891 nm, -1.18e-2)   
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[13]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (26143178.911 Angstrom, -1.18e-2)   
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[14]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (0.000006834658 m^2, -1.18e-2) 
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[15]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (6.834658 mm^2, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[16]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (6834658.036 um^2, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[17]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (6834658035730.334 nm^2, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[18]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (683465803573033.5 Angstrom^2, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[19]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (0.0026135662 m, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[20]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (2.6135662 mm, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[21]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (2613.5662 um, -1.18e-2)                             
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[22]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (2613566.189 nm, -1.18e-2)                             
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[23]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (26135661.89 Angstrom, -1.18e-2)            
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[24]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (0.000006830728 m^2, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[25]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (6.830728 mm^2, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[26]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (6830728.224 um^2, -1.18e-2)        
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[27]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (6830728224043.915 nm^2, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[28]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (683072822404391.625 Angstrom^2, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[29]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (Channel 31, -1.18e-2)
    [Teardown]    Kill carta_backend And Close Browser


Spectral Axis Conversion from VOPT
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M100_combine_CO_cube_optical_velo.fits
    # set cursor position
    Mouse Over    ${VIEWER_DIV}
    # enable the spectral profiler widget
    Click Element    id:SpectralProfilerButton
    # switch channel by click
    Click Element    ${SPECTRAL_PROFILER_PLOT}
    # check default spectral unit (frequency)
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Cursor: (1563.029 km/s, -1.18e-2)
    # switch to different spectral units
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[1]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (1554.922 km/s, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[3]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (1563.029 km/s, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[6]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (114673.329 MHz, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[10]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (2.6143172 mm, -1.18e-2) 
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[15]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (6.834654 mm^2, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[20]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (2.6135655 mm, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[25]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (6.830725 mm^2, -1.18e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[29]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (Channel 31, -1.18e-2)
    [Teardown]    Kill carta_backend And Close Browser


Spectral Axis Conversion from WAVE
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    jw03368-o043_t029_miri_ch1-long_s3d.fits
    # set cursor position
    Mouse Over    ${VIEWER_DIV}
    # enable the spectral profiler widget
    Click Element    id:SpectralProfilerButton
    # switch channel by click
    Click Element    ${SPECTRAL_PROFILER_PLOT}
    # check default spectral unit (frequency)
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Cursor: (0.007032 mm, 9.86e+1)
    # switch to different spectral units
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[1]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (42632.601 GHz, 9.86e+1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[7]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (7.032 um, 9.86e+1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[12]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (49.449 um^2, 9.86e+1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[17]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (7.029978 um, 9.86e+1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[22]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (49.4206 um^2, 9.86e+1)      
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[25]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (Channel 627, 9.86e+1)    
    [Teardown]    Kill carta_backend And Close Browser


Spectral Axis Conversion from AWAV
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    ADP.2016-07-12T14_02_12.047_subimage.fits
    # set cursor position
    Mouse Over    ${VIEWER_DIV}
    # enable the spectral profiler widget
    Click Element    id:SpectralProfilerButton
    # switch channel by click
    Click Element    ${SPECTRAL_PROFILER_PLOT}
    # check default spectral unit (frequency)
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Cursor: (0.000480592 mm, 1.06e+3)
    # switch to different spectral units
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[1]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (623613.725 GHz, 1.06e+3)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[7]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (0.480734 um, 1.06e+3)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[12]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (0.231105 um^2, 1.06e+3)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[17]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (0.480592 um, 1.06e+3)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[22]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (0.230969 um^2, 1.06e+3)      
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[1]/div/div/select/option[25]
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (Channel 45, 1.06e+3)    
    [Teardown]    Kill carta_backend And Close Browser


Spectral Reference Frame Conversion
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    # set cursor position
    Mouse Over    ${VIEWER_DIV}
    # enable the spectral profiler widget
    Click Element    id:SpectralProfilerButton
    # switch channel by click
    Click Element    ${SPECTRAL_PROFILER_PLOT}
    # check default spectral unit (LSRK frequency)
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Cursor: (349.425009 GHz, 1.29e-1)    
    # switch to different spectral reference frames
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[2]/div/div/select/option[1]    # LSRK
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (349.425009 GHz, 1.29e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[2]/div/div/select/option[2]    # LSRD     
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (349.42272 GHz, 1.29e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[2]/div/div/select/option[3]    # BARYCENT     
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (349.40944 GHz, 1.29e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[2]/div/div/select/option[4]    # TOPOCENT     
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (349.404532 GHz, 1.29e-1)   
    [Teardown]    Kill carta_backend And Close Browser
