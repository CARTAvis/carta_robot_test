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
    Click Element    xpath://*[contains(text(), "tab10")]
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    # test pixel shader
    Set Selenium Speed    0.02
    IF    '${BROWSER}' == 'headlesschrome'
    # test raster pixel rendering
    PNG Pixel XY Should Match RGBA    check.png    76,222,58,119,175,255
    PNG Pixel XY Should Match RGBA    check.png    136,222,239,133,54,255
    PNG Pixel XY Should Match RGBA    check.png    196,222,82,157,63,255
    PNG Pixel XY Should Match RGBA    check.png    256,222,197,58,50,255
    PNG Pixel XY Should Match RGBA    check.png    318,222,141,107,184,255
    PNG Pixel XY Should Match RGBA    check.png    380,222,133,88,78,255
    PNG Pixel XY Should Match RGBA    check.png    440,222,213,126,191,255
    PNG Pixel XY Should Match RGBA    check.png    502,222,127,127,127,255
    PNG Pixel XY Should Match RGBA    check.png    562,222,189,188,70,255
    PNG Pixel XY Should Match RGBA    check.png    626,222,87,188,204,255
    PNG Pixel XY Should Match RGBA    check.png    689,222,55,124,184,255
    # test colorbar canvas
    PNG Pixel XY Should Match RGBA    check.png    728,410,58,119,175,255
    PNG Pixel XY Should Match RGBA    check.png    728,370,239,133,54,255
    PNG Pixel XY Should Match RGBA    check.png    728,327,82,157,63,255
    PNG Pixel XY Should Match RGBA    check.png    728,285,197,58,50,255
    PNG Pixel XY Should Match RGBA    check.png    728,243,141,107,184,255
    PNG Pixel XY Should Match RGBA    check.png    728,201,133,88,78,255
    PNG Pixel XY Should Match RGBA    check.png    728,160,213,126,191,255
    PNG Pixel XY Should Match RGBA    check.png    728,115,127,127,127,255
    PNG Pixel XY Should Match RGBA    check.png    728,75,189,188,70,255
    PNG Pixel XY Should Match RGBA    check.png    728,30,87,188,204,255
    ELSE
    # chrome
    # test raster pixel rendering
    PNG Pixel XY Should Match RGBA    check.png    76,177,31,119,180,255
    PNG Pixel XY Should Match RGBA    check.png    136,177,255,127,14,255
    PNG Pixel XY Should Match RGBA    check.png    196,177,44,160,44,255
    PNG Pixel XY Should Match RGBA    check.png    256,177,214,39,40,255
    PNG Pixel XY Should Match RGBA    check.png    318,177,148,103,189,255
    PNG Pixel XY Should Match RGBA    check.png    380,177,140,86,75,255
    PNG Pixel XY Should Match RGBA    check.png    440,177,227,119,194,255
    PNG Pixel XY Should Match RGBA    check.png    502,177,127,127,127,255
    PNG Pixel XY Should Match RGBA    check.png    562,177,188,189,34,255
    PNG Pixel XY Should Match RGBA    check.png    626,177,23,190,207,255
    PNG Pixel XY Should Match RGBA    check.png    689,177,19,124,189,255
    # test colorbar canvas
    PNG Pixel XY Should Match RGBA    check.png    728,327,31,119,180,255
    PNG Pixel XY Should Match RGBA    check.png    728,292,255,127,14,255
    PNG Pixel XY Should Match RGBA    check.png    728,263,44,160,44,255
    PNG Pixel XY Should Match RGBA    check.png    728,234,214,39,40,255
    PNG Pixel XY Should Match RGBA    check.png    728,192,148,103,189,255
    PNG Pixel XY Should Match RGBA    check.png    728,164,140,86,75,255
    PNG Pixel XY Should Match RGBA    check.png    728,126,227,119,194,255
    PNG Pixel XY Should Match RGBA    check.png    728,95,127,127,127,255
    PNG Pixel XY Should Match RGBA    check.png    728,60,188,189,34,255
    PNG Pixel XY Should Match RGBA    check.png    728,28,23,190,207,255
    END
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser
