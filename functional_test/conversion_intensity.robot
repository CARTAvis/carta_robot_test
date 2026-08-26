*** Settings ***
Documentation     Test conversions such as wcs and intensity units
Resource          ../resource.robot

*** Test Cases ***
Intensity Unit Conversion from Jy/beam
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    image_Jy_per_beam.fits
    # set cursor position
    Mouse Over    ${VIEWER_DIV}
    # enable the spectral profiler widget
    Click Element    id:SpectralProfilerButton
    # switch channel by click
    Click Element    ${SPECTRAL_PROFILER_PLOT}
    # check default spectral unit (LSRK frequency)
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Cursor: (100.0023 GHz, 1.59e+0)    
    # switch to different spectral reference frames
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[1]    # Jy/beam
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 1.59e+0)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[2]    # mJy/beam
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 1.59e+3)    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[3]    # uJy/beam
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 1.59e+6)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[4]    # MJy/sr
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 3.66e+6)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[5]    # Jy/arcsec^2
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 8.59e+1)                        
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[6]    # mJy/arcsec^2
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 8.59e+4)                        
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[7]    # uJy/arcsec^2
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 8.59e+7)                        
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[8]    # K
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 1.19e+4)                        
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[9]    # mK
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 1.19e+7)                        
    [Teardown]    Kill carta_backend And Close Browser


Intensity Unit Conversion from K
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    image_K.fits
    # set cursor position
    Mouse Over    ${VIEWER_DIV}
    # enable the spectral profiler widget
    Click Element    id:SpectralProfilerButton
    # switch channel by click
    Click Element    ${SPECTRAL_PROFILER_PLOT}
    # check default spectral unit (LSRK frequency)
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Cursor: (100.0023 GHz, 6.29e-1)    
    # switch to different spectral reference frames
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[1]    # K
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 6.29e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[2]    # mK
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 6.29e+2)    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[3]    # Jy/beam
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 8.40e-5)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[4]    # mJy/beam
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 8.40e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[5]    # uJy/beam
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 8.40e+1)                        
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[6]    # MJy/sr
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 1.93e+2)                        
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[7]    # Jy/arcsec^2
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 4.54e-3)                       
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[8]    # mJy/arcsec^2
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 4.54e+0)                        
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[9]    # uJy/arcsec^2
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 4.54e+3)                        
    [Teardown]    Kill carta_backend And Close Browser


Intensity Unit Conversion from My/sr
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    image_MJy_per_sr_no_beam.fits
    # set cursor position
    Mouse Over    ${VIEWER_DIV}
    # enable the spectral profiler widget
    Click Element    id:SpectralProfilerButton
    # switch channel by click
    Click Element    ${SPECTRAL_PROFILER_PLOT}
    # check default spectral unit (LSRK frequency)
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Cursor: (100.0023 GHz, 6.73e-1)    
    # switch to different spectral reference frames
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[1]    # My/sr
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 6.73e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[2]    # Jy/arcsec^2
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 1.58e-5)    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[6]    # Jy/pixel
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 1.76e-2)
    [Teardown]    Kill carta_backend And Close Browser


Intensity Unit Conversion from Jy/pixel
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    image_Jy_per_pixel_no_beam.fits
    # set cursor position
    Mouse Over    ${VIEWER_DIV}
    # enable the spectral profiler widget
    Click Element    id:SpectralProfilerButton
    # switch channel by click
    Click Element    ${SPECTRAL_PROFILER_PLOT}
    # check default spectral unit (LSRK frequency)
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Cursor: (100.0023 GHz, -8.26e-1)  
    # switch to different spectral reference frames
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[2]    # Jy/pixel
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, -8.26e-1)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[5]    # MJy/sr
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, -3.16e+1)    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[6]    # Jy/arcsec^2
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, -7.43e-4)
    [Teardown]    Kill carta_backend And Close Browser

Intensity Unit Conversion from Jy/arcsec2
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    image_Jy_per_arcsec2_no_beam.fits
    # set cursor position
    Mouse Over    ${VIEWER_DIV}
    # enable the spectral profiler widget
    Click Element    id:SpectralProfilerButton
    # switch channel by click
    Click Element    ${SPECTRAL_PROFILER_PLOT}
    # check default spectral unit (LSRK frequency)
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Cursor: (100.0023 GHz, -1.77e+0)  
    # switch to different spectral reference frames
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[1]    # Jy/arcsec^2
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, -1.77e+0)
    [Teardown]    Kill carta_backend And Close Browser



Intensity Unit Conversion from Jy/beam with Per-Plane-Beam
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    small_perplanebeam.fits
    # set cursor position
    Mouse Over    ${VIEWER_DIV}
    # enable the spectral profiler widget
    Click Element    id:SpectralProfilerButton
    # switch channel by click
    Click Element    ${SPECTRAL_PROFILER_PLOT}
    # check default spectral unit (TOPO frequency)
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Cursor: (90.7361654 GHz, 4.17e-2)
    # switch to different spectral reference frames
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[1]    # Jy/beam
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (90.7361654 GHz, 4.17e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[4]    # MJy/sr
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (90.7361654 GHz, 6.10e+1)    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[5]    # Jy/arcsec^2
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (90.7361654 GHz, 1.43e-3)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[8]    # K
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (90.7361654 GHz, 2.41e-1)
    [Teardown]    Kill carta_backend And Close Browser
