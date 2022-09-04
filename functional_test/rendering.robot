*** Settings ***
Documentation     Check various rendering at pixel level
Resource          ../resource.robot

*** Test Cases ***
Raster Image Rendering
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    pixel_shader_test.fits
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    xpath://*[contains(text(), "tab10")]
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    # test pixel shader
    Set Selenium Speed    0.02
    PNG Pixel XY Should Match RGBA    check.png    76,212,31,119,180,255
    PNG Pixel XY Should Match RGBA    check.png    136,212,255,127,14,255
    PNG Pixel XY Should Match RGBA    check.png    196,212,44,160,44,255
    PNG Pixel XY Should Match RGBA    check.png    256,212,214,39,40,255
    PNG Pixel XY Should Match RGBA    check.png    318,212,148,103,189,255
    PNG Pixel XY Should Match RGBA    check.png    380,212,140,86,75,255
    PNG Pixel XY Should Match RGBA    check.png    440,212,227,119,194,255
    PNG Pixel XY Should Match RGBA    check.png    502,212,127,127,127,255
    PNG Pixel XY Should Match RGBA    check.png    562,212,188,189,34,255
    PNG Pixel XY Should Match RGBA    check.png    626,212,23,190,207,255
    PNG Pixel XY Should Match RGBA    check.png    688,212,19,124,189,255
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser

Contour Image Rendering
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    small_gaussian.fits
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


Region Canvas Rendering
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    pixel_shader_test.fits
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[3]/a
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[2]/td[2]/div/div[1]/label[1]
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[3]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[3]/td[2]/div/div/input    5
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[3]/td[3]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[3]/td[3]/div/div/input    1
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[4]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[4]/td[2]/div/div/input    1
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[4]/td[3]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[4]/td[3]/div/div/input    1
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[1]/div/div[2]/div/div/div[1]/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[1]/div/div[2]/div/div/div[1]/input    3
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[2]/td[2]/div/div[1]/label[1]
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[3]/div/a[2]
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    # test region canvas rendering
    Set Selenium Speed    0.02
    # control points
    PNG Pixel XY Should Match RGBA    check.png    348,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    348,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    348,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    380,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    410,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    410,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    410,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    380,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    379,172,255,255,255,255
    # rectangle sides
    PNG Pixel XY Should Match RGBA    check.png    348,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    348,202,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    364,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    395,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    410,202,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    410,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    395,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    364,248,46,230,214,255
    # set region inactive
    Set Selenium Speed    0.2
    Press Keys    ${VIEWER_DIV}    ESCAPE
    Mouse Out    ${VIEWER_DIV}
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check2.png
    Set Selenium Speed    0.02
    # control points
    PNG Pixel XY Should Match RGBA    check2.png    348,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    348,217,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    348,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    380,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    410,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    410,217,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    410,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    380,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    379,172,207,68,70,255
    # rectangle sides
    PNG Pixel XY Should Match RGBA    check2.png    348,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    348,202,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    364,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    395,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    410,202,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    410,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    395,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    364,248,46,230,214,255    
    Remove Files    check.png    check2.png
    [Teardown]    Kill carta_backend And Close Browser


Catalog Image Overlay Rendering
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    model.fits
    Load Catalog File  model_fits_fk4.xml
    Click Element    //*[@id="root"]/div/div[17]/div/div[1]/div[2]/div/div[3]/div[2]/div/div[1]/div/span/span/div/button
    Click Element    xpath:/html/body/div[8]/div/div/div/div/div/ul/li[3]
    Click Element    //*[@id="root"]/div/div[17]/div/div[1]/div[2]/div/div[3]/div[2]/div/div[2]/div/span/span/div/button
    Click Element At Coordinates   //*[@id="root"]/div/div[17]/div/div[1]/div[2]/div/div[3]/div[2]/div/div[2]/div/span/span/div/button    0    -150
    Click Element    //*[@id="root"]/div/div[17]/div/div[1]/div[2]/div/div[3]/div[3]/div/a[4]
    Click Element    //*[@id="root"]/div/div[17]/div/div[1]/div[2]/div/div[1]/div[3]/a[1]
    Click Element    //*[@id="root"]/div/div[17]/div[2]/div[1]/div[2]/div/div[2]/div/span/span/div/button
    Click Element At Coordinates   //*[@id="root"]/div/div[17]/div[2]/div[1]/div[2]/div/div[2]/div/span/span/div/button    0    50
    Click Element    //*[@id="root"]/div/div[17]/div[2]/div[1]/div[1]/div[3]
    Click Element    //*[@id="root"]/div/div[17]/div/div[1]/div[1]/div[5]
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    Set Selenium Speed    0.02
    # catalog points
    PNG Pixel XY Should Match RGBA    check.png    122,167,0,179,164,255
    PNG Pixel XY Should Match RGBA    check.png    99,213,0,179,164,255
    PNG Pixel XY Should Match RGBA    check.png    78,260,0,179,164,255
    PNG Pixel XY Should Match RGBA    check.png    621,161,0,179,164,255
    PNG Pixel XY Should Match RGBA    check.png    657,197,0,179,164,255
    PNG Pixel XY Should Match RGBA    check.png    691,234,0,179,164,255
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser