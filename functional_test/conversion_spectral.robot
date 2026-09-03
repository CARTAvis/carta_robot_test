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


Rest Frame Conversion - Insufficient Header
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    12CO-2.S115Q.FITS
    # create a rectangle region
    Click Element    data:testid:rectangle-region-shortcut-button
    Click Element    ${VIEWER_DIV}
    # enable the spectral profiler widget
    Click Element    id:SpectralProfilerButton
    # enable the settings dialog
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}
    # check that the rest frame conversion is disabled, as the header contains velocity info only without frequency info
    Element Should Be Disabled    data:testid:spectral-profiler-x-axis-rest-frame-switch
    Element Should Be Disabled    data:testid:spectral-profiler-y-axis-rest-frame-switch
    [Teardown]    Kill carta_backend And Close Browser


Rest Frame Conversion - High-z Multi-CO Cube
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    CO_multiline_z20_cube.fits
    # create a rectangle region
    Click Element    data:testid:rectangle-region-shortcut-button
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    # switch to image Cooridnate and set a new center position and size for the region
    Click Element    //*[contains(text(), "Image")]
    Press Keys    //input[@placeholder="X Coordinate"]    DELETE
    Input Text    //input[@placeholder="X Coordinate"]    25
    Press Keys    //input[@placeholder="Y Coordinate"]    DELETE
    Input Text    //input[@placeholder="Y Coordinate"]    25
    Press Keys    //input[@placeholder="Width"]    DELETE
    Input Text    //input[@placeholder="Width"]    3
    Press Keys    //input[@placeholder="Height"]    DELETE
    Input Text    //input[@placeholder="Height"]    3
    # click the image Cooridnate radio button again to apply changes
    Click Element    //*[contains(text(), "Image")]
    # close the region config dialog
    Click Element    data:testid:region-dialog-header-close-button
    # enable the spectral profiler widget
    Click Element    id:SpectralProfilerButton
    # switch channel to the CO(6-5) line
    # click coordinates (40, 0) is specific to the headless mode so that the peak of the CO(6-5) line is selected
    Click Element At Coordinates    ${SPECTRAL_PROFILER_PLOT}    40    0
    Mouse Out    ${SPECTRAL_PROFILER_PLOT}
    Element Should Contain    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (32.92432 GHz, 2.91e+1)
    # enable the settings dialog
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}
    # enable rest frame conversion x-axis
    Click Element    //*[contains(text(), "X-axis")]
    # enable rest frame conversion y-axis
    Click Element    //*[contains(text(), "Y-axis")]
    # switch to redshift mode
    Click Element    data:testid:spectral-profiler-shift-mode-dropdown
    Click Element    //*[normalize-space(text())='Redshift (z)']
    # set z to 20
    Press Keys    data:testid:spectral-profiler-redshift-input    DELETE
    Input Text    data:testid:spectral-profiler-redshift-input    20
    Click Element    //*[contains(text(), "Redshift (z)")]
    # check that the x-axis and y-axis are converted to rest frame
    Element Should Contain    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (691.411 GHz (rest frame), 1.38e+0)
    # switch to air wavelength in mm
    Click Element    data:testid:spectral-profiler-coordinate-dropdown
    Click Element    //*[contains(text(), "Air wavelength (mm)")]
    # check that the x-axis is now in air wavelength mm
    Element Should Contain    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (0.4334706 mm (rest frame), 1.38e+0)
    # switch to radio velocity 
    Click Element    data:testid:spectral-profiler-coordinate-dropdown
    Click Element    //*[contains(text(), "Radio velocity (km/s)")]
    # check that the x-axis is now in radio velocity
    Element Should Contain    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (27.014 km/s (rest frame), 1.38e+0)
    # disable rest frame conversion for x-axis and y-axis
    Click Element    //*[contains(text(), "X-axis")]
    Click Element    //*[contains(text(), "Y-axis")]
    # switch to frequency GHz
    Click Element    data:testid:spectral-profiler-coordinate-dropdown
    Click Element    //*[contains(text(), "Frequency (GHz)")]
    # check that the x-axis and y-axis are now in observed frame
    Element Should Contain    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (32.92432 GHz, 2.91e+1)
    [Teardown]    Kill carta_backend And Close Browser


Rest Frame Conversion - Matching High-z CO Cubes
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    CO_6_5_z20_cube.fits
    # create a rectangle region
    Click Element    data:testid:rectangle-region-shortcut-button
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    # switch to image Cooridnate and set a new center position and size for the region
    Click Element    //*[contains(text(), "Image")]
    Press Keys    //input[@placeholder="X Coordinate"]    DELETE
    Input Text    //input[@placeholder="X Coordinate"]    25
    Press Keys    //input[@placeholder="Y Coordinate"]    DELETE
    Input Text    //input[@placeholder="Y Coordinate"]    25
    Press Keys    //input[@placeholder="Width"]    DELETE
    Input Text    //input[@placeholder="Width"]    3
    Press Keys    //input[@placeholder="Height"]    DELETE
    Input Text    //input[@placeholder="Height"]    3
    # click the image Cooridnate radio button again to apply changes
    Click Element    //*[contains(text(), "Image")]
    # close the region config dialog
    Click Element    data:testid:region-dialog-header-close-button    
    # Append another cube  
    Append Image    CO_5_4_z20_cube.fits
    # enable spatial and spectral matching
    Click Element    data:testid:image-list-0-matching-xy
    Click Element    data:testid:image-list-0-matching-z
    # enable the spectral profiler widget
    Click Element    id:SpectralProfilerButton
    # enable multi-profile plot mode
    Click Element    //*[@data-testid="spectral-profiler-0-content"]//*[contains(text(), "Image")]
    Click Element    data:testid:spectral-profiler-image-dropdown
    Click Element    //*[contains(text(), "0: CO_6_5_z20_cube.fits (matched)")]    
    # switch channel to the lines
    Click Element At Coordinates    ${SPECTRAL_PROFILER_PLOT}    55    0
    Mouse Out    ${SPECTRAL_PROFILER_PLOT}
    # check spectral profiler cursor info
    Element Should Contain    data:testid:spectral-profiler-info-0    Data: (285515.745 km/s, 3.05e+1), CO_6_5_z20_cube.fits, Region 1, Statistic Mean, Coordinate Current
    Element Should Contain    data:testid:spectral-profiler-info-1    Data: (285515.07 km/s, 2.46e+1), CO_5_4_z20_cube.fits, Region 1, Statistic Mean, Coordinate Current
    # enable the settings dialog
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}
    # enable rest frame conversion x-axis
    Click Element    //*[contains(text(), "X-axis")]
    # enable rest frame conversion y-axis
    Click Element    //*[contains(text(), "Y-axis")]
    # switch to redshift mode
    Click Element    data:testid:spectral-profiler-shift-mode-dropdown
    Click Element    //*[normalize-space(text())='Redshift (z)']
    # set z to 20
    Press Keys    data:testid:spectral-profiler-redshift-input    DELETE
    Input Text    data:testid:spectral-profiler-redshift-input    20
    Click Element    //*[contains(text(), "Redshift (z)")]
    # check that the x-axis and y-axis are converted to rest frame
    Element Should Contain    data:testid:spectral-profiler-info-0    Data: (-18.509 km/s (rest frame), 1.45e+0), CO_6_5_z20_cube.fits, Region 1, Statistic Mean, Coordinate Current
    Element Should Contain    data:testid:spectral-profiler-info-1    Data: (-32.690 km/s (rest frame), 1.17e+0), CO_5_4_z20_cube.fits, Region 1, Statistic Mean, Coordinate Current   
    [Teardown]    Kill carta_backend And Close Browser



Rest Frame Conversion - Local Universe CO Cube
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    CO_6_5_z0_vrad_-500kms_cube.fits
    # create a rectangle region
    Click Element    data:testid:rectangle-region-shortcut-button
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    # switch to image Cooridnate and set a new center position and size for the region
    Click Element    //*[contains(text(), "Image")]
    Press Keys    //input[@placeholder="X Coordinate"]    DELETE
    Input Text    //input[@placeholder="X Coordinate"]    25
    Press Keys    //input[@placeholder="Y Coordinate"]    DELETE
    Input Text    //input[@placeholder="Y Coordinate"]    25
    Press Keys    //input[@placeholder="Width"]    DELETE
    Input Text    //input[@placeholder="Width"]    3
    Press Keys    //input[@placeholder="Height"]    DELETE
    Input Text    //input[@placeholder="Height"]    3
    # click the image Cooridnate radio button again to apply changes
    Click Element    //*[contains(text(), "Image")]
    # close the region config dialog
    Click Element    data:testid:region-dialog-header-close-button
    # enable the spectral profiler widget
    Click Element    id:SpectralProfilerButton
    # switch channel to the CO(6-5) line
    # click coordinates (39, 0) is specific to the headless mode so that the peak of the CO(6-5) line is selected
    Click Element At Coordinates    ${SPECTRAL_PROFILER_PLOT}    39    0
    Mouse Out    ${SPECTRAL_PROFILER_PLOT}
    Element Should Contain    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (692.61633 GHz, 1.40e+0)
    # enable the settings dialog
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}
    # enable rest frame conversion x-axis
    Click Element    //*[contains(text(), "X-axis")]
    # enable rest frame conversion y-axis
    Click Element    //*[contains(text(), "Y-axis")]
    # set velocity to -500 km/s
    Click Element    data:testid:spectral-profiler-shift-mode-dropdown
    Click Element    //*[contains(text(), "Radial velocity (km/s)")]
    # use radio velocity convention
    Click Element    data:testid:spectral-profiler-velocity-convention-dropdown
    Click Element    //*[normalize-space(text())='Radio']
    Press Keys    data:testid:spectral-profiler-radial-velocity-input    DELETE
    Input Text    data:testid:spectral-profiler-radial-velocity-input    -500
    Click Element    //*[contains(text(), "Effective redshift (z)")]
    # check spectral cursor info
    Element Should Contain    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (691.46309 GHz (rest frame), 1.40e+0)
    # switch to radio velocity convention
    Click Element    data:testid:spectral-profiler-coordinate-dropdown
    Click Element    //*[contains(text(), "Radio velocity (km/s)")]
    # check spectral cursor info
    Element Should Contain    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (4.328 km/s (rest frame), 1.40e+0)
    # check the effective redshift value in radio velocity convention
    Element Should Contain    data:testid:spectral-profiler-effective-redshift    -0.0016650434823774363
    # change velocity convention to optical
    Click Element    data:testid:spectral-profiler-velocity-convention-dropdown
    Click Element    //*[normalize-space(text())='Optical']
    Press Keys    data:testid:spectral-profiler-radial-velocity-input    DELETE
    Input Text    data:testid:spectral-profiler-radial-velocity-input    -500
    Element Should Contain    data:testid:spectral-profiler-effective-redshift    -0.0016678204759907602
    # change velocity convention to Relativistic
    Click Element    data:testid:spectral-profiler-velocity-convention-dropdown
    Click Element    //*[normalize-space(text())='Relativistic']
    Press Keys    data:testid:spectral-profiler-radial-velocity-input    DELETE
    Input Text    data:testid:spectral-profiler-radial-velocity-input    -500
    Element Should Contain    data:testid:spectral-profiler-effective-redshift    -0.0016664319801497074       
    [Teardown]    Kill carta_backend And Close Browser


