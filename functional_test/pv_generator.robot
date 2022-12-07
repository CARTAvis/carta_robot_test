*** Settings ***
Documentation     Test pv generator features
Resource          ../resource.robot

*** Test Cases ***
Narrow-field PV Image Generation
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    # create a line region at the view center via the shortcut button
    Click Element    ${LINE_REGION_SHORTCUT_BUTTON}
    Click Element    ${VIEWER_DIV}
    # enable region config dialog and set up the line region
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
    Click Element    ${PV_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating PV    timeout=5
    Click Element    ${PV_GENERATOR_CLOSE_BUTTON}
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    xpath://*[contains(text(), "tab10")]
    Element Should Contain    ${VIEWER_TAB_TITLE}    S255_CH3CN_subcube_pv.fits
    Click Element    ${FILE_HEADER_DIALOG_BUTTON}
    # go to the file info tab and check context
    Click Element    //*[@id="bp3-tab-title_file-info-tabs_image-file"]
    Element Should Contain    //*[@id="root"]/div/div[6]/div[1]/div/div[2]/div/div[2]/div/div[2]/div/div    S255_CH3CN_subcube_pv.fits
    Element Should Contain    //*[@id="root"]/div/div[6]/div[1]/div/div[2]/div/div[2]/div/div[2]/div/div    [63, 251, 1]
    Click Element    ${FILE_HEADER_DIALOG_CLOSE_BUTTON}
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check.png    604,71,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    604,155,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    604,180,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    604,248,729,25
    PNG Two Pixels Should Not Have Matched RGBA    check.png    573,69,729,25
    Set Selenium Speed    0.2
    # generate a point region
    Click Element    ${POINT_REGION_SHORTCUT_BUTTON}
    Click Element At Coordinates    ${VIEWER_DIV}    200    0
    Element Should Contain    ${SPATIAL_PROFILER_CURSOR_INFO}    Data: (WCS: 0.02785714, Image: 33 px, 6.28957e-2)
    Element Should Contain    ${SPATIAL_PROFILER_CURSOR_INFO_Y}    Data: (WCS: -288.7972, Image: 115 px, 6.28957e-2)
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser


Wide-field PV Image Generation
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    Gaussian_array_wide.fits
    # create a line region at the view center via the shortcut button
    Click Element    ${LINE_REGION_SHORTCUT_BUTTON}
    Click Element    ${VIEWER_DIV}
    # enable region config dialog and set up the line region
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
    Click Element    ${PV_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating PV    timeout=30
    Click Element    ${PV_GENERATOR_CLOSE_BUTTON}
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    xpath://*[contains(text(), "tab10")]
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check.png    475,215,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    546,215,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    617,215,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    687,215,729,25
    PNG Two Pixels Should Not Have Matched RGBA    check.png    463,215,729,25
    Set Selenium Speed    0.2
    Click Element    ${POINT_REGION_SHORTCUT_BUTTON}
    Click Element At Coordinates    ${VIEWER_DIV}    200    0
    Element Should Contain    ${SPATIAL_PROFILER_CURSOR_INFO}    Data: (WCS: 1.089626, Image: 334 px, -4.17348e-4)
    Element Should Contain    ${SPATIAL_PROFILER_CURSOR_INFO_Y}    Data: (WCS: 123.5346, Image: 58 px, -4.17348e-4)
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser


PV Image Generation Cancellation And Rerequest
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    Gaussian_array_wide.fits
    # create a line region at the view center via the shortcut button
    Click Element    ${LINE_REGION_SHORTCUT_BUTTON}
    Click Element    ${VIEWER_DIV}
    # enable region config dialog and set up the line region
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
    Click Element    ${PV_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Contains    Generating PV    timeout=5
    Sleep    2.5
    Click Element    xpath://*[contains(text(), "Cancel")]
    Sleep    1
    Click Element    ${PV_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating PV    timeout=30
    Click Element    ${PV_GENERATOR_CLOSE_BUTTON}
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    xpath://*[contains(text(), "tab10")]
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check.png    475,215,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    546,215,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    617,215,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    687,215,729,25
    PNG Two Pixels Should Not Have Matched RGBA    check.png    463,215,729,25
    Set Selenium Speed    0.2
    Click Element    ${POINT_REGION_SHORTCUT_BUTTON}
    Click Element At Coordinates    ${VIEWER_DIV}    200    0
    Element Should Contain    ${SPATIAL_PROFILER_CURSOR_INFO}    Data: (WCS: 1.089626, Image: 334 px, -4.17348e-4)
    Element Should Contain    ${SPATIAL_PROFILER_CURSOR_INFO_Y}    Data: (WCS: 123.5346, Image: 58 px, -4.17348e-4)
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser


PV Image Generation Repeat
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    Click Element    ${LINE_REGION_SHORTCUT_BUTTON}
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
    Click Element    ${PV_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating PV    timeout=5
    Click Element    ${PV_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating PV    timeout=5
    Click Element    ${PV_GENERATOR_CLOSE_BUTTON}
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    xpath://*[contains(text(), "tab10")]
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check.png    604,71,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    604,155,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    604,180,729,25
    PNG Two Pixels Should Have Matched RGBA    check.png    604,248,729,25
    PNG Two Pixels Should Not Have Matched RGBA    check.png    573,69,729,25
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
    Click Element    ${LINE_REGION_SHORTCUT_BUTTON}
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
    Mouse Over    ${VIEWER_10_CANVAS}
    # match M17_SWex.hdf5 to M17_SWex.fits via the matching button in the viewer
    Click Element    //*[@id="image-panel-1-0"]/div[9]/span[9]/span/a
    Click Element    xpath://*[contains(text(), "Spectral (VRAD) and Spatial")]
    Mouse Out    ${VIEWER_DIV}
    Click Element    //*[@id="PVGeneratorButton"]
    Click Element    ${PV_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating PV    timeout=5
    Click Element    ${PV_GENERATOR_CLOSE_BUTTON}
    # mouse over the generated pv image panel and click the zoom-to-fit button
    Mouse Over    //*[@id="image-panel-0-1"]/div[7]/div/div/canvas
    Click Element    //*[@id="image-panel-0-1"]/div[8]/span[8]/a
    Click Element    //*[@id="PVGeneratorButton"]
    # use the image dropdown to select M17_SWex.fits
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[1]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[1]/div/div/select/option[2]
    # use the region dropdown to select Region 1
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[2]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[2]/div/div/select/option[2]
    Click Element    ${PV_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating PV    timeout=5
    Click Element    ${PV_GENERATOR_CLOSE_BUTTON}
    Mouse Out    ${VIEWER_DIV}
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    PNG Two Pixels Should Have Matched RGBA    check.png    194,335,573,335
    Click Element    xpath://*[contains(text(), "Animator")]
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex_pv.fits
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.hdf5
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex_pv.hdf5
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex_pv.fits
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser
    

PV Image Generation With Matched Wide-field Cubes
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    Gaussian_array_wide.fits
    Click Element    ${LINE_REGION_SHORTCUT_BUTTON}
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
    # match Gaussian_array_wide2.fits to Gaussian_array_wide.fits via the matching button in the viewer
    Mouse Over    //*[@id="image-panel-1-0"]/div[7]/div/div/canvas
    Click Element    //*[@id="image-panel-1-0"]/div[8]/span[9]/span/a
    Click Element    xpath://*[contains(text(), "Spectral (VRAD) and Spatial")]
    Mouse Out    ${VIEWER_DIV}
    Click Element    //*[@id="PVGeneratorButton"]
    Click Element    ${PV_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating PV    timeout=30
    Click Element    ${PV_GENERATOR_CLOSE_BUTTON}
    # mouse over the generated pv image panel and click the zoom-to-fit button
    Mouse Over    //*[@id="image-panel-0-1"]/div[7]/div/div/canvas
    Click Element    //*[@id="image-panel-0-1"]/div[8]/span[8]/a
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    xpath://*[contains(text(), "tab10")]
    Click Element    //*[@id="PVGeneratorButton"]
    # use the image dropdown to select Gaussian_array_wide.fits
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[1]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[1]/div/div/select/option[2]
    # use the region dropdown to select Region 1
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[2]/div/div/select
    Click Element    //*[@id="bp3-tab-panel_pvGeneratorTabs_0"]/div/div[2]/div/div/select/option[2]
    Click Element    ${PV_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating PV    timeout=30
    Click Element    ${PV_GENERATOR_CLOSE_BUTTON}
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    xpath://*[contains(text(), "tab10")]
    Mouse Out    ${VIEWER_DIV}
    Sleep    0.5
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check.png    96,400,475,400
    PNG Two Pixels Should Have Matched RGBA    check.png    143,400,522,400
    PNG Two Pixels Should Have Matched RGBA    check.png    189,400,568,400
    PNG Two Pixels Should Have Matched RGBA    check.png    235,400,614,400
    PNG Two Pixels Should Have Matched RGBA    check.png    281,400,660,400
    PNG Two Pixels Should Have Matched RGBA    check.png    327,400,706,400
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser




# validate pv cut and check the state of the generate button
# pv cut on None and NaN


