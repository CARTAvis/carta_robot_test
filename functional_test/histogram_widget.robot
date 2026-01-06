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

    # select "current"
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[3]/div
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[3]/div/div/select/option[1]
    Click Element    ${HISTOGRAM_PLOT_CANVAS}
    # verify the changes
    Mouse Over    ${HISTOGRAM_PLOT_CANVAS}
    Sleep    0.2
    Element Should Contain    ${HISTOGRAM_PLOT_CURSOR_INFO}    Cursor: 0.00155 Jy/beam, 7 Counts

    # select Stokes I
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[3]/div
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[3]/div/div/select/option[2]
    Click Element    ${HISTOGRAM_PLOT_CANVAS}
    # verify the changes
    Mouse Over    ${HISTOGRAM_PLOT_CANVAS}
    Sleep    0.2
    Element Should Contain    ${HISTOGRAM_PLOT_CURSOR_INFO}    Cursor: 0.00155 Jy/beam, 7 Counts

    # select Stokes Q
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[3]/div
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[3]/div/div/select/option[3]
    Click Element    ${HISTOGRAM_PLOT_CANVAS}
    # verify the changes
    Mouse Over    ${HISTOGRAM_PLOT_CANVAS}
    Sleep    0.2
    Element Should Contain    ${HISTOGRAM_PLOT_CURSOR_INFO}    Cursor: -0.00002 Jy/beam, 102 Counts 

    # select Stokes U
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[3]/div
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[3]/div/div/select/option[4]
    Click Element    ${HISTOGRAM_PLOT_CANVAS}
    # verify the changes
    Mouse Over    ${HISTOGRAM_PLOT_CANVAS}
    Sleep    0.2
    Element Should Contain    ${HISTOGRAM_PLOT_CURSOR_INFO}    Cursor: -0.00003 Jy/beam, 143 Counts   
    
    # select Stokes V
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[3]/div
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[3]/div/div/select/option[5]
    Click Element    ${HISTOGRAM_PLOT_CANVAS}
    # verify the changes
    Mouse Over    ${HISTOGRAM_PLOT_CANVAS}
    Sleep    0.2
    Element Should Contain    ${HISTOGRAM_PLOT_CURSOR_INFO}    Cursor: -7.65083e-6 Jy/beam, 112 Counts     
    
    # select PTotal
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[3]/div
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[3]/div/div/select/option[6]
    Click Element    ${HISTOGRAM_PLOT_CANVAS}
    # verify the changes
    Mouse Over    ${HISTOGRAM_PLOT_CANVAS}
    Sleep    0.2
    Element Should Contain    ${HISTOGRAM_PLOT_CURSOR_INFO}    Cursor: 0.00003 Jy/beam, 161 Counts     
    
    # select PLinear
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[3]/div
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[3]/div/div/select/option[7]
    Click Element    ${HISTOGRAM_PLOT_CANVAS}
    # verify the changes
    Mouse Over    ${HISTOGRAM_PLOT_CANVAS}
    Sleep    0.2
    Element Should Contain    ${HISTOGRAM_PLOT_CURSOR_INFO}    Cursor: 0.00003 Jy/beam, 125 Counts     
    
    # select PFTotal
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[3]/div
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[3]/div/div/select/option[8]
    Click Element    ${HISTOGRAM_PLOT_CANVAS}
    # verify the changes
    Mouse Over    ${HISTOGRAM_PLOT_CANVAS}
    Sleep    0.2
    Element Should Contain    ${HISTOGRAM_PLOT_CURSOR_INFO}    Cursor: -761505.95898 %, 0 Count 

    # select PFLinear
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[3]/div
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[3]/div/div/select/option[9]
    Click Element    ${HISTOGRAM_PLOT_CANVAS}
    # verify the changes
    Mouse Over    ${HISTOGRAM_PLOT_CANVAS}
    Sleep    0.2
    Element Should Contain    ${HISTOGRAM_PLOT_CURSOR_INFO}    Cursor: -755495.90625 %, 0 Count 

    # select PAngle
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[3]/div
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[1]/div[3]/div/div/select/option[10]
    Click Element    ${HISTOGRAM_PLOT_CANVAS}
    # verify the changes
    Mouse Over    ${HISTOGRAM_PLOT_CANVAS}
    Sleep    0.2
    Element Should Contain    ${HISTOGRAM_PLOT_CURSOR_INFO}    Cursor: -13.02918 degree, 38 Counts

    [Teardown]    Kill carta_backend And Close Browser

Histogram rendering styling
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Pass Execution    To be implemented
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser
