*** Settings ***
Documentation     Test channel map view features and its integration with other parts of GUI
Resource          ../resource.robot

*** Test Cases ***
Channel Map View - Layout
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

    # Verify channel map view screenshot
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png   108,60,672,380
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser