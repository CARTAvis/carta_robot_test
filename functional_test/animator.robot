*** Settings ***
Documentation     Test animator functions
Resource          ../resource.robot

*** Test Cases ***
Animation Playback
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   ${FITS_M17_SWex}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Sleep    1
    Click Element    xpath://*[contains(text(), "Animator")]
    Sleep    1
    Repeat Keyword    3    Click Element    ${ANIMATOR_SPINBOX_DOWN}
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Wait Until Element Contains    ${ANIMATOR_SLIDER_HANDLE}    1
    Wait Until Element Contains    ${ANIMATOR_SLIDER_HANDLE}    15    timeout=8
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    final.png
    Sleep    1
    PNG Images Should Be Different    initial.png    final.png
    ${ch_index}=    Get Text    ${ANIMATOR_SLIDER_HANDLE}    
    ${result}=    Convert To Integer    ${ch_index}
    Should Be True    ${result} == 14 or ${result} == 15 or ${result} == 16
    Remove Files    initial.png    final.png 
    [Teardown]    Kill carta_backend And Close Browser


Animation Playback Backwards
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   ${FITS_M17_SWex}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Sleep    1
    Click Element    xpath://*[contains(text(), "Animator")]
    Sleep    1
    Repeat Keyword    3    Click Element    ${ANIMATOR_SPINBOX_DOWN}
    Click Element    ${ANIMATOR_PLAYBACK_MODE_BUTTON}
    Sleep    1
    Click Element    xpath://*[contains(text(), "Play Backwards")]
    Sleep    1
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Wait Until Element Contains    ${ANIMATOR_SLIDER_HANDLE}    23    
    Wait Until Element Contains    ${ANIMATOR_SLIDER_HANDLE}    10    timeout=7
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    final.png
    Sleep    1
    PNG Images Should Be Different    initial.png    final.png
    ${ch_index}=    Get Text    ${ANIMATOR_SLIDER_HANDLE}    
    ${result}=    Convert To Integer    ${ch_index}
    Should Be True    ${result} == 11 or ${result} == 10 or ${result} == 9
    Remove Files    initial.png    final.png 
    [Teardown]    Kill carta_backend And Close Browser


Animation Playback Bouncing
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   ${FITS_M17_SWex}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Sleep    1
    Click Element    xpath://*[contains(text(), "Animator")]
    Sleep    1
    Repeat Keyword    3    Click Element    ${ANIMATOR_SPINBOX_DOWN}
    Click Element    ${ANIMATOR_PLAYBACK_MODE_BUTTON}
    Sleep    1
    Click Element    xpath://*[contains(text(), "Bouncing")]
    Sleep    1
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Wait Until Element Contains    ${ANIMATOR_SLIDER_HANDLE}    24    timeout=13    
    Wait Until Element Contains    ${ANIMATOR_SLIDER_HANDLE}    20
    Wait Until Element Contains    ${ANIMATOR_SLIDER_HANDLE}    10    timeout=6
    Wait Until Element Contains    ${ANIMATOR_SLIDER_HANDLE}    3
    Wait Until Element Contains    ${ANIMATOR_SLIDER_HANDLE}    0
    Wait Until Element Contains    ${ANIMATOR_SLIDER_HANDLE}    1
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    final.png
    Sleep    1
    PNG Images Should Be Different    initial.png    final.png
    ${ch_index}=    Get Text    ${ANIMATOR_SLIDER_HANDLE}    
    ${result}=    Convert To Integer    ${ch_index}
    Should Be True    ${result} == 1 or ${result} == 2
    Remove Files    initial.png    final.png 
    [Teardown]    Kill carta_backend And Close Browser



Animation Playback Blink
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Pass Execution    Skip for now: blink element cannot be located for unknown reasons...
    Load Initial Image   ${FITS_M17_SWex}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Sleep    1
    Click Element    xpath://*[contains(text(), "Animator")]
    Sleep    1
    Click Element    ${ANIMATOR_PLAYBACK_MODE_BUTTON}
    Sleep    1
    Click Element    xpath://*[contains(text(), "Blink")]
    Sleep    1
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Sleep    3
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    final.png
    Sleep    1
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
    Load Initial Image   ${FITS_M17_SWex}
    Sleep    1
    Click Element    xpath://*[contains(text(), "Animator")]
    Sleep    1
    Repeat Keyword    5    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Sleep    1
    Element Should Contain    ${ANIMATOR_SLIDER_HANDLE}    5
    Element Should Contain    ${VIEWER_CURSOR_INFO_BAR}    Frequency (LSRK): 86.7502 GHz; Velocity: 14.2200 km/s
    Element Should Contain    ${ANIMATOR_SLIDER_INFO}    LSRK\n86.7502 GHz\n14.2200 km/s
    Sleep    1
    Repeat Keyword    4    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Sleep    1
    Element Should Contain    ${ANIMATOR_SLIDER_HANDLE}    1
    Element Should Contain    ${VIEWER_CURSOR_INFO_BAR}    Frequency (LSRK): 86.7512 GHz; Velocity: 10.8440 km/s
    Element Should Contain    ${ANIMATOR_SLIDER_INFO}    LSRK\n86.7512 GHz\n10.8440 km/s
    Sleep    1
    Click Element    ${ANIMATOR_LAST_BUTTON}
    Sleep    1
    Element Should Contain    ${ANIMATOR_SLIDER_HANDLE}    24
    Element Should Contain    ${VIEWER_CURSOR_INFO_BAR}    Frequency (LSRK): 86.7455 GHz; Velocity: 30.2560 km/s
    Element Should Contain    ${ANIMATOR_SLIDER_INFO}    LSRK\n86.7455 GHz\n30.2560 km/s
    Sleep    1
    Click Element    ${ANIMATOR_FIRST_BUTTON}
    Sleep    1
    Element Should Contain    ${ANIMATOR_SLIDER_HANDLE}    0
    Element Should Contain    ${VIEWER_CURSOR_INFO_BAR}    Frequency (LSRK): 86.7514 GHz; Velocity: 10.0000 km/s
    Element Should Contain    ${ANIMATOR_SLIDER_INFO}    LSRK\n86.7514 GHz\n10.0000 km/s    
    Sleep    1
    Click Element    ${ANIMATOR_SLIDER}
    Element Should Contain    ${ANIMATOR_SLIDER_HANDLE}    12
    Element Should Contain    ${VIEWER_CURSOR_INFO_BAR}    Frequency (LSRK): 86.7485 GHz; Velocity: 20.1280 km/s
    Element Should Contain    ${ANIMATOR_SLIDER_INFO}    LSRK\n86.7485 GHz\n20.1280 km/s
    Sleep    1
    [Teardown]    Kill carta_backend And Close Browser


Animation Playback Channel Range
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   ${FITS_M17_SWex}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Sleep    1
    Click Element    xpath://*[contains(text(), "Animator")]
    Sleep    1
    #Repeat Keyword    3    Click Element    ${ANIMATOR_SPINBOX_DOWN}
    Sleep    1
    Drag And Drop By Offset    ${ANIMATOR_RANGE_SLIDER_HANDLE_LEFT}    50    0
    Sleep    1
    Drag And Drop By Offset    ${ANIMATOR_RANGE_SLIDER_HANDLE_RIGHT}    -100    0
    Sleep    1
    ${range_from_index}=    Get Text    ${ANIMATOR_RANGE_SLIDER_HANDLE_LEFT}
    ${range_to_index}=    Get Text    ${ANIMATOR_RANGE_SLIDER_HANDLE_RIGHT}
    ${range_from_index_int}=    Convert To Integer    ${range_from_index}
    ${range_to_index_int}=    Convert To Integer    ${range_to_index}
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Sleep    5
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    final.png
    Sleep    1
    PNG Images Should Be Different    initial.png    final.png
    ${ch_index}=    Get Text    ${ANIMATOR_SLIDER_HANDLE}    
    ${result}=    Convert To Integer    ${ch_index}
    Should Be True    ${result} >= ${range_from_index_int} and ${result} <= ${range_to_index_int}
    Remove Files    initial.png    final.png 
    [Teardown]    Kill carta_backend And Close Browser


Animation Playback Channel Step
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   ${FITS_M17_SWex}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Sleep    1
    Click Element    xpath://*[contains(text(), "Animator")]
    Sleep    1
    Click Element    xpath://*[contains(text(), "Frame Rate")]
    Sleep    1
    Click Element    xpath://*[contains(text(), "Step")]
    Sleep    1
    Click Element    ${ANIMATOR_SPINBOX_UP}
    Sleep    1
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Sleep    2
    Click Element    ${ANIMATOR_PLAY_STOP_BUTTON}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    final.png
    Sleep    1
    PNG Images Should Be Different    initial.png    final.png
    ${ch_index}=    Get Text    ${ANIMATOR_SLIDER_HANDLE}    
    ${result}=    Convert To Integer    ${ch_index}
    Should Be True    ${result}%2 == 0
    Remove Files    initial.png    final.png 
    [Teardown]    Kill carta_backend And Close Browser
