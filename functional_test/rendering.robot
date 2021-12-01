*** Settings ***
Documentation     Check various rendering at pixel level
Resource          ../resource.robot

*** Test Cases ***
Raster Image Rendering
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
    PNG Pixel XY Should Match RGBA    check.png    76,222,31,119,180,255
    PNG Pixel XY Should Match RGBA    check.png    136,222,255,127,14,255
    PNG Pixel XY Should Match RGBA    check.png    196,222,44,160,44,255
    PNG Pixel XY Should Match RGBA    check.png    256,222,214,39,40,255
    PNG Pixel XY Should Match RGBA    check.png    318,222,148,103,189,255
    PNG Pixel XY Should Match RGBA    check.png    380,222,140,86,75,255
    PNG Pixel XY Should Match RGBA    check.png    440,222,227,119,194,255
    PNG Pixel XY Should Match RGBA    check.png    502,222,127,127,127,255
    PNG Pixel XY Should Match RGBA    check.png    562,222,188,189,34,255
    PNG Pixel XY Should Match RGBA    check.png    626,222,23,190,207,255
    PNG Pixel XY Should Match RGBA    check.png    688,222,19,124,189,255
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser

Contour Image Rendering
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Wait Until Page Contains Element    xpath://*[contains(text(), "small_gaussian.fits")]    timeout=2
    Click Element    xpath://*[contains(text(), "small_gaussian.fits")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=10
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    xpath://*[contains(text(), "nipy_spectral")]
    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[3]/a
    Input Text    //*[@id="bp3-tab-panel_undefined_0"]/div/div[3]/div/div/div/div/input    0.6
    Click Element    xpath://*[contains(text(), "Styling")]
    Input Text    //*[@id="bp3-tab-panel_undefined_2"]/div/div[1]/div/div/div[1]/input    5
    Click Element    //*[@id="root"]/div/div[4]/div[1]/div/div[2]/div/div[3]/div/a[2]
    Click Element    //*[@id="root"]/div/div[4]/div[1]/div/div[2]/div/div[1]/button
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    # test contour shader
    Set Selenium Speed    0.02
    PNG Pixel XY Should Match RGBA    check.png    379,196,15,153,96,255
    PNG Pixel XY Should Match RGBA    check.png    367,200,15,153,96,255
    PNG Pixel XY Should Match RGBA    check.png    362,205,15,153,96,255
    PNG Pixel XY Should Match RGBA    check.png    358,217,15,153,96,255
    PNG Pixel XY Should Match RGBA    check.png    362,229,15,153,96,255
    PNG Pixel XY Should Match RGBA    check.png    367,234,15,153,96,255
    PNG Pixel XY Should Match RGBA    check.png    379,238,15,153,96,255
    PNG Pixel XY Should Match RGBA    check.png    391,234,15,153,96,255
    PNG Pixel XY Should Match RGBA    check.png    396,229,15,153,96,255
    PNG Pixel XY Should Match RGBA    check.png    400,217,15,153,96,255
    PNG Pixel XY Should Match RGBA    check.png    396,205,15,153,96,255
    PNG Pixel XY Should Match RGBA    check.png    392,200,15,153,96,255
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser