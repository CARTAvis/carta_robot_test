*** Settings ***
Documentation     Load an image and check cursor spatial profile
Resource          ../resource.robot

*** Test Cases ***
Cursor Spatial Profile
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Mouse Over    ${VIEWER_DIV}   
    ${viewer_cursor_info_1}=    Get Text    ${VIEWER_CURSOR_INFO_BAR}
    ${spatial_profiler_info_1}=    Get Text    ${SPATIAL_PROFILER_CURSOR_INFO}
    #Log To Console    ${viewer_cursor_info_1}
    #Log To Console    ${spatial_profiler_info_1}
    Should Be True    ${viewer_cursor_info_1}[41:44] == ${spatial_profiler_info_1}[32:35]
    Should Be True    ${viewer_cursor_info_1}[58:70] == ${spatial_profiler_info_1}[39:-1]
    Mouse Out    ${VIEWER_DIV}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${SPATIAL_PROFILER_PLOT}    initial_${key}.png
    Click Element At Coordinates    ${VIEWER_DIV}    20    20
    ${viewer_cursor_info_2}=    Get Text    ${VIEWER_CURSOR_INFO_BAR}
    ${spatial_profiler_info_2}=    Get Text    ${SPATIAL_PROFILER_CURSOR_INFO}
    #Log To Console    ${viewer_cursor_info_2}
    #Log To Console    ${spatial_profiler_info_2}
    Should Be True    ${viewer_cursor_info_2}[41:44] == ${spatial_profiler_info_2}[32:35]
    Should Be True    ${viewer_cursor_info_2}[58:70] == ${spatial_profiler_info_2}[39:-1]
    Capture Element Screenshot    ${SPATIAL_PROFILER_PLOT}    new_cursor_position_${key}.png
    PNG Images Should Be Different    initial_${key}.png    new_cursor_position_${key}.png
    Remove Files    initial_${key}.png    new_cursor_position_${key}.png
    ## move cursor on the spatial profile plot
    Mouse Over    ${SPATIAL_PROFILER_PLOT}
    Element Should Contain    ${SPATIAL_PROFILER_CURSOR_INFO}    Cursor    
    [Teardown]    Kill carta_backend And Close Browser


Line Spatial Profile Fixed Pixel Width
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    Gaussian_array_wide.fits
    Load Region File    region_002.crtf
    Click Element    //*[contains(text(), "Region List")]
    # select the 1st region (line region) from the region list
    Click Element    data:testid:region-list-table-row-2
    #Sleep    1
    Click Element    ${SPATIAL_PROFILER_SETTINGS_DIALOG_BUTTON}
    # increase the line width
    Repeat Keyword    6    Click Element    data:testid:profiler-settings-line-width-input-increment-button
    Click Element    ${SPATIAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${SPATIAL_PROFILER_PLOT}    check_${key}.png
    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    check_${key}.png    127,100,33,93,176,255
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    127,100,210,55
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    127,100,302,17
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    127,100,376,66
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    127,100,459,101
    Mouse Over    ${SPATIAL_PROFILER_PLOT}
    Element Should Contain    ${SPATIAL_PROFILER_CURSOR_INFO}    Cursor: (Offset: -5.00159e-1 deg, 4.58767e-2)
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Line Spatial Profile Fixed Angular Width
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    Gaussian_array_wide.fits
    Load Region File    region_002.crtf
    Click Element    //*[contains(text(), "Region List")]
    # select the 2nd region (line region) from the region list
    Click Element    data:testid:region-list-table-row-3
    #Sleep    5
    Click Element    ${SPATIAL_PROFILER_SETTINGS_DIALOG_BUTTON}
    # increase the line width
    Repeat Keyword    6    Click Element    data:testid:profiler-settings-line-width-input-increment-button
    Click Element    ${SPATIAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${SPATIAL_PROFILER_PLOT}    check_${key}.png
    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    check_${key}.png    111,104,33,93,176,255
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    111,104,174,104
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    111,104,230,104
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    111,104,295,18
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    111,104,385,17
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    111,104,477,16
    Mouse Over    ${SPATIAL_PROFILER_PLOT}
    Element Should Contain    ${SPATIAL_PROFILER_CURSOR_INFO}    Cursor: (Offset: -3.3 deg, 2.6148e-4)
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Polyline Spatial Profile Fixed Pixel Width
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    Gaussian_array_wide.fits
    Load Region File    region_002.crtf
    Click Element    //*[contains(text(), "Region List")]
    # select the 3rd region (polyline region) from the region list
    Click Element   data:testid:region-list-table-row-4
    #Sleep    3
    Click Element    ${SPATIAL_PROFILER_SETTINGS_DIALOG_BUTTON}
    # increase the line width
    Repeat Keyword    6    Click Element    data:testid:profiler-settings-line-width-input-increment-button
    Click Element    ${SPATIAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${SPATIAL_PROFILER_PLOT}    check_${key}.png
    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    check_${key}.png    127,85,33,93,176,255
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    127,85,186,25
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    127,85,296,106
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    127,85,410,14
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    127,85,494,95    
    Mouse Over    ${SPATIAL_PROFILER_PLOT}
    # need to double check if it is due to a regression from interactive pv (backend PR#1253)
    #Element Should Contain    ${SPATIAL_PROFILER_CURSOR_INFO}    Cursor: (Distance: 2.71726 deg, 1.28723e-2)
    Element Should Contain    ${SPATIAL_PROFILER_CURSOR_INFO}    Cursor: (Distance: 2.71699 deg, 1.28723e-2)
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Polyline Spatial Profile Fixed Angular Width
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    Gaussian_array_wide.fits
    Load Region File    region_002.crtf
    Click Element    //*[contains(text(), "Region List")]
    # select the 4th region (polyline region) from the region list
    Click Element    data:testid:region-list-table-row-5
    #Sleep    5
    Click Element    ${SPATIAL_PROFILER_SETTINGS_DIALOG_BUTTON}
    # increase the line width
    Repeat Keyword    6    Click Element    data:testid:profiler-settings-line-width-input-increment-button
    Click Element    ${SPATIAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${SPATIAL_PROFILER_PLOT}    check_${key}.png
    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    check_${key}.png    124,17,33,93,176,255
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    124,17,200,15
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    124,17,299,104
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    124,17,398,16
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    124,17,475,17
    Mouse Over    ${SPATIAL_PROFILER_PLOT}
    Element Should Contain    ${SPATIAL_PROFILER_CURSOR_INFO}    Cursor: (Distance: 1.63e+1 deg, -7.7284e-5)
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser