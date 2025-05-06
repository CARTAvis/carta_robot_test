*** Settings ***
Documentation     Check the features in the spectral profiler
Resource          ../resource.robot


*** Test Cases ***
Region Spectral Profile
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   M17_SWex.fits
    Load Region File    region_001.crtf
    Click Element    id:SpectralProfilerButton
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}
    Click Element    //*[contains(text(), "Styling")]
    # increase the line width in the profile plot
    Repeat Keyword    6    Click Element    data:testid:profiler-settings-line-width-input-increment-button
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    //*[contains(text(), "Region List")]
    # select the polygon region from the region list
    Click Element    data:testid:region-list-table-row-5
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${SPECTRAL_PROFILER_PLOT}    polygon_profile_${key}.png
    # select the ellipse region from the region list
    Click Element    data:testid:region-list-table-row-4
    Capture Element Screenshot    ${SPECTRAL_PROFILER_PLOT}    ellipse_profile_${key}.png
    # select the rectangle region from the region list
    Click Element    data:testid:region-list-table-row-3
    Capture Element Screenshot    ${SPECTRAL_PROFILER_PLOT}    rectangle_profile_${key}.png
    # select the point region from the region list
    Click Element    data:testid:region-list-table-row-2
    Capture Element Screenshot    ${SPECTRAL_PROFILER_PLOT}    point_profile_${key}.png
    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    polygon_profile_${key}.png    454,61,520,16
    PNG Two Pixels Should Not Have Matched RGBA    polygon_profile_${key}.png    454,61,522,25
    PNG Two Pixels Should Have Matched RGBA    ellipse_profile_${key}.png    357,50,553,16
    PNG Two Pixels Should Not Have Matched RGBA    ellipse_profile_${key}.png    357,50,554,51
    PNG Two Pixels Should Have Matched RGBA    point_profile_${key}.png    454,90,553,16
    PNG Two Pixels Should Not Have Matched RGBA    point_profile_${key}.png    454,90,554,76
    PNG Two Pixels Should Have Matched RGBA    rectangle_profile_${key}.png    454,58,553,16
    PNG Two Pixels Should Not Have Matched RGBA    rectangle_profile_${key}.png    454,58,619,159
    PNG Images Should Be Different    polygon_profile_${key}.png    ellipse_profile_${key}.png
    PNG Images Should Be Different    polygon_profile_${key}.png    point_profile_${key}.png
    PNG Images Should Be Different    polygon_profile_${key}.png    rectangle_profile_${key}.png
    PNG Images Should Be Different    ellipse_profile_${key}.png    point_profile_${key}.png
    PNG Images Should Be Different    ellipse_profile_${key}.png    rectangle_profile_${key}.png
    PNG Images Should Be Different    point_profile_${key}.png    rectangle_profile_${key}.png
    Remove Files    polygon_profile_${key}.png    ellipse_profile_${key}.png    point_profile_${key}.png    rectangle_profile_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Spectral Profile Visualization From Multiple Regions
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   M17_SWex.fits
    Load Region File    region_001.crtf
    Click Element    id:SpectralProfilerButton
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}
    Click Element    //*[contains(text(), "Styling")]
    # increase the line width in the profile plot
    Repeat Keyword    6    Click Element    data:testid:profiler-settings-line-width-input-increment-button
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    # select the region checkbox to enable region multi-plot mode
    Click Element    //*[@data-testid="spectral-profiler-0-content"]//*[contains(text(), "Region")]
    # click the region dropdown menu to see options
    Click Element    data:testid:spectral-profiler-region-dropdown
    # select all options in the list
    Click Element    data:testid:spectral-profiler-region-dropdown-region-1
    Click Element    data:testid:spectral-profiler-region-dropdown-region-2
    Click Element    data:testid:spectral-profiler-region-dropdown-region-3
    Click Element    data:testid:spectral-profiler-region-dropdown-region-4
    # click the region dropdown menu to close the option list
    Click Element    data:testid:spectral-profiler-region-dropdown
    #Sleep    1
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${SPECTRAL_PROFILER_PLOT}    check_${key}.png
    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    454,63,585,55
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    488,78,553,67
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    390,97,615,106
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    357,87,520,98
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    454,63,673,25
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    488,78,673,25
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    390,97,673,25
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    357,87,673,25
    Mouse Over    ${SPECTRAL_PROFILER_PLOT}
    # check the cursor info
    Element Should Contain    data:testid:spectral-profiler-info-0    Cursor: (86.748221 GHz, 1.25e-2), M17_SWex.fits, Region 1, Statistic Sum, Coordinate Current
    Element Should Contain    data:testid:spectral-profiler-info-1    Cursor: (86.748221 GHz, 9.34e-3), M17_SWex.fits, Region 2, Statistic Mean, Coordinate Current
    Element Should Contain    data:testid:spectral-profiler-info-2    Cursor: (86.748221 GHz, 4.58e-3), M17_SWex.fits, Region 3, Statistic Mean, Coordinate Current
    Element Should Contain    data:testid:spectral-profiler-info-3    Cursor: (86.748221 GHz, 1.69e-2), M17_SWex.fits, Region 4, Statistic Mean, Coordinate Current
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser




Spectral Profile Visualization From Multiple Statistics
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   M17_SWex.fits
    Load Region File    region_001.crtf
    Click Element    id:SpectralProfilerButton
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}
    Click Element    //*[contains(text(), "Styling")]
    # increase the line width in the profile plot
    Repeat Keyword    6    Click Element    data:testid:profiler-settings-line-width-input-increment-button
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    //*[contains(text(), "Region List")]
    # select the polygon region from the region list 
    Click Element    data:testid:region-list-table-row-5
    # select the statistic checkbox to enable statistic multi-plot mode
    Click Element    //*[@data-testid="spectral-profiler-0-content"]//*[contains(text(), "Statistic")]
    # click the statistic dropdown menu to see options
    Click Element    data:testid:spectral-profiler-statistic-dropdown
    # select mean
    Click Element    data:testid:spectral-profiler-statistic-dropdown-mean
    # select stdDev
    Click Element    data:testid:spectral-profiler-statistic-dropdown-stddev
    # select rms
    Click Element    data:testid:spectral-profiler-statistic-dropdown-rms
    # select min
    Click Element    data:testid:spectral-profiler-statistic-dropdown-min
    # click the statistic dropdown menu to close the list
    Click Element    data:testid:spectral-profiler-statistic-dropdown
    #Sleep    1
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${SPECTRAL_PROFILER_PLOT}    check_${key}.png
    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    521,14,553,19
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    487,25,519,30
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    455,43,487,35
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    424,79,551,88
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    521,14,674,36
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    487,25,674,36
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    455,43,674,36
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    424,79,674,36
    Mouse Over    ${SPECTRAL_PROFILER_PLOT}
    # check the cursor info
    Element Should Contain    data:testid:spectral-profiler-info-0    Cursor: (86.748221 GHz, 1.69e-2), M17_SWex.fits, Region 4, Statistic Mean, Coordinate Current
    Element Should Contain    data:testid:spectral-profiler-info-1    Cursor: (86.748221 GHz, 6.57e-2), M17_SWex.fits, Region 4, Statistic RMS, Coordinate Current
    Element Should Contain    data:testid:spectral-profiler-info-2    Cursor: (86.748221 GHz, 6.34e-2), M17_SWex.fits, Region 4, Statistic StdDev, Coordinate Current
    Element Should Contain    data:testid:spectral-profiler-info-3    Cursor: (86.748221 GHz, -6.15e-2), M17_SWex.fits, Region 4, Statistic Min, Coordinate Current
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Spectral Profile Visualization From Multiple Images
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   HD163296_13CO_2-1_subimage.fits
    Append Image    HD163296_C18O_2-1_subimage.fits
    Append Image    HD163296_CO_2_1_subimage.fits
    Load Region File    region_003.crtf
    # matching C18O cube to 13CO cube spatially and spectrally
    Click Element    ${IMAGE_LIST_SECOND_MATCHING_XY}
    Click Element    data:testid:image-list-1-matching-z
    # matching CO cube to 13CO cube spatially and spectrally
    Click Element    ${IMAGE_LIST_THIRD_MATCHING_XY}
    Click Element    data:testid:image-list-2-matching-z
    Click Element    //*[contains(text(), "Region List")]
    # select the rectangle region
    Click Element    data:testid:region-list-table-row-2
    Click Element    id:SpectralProfilerButton
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}
    Click Element    //*[contains(text(), "Styling")]
    # increase the line width in the profile plot
    Repeat Keyword    6    Click Element    data:testid:profiler-settings-line-width-input-increment-button
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    # select the image check box to enable image multi-plot mode
    Sleep    1
    Click Element    //*[@data-testid="spectral-profiler-0-content"]//*[contains(text(), "Image")]
    Wait Until Page Contains Element    data:testid:spectral-profiler-info-2
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${SPECTRAL_PROFILER_PLOT}    check_${key}.png
    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    564,15,589,44
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    563,75,592,85
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    554,116,596,118
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    564,15,710,57
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    563,75,710,57
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    554,116,710,57
    Mouse Over    ${SPECTRAL_PROFILER_PLOT}
    # check cursor info
    Element Should Contain    data:testid:spectral-profiler-info-0    Cursor: (-2.972 km/s, -5.99e-4), HD163296_13CO_2-1_subimage.fits, Region 2, Statistic Mean, Coordinate Current
    Element Should Contain    data:testid:spectral-profiler-info-1    Cursor: (-8.971 km/s, -9.48e-5), HD163296_C18O_2-1_subimage.fits, Region 2, Statistic Mean, Coordinate Current
    Element Should Contain    data:testid:spectral-profiler-info-2    Cursor: (-9.151 km/s, 2.37e-4), HD163296_CO_2_1_subimage.fits, Region 2, Statistic Mean, Coordinate Current
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Single Spectral Profile Intensity Unit Conversion
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   M17_SWex.fits
    Mouse Over    ${VIEWER_DIV}
    # launch a spectral profiler widget and dock it to the panel with the render config widget
    Drag And Drop    id:SpectralProfilerButton    data:testid:render-config-0-header-title
    # click the spectral profile plot
    Click Element    ${SPECTRAL_PROFILER_PLOT}
    # launch the spectral profiler settings dialog
    Click Element    data:testid:spectral-profiler-0-header-settings-button
    # check cursor info
    Element Should Contain    data:testid:spectral-profiler-info-0    Data: (86.748221 GHz, -1.09e-2)
    # click the intensity unit dropdown menu and select mJy/beam
    Click Element    data:testid:spectral-profiler-settings-intensity-unit-dropdown
    Click Element    //*[contains(text(), "mJy/beam")]
    # check cursor info
    Element Should Contain    data:testid:spectral-profiler-info-0    Data: (86.748221 GHz, -1.09e+1)
    # click the intensity unit dropdown menu and select uJy/beam
    Click Element    data:testid:spectral-profiler-settings-intensity-unit-dropdown
    Click Element    //*[contains(text(), "uJy/beam")]
    # check cursor info
    Element Should Contain    data:testid:spectral-profiler-info-0    Data: (86.748221 GHz, -1.09e+4)
    # click the intensity unit dropdown menu and select MJy/beam
    Click Element    data:testid:spectral-profiler-settings-intensity-unit-dropdown
    Click Element    //*[contains(text(), "MJy/sr")]
    # check cursor info
    Element Should Contain    data:testid:spectral-profiler-info-0    Data: (86.748221 GHz, -1.34e+2)
    # click the intensity unit dropdown menu and select Jy/arcsec^2
    Click Element    data:testid:spectral-profiler-settings-intensity-unit-dropdown
    Click Element    //*[contains(text(), "Jy/arcsec^2")]
    # check cursor info
    Element Should Contain    data:testid:spectral-profiler-info-0    Data: (86.748221 GHz, -3.14e-3)
    # click the intensity unit dropdown menu and select mJy/arcsec^2
    Click Element    data:testid:spectral-profiler-settings-intensity-unit-dropdown
    Click Element    //*[contains(text(), "mJy/arcsec^2")]
    # check cursor info
    Element Should Contain    data:testid:spectral-profiler-info-0    Data: (86.748221 GHz, -3.14e+0)
    # click the intensity unit dropdown menu and select uJy/arcsec^2
    Click Element    data:testid:spectral-profiler-settings-intensity-unit-dropdown
    Click Element    //*[contains(text(), "uJy/arcsec^2")]
    # check cursor info
    Element Should Contain    data:testid:spectral-profiler-info-0    Data: (86.748221 GHz, -3.14e+3)
    # click the intensity unit dropdown menu and select mK
    Click Element    data:testid:spectral-profiler-settings-intensity-unit-dropdown
    Click Element    //*[contains(text(), "mK")]
    # check cursor info
    Element Should Contain    data:testid:spectral-profiler-info-0    Data: (86.748221 GHz, -5.77e+2)
    [Teardown]    Kill carta_backend And Close Browser


Single Spectral Profile Smoothing
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   M17_SWex.fits
    Load Region File    region_001.crtf
    Click Element    id:SpectralProfilerButton
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}
    Click Element    //*[contains(text(), "Styling")]
    # increase the line width in the profile plot
    Repeat Keyword    6    Click Element    data:testid:profiler-settings-line-width-input-increment-button
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Click Element    //*[contains(text(), "Region List")]
    # select the ellipse region from the region list
    Click Element    data:testid:region-list-table-row-4

    Click Element    data:testid:smoothing-button
    Click Element    data:testid:smoothing-settings-method-dropdown
    Click Element    //option[contains(text(), "Boxcar")]
    Repeat Keyword    3    Click Element    data:testid:smoothing-settings-line-width-input-increment-button
    Click Element    css:[data-testid="smoothing-settings-overlay-toggle"] + span
    Click Element    data:testid:smoothing-settings-kernel-input-increment-button
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${SPECTRAL_PROFILER_PLOT}    check_boxcar_${key}.png

    Click Element    data:testid:smoothing-button
    Click Element    data:testid:smoothing-settings-method-dropdown
    Click Element    //option[contains(text(), "Gaussian")]
    Repeat Keyword    3    Click Element    data:testid:smoothing-settings-sigma-input-increment-button
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Capture Element Screenshot    ${SPECTRAL_PROFILER_PLOT}    check_gaussian_${key}.png

    Click Element    data:testid:smoothing-button
    Click Element    data:testid:smoothing-settings-method-dropdown
    Click Element    //option[contains(text(), "Hanning")]
    Click Element    data:testid:smoothing-settings-kernel-input-increment-button
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Capture Element Screenshot    ${SPECTRAL_PROFILER_PLOT}    check_hanning_${key}.png

    Click Element    data:testid:smoothing-button
    Click Element    data:testid:smoothing-settings-method-dropdown
    Click Element    //option[contains(text(), "Binning")]
    Click Element    data:testid:smoothing-settings-binning-width-input-increment-button
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Capture Element Screenshot    ${SPECTRAL_PROFILER_PLOT}    check_binning_${key}.png

    Click Element    data:testid:smoothing-button
    Click Element    data:testid:smoothing-settings-method-dropdown
    Click Element    //option[contains(text(), "Savitzky-Golay")]
    Click Element    data:testid:smoothing-settings-kernel-input-increment-button
    Click Element    data:testid:smoothing-settings-fitting-order-input-increment-button
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Capture Element Screenshot    ${SPECTRAL_PROFILER_PLOT}    check_Savitzky-Golay_${key}.png

    Click Element    data:testid:smoothing-button
    Click Element    data:testid:smoothing-settings-method-dropdown
    Click Element    //option[contains(text(), "Decimation")]
    Click Element    data:testid:smoothing-settings-decimation-width-input-increment-button
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Capture Element Screenshot    ${SPECTRAL_PROFILER_PLOT}    check_decimation_${key}.png

    Click Element    data:testid:smoothing-button
    Click Element    data:testid:smoothing-settings-method-dropdown
    Click Element    //option[contains(text(), "None")]
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Capture Element Screenshot    ${SPECTRAL_PROFILER_PLOT}    check_original_${key}.png

    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_boxcar_${key}.png    389,39,518,16
    PNG Two Pixels Should Have Matched RGBA    check_boxcar_${key}.png    389,73,553,60
    PNG Two Pixels Should Not Have Matched RGBA    check_boxcar_${key}.png    389,39,389,73
    PNG Two Pixels Should Have Matched RGBA    check_gaussian_${key}.png    389,39,518,16
    PNG Two Pixels Should Have Matched RGBA    check_gaussian_${key}.png    325,110,617,99
    PNG Two Pixels Should Not Have Matched RGBA    check_gaussian_${key}.png    389,39,325,110
    PNG Two Pixels Should Have Matched RGBA    check_hanning_${key}.png    389,39,518,16
    PNG Two Pixels Should Have Matched RGBA    check_hanning_${key}.png    325,116,617,105
    PNG Two Pixels Should Not Have Matched RGBA    check_hanning_${key}.png    389,39,325,116
    PNG Two Pixels Should Have Matched RGBA    check_binning_${key}.png    389,39,518,16
    PNG Two Pixels Should Have Matched RGBA    check_binning_${key}.png    293,117,486,60
    PNG Two Pixels Should Not Have Matched RGBA    check_binning_${key}.png    389,39,293,117
    PNG Two Pixels Should Have Matched RGBA    check_Savitzky-Golay_${key}.png    389,39,518,16
    PNG Two Pixels Should Have Matched RGBA    check_Savitzky-Golay_${key}.png    325,107,617,97
    PNG Two Pixels Should Not Have Matched RGBA    check_Savitzky-Golay_${key}.png    389,39,325,107
    PNG Two Pixels Should Have Matched RGBA    check_decimation_${key}.png    357,50,585,53
    PNG Two Pixels Should Have Matched RGBA    check_decimation_${key}.png    440,39,569,16
    PNG Two Pixels Should Not Have Matched RGBA    check_decimation_${key}.png    357,50,440,39
    PNG Two Pixels Should Have Matched RGBA    check_original_${key}.png    389,39,518,16
    PNG Two Pixels Should Not Have Matched RGBA    check_original_${key}.png    389,39,673,45
    Remove Files    check_boxcar_${key}.png    check_gaussian_${key}.png    check_hanning_${key}.png    check_binning_${key}.png    check_Savitzky-Golay_${key}.png    check_decimation_${key}.png    check_original_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Multiple Spectral Profiles Smoothing
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   HD163296_13CO_2-1_subimage.fits
    Append Image    HD163296_C18O_2-1_subimage.fits
    # match C18O cube to 13CO cube spatially and spectrally via the image list widget
    Click Element    ${IMAGE_LIST_SECOND_MATCHING_XY}
    Click Element    data:testid:image-list-1-matching-z
    Load Region File    region_003.crtf
    Click Element    //*[contains(text(), "Region List")]
    # select the rectangle region
    Click Element    data:testid:region-list-table-row-2
    Click Element    id:SpectralProfilerButton
    # select the image checkbox to enable image multi-plot mode
    Click Element    //*[@data-testid="spectral-profiler-0-content"]//*[contains(text(), "Image")]
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_BUTTON}
    Click Element    //*[contains(text(), "Styling")]
    # increase the line width in the profile plot
    Repeat Keyword    4    Click Element    data:testid:profiler-settings-line-width-input-increment-button
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${SPECTRAL_PROFILER_PLOT}    check_${key}.png
    # apply smoothing with the binning method
    Click Element    data:testid:smoothing-button
    Click Element    data:testid:smoothing-settings-method-dropdown
    Click Element    //option[contains(text(), "Binning")]
    Click Element    css:[data-testid="smoothing-settings-overlay-toggle"] + span
    Repeat Keyword    2    Click Element    data:testid:smoothing-settings-binning-width-input-increment-button
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Capture Element Screenshot    ${SPECTRAL_PROFILER_PLOT}    check2_${key}.png

    Set Selenium Speed    0
    PNG Images Should Be Different    check_${key}.png    check2_${key}.png
    PNG Two Pixels Should Have Matched RGBA    check2_${key}.png    371,16,424,44
    PNG Two Pixels Should Have Matched RGBA    check2_${key}.png    361,33,430,56
    PNG Two Pixels Should Have Matched RGBA    check2_${key}.png    371,16,361,33    
    PNG Two Pixels Should Have Matched RGBA    check2_${key}.png    367,104,441,126
    PNG Two Pixels Should Have Matched RGBA    check2_${key}.png    394,114,434,135
    PNG Two Pixels Should Have Matched RGBA    check2_${key}.png    367,104,394,114
    PNG Two Pixels Should Not Have Matched RGBA    check2_${key}.png    371,16,367,104
    PNG Two Pixels Should Not Have Matched RGBA    check2_${key}.png    361,33,394,114
    PNG Two Pixels Should Not Have Matched RGBA    check2_${key}.png    371,16,394,114
    PNG Two Pixels Should Not Have Matched RGBA    check2_${key}.png    361,33,367,104
    Remove Files    check_${key}.png    check2_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Spectral Profile Fitting Guess Then Fit
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    # enter the point region creation mode via the region shortcut button
    Click Element    ${POINT_REGION_SHORTCUT_BUTTON}
    # create a point region at the center of the image view
    Click Element    ${VIEWER_DIV}
    # launch the region config dialog by double-clicking the point region
    Double Click Element    ${VIEWER_DIV}
    # switch to image Cooridnate and set a new center position
    Click Element    //*[contains(text(), "Image")]
    Press Keys    //input[@placeholder="X Coordinate"]    DELETE
    Input Text    //input[@placeholder="X Coordinate"]    63
    Press Keys    //input[@placeholder="Y Coordinate"]    DELETE
    Input Text    //input[@placeholder="Y Coordinate"]    43
    # click the image Cooridnate radio button again to apply changes
    Click Element    //*[contains(text(), "Image")]
    # close the region config dialog
    Click Element    data:testid:region-dialog-header-close-button
    # launch a spectral profiler widget
    Click Element    id:SpectralProfilerButton
    #Sleep    0.5
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${SPECTRAL_PROFILER_PLOT}    check_${key}.png
    # click the profile fitting button
    Click Element    ${PROFILE_FITTING_BUTTON}
    # click the auto detect button    
    Click Element    ${PROFILE_FITTING_AUTO_DETECT_BUTTON}
    Set Selenium Speed    0
    # check the auto detect results
    Element Should Contain    data:testid:profile-fitting-auto-detect-info    detected 5 components.
    Element Attribute Value Should Be    data:testid:profile-fitting-component-input    value    5
    Element Attribute Value Should Be    data:testid:profile-fitting-center-input    value    349.47310991224464
    Element Attribute Value Should Be    data:testid:profile-fitting-amplitude-input    value    0.17664572759531438
    Element Attribute Value Should Be    data:testid:profile-fitting-fwhm-input    value    0.004394980985239272
    Set Selenium Speed    ${DELAY}
    # close the profile fitting dialog
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    #Sleep    0.5
    Capture Element Screenshot    ${SPECTRAL_PROFILER_PLOT}    check2_${key}.png
    Set Selenium Speed    0
    PNG Images Should Be Different    check_${key}.png    check2_${key}.png
    PNG Two Pixels Should Not Have Matched RGBA    check2_${key}.png    100,80,197,80
    PNG Two Pixels Should Have Matched RGBA    check2_${key}.png    197,80,409,80
    PNG Two Pixels Should Have Matched RGBA    check2_${key}.png    409,80,538,80
    PNG Two Pixels Should Have Matched RGBA    check2_${key}.png    538,80,583,80
    PNG Two Pixels Should Not Have Matched RGBA    check2_${key}.png    583,80,738,80
    PNG Two Pixels Should Not Have Matched RGBA    check2_${key}.png    738,80,100,80    
    Set Selenium Speed    ${DELAY}
    # launch the profile fitting dialog
    Click Element    ${PROFILE_FITTING_BUTTON}
    # click the auto detect button
    Click Element    ${PROFILE_FITTING_AUTO_DETECT_BUTTON}
    # make the fit button visible and click it to trigger profile fitting
    Scroll Element Into View    ${PROFILE_FITTING_FIT_BUTTON}
    Click Element    ${PROFILE_FITTING_FIT_BUTTON}
    Set Selenium Speed    0
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Component #1
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Center \= 349.387533 (GHz)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Center Error \= 0.000084 (0.000%)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Amplitude \= 0.190430 (Jy/beam)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Amplitude Error \= 0.006077 (3.191%)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    FWHM \= 0.005394 (GHz)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    FWHM Error \= 0.000199 (3.685%)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Integral \= 0.001093 (Jy/beam * GHz)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Integral Error ~\= 0.000035 (3.191%)

    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Component #2
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Center \= 349.421432 (GHz)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Center Error \= 0.000071 (0.000%)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Amplitude \= 0.208667 (Jy/beam)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Amplitude Error \= 0.006609 (3.167%)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    FWHM \= 0.004561 (GHz)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    FWHM Error \= 0.000167 (3.657%)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Integral \= 0.001013 (Jy/beam * GHz)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Integral Error ~\= 0.000032 (3.167%)

    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Component #3
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Center \= 349.441466 (GHz)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Center Error \= 0.000090 (0.000%)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Amplitude \= 0.215326 (Jy/beam)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Amplitude Error \= 0.005998 (2.786%)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    FWHM \= 0.005877 (GHz)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    FWHM Error \= 0.000233 (3.967%)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Integral \= 0.001347 (Jy/beam * GHz)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Integral Error ~\= 0.000044 (3.248%)

    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Component #4
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Center \= 349.448644 (GHz)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Center Error \= 0.000075 (0.000%)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Amplitude \= 0.212583 (Jy/beam)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Amplitude Error \= 0.007165 (3.371%)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    FWHM \= 0.003906 (GHz)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    FWHM Error \= 0.000181 (4.622%)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Integral \= 0.000884 (Jy/beam * GHz)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Integral Error ~\= 0.000037 (4.206%)

    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Component #5
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Center \= 349.473138 (GHz)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Center Error \= 0.000068 (0.000%)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Amplitude \= 0.205475 (Jy/beam)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Amplitude Error \= 0.006969 (3.392%)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    FWHM \= 0.004102 (GHz)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    FWHM Error \= 0.000161 (3.916%)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Integral \= 0.000897 (Jy/beam * GHz)
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    Integral Error ~\= 0.000030 (3.392%)
    Set Selenium Speed    ${DELAY}
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}    # close fitting dialog
    #Sleep    0.5
    Capture Element Screenshot    ${SPECTRAL_PROFILER_PLOT}    check3_${key}.png
    Set Selenium Speed    0   
    PNG Images Should Be Different    check_${key}.png    check3_${key}.png
    PNG Images Should Be Different    check2_${key}.png    check3_${key}.png
    PNG Two Pixels Should Not Have Matched RGBA    check3_${key}.png    180,32,193,32
    PNG Two Pixels Should Have Matched RGBA    check3_${key}.png    193,32,409,21
    PNG Two Pixels Should Have Matched RGBA    check3_${key}.png    409,21,536,16
    PNG Two Pixels Should Have Matched RGBA    check3_${key}.png    536,16,581,16
    PNG Two Pixels Should Have Matched RGBA    check3_${key}.png    581,16,737,23
    # chech residual dots
    PNG Two Pixels Should Have Matched RGBA    check3_${key}.png    737,23,205,145
    Set Selenium Speed    ${DELAY}
    Click Element    ${PROFILE_FITTING_BUTTON}    # profile fitting button
    Scroll Element Into View    ${PROFILE_FITTING_RESET_BUTTON}
    Click Element    ${PROFILE_FITTING_RESET_BUTTON}    # reset button
    Set Selenium Speed    0
    # check the default initial values
    Element Attribute Value Should Be    data:testid:profile-fitting-component-input    value    1
    Element Attribute Value Should Be    data:testid:profile-fitting-center-input    value    0
    Element Attribute Value Should Be    data:testid:profile-fitting-amplitude-input    value    0
    Element Attribute Value Should Be    data:testid:profile-fitting-fwhm-input    value    0
    Element Should Contain    ${PROFILE_FITTING_RESULT_TAB}    ${EMPTY}
    Set Selenium Speed    ${DELAY}
    Click Element    ${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}    # close fitting dialog
    #Sleep    0.5
    Capture Element Screenshot    ${SPECTRAL_PROFILER_PLOT}    check4_${key}.png
    PNG Images Should Be Identical    check_${key}.png    check4_${key}.png
    Remove Files    check_${key}.png    check2_${key}.png    check3_${key}.png    check4_${key}.png
    [Teardown]    Kill carta_backend And Close Browser








# TODO: add multi-profile test for polarization when the bug is fixed.