*** Settings ***
Documentation     Test animator functions
Resource          ../resource.robot

*** Test Cases ***
Animation Playback
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    xpath://*[contains(text(), "Animator")]
    Repeat Keyword    4    Click Element    ${ANIMATOR_SPINBOX_DOWN}
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Sleep    5
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    final.png
    PNG Images Should Be Different    initial.png    final.png
    Wait Until Page Contains Element    ${ANIMATOR_SLIDER_HANDLE}
    ${ch_index}=    Get Text    ${ANIMATOR_SLIDER_HANDLE}    
    ${result}=    Convert To Integer    ${ch_index}
    Should Be True    ${result} >= 3 and ${result} <= 7
    Remove Files    initial.png    final.png 
    [Teardown]    Kill carta_backend And Close Browser


Animation Playback Backwards
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    xpath://*[contains(text(), "Animator")]
    Repeat Keyword    4    Click Element    ${ANIMATOR_SPINBOX_DOWN}
    Click Element    ${ANIMATOR_PLAYBACK_MODE_BUTTON}
    Click Element    xpath://*[contains(text(), "Play Backwards")]
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Sleep    5
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    final.png
    PNG Images Should Be Different    initial.png    final.png
    Wait Until Page Contains Element    ${ANIMATOR_SLIDER_HANDLE}
    ${ch_index}=    Get Text    ${ANIMATOR_SLIDER_HANDLE}    
    ${result}=    Convert To Integer    ${ch_index}
    Should Be True    ${result} <= 22 and ${result} >= 18
    Remove Files    initial.png    final.png 
    [Teardown]    Kill carta_backend And Close Browser


Animation Playback Bouncing
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    xpath://*[contains(text(), "Animator")]
    Repeat Keyword    3    Click Element    ${ANIMATOR_SPINBOX_DOWN}
    Repeat Keyword    20    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Click Element    ${ANIMATOR_PLAYBACK_MODE_BUTTON}
    Click Element    xpath://*[contains(text(), "Bouncing")]
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Sleep    4
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    final.png
    PNG Images Should Be Different    initial.png    final.png
    Wait Until Page Contains Element    ${ANIMATOR_SLIDER_HANDLE}
    ${ch_index}=    Get Text    ${ANIMATOR_SLIDER_HANDLE}    
    ${result}=    Convert To Integer    ${ch_index}
    Should Be True    ${result} == 20 or ${result} == 21 or ${result} == 22 or ${result} == 23
    Remove Files    initial.png    final.png 
    [Teardown]    Kill carta_backend And Close Browser



Animation Playback Blink
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    xpath://*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PLAYBACK_MODE_BUTTON}
    Click Element At Coordinates    ${ANIMATOR_PLAYBACK_MODE_BUTTON}    0    -50
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Sleep    3
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    final.png
    Wait Until Page Contains Element    ${ANIMATOR_SLIDER_HANDLE}
    ${ch_index}=    Get Text    ${ANIMATOR_SLIDER_HANDLE}    
    ${result}=    Convert To Integer    ${ch_index}
    Should Be True    ${result} == 0 or ${result} == 24
    IF    ${result} == 0
    PNG Images Should Be Identical    initial.png    final.png
    ELSE
    PNG Images Should Be Different    initial.png    final.png
    END
    Remove Files    initial.png    final.png 
    [Teardown]    Kill carta_backend And Close Browser



Channel Navigation
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Click Element    xpath://*[contains(text(), "Animator")]
    Repeat Keyword    5    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Page Contains Element    ${ANIMATOR_SLIDER_HANDLE}
    Element Should Contain    ${ANIMATOR_SLIDER_HANDLE}    5
    Element Should Contain    ${VIEWER_CURSOR_INFO_BAR}    Frequency (LSRK): 86.7502 GHz; Velocity: 14.2200 km/s
    Element Should Contain    ${ANIMATOR_SLIDER_INFO}    LSRK\n86.7502 GHz\n14.2200 km/s
    Repeat Keyword    4    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Wait Until Page Contains Element    ${ANIMATOR_SLIDER_HANDLE}
    Element Should Contain    ${ANIMATOR_SLIDER_HANDLE}    1
    Element Should Contain    ${VIEWER_CURSOR_INFO_BAR}    Frequency (LSRK): 86.7512 GHz; Velocity: 10.8440 km/s
    Element Should Contain    ${ANIMATOR_SLIDER_INFO}    LSRK\n86.7512 GHz\n10.8440 km/s
    Click Element    ${ANIMATOR_LAST_BUTTON}
    Wait Until Page Contains Element    ${ANIMATOR_SLIDER_HANDLE}
    Element Should Contain    ${ANIMATOR_SLIDER_HANDLE}    24
    Element Should Contain    ${VIEWER_CURSOR_INFO_BAR}    Frequency (LSRK): 86.7455 GHz; Velocity: 30.2560 km/s
    Element Should Contain    ${ANIMATOR_SLIDER_INFO}    LSRK\n86.7455 GHz\n30.2560 km/s
    Click Element    ${ANIMATOR_FIRST_BUTTON}
    Wait Until Page Contains Element    ${ANIMATOR_SLIDER_HANDLE}
    Element Should Contain    ${ANIMATOR_SLIDER_HANDLE}    0
    Element Should Contain    ${VIEWER_CURSOR_INFO_BAR}    Frequency (LSRK): 86.7514 GHz; Velocity: 10.0000 km/s
    Element Should Contain    ${ANIMATOR_SLIDER_INFO}    LSRK\n86.7514 GHz\n10.0000 km/s    
    Click Element    ${ANIMATOR_SLIDER}
    Wait Until Page Contains Element    ${ANIMATOR_SLIDER_HANDLE}
    Element Should Contain    ${ANIMATOR_SLIDER_HANDLE}    12
    Element Should Contain    ${VIEWER_CURSOR_INFO_BAR}    Frequency (LSRK): 86.7485 GHz; Velocity: 20.1280 km/s
    Element Should Contain    ${ANIMATOR_SLIDER_INFO}    LSRK\n86.7485 GHz\n20.1280 km/s
    [Teardown]    Kill carta_backend And Close Browser


Animation Playback Channel Range
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    xpath://*[contains(text(), "Animator")]
    Repeat Keyword    3    Click Element    ${ANIMATOR_SPINBOX_DOWN}
    Drag And Drop By Offset    ${ANIMATOR_RANGE_SLIDER_HANDLE_LEFT}    50    0
    Drag And Drop By Offset    ${ANIMATOR_RANGE_SLIDER_HANDLE_RIGHT}    -100    0
    ${range_from_index}=    Get Text    ${ANIMATOR_RANGE_SLIDER_HANDLE_LEFT}
    ${range_to_index}=    Get Text    ${ANIMATOR_RANGE_SLIDER_HANDLE_RIGHT}
    ${range_from_index_int}=    Convert To Integer    ${range_from_index}
    ${range_to_index_int}=    Convert To Integer    ${range_to_index}
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Sleep    5
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    final.png
    PNG Images Should Be Different    initial.png    final.png
    Wait Until Page Contains Element    ${ANIMATOR_SLIDER_HANDLE}
    ${ch_index}=    Get Text    ${ANIMATOR_SLIDER_HANDLE}    
    ${result}=    Convert To Integer    ${ch_index}
    Should Be True    ${result} >= ${range_from_index_int} and ${result} <= ${range_to_index_int}
    Remove Files    initial.png    final.png 
    [Teardown]    Kill carta_backend And Close Browser


Animation Playback Channel Step
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    xpath://*[contains(text(), "Animator")]
    Click Element    xpath://*[contains(text(), "Frame Rate")]
    Click Element    xpath://*[contains(text(), "Step")]
    Click Element    ${ANIMATOR_SPINBOX_UP}
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Sleep    2
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    final.png
    PNG Images Should Be Different    initial.png    final.png
    Wait Until Page Contains Element    ${ANIMATOR_SLIDER_HANDLE}
    ${ch_index}=    Get Text    ${ANIMATOR_SLIDER_HANDLE}    
    ${result}=    Convert To Integer    ${ch_index}
    Should Be True    ${result}%2 == 0
    Remove Files    initial.png    final.png 
    [Teardown]    Kill carta_backend And Close Browser


Polarization Slider And Computed Components
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    IRCp10216_sci.spw0.cube.IQUV.manual.pbcor.fits
    # zoom in
    Mouse Over    ${VIEWER_DIV}
    Click Element    //*[@id="image-panel-0-0"]/div[9]/span[5]/a
    # change to tab10 colormap
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div/div[1]/div[3]/div[2]/div/div/div/div[2]/div[5]/div/span/span/div/button
    Click Element    xpath://*[contains(text(), "tab10")]
    # use animator and the polarization slider to switch to different components
    Click Element    xpath://*[contains(text(), "Animator")]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[3]/label/span
    Capture Element Screenshot    ${VIEWER_DIV}    check_Stokes_I.png
    Click Element    ${ANIMATOR_NEXT_BUTTON} 
    Capture Element Screenshot    ${VIEWER_DIV}    check_Stokes_Q.png
    Click Element    ${ANIMATOR_NEXT_BUTTON} 
    Capture Element Screenshot    ${VIEWER_DIV}    check_Stokes_U.png
    Click Element    ${ANIMATOR_NEXT_BUTTON} 
    Capture Element Screenshot    ${VIEWER_DIV}    check_Stokes_V.png
    Click Element    ${ANIMATOR_NEXT_BUTTON} 
    Capture Element Screenshot    ${VIEWER_DIV}    check_Ptotal.png
    Click Element    ${ANIMATOR_NEXT_BUTTON} 
    Capture Element Screenshot    ${VIEWER_DIV}    check_Plinear.png
    Click Element    ${ANIMATOR_NEXT_BUTTON} 
    Capture Element Screenshot    ${VIEWER_DIV}    check_PFtotal.png
    Click Element    ${ANIMATOR_NEXT_BUTTON} 
    Capture Element Screenshot    ${VIEWER_DIV}    check_PFlinear.png
    Click Element    ${ANIMATOR_NEXT_BUTTON} 
    Capture Element Screenshot    ${VIEWER_DIV}    check_Pangle.png

    Set Selenium Speed    0.02
    # Stokes I
    PNG Two Pixels Should Have Matched RGBA    check_Stokes_I.png     390,216,394,219
    PNG Two Pixels Should Have Matched RGBA    check_Stokes_I.png     390,192,391,245
    PNG Two Pixels Should Not Have Matched RGBA    check_Stokes_I.png     390,216,390,192
    # Stokes Q
    PNG Two Pixels Should Have Matched RGBA    check_Stokes_Q.png     390,218,313,205
    PNG Two Pixels Should Have Matched RGBA    check_Stokes_Q.png     370,174,350,256
    PNG Two Pixels Should Not Have Matched RGBA    check_Stokes_Q.png     390,218,370,174   
    # Stokes U
    PNG Two Pixels Should Have Matched RGBA    check_Stokes_U.png     383,219,393,214
    PNG Two Pixels Should Have Matched RGBA    check_Stokes_U.png     381,187,364,210
    PNG Two Pixels Should Not Have Matched RGBA    check_Stokes_U.png     383,219,381,187      
    # Stokes V
    PNG Two Pixels Should Have Matched RGBA    check_Stokes_V.png     373,208,351,158
    PNG Two Pixels Should Have Matched RGBA    check_Stokes_V.png     362,194,351,236
    PNG Two Pixels Should Not Have Matched RGBA    check_Stokes_V.png     373,208,362,194          
    # Ptotal
    PNG Two Pixels Should Have Matched RGBA    check_Ptotal.png    383,210,393,219
    PNG Two Pixels Should Have Matched RGBA    check_Ptotal.png    389,175,448,266
    PNG Two Pixels Should Not Have Matched RGBA    check_Ptotal.png    383,210,389,175
    # Plinear
    PNG Two Pixels Should Have Matched RGBA    check_Plinear.png    394,213,394,222
    PNG Two Pixels Should Have Matched RGBA    check_Plinear.png    379,173,415,224
    PNG Two Pixels Should Not Have Matched RGBA    check_Plinear.png    394,213,379,173          
    # PFtotal (skipped for now)
    # PFlinar (skipped for now)
    # Pangle
    PNG Two Pixels Should Have Matched RGBA    check_Pangle.png    384,220,397,211
    PNG Two Pixels Should Have Matched RGBA    check_Pangle.png    374,172,515,248
    PNG Two Pixels Should Not Have Matched RGBA    check_Pangle.png    384,220,374,172    

    Remove Files    check_Stokes_I.png    check_Stokes_Q.png    check_Stokes_U.png    check_Stokes_V.png    check_Ptotal.png    check_Plinear.png    check_PFtotal.png    check_PFlinear.png    check_Pangle.png
    [Teardown]    Kill carta_backend And Close Browser