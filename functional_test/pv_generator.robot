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
    Click Element    css:[data-testid="coordinate-image-radio-button"] + span
    Press Keys    (//input[@placeholder="X Coordinate"])[3]    DELETE
    Input Text    (//input[@placeholder="X Coordinate"])[3]    54
    Press Keys    (//input[@placeholder="Y Coordinate"])[3]    DELETE
    Input Text    (//input[@placeholder="Y Coordinate"])[3]    33
    Press Keys    //input[@placeholder="Length"]    DELETE
    Input Text    //input[@placeholder="Length"]    62
    Press Keys    //input[@placeholder="P.A."]    DELETE
    Input Text    //input[@placeholder="P.A."]    315
    Click Element    css:[data-testid="coordinate-image-radio-button"] + span
    Click Element    css:[data-testid="region-dialog"] [class*="-dialog-close-button"]
    Click Element    id:PVGeneratorButton
    # select the line region as the pv cut
    Click Element    ${PV_GENERATOR_PV_CUT_REGION_DROPDOWN}
    Click Element    //*[@data-testid="pv-generator-pv-cut-region-dropdown"]/option[contains(text(), "Region 1")]
    Click Element    ${PV_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating PV    timeout=5
    Click Element    ${PV_GENERATOR_CLOSE_BUTTON}
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[contains(text(), "tab10")]
    Element Should Contain    ${VIEWER_TAB_TITLE}    S255_CH3CN_subcube_pv.fits
    Click Element    ${FILE_HEADER_DIALOG_BUTTON}
    # go to the file info tab and check context
    Click Element    data:testid:file-information-tab-title
    Element Should Contain     ${FILE_INFO_TEXT}    S255_CH3CN_subcube_pv.fits
    Element Should Contain     ${FILE_INFO_TEXT}    [63, 251, 1]
    Click Element    ${FILE_HEADER_DIALOG_CLOSE_BUTTON}
    #Sleep    0.5
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    # generate a point region
    Click Element    ${POINT_REGION_SHORTCUT_BUTTON}
    Click Element At Coordinates    ${VIEWER_DIV}    200    0
    Element Should Contain    ${SPATIAL_PROFILER_CURSOR_INFO}    Data: (WCS: 0.02785714, Image: 33 px, 6.28957e-2)
    Element Should Contain    ${SPATIAL_PROFILER_CURSOR_INFO_Y}    Data: (WCS: -288.7972, Image: 115 px, 6.28957e-2)
    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    604,71,729,25
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    604,155,729,25
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    604,180,729,25
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    604,248,729,25
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    573,69,729,25
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Wide-field PV Image Generation
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    Gaussian_array_wide.fits
    # create a line region at the view center via the shortcut button
    Click Element    ${LINE_REGION_SHORTCUT_BUTTON}
    Click Element    ${VIEWER_DIV}
    # enable region config dialog and set up the line region
    Double Click Element    ${VIEWER_DIV}
    Click Element    css:[data-testid="coordinate-image-radio-button"] + span
    Press Keys    (//input[@placeholder="X Coordinate"])[3]    DELETE
    Input Text    (//input[@placeholder="X Coordinate"])[3]    268
    Press Keys    (//input[@placeholder="Y Coordinate"])[3]    DELETE
    Input Text    (//input[@placeholder="Y Coordinate"])[3]    192
    Press Keys    //input[@placeholder="Length"]    DELETE
    Input Text    //input[@placeholder="Length"]    400
    Press Keys    //input[@placeholder="P.A."]    DELETE
    Input Text    //input[@placeholder="P.A."]    90
    Click Element    css:[data-testid="coordinate-image-radio-button"] + span
    Click Element    css:[data-testid="region-dialog"] [class*="-dialog-close-button"]
    Click Element    id:PVGeneratorButton
    # select the line region as the pv cut
    Click Element    ${PV_GENERATOR_PV_CUT_REGION_DROPDOWN}
    Click Element    //*[@data-testid="pv-generator-pv-cut-region-dropdown"]/option[contains(text(), "Region 1")]
    Click Element    ${PV_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating PV    timeout=30
    Click Element    ${PV_GENERATOR_CLOSE_BUTTON}
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[contains(text(), "tab10")]
    #Sleep    0.5
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    Click Element    ${POINT_REGION_SHORTCUT_BUTTON}
    Click Element At Coordinates    ${VIEWER_DIV}    200    0
    Element Should Contain    ${SPATIAL_PROFILER_CURSOR_INFO}    Data: (WCS: 1.089626, Image: 334 px, -4.17348e-4)
    Element Should Contain    ${SPATIAL_PROFILER_CURSOR_INFO_Y}    Data: (WCS: 123.5346, Image: 58 px, -4.17348e-4)
    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    475,215,729,25
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    546,215,729,25
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    617,215,729,25
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    687,215,729,25
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    463,215,729,25
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


PV Image Generation Cancellation And Rerequest
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    Gaussian_array_wide.fits
    # create a line region at the view center via the shortcut button
    Click Element    ${LINE_REGION_SHORTCUT_BUTTON}
    Click Element    ${VIEWER_DIV}
    # enable region config dialog and set up the line region
    Double Click Element    ${VIEWER_DIV}
    Click Element    css:[data-testid="coordinate-image-radio-button"] + span
    Press Keys    (//input[@placeholder="X Coordinate"])[3]    DELETE
    Input Text    (//input[@placeholder="X Coordinate"])[3]    268
    Press Keys    (//input[@placeholder="Y Coordinate"])[3]    DELETE
    Input Text    (//input[@placeholder="Y Coordinate"])[3]    192
    Press Keys    //input[@placeholder="Length"]    DELETE
    Input Text    //input[@placeholder="Length"]    400
    Press Keys    //input[@placeholder="P.A."]    DELETE
    Input Text    //input[@placeholder="P.A."]    90
    Click Element    css:[data-testid="coordinate-image-radio-button"] + span
    Click Element    css:[data-testid="region-dialog"] [class*="-dialog-close-button"]
    Click Element    id:PVGeneratorButton
    # select the line region as the pv cut
    Click Element    ${PV_GENERATOR_PV_CUT_REGION_DROPDOWN}
    Click Element    //*[@data-testid="pv-generator-pv-cut-region-dropdown"]/option[contains(text(), "Region 1")]
    Click Element    ${PV_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Contains    Generating PV    timeout=5
    Sleep    2.5
    Click Element    //*[contains(text(), "Cancel")]
    #Sleep    1
    Click Element    ${PV_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating PV    timeout=30
    Click Element    ${PV_GENERATOR_CLOSE_BUTTON}
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[contains(text(), "tab10")]
    #Sleep    0.5
    Click Element    ${POINT_REGION_SHORTCUT_BUTTON}
    Click Element At Coordinates    ${VIEWER_DIV}    200    0
    Element Should Contain    ${SPATIAL_PROFILER_CURSOR_INFO}    Data: (WCS: 1.089626, Image: 334 px, -4.17348e-4)
    Element Should Contain    ${SPATIAL_PROFILER_CURSOR_INFO_Y}    Data: (WCS: 123.5346, Image: 58 px, -4.17348e-4)
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    475,215,729,25
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    546,215,729,25
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    617,215,729,25
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    687,215,729,25
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    463,215,729,25    
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


PV Image Generation Repeat
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    Click Element    ${LINE_REGION_SHORTCUT_BUTTON}
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    Click Element    css:[data-testid="coordinate-image-radio-button"] + span
    Press Keys    (//input[@placeholder="X Coordinate"])[3]    DELETE
    Input Text    (//input[@placeholder="X Coordinate"])[3]    54
    Press Keys    (//input[@placeholder="Y Coordinate"])[3]    DELETE
    Input Text    (//input[@placeholder="Y Coordinate"])[3]    33
    Press Keys    //input[@placeholder="Length"]    DELETE
    Input Text    //input[@placeholder="Length"]    62
    Press Keys    //input[@placeholder="P.A."]    DELETE
    Input Text    //input[@placeholder="P.A."]    315
    Click Element    css:[data-testid="coordinate-image-radio-button"] + span
    Click Element    css:[data-testid="region-dialog"] [class*="-dialog-close-button"]
    Click Element    id:PVGeneratorButton
    # select the line region as the pv cut
    Click Element    ${PV_GENERATOR_PV_CUT_REGION_DROPDOWN}
    Click Element    //*[@data-testid="pv-generator-pv-cut-region-dropdown"]/option[contains(text(), "Region 1")]
    Click Element    ${PV_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating PV    timeout=5
    Click Element    ${PV_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating PV    timeout=5
    # the following is a workaround of a bug (the widget should not be closed automatically)
    #Click Element    ${PV_GENERATOR_CLOSE_BUTTON}
    Sleep    1
    Click Element    ${COLORMAP_DROPDOWN}
    Wait Until Page Contains Element    //*[contains(text(), "tab10")]
    Click Element    //*[contains(text(), "tab10")]
    ${key}=    Generate Random String    8
    # this sleep is required to let the viewer size popup in the viewer go away
    Sleep    0.8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    604,71,729,25
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    604,155,729,25
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    604,180,729,25
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    604,248,729,25
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    573,69,729,25
    Set Selenium Speed    ${DELAY}
    Click Element    //*[contains(text(), "Animator")]
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    check2_${key}.png
    Click Element    ${ANIMATOR_PREVIOUS_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    check3_${key}.png
    PNG Images Should Be Different    check_${key}.png    check2_${key}.png
    PNG Images Should Be Identical    check_${key}.png    check3_${key}.png
    Remove Files    check_${key}.png    check2_${key}.png    check3_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



PV Image Generation With Matched Cubes
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Click Element    ${LINE_REGION_SHORTCUT_BUTTON}
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    Click Element    css:[data-testid="coordinate-image-radio-button"] + span
    Press Keys    (//input[@placeholder="X Coordinate"])[3]    DELETE
    Input Text    (//input[@placeholder="X Coordinate"])[3]    245
    Press Keys    (//input[@placeholder="Y Coordinate"])[3]    DELETE
    Input Text    (//input[@placeholder="Y Coordinate"])[3]    506
    Press Keys    //input[@placeholder="Length"]    DELETE
    Input Text    //input[@placeholder="Length"]    141
    Press Keys    //input[@placeholder="P.A."]    DELETE
    Input Text    //input[@placeholder="P.A."]    124
    Click Element    css:[data-testid="coordinate-image-radio-button"] + span
    Click Element    css:[data-testid="region-dialog"] [class*="-dialog-close-button"]
    Append Image    M17_SWex.hdf5
    Mouse Over    ${VIEWER_10_CANVAS}
    # match M17_SWex.hdf5 to M17_SWex.fits via the matching button in the viewer
    Click Element    ${VIEWER_10_MATCH_BUTTON}
    Click Element    //*[contains(text(), "Spectral (VRAD) and spatial")]
    Mouse Out    ${VIEWER_DIV}
    Click Element    id:PVGeneratorButton
    # select the line region as the pv cut
    Click Element    ${PV_GENERATOR_PV_CUT_REGION_DROPDOWN}
    Click Element    //*[@data-testid="pv-generator-pv-cut-region-dropdown"]/option[contains(text(), "Region 1")]
    Click Element    ${PV_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating PV    timeout=5
    Click Element    ${PV_GENERATOR_CLOSE_BUTTON}
    # mouse over the generated pv image panel and click the zoom-to-fit button
    Mouse Over    css:#image-panel-0-1 .region-stage
    Click Element    css:#image-panel-0-1 [data-testid="zoom-to-fit-button"]
    Click Element    id:PVGeneratorButton
    # use the image dropdown to select M17_SWex.fits
    Click Element    data:testid:pv-generator-image-dropdown
    Click Element    //*[@data-testid="pv-generator-image-dropdown"]/option[contains(text(), "0: M17_SWex.fits")]
    # use the region dropdown to select Region 1
    Click Element    ${PV_GENERATOR_PV_CUT_REGION_DROPDOWN}
    Click Element    //*[@data-testid="pv-generator-pv-cut-region-dropdown"]/option[contains(text(), "Region 1")]
    Click Element    ${PV_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating PV    timeout=5
    Click Element    ${PV_GENERATOR_CLOSE_BUTTON}
    Mouse Out    ${VIEWER_DIV}
    #Sleep    0.5
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    194,335,573,335
    Click Element    //*[contains(text(), "Animator")]
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex_pv.fits
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.fits
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex.hdf5
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex_pv.hdf5
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Element Should Contain    ${VIEWER_TAB_TITLE}    M17_SWex_pv.fits
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser
    

PV Image Generation With Matched Wide-field Cubes
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    Gaussian_array_wide.fits
    Click Element    ${LINE_REGION_SHORTCUT_BUTTON}
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    Click Element    css:[data-testid="coordinate-image-radio-button"] + span
    Press Keys    (//input[@placeholder="X Coordinate"])[3]    DELETE
    Input Text    (//input[@placeholder="X Coordinate"])[3]    813
    Press Keys    (//input[@placeholder="Y Coordinate"])[3]    DELETE
    Input Text    (//input[@placeholder="Y Coordinate"])[3]    192
    Press Keys    //input[@placeholder="Length"]    DELETE
    Input Text    //input[@placeholder="Length"]    888
    Press Keys    //input[@placeholder="P.A."]    DELETE
    Input Text    //input[@placeholder="P.A."]    90
    Click Element    css:[data-testid="coordinate-image-radio-button"] + span
    Click Element    css:[data-testid="region-dialog"] [class*="-dialog-close-button"]
    Append Image    Gaussian_array_wide2.fits
    #Sleep    1
    # match Gaussian_array_wide2.fits to Gaussian_array_wide.fits via the matching button in the viewer
    Mouse Over    ${VIEWER_10_CANVAS}
    Click Element    ${VIEWER_10_MATCH_BUTTON}
    Click Element    //*[contains(text(), "Spectral (VRAD) and spatial")]
    Mouse Out    ${VIEWER_DIV}
    Click Element    id:PVGeneratorButton
    # select the line region as the pv cut
    Click Element    ${PV_GENERATOR_PV_CUT_REGION_DROPDOWN}
    Click Element    //*[@data-testid="pv-generator-pv-cut-region-dropdown"]/option[contains(text(), "Region 1")]
    Click Element    ${PV_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating PV    timeout=30
    Click Element    ${PV_GENERATOR_CLOSE_BUTTON}
    # mouse over the generated pv image panel and click the zoom-to-fit button
    Mouse Over    css:#image-panel-0-1 .region-stage
    Click Element    css:#image-panel-0-1 [data-testid="zoom-to-fit-button"]
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[contains(text(), "tab10")]
    Click Element    id:PVGeneratorButton
    # use the image dropdown to select Gaussian_array_wide.fits
    Click Element    data:testid:pv-generator-image-dropdown
    Click Element    //*[@data-testid="pv-generator-image-dropdown"]/option[contains(text(), "0: Gaussian_array_wide.fits")]
    # use the region dropdown to select Region 1
    Click Element    ${PV_GENERATOR_PV_CUT_REGION_DROPDOWN}
    Click Element    //*[@data-testid="pv-generator-pv-cut-region-dropdown"]/option[contains(text(), "Region 1")]
    Click Element    ${PV_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating PV    timeout=30
    Click Element    ${PV_GENERATOR_CLOSE_BUTTON}
    Sleep    1
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[contains(text(), "tab10")]
    Mouse Out    ${VIEWER_DIV}
    #Sleep    0.5
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    96,400,475,400
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    143,400,522,400
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    189,400,568,400
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    235,400,614,400
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    281,400,660,400
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    327,400,706,400
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Interactive PV Preview
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    Click Element    ${LINE_REGION_SHORTCUT_BUTTON}
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    Click Element    css:[data-testid="coordinate-image-radio-button"] + span
    Press Keys    //input[@placeholder="Length"]    DELETE
    Input Text    //input[@placeholder="Length"]    60
    Click Element    css:[data-testid="coordinate-image-radio-button"] + span
    Click Element    css:[data-testid="region-dialog"] [class*="-dialog-close-button"]
    Drag And Drop    id:PVGeneratorButton   (//li[@data-testid="spatial-profiler-tab"])[1]
    # remove unused widgets
    Click Element    (//div[@data-testid="spatial-profiler-tab-close-button"])[2]
    Click Element    ${IMAGE_LIST_CLOSE_BUTTON}
    Click Element    ${ANIMATOR_CLOSE_BUTTON}
    Click Element    ${REGION_LIST_CLOSE_BUTTON}
    # define pv cut
    Click Element    ${PV_GENERATOR_PV_CUT_REGION_DROPDOWN}
    Click Element    //*[@data-testid="pv-generator-pv-cut-region-dropdown"]/option[contains(text(), "Region 1")]
    # enable preview
    Click Element    //a[contains(., "Start preview")]
    # relocate preview widget
    Drag And Drop    data:testid:pv-generator-0-pv-preview-0-header-dock-button    data:testid:spatial-profiler-tab
    # change colormap
    Click Element    data:testid:colormap-dropdown
    Click Element    //*[contains(text(), "tab10")]
    Click Element    ${VIEWER_DIV}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[3]    before_${key}.png
    # moving pv cut
    Drag And Drop By Offset    ${VIEWER_DIV}    20    50
    Capture Element Screenshot    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[3]    after_${key}.png
    # checking rendered images
    Set Selenium Speed    0
    PNG Images Should Be Different    before_${key}.png    after_${key}.png
    PNG Two Pixels Should Have Matched RGBA    before_${key}.png    272,298,476,40
    PNG Two Pixels Should Have Matched RGBA    after_${key}.png    268,486,476,40
    Remove Files    before_${key}.png    after_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Interactive PV Preview With Customization
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1_subimage.fits
    Click Element    ${LINE_REGION_SHORTCUT_BUTTON}
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    Click Element    css:[data-testid="coordinate-image-radio-button"] + span
    Press Keys    //input[@placeholder="Length"]    DELETE
    Input Text    //input[@placeholder="Length"]    200
    Click Element    css:[data-testid="coordinate-image-radio-button"] + span
    Click Element    css:[data-testid="region-dialog"] [class*="-dialog-close-button"]
    Drag And Drop    id:PVGeneratorButton   (//li[@data-testid="spatial-profiler-tab"])[1]
    # remove unused widgets
    Click Element    (//div[@data-testid="spatial-profiler-tab-close-button"])[2]
    Click Element    ${IMAGE_LIST_CLOSE_BUTTON}
    Click Element    ${ANIMATOR_CLOSE_BUTTON}
    Click Element    ${REGION_LIST_CLOSE_BUTTON}
    # define pv cut
    Click Element    ${PV_GENERATOR_PV_CUT_REGION_DROPDOWN}
    Click Element    //*[@data-testid="pv-generator-pv-cut-region-dropdown"]/option[contains(text(), "Region 1")]
    # switch to radio velocity definition
    Click Element    data:testid:spectral-profiler-coordinate-dropdown
    Click Element    //option[contains(text(), "Radio velocity (km/s)")]
    # define a velocity range
    Input Text    data:testid:pv-generator-spectral-range-from-input    -5
    Input Text    data:testid:pv-generator-spectral-range-to-input    18
    # swap axes
    Click Element    //option[contains(text(), "X-axis: Spectral, Y-axis: Spatial")]
    # downsample cube
    Click Element    //input[@data-testid="pv-generator-preview-rebin-xy-input"]/parent::div/parent::div//button[.//span[@icon="chevron-up"]]
    Click Element    //input[@data-testid="pv-generator-preview-rebin-z-input"]/parent::div/parent::div//button[.//span[@icon="chevron-up"]]
    # enable preview
    Click Element    //a[contains(., "Start preview")]
    # relocate preview widget
    Drag And Drop    data:testid:pv-generator-0-pv-preview-0-header-dock-button    data:testid:spatial-profiler-tab
    # change colormap
    Click Element    data:testid:colormap-dropdown
    Click Element    //*[contains(text(), "tab10")]
    Click Element    ${VIEWER_DIV}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[3]    before_${key}.png
    # moving pv cut
    Drag And Drop By Offset    ${VIEWER_DIV}    -20    20
    Capture Element Screenshot    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[3]    after_${key}.png
    # generate full resolution PV
    Click Element    data:testid:pv-generator-tab
    Click Element    ${PV_GENERATOR_GENERATE_BUTTON}
    Wait Until Page Does Not Contain    Generating PV    timeout=30
    # change colormap
    Click Element    data:testid:colormap-dropdown
    Click Element    //*[contains(text(), "tab10")]
    # make pv preview widget active
    Click Element    data:testid:pv-preview-tab
    Capture Page Screenshot    final_${key}.png
    # checking rendered images
    Set Selenium Speed    0
    PNG Images Should Be Different    before_${key}.png    after_${key}.png
    PNG Two Pixels Should Have Matched RGBA    before_${key}.png   236,353,476,40
    PNG Two Pixels Should Have Matched RGBA    after_${key}.png    299,303,476,40
    PNG Two Pixels Should Have Matched RGBA    final_${key}.png    634,260,1068,371
    PNG Two Pixels Should Have Matched RGBA    final_${key}.png    500,280,960,410
    Remove Files    before_${key}.png    after_${key}.png    final_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


# validate pv cut and check the state of the generate button
# pv cut on None and NaN
