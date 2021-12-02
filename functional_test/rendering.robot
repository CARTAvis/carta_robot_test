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


Region Canvas Rendering
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Wait Until Page Contains Element    xpath://*[contains(text(), "pixel_shader_test.fits")]    timeout=2
    Click Element    xpath://*[contains(text(), "pixel_shader_test.fits")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=10
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
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





Matched Region Canvas Rendering Multiple Panel View
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Wait Until Page Contains Element    xpath://*[contains(text(), "pixel_shader_test.fits")]    timeout=2
    Click Element    xpath://*[contains(text(), "pixel_shader_test.fits")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=10
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
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
    Append Image    xpath://*[contains(text(), "pixel_shader_test.fits")]
    Mouse Over    ${VIEWER_DIV}
    Click Element    //*[@id="image-panel-1-0"]/div[7]/span[9]/span/a
    Mouse Out    //*[@id="image-panel-1-0"]/div[7]/span[9]/span/a
    Sleep    0.5
    Click Element    xpath://*[contains(text(), "Spatial only")]
    Mouse Out    ${VIEWER_DIV}
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    Set Selenium Speed    0.02
    # control points left region
    PNG Pixel XY Should Match RGBA    check.png    159,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    159,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    159,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    189,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    220,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    220,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    220,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    189,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    189,171,255,255,255,255
    # rectangle sides left region
    PNG Pixel XY Should Match RGBA    check.png    159,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    159,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    174,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    205,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    220,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    220,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    205,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    174,186,46,230,214,255
    # control points right region
    PNG Pixel XY Should Match RGBA    check.png    538,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    538,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    538,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    568,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    599,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    599,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    599,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    568,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check.png    568,171,255,255,255,255
    # rectangle sides right region
    PNG Pixel XY Should Match RGBA    check.png    538,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    538,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    553,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    584,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    599,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    599,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    584,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check.png    553,186,46,230,214,255
    Set Selenium Speed    0.2
    Click Element    xpath://*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check2.png
    Set Selenium Speed    0.02
    # control points left region
    PNG Pixel XY Should Match RGBA    check2.png    159,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    159,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    159,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    189,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    220,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    220,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    220,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    189,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    189,171,255,255,255,255
    # rectangle sides left region
    PNG Pixel XY Should Match RGBA    check2.png    159,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    159,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    174,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    205,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    220,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    220,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    205,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    174,186,46,230,214,255
    # control points right region
    PNG Pixel XY Should Match RGBA    check2.png    538,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    538,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    538,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    568,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    599,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    599,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    599,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    568,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    568,171,255,255,255,255
    # rectangle sides right region
    PNG Pixel XY Should Match RGBA    check2.png    538,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    538,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    553,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    584,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    599,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    599,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    584,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    553,186,46,230,214,255
    Set Selenium Speed    0.2
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check3.png
    PNG Images Should Be Identical    check.png    check3.png
    Press Keys    ${VIEWER_DIV}    ESCAPE
    Mouse Out    ${VIEWER_DIV}
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check4.png
    Set Selenium Speed    0.02
    # control points left region
    PNG Pixel XY Should Match RGBA    check4.png    159,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    159,217,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    159,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    189,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    220,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    220,217,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    220,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    189,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    189,171,207,68,70,255
    # rectangle sides left region
    PNG Pixel XY Should Match RGBA    check4.png    159,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    159,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    174,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    205,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    220,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    220,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    205,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    174,186,46,230,214,255
    # control points right region
    PNG Pixel XY Should Match RGBA    check4.png    538,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    538,217,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    538,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    568,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    599,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    599,217,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    599,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    568,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    568,171,207,68,70,255
    # rectangle sides right region
    PNG Pixel XY Should Match RGBA    check4.png    538,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    538,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    553,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    584,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    599,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    599,201,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    584,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check4.png    553,186,46,230,214,255
    #Remove Files    check.png    check2.png    check3.png    check4.png
    [Teardown]    Kill carta_backend And Close Browser




