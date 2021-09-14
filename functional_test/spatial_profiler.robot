*** Settings ***
Documentation     Load an image and check cursor spatial profile
Resource          ../resource.robot

*** Test Cases ***
Cursor Spatial Profile
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Wait Until Page Contains Element    ${FITS_M17_SWex}    timeout=2
    Click Element    ${FITS_M17_SWex}
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Sleep    1
    Mouse Over    ${VIEWER_DIV}   
    ${viewer_cursor_info_1}=    Get Text    ${VIEWER_CURSOR_INFO_BAR}
    ${spatial_profiler_info_1}=    Get Text    //*[@id="root"]/div/div[12]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[3]/div
    Run Keyword And Continue On Failure    Should Be True    '${viewer_cursor_info_1}[6:17]' == '${spatial_profiler_info_1}[12:23]'
    Should Be True    '${viewer_cursor_info_1}[41:44]' == '${spatial_profiler_info_1}[32:35]'
    Should Be True    '${viewer_cursor_info_1}[59:70]' == '${spatial_profiler_info_1}[39:50]'
    Mouse Out    ${VIEWER_DIV}
    Sleep    1
    Capture Element Screenshot    //*[@id="root"]/div/div[12]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[2]    initial.png
    Sleep    1
    Click Element At Coordinates    ${VIEWER_DIV}    20    20
    Sleep    1
    ${viewer_cursor_info_2}=    Get Text    ${VIEWER_CURSOR_INFO_BAR}
    ${spatial_profiler_info_2}=    Get Text    //*[@id="root"]/div/div[12]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[3]/div
    Run Keyword And Continue On Failure    Should Be True    '${viewer_cursor_info_2}[6:17]' == '${spatial_profiler_info_2}[12:23]'
    Should Be True    '${viewer_cursor_info_2}[41:44]' == '${spatial_profiler_info_2}[32:35]'
    Should Be True    '${viewer_cursor_info_2}[59:70]' == '${spatial_profiler_info_2}[39:50]'
    Capture Element Screenshot    //*[@id="root"]/div/div[12]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[2]    new_cursor_position.png
    Sleep    1
    PNG Images Should Be Different    initial.png    new_cursor_position.png
    Sleep    1
    Remove Files    initial.png    new_cursor_position.png
    Sleep    1
    ### move cursor on the spatial profile plot
    Mouse Over    //*[@id="root"]/div/div[12]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[2]
    Element Should Contain    //*[@id="root"]/div/div[12]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[3]/div    Cursor    
    [Teardown]    Kill carta_backend And Close Browser





