*** Settings ***
Documentation     Test region histogram widget functionality
Resource          ../resource.robot


*** Test Cases ***
Region Histogram Generation
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_with_carta.crtf
    Click Element    //*[contains(text(), "Region List")]
    Click Element    id:HistogramWidgetButton
    Mouse Over    ${HISTOGRAM_PLOT_CANVAS}
    # full image historgam
    Element Should Contain    ${HISTOGRAM_PLOT_CURSOR_INFO}    Cursor: 1.27003 Jy/beam.km/s, 13 Counts
    # rectangle region histogram
    Click Element    data:testid:region-list-table-row-4
    Mouse Over    ${HISTOGRAM_PLOT_CANVAS}
    Sleep    0.2
    Element Should Contain    ${HISTOGRAM_PLOT_CURSOR_INFO}    Cursor: 0.08037 Jy/beam.km/s, 60 Counts
    # ellipse region histogram
    Click Element    data:testid:region-list-table-row-5
    Mouse Over    ${HISTOGRAM_PLOT_CANVAS}
    Sleep    0.2
    Element Should Contain    ${HISTOGRAM_PLOT_CURSOR_INFO}    Cursor: 0.06522 Jy/beam.km/s, 39 Counts
    # polygon region histogram
    Click Element    data:testid:region-list-table-row-6
    Mouse Over    ${HISTOGRAM_PLOT_CANVAS}
    Sleep    0.2
    Element Should Contain    ${HISTOGRAM_PLOT_CURSOR_INFO}    Cursor: 0.11402 Jy/beam.km/s, 54 Counts
    # cursor region histogram -> full image histogram
    Click Element    data:testid:region-list-table-row-1
    Mouse Over    ${HISTOGRAM_PLOT_CANVAS}
    Sleep    0.2
    Element Should Contain    ${HISTOGRAM_PLOT_CURSOR_INFO}    Cursor: 1.27003 Jy/beam.km/s, 13 Counts
    # point region histogram -> full image histogram
    Click Element    data:testid:region-list-table-row-2
    Mouse Over    ${HISTOGRAM_PLOT_CANVAS}
    Sleep    0.2
    Element Should Contain    ${HISTOGRAM_PLOT_CURSOR_INFO}    Cursor: 1.27003 Jy/beam.km/s, 13 Counts
    # line region histogram -> full image histogram
    Click Element    data:testid:region-list-table-row-3
    Mouse Over    ${HISTOGRAM_PLOT_CANVAS}
    Sleep    0.2
    Element Should Contain    ${HISTOGRAM_PLOT_CURSOR_INFO}    Cursor: 1.27003 Jy/beam.km/s, 13 Counts
    # polyline region histogram -> full image histogram
    Click Element    data:testid:region-list-table-row-7
    Mouse Over    ${HISTOGRAM_PLOT_CANVAS}
    Sleep    0.2
    Element Should Contain    ${HISTOGRAM_PLOT_CURSOR_INFO}    Cursor: 1.27003 Jy/beam.km/s, 13 Counts
    [Teardown]    Kill carta_backend And Close Browser


Custom Parameters for Histogram Generation
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_with_carta.crtf
    Click Element    //*[contains(text(), "Region List")]
    Click Element    data:testid:region-list-table-row-4
    Click Element    id:HistogramWidgetButton    
    # enable the settings dialog
    Click Element    data:testid:histogram-0-header-settings-button
    # disable auto bound
    Click Element    ${HISTOGRAM_AUTO_BOUND_TOGGLE}
    # set min and max
    Input Text    ${HISTOGRAM_MANUAL_BOUND_MIN_INPUT}    0.02    clear=True
    Input Text    ${HISTOGRAM_MANUAL_BOUND_MAX_INPUT}    0.15    clear=True    
    # disable auto bins
    Click Element    ${HISTOGRAM_AUTO_BINS_TOGGLE}
    Input Text    ${HISTOGRAM_MANUAL_MAX_BINS_INPUT}    100
    # adjust bins slider
    Click Element    ${HISTOGRAM_MANUAL_BINS_SLIDER}
    # close the settings dialog
    Click Element    ${HISTOGRAM_SETTINGS_DIALOG_CLOSE_BUTTON}
    # verify the changes
    Mouse Over    ${HISTOGRAM_PLOT_CANVAS}
    Sleep    0.2
    Element Should Contain    ${HISTOGRAM_PLOT_CURSOR_INFO}    Cursor: 0.07480 Jy/beam.km/s, 73 Counts
    [Teardown]    Kill carta_backend And Close Browser

Manual Selection of Displayed Histogram
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HL_Tau_StokesIQUV_clean.pbcor.fits
    Append Image    HL_tau_Stokes_hypercube_IQU.pbcor.fits
    Mouse Over    ${VIEWER_DIV}
    Click Element    ${VIEWER_10_MATCH_BUTTON}
    Click Element    //*[contains(text(), "Spatial only")]
    Load Region File    all_region_generated_with_carta_pix.crtf
    Click Element    id:HistogramWidgetButton
    # select target image
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[1]/div
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[1]/div/div/select/option[2]
    Click Element    ${HISTOGRAM_PLOT_CANVAS}
    # select region
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[2]/div
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[2]/div/div/select/option[5]
    Click Element    ${HISTOGRAM_PLOT_CANVAS}
    # select polarization # BUG: no histogram shown for polarization other than I
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[3]/div
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[3]/div/div/select/option[4]
    Click Element    ${HISTOGRAM_PLOT_CANVAS}
    # verify the changes
    Mouse Over    ${HISTOGRAM_PLOT_CANVAS}
    Sleep    0.2
    Element Should Contain    ${HISTOGRAM_PLOT_CURSOR_INFO}    Cursor: -0.00003 Jy/beam, 143 Counts   
    [Teardown]    Kill carta_backend And Close Browser


Histogram rendering styling
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    # enable histogram widget and its settings dialog
    Click Element    id:HistogramWidgetButton
    Sleep    0.2
    ${key}=    Generate Random String    8
    Capture Element Screenshot    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[2]/div/div[1]/div/canvas    check_before_${key}.png
    Click Element    data:testid:histogram-0-header-settings-button

    # set styling 
    Click Element    //*[normalize-space(text())='Styling']
    # make line thicker
    Repeat Keyword    4    Click Element    data:testid:profiler-settings-line-width-input-increment-button
    # disable log mode
    Click Element    //*[@id="bp6-tab-panel_histogramSettingTabs_0"]/div/div[4]/div/label
    # enable mean/rms highlight
    Click Element    //*[@id="bp6-tab-panel_histogramSettingTabs_0"]/div/div[5]/div/label

    # close the settings dialog
    Click Element    data:testid:histogram-0-floating-settings-0-header-close-button

    Capture Element Screenshot    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[2]/div/div[1]/div/canvas    check_after_${key}.png

    PNG Images Should Be Different    check_before_${key}.png    check_after_${key}.png
    # check line
    PNG Pixel XY Should Match RGBA    check_after_${key}.png    337,99,33,93,176,255
    # check mean/rms marker, disabled due to a bug
    # PNG Pixel XY Should Match RGBA    check_after_${key}.png    278,100,33,93,176,255
 
    Remove Files    check_before_${key}.png    check_after_${key}.png 
    [Teardown]    Kill carta_backend And Close Browser
