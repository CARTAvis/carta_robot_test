*** Settings ***
Documentation     Load an image and check cursor spatial profile
Resource          ../resource.robot

*** Test Cases ***
Cursor Spatial Profile
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Sleep     1
    Go To E2E QA Folder
    Wait Until Page Contains Element    ${FITS_M17_SWex}    timeout=2
    Click Element    ${FITS_M17_SWex}
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Sleep    1
    Element Should Contain    ${VIEWER_CURSOR_INFO_BAR}    WCS: (18:20:21.01, -16:12:10.2); Image: (320, 400); Value: -3.09508e-3 Jy/beam ; Frequency (LSRK): 86.7514 GHz; Velocity: 10.0000 km/s
    Element Should Contain    //*[@id="root"]/div/div[11]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[2]    Data: (WCS: 18:20:21.01, Image: 320 px, -3.09508e-3)    
    Capture Element Screenshot    //*[@id="root"]/div/div[11]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[1]    initial.png
    Sleep    1
    Click Element At Coordinates    ${VIEWER_DIV}    10    10
    Sleep    1
    Element Should Contain    ${VIEWER_CURSOR_INFO_BAR}    WCS: (18:20:21.61, -16:12:37.0); Image: (298, 332); Value: -1.45714e-3 Jy/beam ; Frequency (LSRK): 86.7514 GHz; Velocity: 10.0000 km/s
    Element Should Contain    //*[@id="root"]/div/div[11]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[2]    Data: (WCS: 18:20:21.61, Image: 298 px, -1.45714e-3)    
    Capture Element Screenshot    //*[@id="root"]/div/div[11]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[1]    new_cursor_position.png
    Sleep    1
    Compare Images To Be Different    initial.png    new_cursor_position.png    0.101450
    Sleep    1
    Remove Files    initial.png    new_cursor_position.png
    Sleep    1
    # move cursor on the spatial profile plot
    Mouse Over    //*[@id="root"]/div/div[11]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[1]
    Element Should Contain    //*[@id="root"]/div/div[11]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[2]    Cursor: (WCS: 18:20:22.72, Image: 258 px, -6.50121e-3)    
    Sleep    1
    Click Element At Coordinates    //*[@id="root"]/div/div[11]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[1]    10    0
    Element Should Contain    //*[@id="root"]/div/div[11]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[2]    Cursor: (WCS: 18:20:22.31, Image: 273 px, -1.35422e-3)    
    Sleep    1
    [Teardown]    Kill carta_backend And Close Browser





