*** Settings ***
Documentation     Test the functionalities of the spectral line query widget
Resource          ../resource.robot

*** Variables ***
${MAGIC_INDEX}    18


*** Test Cases ***
Query Splatalogue
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    Click Element    //*[@id="SpectralLineQueryWidgetButton"]
    Wait Until Page Contains    Intensity limit    timeout=10
    Input Text    ${SPECTRAL_LINE_QUERY_FROM_INPUT}    349370    True
    Input Text    ${SPECTRAL_LINE_QUERY_TO_INPUT}    349500    True
    Click Element    ${SPECTRAL_LINE_QUERY_BUTTON}
    Wait Until Page Does Not Contain Element    ${SPECTRAL_LINE_QUERY_LOADING_ICON}    10
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 424 line(s).
    Click Element    ${SPECTRAL_LINE_QUERY_UNIT_DROPDOWN}
    # set unit to GHz
    Click Element    ${SPECTRAL_LINE_QUERY_UNIT_DROPDOWN}/option[1]
    Input Text    ${SPECTRAL_LINE_QUERY_FROM_INPUT}    349.370    True
    Input Text    ${SPECTRAL_LINE_QUERY_TO_INPUT}    349.500    True
    Click Element    ${SPECTRAL_LINE_QUERY_BUTTON}
    Wait Until Page Does Not Contain Element    ${SPECTRAL_LINE_QUERY_LOADING_ICON}    10
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 424 line(s).
    Click Element    ${SPECTRAL_LINE_QUERY_UNIT_DROPDOWN}
    # set unit to cm
    Click Element    ${SPECTRAL_LINE_QUERY_UNIT_DROPDOWN}/option[3]
    Input Text    ${SPECTRAL_LINE_QUERY_FROM_INPUT}    0.08580944500100181    True
    Input Text    ${SPECTRAL_LINE_QUERY_TO_INPUT}    0.08577752732474964    True
    Click Element    ${SPECTRAL_LINE_QUERY_BUTTON}
    Wait Until Page Does Not Contain Element    ${SPECTRAL_LINE_QUERY_LOADING_ICON}    10
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 424 line(s).
    Click Element    ${SPECTRAL_LINE_QUERY_UNIT_DROPDOWN}
    # set unit to mm
    Click Element    ${SPECTRAL_LINE_QUERY_UNIT_DROPDOWN}/option[4]
    Input Text    ${SPECTRAL_LINE_QUERY_FROM_INPUT}    0.8580944500100181    True
    Input Text    ${SPECTRAL_LINE_QUERY_TO_INPUT}    0.8577752732474964    True
    Click Element    ${SPECTRAL_LINE_QUERY_BUTTON}
    Wait Until Page Does Not Contain Element    ${SPECTRAL_LINE_QUERY_LOADING_ICON}    10
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 424 line(s).
    Click Element    ${SPECTRAL_LINE_QUERY_MODE_DROPDOWN}
    # set query mode from FROM-TO to CENTER-WIDTH
    Click Element    ${SPECTRAL_LINE_QUERY_MODE_DROPDOWN}/option[2]
    Input Text    ${SPECTRAL_LINE_QUERY_FROM_INPUT}    0.8579348616287572    True
    Input Text    ${SPECTRAL_LINE_QUERY_TO_INPUT}    0.00015958838126084451    True
    Click Element    ${SPECTRAL_LINE_QUERY_BUTTON}
    Wait Until Page Does Not Contain Element    ${SPECTRAL_LINE_QUERY_LOADING_ICON}    10
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 424 line(s).
    Click Element    ${SPECTRAL_LINE_QUERY_UNIT_DROPDOWN}
    Click Element    ${SPECTRAL_LINE_QUERY_UNIT_DROPDOWN}/option[3]
    Input Text    ${SPECTRAL_LINE_QUERY_FROM_INPUT}    0.08579348616287572    True
    Input Text    ${SPECTRAL_LINE_QUERY_TO_INPUT}    0.000015958838126084451    True
    Click Element    ${SPECTRAL_LINE_QUERY_BUTTON}
    Wait Until Page Does Not Contain Element    ${SPECTRAL_LINE_QUERY_LOADING_ICON}    10
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 424 line(s).
    Click Element    ${SPECTRAL_LINE_QUERY_UNIT_DROPDOWN}
    Click Element    ${SPECTRAL_LINE_QUERY_UNIT_DROPDOWN}/option[2]
    Input Text    ${SPECTRAL_LINE_QUERY_FROM_INPUT}    349435    True
    Input Text    ${SPECTRAL_LINE_QUERY_TO_INPUT}    65    True
    Click Element    ${SPECTRAL_LINE_QUERY_BUTTON}
    Wait Until Page Does Not Contain Element    ${SPECTRAL_LINE_QUERY_LOADING_ICON}    10
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 424 line(s).        
    Click Element    ${SPECTRAL_LINE_QUERY_UNIT_DROPDOWN}
    Click Element    ${SPECTRAL_LINE_QUERY_UNIT_DROPDOWN}/option[1]
    Input Text    ${SPECTRAL_LINE_QUERY_FROM_INPUT}    349.435    True
    Input Text    ${SPECTRAL_LINE_QUERY_TO_INPUT}    0.065    True
    Click Element    ${SPECTRAL_LINE_QUERY_BUTTON}
    Wait Until Page Does Not Contain Element    ${SPECTRAL_LINE_QUERY_LOADING_ICON}    10
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 424 line(s).       
    [Teardown]    Kill carta_backend And Close Browser


Line Table Filtering And Shifting
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    Click Element    //*[@id="SpectralLineQueryWidgetButton"]
    Wait Until Page Contains    Intensity limit    timeout=10
    Input Text    ${SPECTRAL_LINE_QUERY_FROM_INPUT}    349370    True
    Input Text    ${SPECTRAL_LINE_QUERY_TO_INPUT}    349500    True
    Click Element    ${SPECTRAL_LINE_QUERY_BUTTON}
    Wait Until Page Does Not Contain Element    ${SPECTRAL_LINE_QUERY_LOADING_ICON}    10
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 424 line(s).
    # apply a filter to the Species field
    Input Text    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[2]/div[2]/div[2]/span/div/input    CH3CN v \= 0
    Click Element    ${SPECTRAL_LINE_QUERY_FILTER_BUTTON}
    #Sleep    0.5
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 9 filtered line(s) of total 424 line(s). Applied 1 filter(s).
    # set a velocity to compute shifted frequencies
    Input Text    ${SPECTRAL_LINE_QUERY_FREQUENCY_SHIFT_INPUT}    4    True
    Click Element    ${SPECTRAL_LINE_QUERY_FILTER_BUTTON}
    # verify shifted frequency
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div[2]/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    349388.6352976394
    # switch from velocity to redshift
    Click Element    ${SPECTRAL_LINE_QUERY_FREQUENCY_SHIFT_REFERENCE}
    Click Element    ${SPECTRAL_LINE_QUERY_FREQUENCY_SHIFT_REFERENCE}/option[2]
    # enter an equivalent redshift
    Press Keys    ${SPECTRAL_LINE_QUERY_FREQUENCY_SHIFT_INPUT}    BACKSPACE
    Input Text    ${SPECTRAL_LINE_QUERY_FREQUENCY_SHIFT_INPUT}    0.000013342652821046741    True
    Click Element    ${SPECTRAL_LINE_QUERY_FILTER_BUTTON}
    # verify shifted frequency
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div[2]/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    349388.63532873924
    # add another filter to "shifted frequency"
    Input Text    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div/div/div[2]/div/div[1]/div[2]/div[2]/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[4]/div[2]/div[2]/div[2]/span/div/input    349420..349423
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
    Click Element    //*[@id="SpectralLineQueryWidgetButton"]
    Wait Until Page Contains    Intensity limit    timeout=10
    Input Text    ${SPECTRAL_LINE_QUERY_FROM_INPUT}    349370    True
    Input Text    ${SPECTRAL_LINE_QUERY_TO_INPUT}    349500    True
    Click Element    ${SPECTRAL_LINE_QUERY_BUTTON}
    Wait Until Page Does Not Contain Element    ${SPECTRAL_LINE_QUERY_LOADING_ICON}    10
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 424 line(s).
    # hide Chemical Name column
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[9]/div/label
    # verify Chemical Name column is hidden so the column becomes Shifted Frequency
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div[3]/div[2]/div[1]/div[1]/div/div/label/span[2]    Shifted Frequency
    # show Chemical Name column
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[9]/div/label
    # verify Chemical Name column is displayed again
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div[3]/div[2]/div[1]/div[1]/div/div/label/span[2]    Chemical Name
    [Teardown]    Kill carta_backend And Close Browser



Line ID Overlay On Spectral Profiler
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    # create a point region at the view center
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[1]/a
    Click Element    ${VIEWER_DIV}
    # enable region config dialog
    Double Click Element    ${VIEWER_DIV}
    # switch to image coordinate and set a new position for the point region
    Click Element    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[1]/label[1]
    Press Keys    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[3]/div/div[1]/div/input    DELETE
    Input Text    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[3]/div/div[1]/div/input    63
    Press Keys    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[3]/div/div[2]/div/input    DELETE
    Input Text    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[3]/div/div[2]/div/input    43
    Click Element    //*[@id="bp3-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[1]/label[1]
    # close the region config dialog
    Click Element    //*[@id="root"]/div/div[2]/div/div[1]/div[2]/div/div[1]/button
    Click Element    //*[@id="SpectralLineQueryWidgetButton"]
    Wait Until Page Contains    Intensity limit    timeout=10
    Input Text    ${SPECTRAL_LINE_QUERY_FROM_INPUT}    349370    True
    Input Text    ${SPECTRAL_LINE_QUERY_TO_INPUT}    349500    True
    Click Element    ${SPECTRAL_LINE_QUERY_BUTTON}
    Wait Until Page Does Not Contain Element    ${SPECTRAL_LINE_QUERY_LOADING_ICON}    10
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 424 line(s).
    # apply a filter to the Species field
    Input Text    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[2]/div[2]/div[2]/span/div/input    CH3CN v \= 0
    Click Element    ${SPECTRAL_LINE_QUERY_FILTER_BUTTON}
    #Sleep    0.5
    Element Should Contain    ${SPECTRAL_LINE_QUERY_INFO}    Showing 9 filtered line(s) of total 424 line(s). Applied 1 filter(s).
    Input Text    ${SPECTRAL_LINE_QUERY_FREQUENCY_SHIFT_INPUT}    4.5    True
    Click Element    ${SPECTRAL_LINE_QUERY_FILTER_BUTTON}
    # select all filtered lines in the table
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[1]/div[2]/div[1]/div[2]/label
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    ${SPECTRAL_LINE_QUERY_PLOT_BUTTON}
    # capture a screenshot of the spectral profile plot
    ${key}=    Generate Random String    8
    Capture Element Screenshot    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    check_${key}.png
    Click Element    ${SPECTRAL_LINE_QUERY_CLEAR_BUTTON}
    # bring spectral profile plot to frontend
    Click Element At Coordinates    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]    350    0
    # capture a screenshot of the spectral profile plot
    Capture Element Screenshot    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    check2_${key}.png
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
