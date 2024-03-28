*** Settings ***
Documentation     Test the functionalities of the spectral line query widget
Resource          ../resource.robot


*** Test Cases ***
Query Splatalogue
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    Click Element    id:SpectralLineQueryWidgetButton
    Wait Until Page Contains    Intensity limit    timeout=10
    Input Text    ${SPECTRAL_LINE_QUERY_FROM_INPUT}    349370    True
    Input Text    ${SPECTRAL_LINE_QUERY_TO_INPUT}    349500    True
    Click Element    ${SPECTRAL_LINE_QUERY_BUTTON}
    Wait Until Page Does Not Contain Element    ${SPECTRAL_LINE_QUERY_LOADING_ICON}    10
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 424 line(s).
    Click Element    ${SPECTRAL_LINE_QUERY_UNIT_DROPDOWN}
    # set unit to GHz
    Click Element    //*[@data-testid="spectral-line-query-unit-dropdown"]/option[contains(text(), "GHz")]
    Input Text    ${SPECTRAL_LINE_QUERY_FROM_INPUT}    349.370    True
    Input Text    ${SPECTRAL_LINE_QUERY_TO_INPUT}    349.500    True
    Click Element    ${SPECTRAL_LINE_QUERY_BUTTON}
    Wait Until Page Does Not Contain Element    ${SPECTRAL_LINE_QUERY_LOADING_ICON}    10
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 424 line(s).
    Click Element    ${SPECTRAL_LINE_QUERY_UNIT_DROPDOWN}
    # set unit to cm
    Click Element    //*[@data-testid="spectral-line-query-unit-dropdown"]/option[contains(text(), "cm")]
    Input Text    ${SPECTRAL_LINE_QUERY_FROM_INPUT}    0.08580944500100181    True
    Input Text    ${SPECTRAL_LINE_QUERY_TO_INPUT}    0.08577752732474964    True
    Click Element    ${SPECTRAL_LINE_QUERY_BUTTON}
    Wait Until Page Does Not Contain Element    ${SPECTRAL_LINE_QUERY_LOADING_ICON}    10
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 424 line(s).
    Click Element    ${SPECTRAL_LINE_QUERY_UNIT_DROPDOWN}
    # set unit to mm
    Click Element    //*[@data-testid="spectral-line-query-unit-dropdown"]/option[contains(text(), "mm")]
    Input Text    ${SPECTRAL_LINE_QUERY_FROM_INPUT}    0.8580944500100181    True
    Input Text    ${SPECTRAL_LINE_QUERY_TO_INPUT}    0.8577752732474964    True
    Click Element    ${SPECTRAL_LINE_QUERY_BUTTON}
    Wait Until Page Does Not Contain Element    ${SPECTRAL_LINE_QUERY_LOADING_ICON}    10
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 424 line(s).
    Click Element    ${SPECTRAL_LINE_QUERY_MODE_DROPDOWN}
    # set query mode from FROM-TO to CENTER-WIDTH
    Click Element    //*[@data-testid="spectral-line-query-mode-dropdown"]/option[contains(text(), "Center")]
    Input Text    ${SPECTRAL_LINE_QUERY_CENTER_INPUT}    0.8579348616287572    True
    Input Text    ${SPECTRAL_LINE_QUERY_WIDTH_INPUT}    0.00015958838126084451    True
    Click Element    ${SPECTRAL_LINE_QUERY_BUTTON}
    Wait Until Page Does Not Contain Element    ${SPECTRAL_LINE_QUERY_LOADING_ICON}    10
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 424 line(s).
    Click Element    ${SPECTRAL_LINE_QUERY_UNIT_DROPDOWN}
    Click Element    //*[@data-testid="spectral-line-query-unit-dropdown"]/option[contains(text(), "cm")]
    Input Text    ${SPECTRAL_LINE_QUERY_CENTER_INPUT}    0.08579348616287572    True
    Input Text    ${SPECTRAL_LINE_QUERY_WIDTH_INPUT}    0.000015958838126084451    True
    Click Element    ${SPECTRAL_LINE_QUERY_BUTTON}
    Wait Until Page Does Not Contain Element    ${SPECTRAL_LINE_QUERY_LOADING_ICON}    10
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 424 line(s).
    Click Element    ${SPECTRAL_LINE_QUERY_UNIT_DROPDOWN}
    Click Element    //*[@data-testid="spectral-line-query-unit-dropdown"]/option[contains(text(), "MHz")]
    Input Text    ${SPECTRAL_LINE_QUERY_CENTER_INPUT}    349435    True
    Input Text    ${SPECTRAL_LINE_QUERY_WIDTH_INPUT}    65    True
    Click Element    ${SPECTRAL_LINE_QUERY_BUTTON}
    Wait Until Page Does Not Contain Element    ${SPECTRAL_LINE_QUERY_LOADING_ICON}    10
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 424 line(s).        
    Click Element    ${SPECTRAL_LINE_QUERY_UNIT_DROPDOWN}
    Click Element    //*[@data-testid="spectral-line-query-unit-dropdown"]/option[contains(text(), "GHz")]
    Input Text    ${SPECTRAL_LINE_QUERY_CENTER_INPUT}    349.435    True
    Input Text    ${SPECTRAL_LINE_QUERY_WIDTH_INPUT}    0.065    True
    Click Element    ${SPECTRAL_LINE_QUERY_BUTTON}
    Wait Until Page Does Not Contain Element    ${SPECTRAL_LINE_QUERY_LOADING_ICON}    10
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 424 line(s).       
    [Teardown]    Kill carta_backend And Close Browser


Line Table Filtering And Shifting
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    Click Element    id:SpectralLineQueryWidgetButton
    Wait Until Page Contains    Intensity limit    timeout=10
    Input Text    ${SPECTRAL_LINE_QUERY_FROM_INPUT}    349370    True
    Input Text    ${SPECTRAL_LINE_QUERY_TO_INPUT}    349500    True
    Click Element    ${SPECTRAL_LINE_QUERY_BUTTON}
    Wait Until Page Does Not Contain Element    ${SPECTRAL_LINE_QUERY_LOADING_ICON}    10
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 424 line(s).
    # apply a filter to the Species field
    Input Text    data:testid:filterable-table-filter-input-1    CH3CN v \= 0
    Click Element    ${SPECTRAL_LINE_QUERY_FILTER_BUTTON}
    #Sleep    0.5
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 9 filtered line(s) of total 424 line(s). Applied 1 filter(s).
    # set a velocity to compute shifted frequencies
    Input Text    ${SPECTRAL_LINE_QUERY_FREQUENCY_SHIFT_INPUT}    4    True
    Click Element    ${SPECTRAL_LINE_QUERY_FILTER_BUTTON}
    # verify shifted frequency
    Element Should Contain    data:testid:filterable-table-0-3    349388.6352976394
    # switch from velocity to redshift
    Click Element    ${SPECTRAL_LINE_QUERY_FREQUENCY_SHIFT_REFERENCE}
    Click Element    //*[@data-testid="spectral-line-query-frequency-shift-reference"]/option[contains(text(), "Redshift")]
    # enter an equivalent redshift
    Press Keys    ${SPECTRAL_LINE_QUERY_FREQUENCY_SHIFT_INPUT}    BACKSPACE
    Input Text    ${SPECTRAL_LINE_QUERY_FREQUENCY_SHIFT_INPUT}    0.000013342652821046741    True
    Click Element    ${SPECTRAL_LINE_QUERY_FILTER_BUTTON}
    # verify shifted frequency
    Element Should Contain    data:testid:filterable-table-0-3    349388.63532873924
    # add another filter to "shifted frequency"
    Input Text    data:testid:filterable-table-filter-input-3    349420..349423
    Click Element    ${SPECTRAL_LINE_QUERY_FILTER_BUTTON}
    #Sleep    0.5
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 2 filtered line(s) of total 424 line(s). Applied 2 filter(s).
    #Sleep    0.5
    Click Element    ${SPECTRAL_LINE_QUERY_RESET_BUTTON}
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 424 line(s).
    [Teardown]    Kill carta_backend And Close Browser


Line Table Column Configuration
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    Click Element    id:SpectralLineQueryWidgetButton
    Wait Until Page Contains    Intensity limit    timeout=10
    Input Text    ${SPECTRAL_LINE_QUERY_FROM_INPUT}    349370    True
    Input Text    ${SPECTRAL_LINE_QUERY_TO_INPUT}    349500    True
    Click Element    ${SPECTRAL_LINE_QUERY_BUTTON}
    Wait Until Page Does Not Contain Element    ${SPECTRAL_LINE_QUERY_LOADING_ICON}    10
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 424 line(s).
    # hide Chemical Name column
    Click Element    css:[data-testid="catalog-header-table-switch-2"] + span
    # verify Chemical Name column is hidden so the column becomes Shifted Frequency
    Element Should Contain    data:testid:filterable-table-header-2    Shifted Frequency
    # show Chemical Name column
    Click Element    css:[data-testid="catalog-header-table-switch-2"] + span
    # verify Chemical Name column is displayed again
    Element Should Contain    data:testid:filterable-table-header-2    Chemical Name
    [Teardown]    Kill carta_backend And Close Browser



Line ID Overlay On Spectral Profiler
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    # create a point region at the view center
    Click Element    ${POINT_REGION_SHORTCUT_BUTTON}
    Click Element    ${VIEWER_DIV}
    # enable region config dialog
    Double Click Element    ${VIEWER_DIV}
    # switch to image coordinate and set a new position for the point region
    Click Element    css:[data-testid="coordinate-image-radio-button"] + span
    Press Keys    //input[@placeholder="X Coordinate"]    DELETE
    Input Text    //input[@placeholder="X Coordinate"]    63
    Press Keys    //input[@placeholder="Y Coordinate"]    DELETE
    Input Text    //input[@placeholder="Y Coordinate"]    43
    Click Element    css:[data-testid="coordinate-image-radio-button"] + span
    # close the region config dialog
    Click Element    css:[data-testid="region-dialog"] [class*="-dialog-close-button"]
    Click Element    id:SpectralLineQueryWidgetButton
    Wait Until Page Contains    Intensity limit    timeout=10
    Input Text    ${SPECTRAL_LINE_QUERY_FROM_INPUT}    349370    True
    Input Text    ${SPECTRAL_LINE_QUERY_TO_INPUT}    349500    True
    Click Element    ${SPECTRAL_LINE_QUERY_BUTTON}
    Wait Until Page Does Not Contain Element    ${SPECTRAL_LINE_QUERY_LOADING_ICON}    10
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 424 line(s).
    # apply a filter to the Species field
    Input Text    data:testid:filterable-table-filter-input-1    CH3CN v \= 0
    Click Element    ${SPECTRAL_LINE_QUERY_FILTER_BUTTON}
    #Sleep    0.5
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 9 filtered line(s) of total 424 line(s). Applied 1 filter(s).
    Input Text    ${SPECTRAL_LINE_QUERY_FREQUENCY_SHIFT_INPUT}    4.5    True
    Click Element    ${SPECTRAL_LINE_QUERY_FILTER_BUTTON}
    # select all filtered lines in the table
    # workaround for Blueprint Table: two duplicated tables are created, and only the second one is interactable
    Click Element    (//input[@data-testid="filterable-table-header-checkbox"]/parent::label//span)[2]
    Click Element    id:SpectralProfilerButton
    Click Element    ${SPECTRAL_LINE_QUERY_PLOT_BUTTON}
    # capture a screenshot of the spectral profile plot
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${SPECTRAL_PROFILER_PLOT}    check_${key}.png
    Click Element    ${SPECTRAL_LINE_QUERY_CLEAR_BUTTON}
    # bring spectral profile plot to frontend
    Click Element    data:testid:spectral-profiler-0-header-dock-button
    # capture a screenshot of the spectral profile plot
    Capture Element Screenshot    ${SPECTRAL_PROFILER_PLOT}    check2_${key}.png
    Set Selenium Speed    0
    PNG Images Should Be Different    check_${key}.png    check2_${key}.png
    
    # NEED A MORE ROBUST TEST HERE
    
    # with line ID label (note the rgba inconsistency due to anti-aliasing)
    #IF    '${BROWSER}' == 'headlesschrome'
    #PNG Pixel XY Should Match RGBA    check_${key}.png    199,15,129,188,165,255
    #PNG Pixel XY Should Match RGBA    check_${key}.png    415,15,129,188,165,255
    #PNG Pixel XY Should Match RGBA    check_${key}.png    544,15,129,188,165,255
    #PNG Pixel XY Should Match RGBA    check_${key}.png    588,15,129,188,165,255
    #END
    #IF    '${BROWSER}' == 'chrome'
    #PNG Pixel XY Should Match RGBA    check_${key}.png    199,15,13,128,80,255
    #PNG Pixel XY Should Match RGBA    check_${key}.png    415,15,14,129,81,255
    #PNG Pixel XY Should Match RGBA    check_${key}.png    544,15,15,129,82,255
    #PNG Pixel XY Should Match RGBA    check_${key}.png    588,15,14,128,81,255
    #END
    # without line ID label
    #PNG Pixel XY Should Match RGBA    check2_${key}.png    199,15,245,248,250,255
    #PNG Pixel XY Should Match RGBA    check2_${key}.png    415,15,245,248,250,255
    #PNG Pixel XY Should Match RGBA    check2_${key}.png    544,15,245,248,250,255
    #PNG Pixel XY Should Match RGBA    check2_${key}.png    588,15,245,248,250,255    
    
    Remove Files    check_${key}.png    check2_${key}.png
    [Teardown]    Kill carta_backend And Close Browser
