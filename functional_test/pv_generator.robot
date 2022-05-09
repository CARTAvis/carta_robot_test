*** Settings ***
Documentation     Test pv generator features
Resource          ../resource.robot

*** Test Cases ***
Narrow-field PV Image Generation
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[2]/a
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[2]/td[2]/div/div[1]/label[1]
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[2]/div/div/input    54
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[3]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[3]/div/div/input    33
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[6]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[6]/td[2]/div/div/input    62
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[7]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[7]/td[2]/div/div/input    315
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[2]/td[2]/div/div[1]/label[1]
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[1]/button
    Click Element    //*[@id="PVGeneratorButton"]
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[4]/span/a
    Wait Until Page Does Not Contain    Generating PV    timeout=5
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[4]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[3]/div[2]/div/div/div/div[2]/div[4]/div/span/span/div/button
    Click Element    xpath://*[contains(text(), "tab10")]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    S255_CH3CN_subcube_pv.fits
    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[1]/a
    Click Element    //*[@id="bp3-tab-title_file-info-tabs_image-file"]
    Element Should Contain    //*[@id="root"]/div/div[6]/div[1]/div/div[2]/div/div[2]/div/div[2]/div/div    S255_CH3CN_subcube_pv.fits
    Element Should Contain    //*[@id="root"]/div/div[6]/div[1]/div/div[2]/div/div[2]/div/div[2]/div/div    [63, 251, 1]
    Click Element    //*[@id="root"]/div/div[6]/div[1]/div/div[2]/div/div[1]/button
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check.png    530,71,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    530,155,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    530,180,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    530,248,729,25
    PNG Two Pixels Should Not Have Matched RGBA    check.png    564,69,729,25
    Set Selenium Speed    0.2
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[1]/a
    Click Element At Coordinates    ${VIEWER_DIV}    200    0
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[3]/div    Data: (WCS: 0.02785714, Image: 33 px, 7.17324e-2)
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[2]/div/div/div/div[1]/div[3]/div    Data: (WCS: -288.7972, Image: 115 px, 7.17324e-2)
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser


Wide-field PV Image Generation
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    Gaussian_array_wide.fits
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[2]/a
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[2]/td[2]/div/div[1]/label[1]
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[2]/div/div/input    268
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[3]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[3]/div/div/input    192
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[6]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[6]/td[2]/div/div/input    400
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[7]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[7]/td[2]/div/div/input    90
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[2]/td[2]/div/div[1]/label[1]
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[1]/button
    Click Element    //*[@id="PVGeneratorButton"]
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[4]/span/a
    Wait Until Page Does Not Contain    Generating PV    timeout=30
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[4]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[3]/div[2]/div/div/div/div[2]/div[4]/div/span/span/div/button
    Click Element    xpath://*[contains(text(), "tab10")]
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check.png    453,215,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    524,215,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    594,215,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    665,215,729,25
    PNG Two Pixels Should Not Have Matched RGBA    check.png    437,215,729,25
    Set Selenium Speed    0.2
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[1]/a
    Click Element At Coordinates    ${VIEWER_DIV}    200    0
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[3]/div    Data: (WCS: 1.089626, Image: 334 px, 8.10033e-3)
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[2]/div/div/div/div[1]/div[3]/div    Data: (WCS: 123.5346, Image: 58 px, 8.10033e-3)
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser


PV Image Generation Cancellation And Rerequest
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    Gaussian_array_wide.fits
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[2]/a
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[2]/td[2]/div/div[1]/label[1]
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[2]/div/div/input    268
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[3]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[3]/div/div/input    192
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[6]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[6]/td[2]/div/div/input    400
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[7]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[7]/td[2]/div/div/input    90
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[2]/td[2]/div/div[1]/label[1]
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[1]/button
    Click Element    //*[@id="PVGeneratorButton"]
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[4]/span/a
    Wait Until Page Contains    Generating PV    timeout=5
    Sleep    2.5
    Click Element    xpath://*[contains(text(), "Cancel")]
    Sleep    1
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[4]/span/a
    Wait Until Page Does Not Contain    Generating PV    timeout=30
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[4]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[3]/div[2]/div/div/div/div[2]/div[4]/div/span/span/div/button
    Click Element    xpath://*[contains(text(), "tab10")]
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check.png    453,215,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    524,215,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    594,215,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    665,215,729,25
    PNG Two Pixels Should Not Have Matched RGBA    check.png    437,215,729,25
    Set Selenium Speed    0.2
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[1]/a
    Click Element At Coordinates    ${VIEWER_DIV}    200    0
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[3]/div    Data: (WCS: 1.089626, Image: 334 px, 8.10033e-3)
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[2]/div/div/div/div[1]/div[3]/div    Data: (WCS: 123.5346, Image: 58 px, 8.10033e-3)
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser


PV Image Generation Repeat
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[2]/a
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[2]/td[2]/div/div[1]/label[1]
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[2]/div/div/input    54
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[3]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[3]/div/div/input    33
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[6]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[6]/td[2]/div/div/input    62
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[7]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[7]/td[2]/div/div/input    315
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[2]/td[2]/div/div[1]/label[1]
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[1]/button
    Click Element    //*[@id="PVGeneratorButton"]
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[4]/span/a
    Wait Until Page Does Not Contain    Generating PV    timeout=5
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[4]/span/a
    Wait Until Page Does Not Contain    Generating PV    timeout=5
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[4]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[3]/div[2]/div/div/div/div[2]/div[4]/div/span/span/div/button
    Click Element    xpath://*[contains(text(), "tab10")]
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check.png    530,71,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    530,155,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    530,180,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    530,248,729,25
    PNG Two Pixels Should Not Have Matched RGBA    check.png    564,69,729,25
    Set Selenium Speed    0.2
    Click Element    xpath://*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    check2.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    check3.png
    PNG Images Should Be Different    check.png    check2.png
    PNG Images Should Be Identical    check.png    check3.png
    Remove Files    check.png    check2.png    check3.png
    [Teardown]    Kill carta_backend And Close Browser



PV Image Generation With Matched Cubes
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[2]/a
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[2]/td[2]/div/div[1]/label[1]
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[2]/div/div/input    245
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[3]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[3]/div/div/input    506
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[6]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[6]/td[2]/div/div/input    141
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[7]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[7]/td[2]/div/div/input    124
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[2]/td[2]/div/div[1]/label[1]
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[1]/button
    Append Image    M17_SWex.hdf5
    Mouse Over    //*[@id="image-panel-1-0"]/div[8]/div/div/canvas
    Click Element    //*[@id="image-panel-1-0"]/div[9]/span[9]/span/a
    Click Element    xpath://*[contains(text(), "Spectral (VRAD) and Spatial")]
    Mouse Out    ${VIEWER_DIV}
    Click Element    //*[@id="PVGeneratorButton"]
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[4]/span/a
    Wait Until Page Does Not Contain    Generating PV    timeout=5
    Mouse Over    //*[@id="image-panel-0-1"]/div[7]/div/div/canvas
    Click Element    //*[@id="image-panel-0-1"]/div[8]/span[8]/a
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[1]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[1]/div/div/select/option[2]
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[2]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[2]/div/div/select/option[2]
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[4]/span/a
    Wait Until Page Does Not Contain    Generating PV    timeout=5
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[4]
    Mouse Out    ${VIEWER_DIV}
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    PNG Two Pixels Should Have Matched RGBA    check.png    186,335,565,335
    Click Element    xpath://*[contains(text(), "Animator")]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    M17_SWex_pv.fits
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    M17_SWex.fits
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    M17_SWex.hdf5
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    M17_SWex_pv.hdf5
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    M17_SWex_pv.fits
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser
    

PV Image Generation With Matched Wide-field Cubes
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    Gaussian_array_wide.fits
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[2]/a
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[2]/td[2]/div/div[1]/label[1]
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[2]/div/div/input    813
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[3]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[5]/td[3]/div/div/input    192
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[6]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[6]/td[2]/div/div/input    888
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[7]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[7]/td[2]/div/div/input    90
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[2]/td[2]/div/div[1]/label[1]
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[1]/button
    Append Image    Gaussian_array_wide2.fits
    Sleep    1
    Mouse Over    //*[@id="image-panel-1-0"]/div[7]/div/div/canvas
    Click Element    //*[@id="image-panel-1-0"]/div[8]/span[9]/span/a
    Click Element    xpath://*[contains(text(), "Spectral (VRAD) and Spatial")]
    Mouse Out    ${VIEWER_DIV}
    Click Element    //*[@id="PVGeneratorButton"]
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[4]/span/a
    Wait Until Page Does Not Contain    Generating PV    timeout=20
    Mouse Over    //*[@id="image-panel-0-1"]/div[7]/div/div/canvas
    Click Element    //*[@id="image-panel-0-1"]/div[8]/span[8]/a
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[3]/div[2]/div/div/div/div[2]/div[4]/div/span/span/div/button
    Click Element    xpath://*[contains(text(), "tab10")]
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[1]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[1]/div/div/select/option[2]
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[2]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[2]/div/div/select/option[2]
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[4]/span/a
    Wait Until Page Does Not Contain    Generating PV    timeout=20
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[4]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[3]/div[2]/div/div/div/div[2]/div[4]/div/span/span/div/button
    Click Element    xpath://*[contains(text(), "tab10")]
    Mouse Out    ${VIEWER_DIV}
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check.png    88,400,467,400
    PNG Two Pixels Should Have Matched RGBA    check.png    134,400,513,400
    PNG Two Pixels Should Have Matched RGBA    check.png    180,400,559,400
    PNG Two Pixels Should Have Matched RGBA    check.png    226,400,605,400
    PNG Two Pixels Should Have Matched RGBA    check.png    272,400,651,400
    PNG Two Pixels Should Have Matched RGBA    check.png    318,400,697,400
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser




# validate pv cut and check the state of the generate button
# pv cut on None and NaN


