*** Settings ***
Documentation     Test image viewer settings
Resource          ../resource.robot

*** Test Cases ***
Image Viewer Settings - Pan and Zoom
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    spire500_ext.fits
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[contains(text(), "tab10")]   
    Append Image    pacs160_js.fits
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[contains(text(), "tab10")]   
    # enable spatial matching
    Mouse Over    ${VIEWER_10_CANVAS}
    Click Element    css:#image-panel-1-0 [data-testid="match-button"]
    Click Element    //*[contains(text(), "Spatial")]
    # enable viewer settings dialog
    Click Element    ${VIEWER_SETTINGS_DIALOG}
    # set a custom field center
    Clear Input Field    //*[@id="numericInput-3"]
    Input Text    //*[@id="numericInput-3"]    7:08:59.6718741073    clear=True
    Clear Input Field    //*[@id="numericInput-4"]
    Input Text    //*[@id="numericInput-4"]    -11:12:39.5779647306    clear=True
    # set a custom fov in ra
    Clear Input Field    //*[@id="numericInput-5"]
    Input Text    //*[@id="numericInput-5"]    3.2'    clear=True
    Press Keys    //*[@id="numericInput-5"]    RETURN
    # verify the fov changes
    ${fov_x}=    Get Element Attribute    //*[@id="numericInput-5"]    value
    ${fov_y}=    Get Element Attribute    //*[@id="numericInput-6"]    value
    Should Be Equal As Strings    ${fov_x}    3.2019458956'
    Should Be Equal As Strings    ${fov_y}    4.6054338865'
    # close viewer settings dialog
    Click Element    ${VIEWER_SETTINGS_DIALOG_CLOSE_BUTTON}
    # take screenshot for verification
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    test0_${key}.png
    PNG Pixel XY Should Match RGBA    test0_${key}.png    196,199,227,119,194,255
    PNG Pixel XY Should Match RGBA    test0_${key}.png    580,210,23,190,207,255
    # enable offset coordinates
    Click Element    ${VIEWER_SETTINGS_DIALOG}
    Click Element    //*[@id="bp5-tab-panel_imageViewSettingsTabs_Pan and Zoom"]/div/div/div/div[6]/div/label
    # set new offset origin
    Clear Input Field    //*[@id="numericInput-57"]
    Input Text    //*[@id="numericInput-57"]    7:08:56.4326588482    clear=True
    Clear Input Field    //*[@id="numericInput-58"]
    Input Text    //*[@id="numericInput-58"]    -11:11:45.1705220787    clear=True
    Press Keys    //*[@id="numericInput-58"]    RETURN
    # enlarge tick values
    Click Element    //*[contains(text(), "Numbers")]
    Input Text    //*[@id="numericInput-44"]    24    clear=True
    # close viewer settings dialog
    Click Element    ${VIEWER_SETTINGS_DIALOG_CLOSE_BUTTON}
    Mouse Over    ${VIEWER_10_CANVAS}
    Click Element    ${VIEWER_10_GRID_BUTTON}
    Mouse Out    ${VIEWER_DIV}
    # take screenshot for verification
    Capture Element Screenshot    ${VIEWER_DIV}    test1_${key}.png
    OCR Test    test1_${key}.png    627 422 666 445 "0.0"
    OCR Test    test1_${key}.png    403 105 429 145 "0.0" --rotation 90
    OCR Test    test1_${key}.png    465 446 681 468 "Right ascension (FKS) arcmin)"    # workaround du to OCR accuracy issue
    Remove Files    test0_${key}.png    test1_${key}.png
    [Teardown]    Kill carta_backend And Close Browser
