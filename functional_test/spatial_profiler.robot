*** Settings ***
Documentation     Load an image and check cursor spatial profile
Resource          ../resource.robot

*** Test Cases ***
Cursor Spatial Profile
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Mouse Over    ${VIEWER_DIV}   
    ${viewer_cursor_info_1}=    Get Text    ${VIEWER_CURSOR_INFO_BAR}
    ${spatial_profiler_info_1}=    Get Text    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[3]/div
    #Log To Console    ${viewer_cursor_info_1}
    #Log To Console    ${spatial_profiler_info_1}
    Should Be True    ${viewer_cursor_info_1}[41:44] == ${spatial_profiler_info_1}[32:35]
    Should Be True    ${viewer_cursor_info_1}[58:70] == ${spatial_profiler_info_1}[39:-1]
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[2]    initial.png
    Click Element At Coordinates    ${VIEWER_DIV}    20    20
    ${viewer_cursor_info_2}=    Get Text    ${VIEWER_CURSOR_INFO_BAR}
    ${spatial_profiler_info_2}=    Get Text    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[3]/div
    #Log To Console    ${viewer_cursor_info_2}
    #Log To Console    ${spatial_profiler_info_2}
    Should Be True    ${viewer_cursor_info_2}[41:44] == ${spatial_profiler_info_2}[32:35]
    Should Be True    ${viewer_cursor_info_2}[58:70] == ${spatial_profiler_info_2}[39:-1]
    Capture Element Screenshot    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[2]    new_cursor_position.png
    PNG Images Should Be Different    initial.png    new_cursor_position.png
    Remove Files    initial.png    new_cursor_position.png
    ## move cursor on the spatial profile plot
    Mouse Over    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[2]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[3]/div    Cursor    
    [Teardown]    Kill carta_backend And Close Browser





