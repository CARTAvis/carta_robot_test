*** Settings ***
Documentation     Check various rendering at pixel level
Resource          ../resource.robot

*** Test Cases ***
Raster image rendering
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Wait Until Page Contains Element    xpath://*[contains(text(), "pixel_shader_test.fits")]    timeout=2
    Click Element    xpath://*[contains(text(), "pixel_shader_test.fits")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=10
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    xpath://*[contains(text(), "gray")]
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    # test pixel shader
    Set Selenium Speed    0.02
    PNG Pixel XY Should Match RGBA    check.png    76,222,0,0,0,255
    PNG Pixel XY Should Match RGBA    check.png    136,222,28,28,28,255
    PNG Pixel XY Should Match RGBA    check.png    196,222,56,56,56,255
    PNG Pixel XY Should Match RGBA    check.png    256,222,85,85,85,255
    PNG Pixel XY Should Match RGBA    check.png    318,222,113,113,113,255
    PNG Pixel XY Should Match RGBA    check.png    380,222,142,142,142,255
    PNG Pixel XY Should Match RGBA    check.png    440,222,170,170,170,255
    PNG Pixel XY Should Match RGBA    check.png    502,222,199,199,199,255
    PNG Pixel XY Should Match RGBA    check.png    562,222,227,227,227,255
    PNG Pixel XY Should Match RGBA    check.png    626,222,255,255,255,255
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser
