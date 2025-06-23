*** Settings ***
Documentation     Test channel map view features and its integration with other parts of GUI
Resource          ../resource.robot

*** Test Cases ***
Channel Map View - Layout
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    # enable channel map view mode
    Click Element    //*[@id="root"]/div/div[16]/div/div/div[1]/div[1]/div[1]/ul[2]/li[1]
    # change colormap
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[contains(text(), "tab10")]
    # enable channel map view control widget
    Click Element    id:ChannelMapControlButton
    # configure channel map layout
    Input Text    //*[@id="numericInput-4"]    5    clear=True
    Input Text    //*[@id="numericInput-5"]    4    clear=True
    # configure starting channel
    Input Text    //*[@id="numericInput-3"]    20    clear=True
    # close control widget
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[1]/div[3]

    # adjust FOV
    Mouse Over    ${VIEWER_DIV}
    Click Element    data:testid:zoom-to-fit-button
    Mouse Out    ${VIEWER_DIV}
    Wait Until Page Does Not Contain    ${PROGRESS_CLOUD}
    Sleep    1

    # Verify channel map view screenshot
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png

    # disable channel map view mode
    Click Element    //*[@id="root"]/div/div[16]/div/div/div[1]/div[1]/div[1]/ul[2]/li[1]
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    check2_${key}.png

    Set Selenium Speed    0
    # check active channel highlight box
    PNG Pixel XY Should Match RGBA    check_${key}.png    42,4,255,0,0,255
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png   42,4,176,4
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png   42,4,42,109
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png   42,4,176,109
    # check per channel borders
    PNG Pixel XY Should Match RGBA    check_${key}.png    174,107,33,93,176,255
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png   174,107,179,107
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png   174,107,174,112
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png   174,107,179,112
    PNG Pixel XY Should Match RGBA    check_${key}.png    581,321,33,93,176,255
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png   581,321,585,321
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png   581,321,581,326
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png   581,321,585,326
    # check outer-most border
    PNG Pixel XY Should Match RGBA    check_${key}.png    43,428,33,93,176,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    716,428,33,93,176,255
    PNG Pixel XY Should Match RGBA    check_${key}.png    716,5,33,93,176,255
    # check normal mode outer-most border
    PNG Pixel XY Should Match RGBA    check2_${key}.png    43,428,33,93,176,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    716,428,33,93,176,255
    PNG Pixel XY Should Match RGBA    check2_${key}.png    716,5,33,93,176,255


    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser

Channel Map View - raster coloring
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    Click Element    //*[@id="root"]/div/div[16]/div/div/div[1]/div[1]/div[1]/ul[2]/li[1]
    # change colormap
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[contains(text(), "tab10")]
    # enable channel map view control widget
    Click Element    id:ChannelMapControlButton
    # configure channel map layout
    Input Text    //*[@id="numericInput-4"]    5    clear=True
    Input Text    //*[@id="numericInput-5"]    4    clear=True
    # configure starting channel
    Input Text    //*[@id="numericInput-3"]    20    clear=True
    # close control widget
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[1]/div[3]

    # adjust FOV
    Mouse Over    ${VIEWER_DIV}
    Click Element    data:testid:zoom-to-fit-button
    Mouse Out    ${VIEWER_DIV}
    Wait Until Page Does Not Contain    ${PROGRESS_CLOUD}
    Sleep    1

    # Verify channel map view raster pixel coloring
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    check_${key}.png    120,72,31,119,180,255
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png   120,72,630,394
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Channel Map View - active channel switching
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    Click Element    //*[@id="root"]/div/div[16]/div/div/div[1]/div[1]/div[1]/ul[2]/li[1]
    # change colormap
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[contains(text(), "tab10")]
    # enable channel map view control widget
    Click Element    id:ChannelMapControlButton
    # configure channel map layout
    Input Text    //*[@id="numericInput-4"]    5    clear=True
    Input Text    //*[@id="numericInput-5"]    4    clear=True
    # configure starting channel
    Input Text    //*[@id="numericInput-3"]    20    clear=True
    # close control widget
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[1]/div[3]

    # adjust FOV
    Mouse Over    ${VIEWER_DIV}
    Click Element    data:testid:zoom-to-fit-button
    # change an active channel
    Click Element    ${VIEWER_DIV}
    Mouse Out    ${VIEWER_DIV}
    Wait Until Page Does Not Contain    ${PROGRESS_CLOUD}
    Sleep    1

    # check animator active channel index
    Click Element    //*[contains(text(), "Animator")]
    Wait Until Page Contains Element    ${ANIMATOR_SLIDER_HANDLE}
    ${ch_index}=    Get Text    ${ANIMATOR_SLIDER_HANDLE}    
    ${result}=    Convert To Integer    ${ch_index}
    Should Be True    ${result} == 32

    # Verify channel map view screenshot
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png

    # enable spectral profiler
    Mouse Over    ${VIEWER_DIV}
    Click Element    id:SpectralProfilerButton
    # use the spectral profile plot to switch to a new active channel
    Click Element    css:[data-testid="spectral-profiler-0-content"] [data-testid="profiler-plot"]
    Wait Until Page Does Not Contain    ${PROGRESS_CLOUD}
    Sleep    5
    # close spectral profiler
    Click Element    data:testid:spectral-profiler-0-header-close-button

    # check animator active channel index
    ${ch_index}=    Get Text    ${ANIMATOR_SLIDER_HANDLE}    
    ${result}=    Convert To Integer    ${ch_index}
    Should Be True    ${result} == 112

    Capture Element Screenshot    ${VIEWER_DIV}    check2_${key}.png

    Set Selenium Speed    0
    # check active channel highlight box
    PNG Pixel XY Should Match RGBA    check_${key}.png    313,218,255,0,0,255
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png   313,218,447,218
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png   313,218,313,323
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png   313,218,447,323
    # check raster pixel coloring due to the default per-channel raster rendering config
    PNG Pixel XY Should Match RGBA    check_${key}.png    262,192,255,127,14,255

    # check raster pixel coloring due to the default per-channel raster rendering config
    PNG Pixel XY Should Match RGBA    check2_${key}.png    652,276,44,160,44,255
    # check active channel highlight box
    PNG Pixel XY Should Match RGBA    check2_${key}.png    42,4,255,0,0,255
    PNG Two Pixels Should Have Matched RGBA    check2_${key}.png   42,4,176,4
    PNG Two Pixels Should Have Matched RGBA    check2_${key}.png   42,4,42,109
    PNG Two Pixels Should Have Matched RGBA    check2_${key}.png   42,4,176,109

    Remove Files    check_${key}.png    check2_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Channel Map View - spectral labels
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    # enable channel map view mode
    Click Element    //*[@id="root"]/div/div[16]/div/div/div[1]/div[1]/div[1]/ul[2]/li[1]
    # change colormap
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[contains(text(), "jet")]
    # enable channel map view control widget
    Click Element    id:ChannelMapControlButton
    # configure channel map layout
    Input Text    //*[@id="numericInput-4"]    5    clear=True
    Input Text    //*[@id="numericInput-5"]    4    clear=True
    # configure starting channel
    Input Text    //*[@id="numericInput-3"]    20    clear=True
    Sleep    5
    # close control widget
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[1]/div[3]
    Mouse Out    ${VIEWER_DIV}
    Sleep    1
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    before_${key}.png    

    # enable channel map view control widget
    Click Element    id:ChannelMapControlButton
    # enable spectral labels
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div/div/div[2]/div[6]/div/div/label
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div/div/div[2]/div[7]/div/div/label
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div/div/div[2]/div[8]/div/div/label
    # close control widget
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[1]/div[3]
    Mouse Out    ${VIEWER_DIV}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    after_${key}.png    

    Set Selenium Speed    0
    PNG Images Should Be Different    before_${key}.png    after_${key}.png 
    Remove Files    before_${key}.png    after_${key}.png
    [Teardown]    Kill carta_backend And Close Browser