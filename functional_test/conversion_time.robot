*** Settings ***
Documentation     Test conversions of time
Resource          ../resource.robot

*** Test Cases ***
Time conversion
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    variable_source_09.fits
    Append Image    variable_source_04.fits
    Append Image    variable_source_10.fits
    Append Image    variable_source_08.fits
    Click Element    data:testid:image-list-3-matching-t

    # switch to the animator widget and enable its settings dialog
    Click Element    //*[normalize-space(text())='Animator']
    Click Element    data:testid:animator-0-header-settings-button
    
    # switch to ISO 8601 time format
    Click Element    data:testid:animator-time-label-format
    Click Element    //*[normalize-space(text())='ISO 8601']
    # set precision to seconds
    Click Element    data:testid:animator-iso-time-precision
    Click Element    //*[normalize-space(text())='Seconds']
    # check format: time zone UTC (skip custom time zone test), precision seconds
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[10]/div/div/div/div/div[2]/div[2]/div[1]/div/div[2]/div[1]    2026-01-01T16:00:00Z

    # switch to MJD time format
    Click Element    data:testid:animator-time-label-format
    Click Element    //*[normalize-space(text())='Modified Julian Date (MJD)']
    # set precision to 
    Click Element    data:testid:animator-numeric-time-precision
    Click Element    //*[@id="bp6-tab-panel_animatorSettingsTabs_time-series"]/div/section[3]/div/div/div/select/option[11]
    # check format: scale UTC
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[10]/div/div/div/div/div[2]/div[2]/div[1]/div/div[2]/div[1]    61041.666666667
    # check format: scale TAI
    Click Element    data:testid:animator-time-scale
    Click Element    //*[normalize-space(text())='TAI']
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[10]/div/div/div/div/div[2]/div[2]/div[1]/div/div[2]/div[1]    61041.667094907
    # check format: scale TT
    Click Element    data:testid:animator-time-scale
    Click Element    //*[normalize-space(text())='TT']
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[10]/div/div/div/div/div[2]/div[2]/div[1]/div/div[2]/div[1]    61041.667467407
    # check format: scale TCG
    Click Element    data:testid:animator-time-scale
    Click Element    //*[normalize-space(text())='TCG']
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[10]/div/div/div/div/div[2]/div[2]/div[1]/div/div[2]/div[1]    61041.667479881

    # switch to JD time format
    Click Element    data:testid:animator-time-label-format
    Click Element    //*[normalize-space(text())='Julian Date (JD)']
    # check format: scale UTC
    Click Element    data:testid:animator-time-scale
    Click Element    //*[normalize-space(text())='UTC']
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[10]/div/div/div/div/div[2]/div[2]/div[1]/div/div[2]/div[1]    2461042.166666667
    # check format: scale TAI
    Click Element    data:testid:animator-time-scale
    Click Element    //*[normalize-space(text())='TAI']
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[10]/div/div/div/div/div[2]/div[2]/div[1]/div/div[2]/div[1]    2461042.167094907
    # check format: scale TT
    Click Element    data:testid:animator-time-scale
    Click Element    //*[normalize-space(text())='TT']
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[10]/div/div/div/div/div[2]/div[2]/div[1]/div/div[2]/div[1]    2461042.167467407
    # check format: scale TCG
    Click Element    data:testid:animator-time-scale
    Click Element    //*[normalize-space(text())='TCG']
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[10]/div/div/div/div/div[2]/div[2]/div[1]/div/div[2]/div[1]    2461042.167479881
    
    # switch to relative time format
    Click Element    data:testid:animator-time-label-format
    Click Element    //*[normalize-space(text())='Relative']
    # set scale to UTC
    Click Element    data:testid:animator-time-scale
    Click Element    //*[normalize-space(text())='UTC']
    # set relative unit to hours
    Click Element    data:testid:animator-relative-time-unit
    Click Element    //*[normalize-space(text())='Hours']
    # check format: reference as first observation
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[10]/div/div/div/div/div[2]/div[2]/div[1]/div/div[2]/div[1]    0.000000000 h
    
    # check format: reference as time-series image with reference image as "variable_source_08.fits"
    Click Element    data:testid:animator-relative-reference
    Click Element    //*[normalize-space(text())='Time-series image']
    Click Element    data:testid:animator-relative-reference-image
    Click Element    //*[@id="bp6-tab-panel_animatorSettingsTabs_time-series"]/div/section[2]/div[3]/div/div/select/option[2]
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[10]/div/div/div/div/div[2]/div[2]/div[1]/div/div[2]/div[1]    -21.333333333 h

    # check format: reference as a custom epoch of MJD 65000
    Click Element    data:testid:animator-relative-reference
    Click Element    //*[normalize-space(text())='Custom epoch']
    Input Text    data:testid:animator-relative-reference-mjd    65000
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[10]/div/div/div/div/div[2]/div[2]/div[1]/div/div[2]/div[1]    -95000.000000000 h

    [Teardown]    Kill carta_backend And Close Browser
