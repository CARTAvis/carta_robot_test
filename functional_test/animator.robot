*** Settings ***
Documentation     Test animator functions
Resource          ../resource.robot

*** Test Cases ***
Animation Playback
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    //*[contains(text(), "Animator")]
    Repeat Keyword    3    Click Element    ${ANIMATOR_SPINBOX_DOWN}
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Wait Until Element Contains    ${ANIMATOR_SLIDER_HANDLE}    5    timeout=10
    #Sleep    5
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    final_${key}.png
    PNG Images Should Be Different    initial_${key}.png    final_${key}.png
    Wait Until Page Contains Element    ${ANIMATOR_SLIDER_HANDLE}
    ${ch_index}=    Get Text    ${ANIMATOR_SLIDER_HANDLE}    
    ${result}=    Convert To Integer    ${ch_index}
    Should Be True    ${result} == 5 or ${result} == 6
    Remove Files    initial_${key}.png    final_${key}.png 
    [Teardown]    Kill carta_backend And Close Browser


Animation Playback Backwards
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    //*[contains(text(), "Animator")]
    Repeat Keyword    3    Click Element    ${ANIMATOR_SPINBOX_DOWN}
    Click Element    ${ANIMATOR_PLAYBACK_MODE_BUTTON}
    Click Element    //*[contains(text(), "Play backwards")]
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Wait Until Element Contains    ${ANIMATOR_SLIDER_HANDLE}    16    timeout=10
    #Sleep    5
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    final_${key}.png
    PNG Images Should Be Different    initial_${key}.png    final_${key}.png
    Wait Until Page Contains Element    ${ANIMATOR_SLIDER_HANDLE}
    ${ch_index}=    Get Text    ${ANIMATOR_SLIDER_HANDLE}    
    ${result}=    Convert To Integer    ${ch_index}
    Should Be True    ${result} == 16 or ${result} == 15
    Remove Files    initial_${key}.png    final_${key}.png 
    [Teardown]    Kill carta_backend And Close Browser


Animation Playback Bouncing
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    //*[contains(text(), "Animator")]
    Repeat Keyword    3    Click Element    ${ANIMATOR_SPINBOX_DOWN}
    Repeat Keyword    23    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Click Element    ${ANIMATOR_PLAYBACK_MODE_BUTTON}
    Click Element    //*[contains(text(), "Bouncing")]
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    #Sleep    4
    Wait Until Element Contains    ${ANIMATOR_SLIDER_HANDLE}    22    timeout=10
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    final_${key}.png
    PNG Images Should Be Different    initial_${key}.png    final_${key}.png
    Wait Until Page Contains Element    ${ANIMATOR_SLIDER_HANDLE}
    ${ch_index}=    Get Text    ${ANIMATOR_SLIDER_HANDLE}    
    ${result}=    Convert To Integer    ${ch_index}
    Should Be True    ${result} == 22 or ${result} == 21
    Remove Files    initial_${key}.png    final_${key}.png 
    [Teardown]    Kill carta_backend And Close Browser



Animation Playback Blink
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    # let the size indicator go away
    sleep    1
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    //*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PLAYBACK_MODE_BUTTON}
    Click Element At Coordinates    ${ANIMATOR_PLAYBACK_MODE_BUTTON}    0    -50
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Sleep    3
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    final_${key}.png
    Wait Until Page Contains Element    ${ANIMATOR_SLIDER_HANDLE}
    ${ch_index}=    Get Text    ${ANIMATOR_SLIDER_HANDLE}    
    ${result}=    Convert To Integer    ${ch_index}
    Should Be True    ${result} == 0 or ${result} == 24
    IF    ${result} == 0
    PNG Images Should Be Identical    initial_${key}.png    final_${key}.png
    ELSE
    PNG Images Should Be Different    initial_${key}.png    final_${key}.png
    END
    Remove Files    initial_${key}.png    final_${key}.png 
    [Teardown]    Kill carta_backend And Close Browser



Channel Navigation
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Click Element    //*[contains(text(), "Animator")]
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
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    //*[contains(text(), "Animator")]
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
    Capture Element Screenshot    ${VIEWER_DIV}    final_${key}.png
    PNG Images Should Be Different    initial_${key}.png    final_${key}.png
    Wait Until Page Contains Element    ${ANIMATOR_SLIDER_HANDLE}
    ${ch_index}=    Get Text    ${ANIMATOR_SLIDER_HANDLE}    
    ${result}=    Convert To Integer    ${ch_index}
    Should Be True    ${result} >= ${range_from_index_int} and ${result} <= ${range_to_index_int}
    Remove Files    initial_${key}.png    final_${key}.png 
    [Teardown]    Kill carta_backend And Close Browser


Animation Playback Channel Step
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    //*[contains(text(), "Animator")]
    Click Element    //*[contains(text(), "Frame rate")]
    Click Element    //*[contains(text(), "Step")]
    Click Element    ${ANIMATOR_SPINBOX_UP}
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Sleep    2
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    final_${key}.png
    PNG Images Should Be Different    initial_${key}.png    final_${key}.png
    Wait Until Page Contains Element    ${ANIMATOR_SLIDER_HANDLE}
    ${ch_index}=    Get Text    ${ANIMATOR_SLIDER_HANDLE}    
    ${result}=    Convert To Integer    ${ch_index}
    Should Be True    ${result}%2 == 0
    Remove Files    initial_${key}.png    final_${key}.png 
    [Teardown]    Kill carta_backend And Close Browser


Polarization Slider And Computed Components
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    IRCp10216_sci.spw0.cube.IQUV.manual.pbcor.fits
    # zoom in
    Mouse Over    ${VIEWER_DIV}
    Click Element    ${VIEWER_00_ZOOM_IN_BUTTON}
    # change to tab10 colormap
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[contains(text(), "tab10")]
    # use animator and the polarization slider to switch to different components
    Click Element    //*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_POLARIZATION_RADIO_BUTTON}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_Stokes_I_${key}.png
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Element Contains    ${VIEWER_CURSOR_INFO_BAR}    Stokes Q 
    Capture Element Screenshot    ${VIEWER_DIV}    check_Stokes_Q_${key}.png
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Element Contains    ${VIEWER_CURSOR_INFO_BAR}    Stokes U 
    Capture Element Screenshot    ${VIEWER_DIV}    check_Stokes_U_${key}.png
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Element Contains    ${VIEWER_CURSOR_INFO_BAR}    Stokes V 
    Capture Element Screenshot    ${VIEWER_DIV}    check_Stokes_V_${key}.png
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Element Contains    ${VIEWER_CURSOR_INFO_BAR}    Ptotal 
    Capture Element Screenshot    ${VIEWER_DIV}    check_Ptotal_${key}.png
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Element Contains    ${VIEWER_CURSOR_INFO_BAR}    Plinear
    Capture Element Screenshot    ${VIEWER_DIV}    check_Plinear_${key}.png
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Element Contains    ${VIEWER_CURSOR_INFO_BAR}    PFtotal 
    Capture Element Screenshot    ${VIEWER_DIV}    check_PFtotal_${key}.png
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Element Contains    ${VIEWER_CURSOR_INFO_BAR}    PFlinear 
    Capture Element Screenshot    ${VIEWER_DIV}    check_PFlinear_${key}.png
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Element Contains    ${VIEWER_CURSOR_INFO_BAR}    Pangle 
    Capture Element Screenshot    ${VIEWER_DIV}    check_Pangle_${key}.png

    Set Selenium Speed    0
    # Stokes I
    PNG Two Pixels Should Have Matched RGBA    check_Stokes_I_${key}.png     390,216,394,219
    PNG Two Pixels Should Have Matched RGBA    check_Stokes_I_${key}.png     390,192,391,245
    PNG Two Pixels Should Not Have Matched RGBA    check_Stokes_I_${key}.png     390,216,390,192
    # Stokes Q
    PNG Two Pixels Should Have Matched RGBA    check_Stokes_Q_${key}.png     390,218,313,205
    PNG Two Pixels Should Have Matched RGBA    check_Stokes_Q_${key}.png     370,174,350,256
    PNG Two Pixels Should Not Have Matched RGBA    check_Stokes_Q_${key}.png     390,218,370,174   
    # Stokes U
    PNG Two Pixels Should Have Matched RGBA    check_Stokes_U_${key}.png     383,219,393,214
    PNG Two Pixels Should Have Matched RGBA    check_Stokes_U_${key}.png     381,187,364,210
    PNG Two Pixels Should Not Have Matched RGBA    check_Stokes_U_${key}.png     383,219,381,187      
    # Stokes V
    PNG Two Pixels Should Have Matched RGBA    check_Stokes_V_${key}.png     373,208,351,158
    PNG Two Pixels Should Have Matched RGBA    check_Stokes_V_${key}.png     362,194,351,236
    PNG Two Pixels Should Not Have Matched RGBA    check_Stokes_V_${key}.png     373,208,362,194          
    # Ptotal
    PNG Two Pixels Should Have Matched RGBA    check_Ptotal_${key}.png    383,210,393,219
    PNG Two Pixels Should Have Matched RGBA    check_Ptotal_${key}.png    389,175,448,266
    PNG Two Pixels Should Not Have Matched RGBA    check_Ptotal_${key}.png    383,210,389,175
    # Plinear
    PNG Two Pixels Should Have Matched RGBA    check_Plinear_${key}.png    394,213,394,222
    PNG Two Pixels Should Have Matched RGBA    check_Plinear_${key}.png    379,173,415,224
    PNG Two Pixels Should Not Have Matched RGBA    check_Plinear_${key}.png    394,213,379,173          
    # PFtotal (skipped for now)
    # PFlinar (skipped for now)
    # Pangle
    PNG Two Pixels Should Have Matched RGBA    check_Pangle_${key}.png    384,220,397,211
    PNG Two Pixels Should Have Matched RGBA    check_Pangle_${key}.png    374,172,515,248
    PNG Two Pixels Should Not Have Matched RGBA    check_Pangle_${key}.png    384,220,374,172    

    Remove Files    check_Stokes_I_${key}.png    check_Stokes_Q_${key}.png    check_Stokes_U_${key}.png    check_Stokes_V_${key}.png    check_Ptotal_${key}.png    check_Plinear_${key}.png    check_PFtotal_${key}.png    check_PFlinear_${key}.png    check_Pangle_${key}.png
    [Teardown]    Kill carta_backend And Close Browser
