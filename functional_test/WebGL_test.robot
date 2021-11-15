*** Settings ***
Documentation     Load an image and check if the image is rendered properly with WebGL
Resource          ../resource.robot

*** Test Cases ***
Check Raster Rendering With WebGL
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Sleep     3
    Page Should Not Contain    'Could not load WebGL. Images will not be displayed properly.'
    Wait Until Page Contains Element    xpath://*[contains(text(), "M17_SWex.fits")]    timeout=2
    Click Element    xpath://*[contains(text(), "M17_SWex.fits")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=10
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser

Webglreport Test
    Set Selenium Speed    ${DELAY}
    IF    '${BROWSER}' == 'headlesschrome'
    Open Browser    browser=${BROWSER}    options=add_argument("--use-gl=egl")
    ELSE
    Open Browser    browser=${BROWSER}
    END
    Set Window Size    ${WINDOW_SIZE_X}    ${WINDOW_SIZE_Y}
    Go To    https://webglreport.com/?v\=1
    Wait Until Page Contains    WebGL
    Page Should Contain    This browser supports WebGL 1
    Capture Page Screenshot    WebGL1.png
    Go To    https://webglreport.com/?v\=2
    Wait Until Page Contains    WebGL
    Page Should Contain    This browser supports WebGL 2
    Capture Page Screenshot    WebGL2.png
    Close Browser