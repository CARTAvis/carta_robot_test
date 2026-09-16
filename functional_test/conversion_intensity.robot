*** Settings ***
Documentation     Test conversions of intensity units
Resource          ../resource.robot

*** Test Cases ***
Intensity Unit Conversion from Jy/beam
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    image_Jy_per_beam.fits
    # create a region
    Click Element    data:testid:rectangle-region-shortcut-button
    Click Element    ${VIEWER_DIV}
    # enable region dialog
    Double Click Element    ${VIEWER_DIV}
    # switch to image Cooridnate and set a new size for the region
    Click Element    //*[contains(text(), "Image")]
    Press Keys    //input[@placeholder="X Coordinate"]    DELETE
    Input Text    //input[@placeholder="X Coordinate"]    32
    Press Keys    //input[@placeholder="Y Coordinate"]    DELETE
    Input Text    //input[@placeholder="Y Coordinate"]    32
    Press Keys    //input[@placeholder="Width"]    DELETE
    Input Text    //input[@placeholder="Width"]    20
    Press Keys    //input[@placeholder="Height"]    DELETE
    Input Text    //input[@placeholder="Height"]    20
    # click the image Cooridnate radio button again to apply changes
    Click Element    //*[contains(text(), "Image")]
    # close the region config dialog
    Click Element    data:testid:region-dialog-header-close-button
    # enable the spectral profiler widget
    Click Element    id:SpectralProfilerButton
    # switch channel by click
    Click Element    ${SPECTRAL_PROFILER_PLOT}
    # check default spectral unit (LSRK frequency)
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Cursor: (100.0023 GHz, 2.10e-2)    
    # switch to different intensity units (region statistic: mean)
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[1]    # Jy/beam
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 2.10e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[2]    # mJy/beam
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 2.10e+1)    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[3]    # uJy/beam
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 2.10e+4)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[4]    # MJy/sr
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 4.83e+4)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[5]    # Jy/arcsec^2
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 1.14e+0)                        
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[6]    # mJy/arcsec^2
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 1.14e+3)                        
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[7]    # uJy/arcsec^2
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 1.14e+6)                        
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[8]    # K
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 1.57e+2)                        
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[9]    # mK
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 1.57e+5)                        
    # close the settings dialog
    Click Element    data:testid:spectral-profiler-0-floating-settings-0-header-close-button
    # set region statistic to flux density
    Click Element    data:testid:spectral-profiler-statistic-dropdown
    Click Element    data:testid:spectral-profiler-statistic-dropdown-fluxdensity
    # enable settings dialog
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}
    # switch to different intensity units (region statistic: flux density)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[1]    # Jy/beam
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 4.51e-1)        # Jy as flux density
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[2]    # mJy/beam
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 4.51e+2)        # mJy as flux density
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[3]    # uJy/beam
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 4.51e+5)        # uJy as flux density
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[4]    # MJy/sr 
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 4.51e-7)        # MJy as flux density
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[5]    # Jy/arcsec^2
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 4.51e-1)        # Jy as flux density               
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[6]    # mJy/arcsec^2
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 4.51e+2)        # mJy as flux density                
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[7]    # uJy/arcsec^2
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 4.51e+5)        # uJy as flux density
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[8]    # K
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 6.24e+1)        # K arcsec^2 as flux density              
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[9]    # mK
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 6.24e+4)        # mK arcsec^2 as flux density                    
    # check region statistics
    Click Element    id:StatisticsWidgetButton
    Wait Until Page Does Not Contain    No stats data
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    4.505524855548e-1 Jy
    [Teardown]    Kill carta_backend And Close Browser


Intensity Unit Conversion from K
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    image_K.fits
    # create a region
    Click Element    data:testid:rectangle-region-shortcut-button
    Click Element    ${VIEWER_DIV}
    # enable region dialog
    Double Click Element    ${VIEWER_DIV}
    # switch to image Cooridnate and set a new size for the region
    Click Element    //*[contains(text(), "Image")]
    Press Keys    //input[@placeholder="X Coordinate"]    DELETE
    Input Text    //input[@placeholder="X Coordinate"]    32
    Press Keys    //input[@placeholder="Y Coordinate"]    DELETE
    Input Text    //input[@placeholder="Y Coordinate"]    32
    Press Keys    //input[@placeholder="Width"]    DELETE
    Input Text    //input[@placeholder="Width"]    20
    Press Keys    //input[@placeholder="Height"]    DELETE
    Input Text    //input[@placeholder="Height"]    20
    # click the image Cooridnate radio button again to apply changes
    Click Element    //*[contains(text(), "Image")]
    # close the region config dialog
    Click Element    data:testid:region-dialog-header-close-button
    # enable the spectral profiler widget
    Click Element    id:SpectralProfilerButton
    # switch channel by click
    Click Element    ${SPECTRAL_PROFILER_PLOT}
    # check default spectral unit (LSRK frequency)
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Cursor: (100.0023 GHz, 3.29e-2)    
    # switch to different intensity units (region statistic: mean)
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[1]    # K
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 3.29e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[2]    # mK
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 3.29e+1)    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[3]    # Jy/beam
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 4.40e-6)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[4]    # mJy/beam
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 4.40e-3)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[5]    # uJy/beam
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 4.40e+0)                        
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[6]    # MJy/sr
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 1.01e+1)                        
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[7]    # Jy/arcsec^2
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 2.38e-4)                       
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[8]    # mJy/arcsec^2
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 2.38e-1)                        
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[9]    # uJy/arcsec^2
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 2.38e+2)
    # close the settings dialog
    Click Element    data:testid:spectral-profiler-0-floating-settings-0-header-close-button
    # set region statistic to flux density
    Click Element    data:testid:spectral-profiler-statistic-dropdown
    Click Element    data:testid:spectral-profiler-statistic-dropdown-fluxdensity
    # enable settings dialog
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}
    # switch to different intensity units (region statistic: flux density)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[1]    # K
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 1.31e-2)        # K arcsec^2 as flux density
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[2]    # mK
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 1.31e+1)        # mK arcsec^2 as flux density
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[3]    # Jy/beam
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 9.43e-5)        # Jy as flux density
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[4]    # mJy/beam
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 9.43e-2)        # mJy as flux density
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[5]    # uJy/beam
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 9.43e+1)        # uJy as flux density                
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[6]    # MJy/sr
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 9.43e-11)        # MJy as flux density                
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[7]    # Jy/arcsec^2
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 9.43e-5)        # Jy as flux density                
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[8]    # mJy/arcsec^2
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 9.43e-2)        # mJy as flux density               
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[9]    # uJy/arcsec^2
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 9.43e+1)        # uJy as flux density                   
    # check region statistics
    Click Element    id:StatisticsWidgetButton
    Wait Until Page Does Not Contain    No stats data
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    1.306214382631e-2 K*arcsec^2                        
    [Teardown]    Kill carta_backend And Close Browser


Intensity Unit Conversion from MJy/sr
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    image_MJy_per_sr_no_beam.fits
    # create a region
    Click Element    data:testid:rectangle-region-shortcut-button
    Click Element    ${VIEWER_DIV}
    # enable region dialog
    Double Click Element    ${VIEWER_DIV}
    # switch to image Cooridnate and set a new size for the region
    Click Element    //*[contains(text(), "Image")]
    Press Keys    //input[@placeholder="X Coordinate"]    DELETE
    Input Text    //input[@placeholder="X Coordinate"]    32
    Press Keys    //input[@placeholder="Y Coordinate"]    DELETE
    Input Text    //input[@placeholder="Y Coordinate"]    32
    Press Keys    //input[@placeholder="Width"]    DELETE
    Input Text    //input[@placeholder="Width"]    20
    Press Keys    //input[@placeholder="Height"]    DELETE
    Input Text    //input[@placeholder="Height"]    20
    # click the image Cooridnate radio button again to apply changes
    Click Element    //*[contains(text(), "Image")]
    # close the region config dialog
    Click Element    data:testid:region-dialog-header-close-button
    # enable the spectral profiler widget
    Click Element    id:SpectralProfilerButton
    # switch channel by click
    Click Element    ${SPECTRAL_PROFILER_PLOT}
    # check default spectral unit (LSRK frequency)
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Cursor: (100.0023 GHz, 8.87e-2)    
    # switch to different intensity units (statistic: mean)
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[1]    # MJy/sr
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 8.87e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[2]    # Jy/arcsec^2
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 2.08e-6)    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[6]    # Jy/pixel
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 1.88e-9)
    # close the settings dialog
    Click Element    data:testid:spectral-profiler-0-floating-settings-0-header-close-button
    # set region statistic to flux density
    Click Element    data:testid:spectral-profiler-statistic-dropdown
    Click Element    data:testid:spectral-profiler-statistic-dropdown-fluxdensity
    # enable settings dialog
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}
    # switch to different intensity units (region statistic: flux density)    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[1]    # MJy/sr
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 8.27e-13)       # MJy as flux density
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[2]    # Jy/arcsec^2
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 8.27e-7)        # Jy as flux density    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[6]    # Jy/pixel
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, 8.27e-7)        # Jy as flux density
    # check region statistics
    Click Element    id:StatisticsWidgetButton
    Wait Until Page Does Not Contain    No stats data
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    8.273431717313e-13 MJy       
    [Teardown]    Kill carta_backend And Close Browser


Intensity Unit Conversion from Jy/pixel
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    image_Jy_per_pixel_no_beam.fits
    # create a region
    Click Element    data:testid:rectangle-region-shortcut-button
    Click Element    ${VIEWER_DIV}
    # enable region dialog
    Double Click Element    ${VIEWER_DIV}
    # switch to image Cooridnate and set a new size for the region
    Click Element    //*[contains(text(), "Image")]
    Press Keys    //input[@placeholder="X Coordinate"]    DELETE
    Input Text    //input[@placeholder="X Coordinate"]    32
    Press Keys    //input[@placeholder="Y Coordinate"]    DELETE
    Input Text    //input[@placeholder="Y Coordinate"]    32
    Press Keys    //input[@placeholder="Width"]    DELETE
    Input Text    //input[@placeholder="Width"]    20
    Press Keys    //input[@placeholder="Height"]    DELETE
    Input Text    //input[@placeholder="Height"]    20
    # click the image Cooridnate radio button again to apply changes
    Click Element    //*[contains(text(), "Image")]
    # close the region config dialog
    Click Element    data:testid:region-dialog-header-close-button
    # enable the spectral profiler widget
    Click Element    id:SpectralProfilerButton
    # switch channel by click
    Click Element    ${SPECTRAL_PROFILER_PLOT}
    # check default spectral unit (LSRK frequency)
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Cursor: (100.0023 GHz, -4.50e-2)  
    # switch to different intensity units (statistic: mean)
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[2]    # Jy/pixel
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, -4.50e-2)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[5]    # MJy/sr
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, -2.13e+6)    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[6]    # Jy/arcsec^2
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, -5.00e+1)
    # close the settings dialog
    Click Element    data:testid:spectral-profiler-0-floating-settings-0-header-close-button
    # set region statistic to flux density
    Click Element    data:testid:spectral-profiler-statistic-dropdown
    Click Element    data:testid:spectral-profiler-statistic-dropdown-fluxdensity
    # enable settings dialog
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}
    # switch to different intensity units (region statistic: flux density)    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[2]    # Jy/pixel
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, -1.98e+1)       # Jy as flux density
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[5]    # MJy/sr
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, -1.98e-5)       # MJy as flux density   
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[6]    # Jy/arcsec^2
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, -1.98e+1)       # Jy as flux density
    # check region statistics
    Click Element    id:StatisticsWidgetButton
    Wait Until Page Does Not Contain    No stats data
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    -1.983184228744e+1 Jy        
    [Teardown]    Kill carta_backend And Close Browser


Intensity Unit Conversion from Jy/arcsec2
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    image_Jy_per_arcsec2_no_beam.fits
    # create a region
    Click Element    data:testid:rectangle-region-shortcut-button
    Click Element    ${VIEWER_DIV}
    # enable region dialog
    Double Click Element    ${VIEWER_DIV}
    # switch to image Cooridnate and set a new size for the region
    Click Element    //*[contains(text(), "Image")]
    Press Keys    //input[@placeholder="X Coordinate"]    DELETE
    Input Text    //input[@placeholder="X Coordinate"]    32
    Press Keys    //input[@placeholder="Y Coordinate"]    DELETE
    Input Text    //input[@placeholder="Y Coordinate"]    32
    Press Keys    //input[@placeholder="Width"]    DELETE
    Input Text    //input[@placeholder="Width"]    20
    Press Keys    //input[@placeholder="Height"]    DELETE
    Input Text    //input[@placeholder="Height"]    20
    # click the image Cooridnate radio button again to apply changes
    Click Element    //*[contains(text(), "Image")]
    # close the region config dialog
    Click Element    data:testid:region-dialog-header-close-button
    # enable the spectral profiler widget
    Click Element    id:SpectralProfilerButton
    # switch channel by click
    Click Element    ${SPECTRAL_PROFILER_PLOT}
    # check default spectral unit (LSRK frequency)
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Cursor: (100.0023 GHz, -3.97e-4)  
    # switch to different intensity units (statistic: mean)
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[1]    # Jy/arcsec^2
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, -3.97e-4)
    # close the settings dialog
    Click Element    data:testid:spectral-profiler-0-floating-settings-0-header-close-button
    # set region statistic to flux density
    Click Element    data:testid:spectral-profiler-statistic-dropdown
    Click Element    data:testid:spectral-profiler-statistic-dropdown-fluxdensity
    # enable settings dialog
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}
    # switch to different intensity units (region statistic: flux density)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[1]    # Jy/arcsec^2
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (100.0023 GHz, -1.57e-4)       # Jy as flux density
    # check region statistics
    Click Element    id:StatisticsWidgetButton
    Wait Until Page Does Not Contain    No stats data
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    4    2    -1.574543138500e-4 Jy            
    [Teardown]    Kill carta_backend And Close Browser



Intensity Unit Conversion from Jy/beam with Per-Plane-Beam
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    small_perplanebeam.fits
    # create a region
    Click Element    data:testid:rectangle-region-shortcut-button
    Click Element    ${VIEWER_DIV}
    # enable region dialog
    Double Click Element    ${VIEWER_DIV}
    # switch to image Cooridnate and set a new size for the region
    Click Element    //*[contains(text(), "Image")]
    Press Keys    //input[@placeholder="X Coordinate"]    DELETE
    Input Text    //input[@placeholder="X Coordinate"]    10
    Press Keys    //input[@placeholder="Y Coordinate"]    DELETE
    Input Text    //input[@placeholder="Y Coordinate"]    10
    Press Keys    //input[@placeholder="Width"]    DELETE
    Input Text    //input[@placeholder="Width"]    15
    Press Keys    //input[@placeholder="Height"]    DELETE
    Input Text    //input[@placeholder="Height"]    15
    # click the image Cooridnate radio button again to apply changes
    Click Element    //*[contains(text(), "Image")]
    # close the region config dialog
    Click Element    data:testid:region-dialog-header-close-button
    # enable the spectral profiler widget
    Click Element    id:SpectralProfilerButton
    # switch channel by click
    Click Element    ${SPECTRAL_PROFILER_PLOT}
    # check default spectral unit (TOPO frequency)
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Cursor: (90.7361654 GHz, 4.67e-3)
    # switch to different intensity units (statistic: mean)
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[1]    # Jy/beam
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (90.7361654 GHz, 4.67e-3)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[4]    # MJy/sr
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (90.7361654 GHz, 6.83e+0)    
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[5]    # Jy/arcsec^2
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (90.7361654 GHz, 1.61e-4)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[8]    # K
    Element Text Should Be    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (90.7361654 GHz, 2.70e-2)
    # close the settings dialog
    Click Element    data:testid:spectral-profiler-0-floating-settings-0-header-close-button
    # set region statistic to flux density
    Click Element    data:testid:spectral-profiler-statistic-dropdown
    Click Element    data:testid:spectral-profiler-statistic-dropdown-fluxdensity
    # enable settings dialog
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}
    # switch to different intensity units (region statistic: flux density)
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[1]    # Jy/beam
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (90.7361654 GHz, 1.32e-2)        # Jy as flux density
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[4]    # MJy/sr
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (90.7361654 GHz, 1.32e-8)        # MJy as flux density
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[5]    # Jy/arcsec^2
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (90.7361654 GHz, 1.32e-2)        # Jy as flux density
    Click Element    //*[@id="bp6-tab-panel_spectralSettingTabs_0"]/div[3]/div/div/select/option[8]    # K
    Wait Until Element Contains    ${SPECTRAL_PROFILER_CURSOR_INFO}    Data: (90.7361654 GHz, 2.22e+0)        # K arcsec^2 as flux density
    # check region statistics
    Click Element    id:StatisticsWidgetButton
    Wait Until Page Does Not Contain    No stats data
    Table Cell Should Contain    ${STATISTICS_WIDGET_TABLE}    7    2    1.319290442279e-2 Jy                     
    [Teardown]    Kill carta_backend And Close Browser
