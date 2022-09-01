*** Settings ***
Documentation     Load multiple images and match them
Resource          ../resource.robot

*** Test Cases ***
Match Images Spatially And Spectrally
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    Mouse Over    ${VIEWER_DIV}
    Sleep    1
    Click Element    //*[@id="image-panel-0-0"]/div[9]/span[5]/a
    Append Image    M17_SWex.image
    Mouse Over    ${VIEWER_DIV}
    Sleep    1
    Click Element    //*[@id="image-panel-0-0"]/div[9]/span[9]/span/a
    Click Element    xpath://*[contains(text(), "Spectral (VRAD) and Spatial")]
    Click Element    xpath://*[contains(text(), "Animator")]
    Repeat Keyword    5    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Mouse Over    ${VIEWER_DIV}
    Sleep    0.5
    Mouse Out    ${VIEWER_DIV}
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    casa_zoomed_matched.png
    Sleep    0.5
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[1]/label
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Mouse Over    ${VIEWER_DIV}
    Sleep    0.5
    Mouse Out    ${VIEWER_DIV}
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    fits_zoomed_matched.png
    Sleep    0.5
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    Sleep    0.5
    Set Selenium Speed    0.02
    PNG Images Should Be Identical    fits_zoomed_matched.png    casa_zoomed_matched.png
    Remove Files    fits_zoomed_matched.png    casa_zoomed_matched.png
    [Teardown]    Kill carta_backend And Close Browser



Match Wide-Field Images Spatially
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    Gaussian2.fits
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[1]/a
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[2]/td[2]/div/div[1]/label[1]
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[3]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[3]/td[2]/div/div/input    465.5
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[3]/td[3]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[3]/td[3]/div/div/input    483
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[2]/td[2]/div/div[1]/label[1]
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[3]/div/a[2]
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[2]
    Append Image    Gaussian_SE2.fits
    Mouse Over    ${VIEWER_DIV}
    Sleep    1
    Click Element    //*[@id="image-panel-1-0"]/div[9]/span[9]/span/a
    Sleep    0.5
    Mouse Out    //*[@id="image-panel-1-0"]/div[9]/span[9]/span/a
    Sleep    0.5
    Click Element    xpath://*[contains(text(), "Spatial only")]
    Repeat Keyword    3    Click Element    //*[@id="image-panel-1-0"]/div[9]/span[5]/a
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]
    Press Keys    //*[@id="root"]/div/div[16]/div[2]/div/div[3]/div[5]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]    DELETE
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    matched_multipanel.png
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    matched_2nd_image.png
    Click Element    xpath://*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    matched_1st_image.png
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    Sleep    0.5
    Set Selenium Speed    0.02
    PNG Pixel XY Should Match RGBA    matched_1st_image.png    379,217,252,254,164,255
    PNG Pixel XY Should Match RGBA    matched_2nd_image.png    379,217,252,254,164,255
    PNG Two Pixels Should Have Matched RGBA    matched_multipanel.png    190,217,570,217
    Remove Files    matched_multipanel.png    matched_2nd_image.png    matched_1st_image.png
    [Teardown]    Kill carta_backend And Close Browser    


Matched Region Canvas Rendering Multiple Panel View
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
    Append Image    pixel_shader_test.fits
    Mouse Over    ${VIEWER_DIV}
    Click Element    //*[@id="image-panel-1-0"]/div[8]/span[9]/span/a
    Mouse Out    //*[@id="image-panel-1-0"]/div[8]/span[9]/span/a
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
    Remove Files    check.png    check2.png    check3.png    check4.png
    [Teardown]    Kill carta_backend And Close Browser




Matched Region Canvas Rendering Single Panel View
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
    Append Image    pixel_shader_test.fits
    Mouse Over    ${VIEWER_DIV}
    Click Element    //*[@id="image-panel-1-0"]/div[8]/span[9]/span/a
    Mouse Out    //*[@id="image-panel-1-0"]/div[8]/span[9]/span/a
    Sleep    0.5
    Click Element    xpath://*[contains(text(), "Spatial only")]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div/div[1]/div[1]/div[1]/ul[2]/li[2]
    Mouse Out    ${VIEWER_DIV}
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
    Set Selenium Speed    0.2
    Click Element    xpath://*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check2.png
    # test region canvas rendering
    Set Selenium Speed    0.02
    # control points
    PNG Pixel XY Should Match RGBA    check2.png    348,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    348,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    348,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    380,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    410,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    410,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    410,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    380,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check2.png    379,172,255,255,255,255
    # rectangle sides
    PNG Pixel XY Should Match RGBA    check2.png    348,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    348,202,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    364,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    395,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    410,202,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    410,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    395,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check2.png    364,248,46,230,214,255
    Set Selenium Speed    0.2
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check3.png
    # test region canvas rendering
    Set Selenium Speed    0.02
    # control points
    PNG Pixel XY Should Match RGBA    check3.png    348,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check3.png    348,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check3.png    348,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check3.png    380,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check3.png    410,186,255,255,255,255
    PNG Pixel XY Should Match RGBA    check3.png    410,217,255,255,255,255
    PNG Pixel XY Should Match RGBA    check3.png    410,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check3.png    380,248,255,255,255,255
    PNG Pixel XY Should Match RGBA    check3.png    379,172,255,255,255,255
    # rectangle sides
    PNG Pixel XY Should Match RGBA    check3.png    348,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check3.png    348,202,46,230,214,255
    PNG Pixel XY Should Match RGBA    check3.png    364,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check3.png    395,186,46,230,214,255
    PNG Pixel XY Should Match RGBA    check3.png    410,202,46,230,214,255
    PNG Pixel XY Should Match RGBA    check3.png    410,233,46,230,214,255
    PNG Pixel XY Should Match RGBA    check3.png    395,248,46,230,214,255
    PNG Pixel XY Should Match RGBA    check3.png    364,248,46,230,214,255
    Set Selenium Speed    0.2
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div/div[1]/div[1]/div[1]/ul[2]/li[2]
    Remove Files    check.png    check2.png    check3.png
    [Teardown]    Kill carta_backend And Close Browser



Match Contours Spatially
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    small_gaussian.fits
    Append Image    Gaussian2.fits
    Click Element    xpath://*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[3]
    Input Text    //*[@id="bp3-tab-panel_undefined_0"]/div/div[3]/div/div/div/div/input    0.5
    Click Element    //*[@id="bp3-tab-title_undefined_2"]
    Input Text    //*[@id="bp3-tab-panel_undefined_2"]/div/div[1]/div/div/div[1]/input    5
    Click Element    //*[@id="root"]/div/div[4]/div[1]/div/div[2]/div/div[3]/div/a[2]
    Click Element    //*[@id="root"]/div/div[4]/div[1]/div/div[2]/div/div[1]/button
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Mouse Over    //*[@id="image-panel-1-0"]/div[8]/div/div/canvas
    Click Element    //*[@id="image-panel-1-0"]/div[9]/span[9]/span/a
    Mouse Over    xpath://*[contains(text(), "Spatial only")]
    Click Element    xpath://*[contains(text(), "Spatial only")]
    Mouse Out    ${VIEWER_DIV}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    check2.png
    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[3]
    Input Text    //*[@id="bp3-tab-panel_undefined_0"]/div/div[3]/div/div/div/div/input    0.5
    Click Element    //*[@id="bp3-tab-title_undefined_2"]
    Input Text    //*[@id="bp3-tab-panel_undefined_2"]/div/div[1]/div/div/div[1]/input    5
    Click Element    //*[@id="root"]/div/div[4]/div[1]/div/div[2]/div/div[3]/div/a[2]
    Click Element    //*[@id="root"]/div/div[4]/div[1]/div/div[2]/div/div[1]/button
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    check3.png
    Mouse Over    //*[@id="image-panel-1-0"]/div[8]/div/div/canvas
    Click Element    //*[@id="image-panel-1-0"]/div[9]/span[8]/a
    Mouse Out    ${VIEWER_DIV}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    check4.png
    Set Selenium Speed    0.02
    PNG Images Should Be Different    check.png    check2.png
    PNG Images Should Be Different    check.png    check3.png
    PNG Images Should Be Different    check.png    check4.png
    PNG Images Should Be Different    check2.png    check4.png
    PNG Images Should Be Different    check3.png    check4.png
    PNG Two Pixels Should Have Matched RGBA    check2.png    190,184,569,184
    PNG Two Pixels Should Have Matched RGBA    check2.png    166,195,545,195
    PNG Two Pixels Should Have Matched RGBA    check2.png    156,218,535,218
    PNG Two Pixels Should Have Matched RGBA    check2.png    166,240,545,240
    PNG Two Pixels Should Have Matched RGBA    check2.png    190,252,569,252
    PNG Two Pixels Should Have Matched RGBA    check2.png    213,240,592,240
    PNG Two Pixels Should Have Matched RGBA    check2.png    224,218,603,218
    PNG Two Pixels Should Have Matched RGBA    check2.png    213,195,592,195
    PNG Two Pixels Should Have Matched RGBA    check3.png    190,177,569,177
    PNG Two Pixels Should Have Matched RGBA    check3.png    162,188,541,188
    PNG Two Pixels Should Have Matched RGBA    check3.png    149,218,528,218
    PNG Two Pixels Should Have Matched RGBA    check3.png    162,247,541,247
    PNG Two Pixels Should Have Matched RGBA    check3.png    190,258,569,258
    PNG Two Pixels Should Have Matched RGBA    check3.png    218,247,597,247
    PNG Two Pixels Should Have Matched RGBA    check3.png    230,218,609,218
    PNG Two Pixels Should Have Matched RGBA    check3.png    218,188,597,188
    PNG Two Pixels Should Have Matched RGBA    check4.png    108,148,489,148
    PNG Two Pixels Should Have Matched RGBA    check4.png    108,148,248,298
    PNG Two Pixels Should Have Matched RGBA    check4.png    248,298,630,293
    Remove Files    check.png    check2.png    check3.png    check4.png
    [Teardown]    Kill carta_backend And Close Browser


Match Catalog Image Overlay Spatially
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
    Input Text    //*[@id="bp3-tab-panel_catalogSettings_3"]/div/div[1]/div/span/div/div[1]/input    5
    Click Element    //*[@id="root"]/div/div[17]/div[2]/div[1]/div[1]/div[3]
    Click Element    //*[@id="root"]/div/div[17]/div/div[1]/div[1]/div[5]
    Append Image    model_imregrid_galactic.fits
    Mouse Over    //*[@id="image-panel-1-0"]/div[8]/div/div/canvas
    Click Element    //*[@id="image-panel-1-0"]/div[9]/span[9]/span/a
    Mouse Over    xpath://*[contains(text(), "Spatial only")]
    Click Element    xpath://*[contains(text(), "Spatial only")]
    Mouse Over    //*[@id="image-panel-1-0"]/div[8]/div/div/canvas
    Click Element    //*[@id="image-panel-1-0"]/div[9]/span[8]/a
    Mouse Out    ${VIEWER_DIV}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    Set Selenium Speed    0.02
    # matched catalog points
    PNG Two Pixels Should Have Matched RGBA    check.png    100,200,479,200
    PNG Two Pixels Should Have Matched RGBA    check.png    92,216,471,216
    PNG Two Pixels Should Have Matched RGBA    check.png    85,232,464,232
    PNG Two Pixels Should Have Matched RGBA    check.png    274,198,653,198
    PNG Two Pixels Should Have Matched RGBA    check.png    286,211,665,211
    PNG Two Pixels Should Have Matched RGBA    check.png    298,224,677,224
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser