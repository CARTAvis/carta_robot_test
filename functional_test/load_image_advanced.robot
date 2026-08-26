*** Settings ***
Documentation     Load an image and check if the image is loaded properly
Resource          ../resource.robot


*** Test Cases ***
Load Images As A Stokes Hypercube
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    IRCp10216
    Wait Until Element Contains    ${FILE_LIST}   IRCp10216_sci.spw0.cube.I.manual.pbcor.fits
    Click Element    //*[contains(text(), "IRCp10216_sci.spw0.cube.I.manual.pbcor.fits")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    ${platform}=    Evaluate    sys.platform    sys
    IF    '${platform}' == 'darwin'
    Click Element    //*[contains(text(), "IRCp10216_sci.spw0.cube.Q.manual.pbcor.fits")]    modifier=COMMAND
    Click Element    //*[contains(text(), "IRCp10216_sci.spw0.cube.U.manual.pbcor.fits")]    modifier=COMMAND
    Click Element    //*[contains(text(), "IRCp10216_sci.spw0.cube.V.manual.pbcor.fits")]    modifier=COMMAND
    ELSE
    Click Element    //*[contains(text(), "IRCp10216_sci.spw0.cube.Q.manual.pbcor.fits")]    modifier=CTRL
    Click Element    //*[contains(text(), "IRCp10216_sci.spw0.cube.U.manual.pbcor.fits")]    modifier=CTRL
    Click Element    //*[contains(text(), "IRCp10216_sci.spw0.cube.V.manual.pbcor.fits")]    modifier=CTRL
    END
    # click the "load as hypercube" button
    Click Element    //a[contains(., "Load as hypercube")]
    # check the popup title 
    Wait Until Page Contains Element    //*[contains(text(), "Merging polarization hypercube")]
    Set Selenium Speed    0.02
    # verify the context in the popup window
    Element Should Contain    data:testid:stokes-table-filename-0    IRCp10216_sci.spw0.cube.I.manual.pbcor.fits
    Element Should Contain    data:testid:stokes-table-dropdown-0    Stokes I
    Element Should Contain    data:testid:stokes-table-filename-1    IRCp10216_sci.spw0.cube.Q.manual.pbcor.fits
    Element Should Contain    data:testid:stokes-table-dropdown-1    Stokes Q
    Element Should Contain    data:testid:stokes-table-filename-2    IRCp10216_sci.spw0.cube.U.manual.pbcor.fits
    Element Should Contain    data:testid:stokes-table-dropdown-2    Stokes U
    Element Should Contain    data:testid:stokes-table-filename-3    IRCp10216_sci.spw0.cube.V.manual.pbcor.fits
    Element Should Contain    data:testid:stokes-table-dropdown-3    Stokes V
    Set Selenium Speed    ${DELAY}
    # click the load button
    Click Element    data:testid:load-hypercube-button
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Element Should Contain    ${VIEWER_TAB_TITLE}    IRCp10216_sci.spw0.cube.hypercube_IQUV.manual.pbcor.fits
    Click Element    //*[contains(text(), "Animator")]
    Set Selenium Speed    0.02
    # check the labels in the polarization slider to ensure native and computed polarization components are there
    Element Should Contain    data:testid:animator-polarization-slider    Stokes I
    Element Should Contain    data:testid:animator-polarization-slider    Stokes Q
    Element Should Contain    data:testid:animator-polarization-slider    Stokes U
    Element Should Contain    data:testid:animator-polarization-slider    Stokes V
    Element Should Contain    data:testid:animator-polarization-slider    Ptotal
    Element Should Contain    data:testid:animator-polarization-slider    Plinear
    Element Should Contain    data:testid:animator-polarization-slider    PFtotal
    Element Should Contain    data:testid:animator-polarization-slider    PFlinear
    Element Should Contain    data:testid:animator-polarization-slider    Pangle
    Set Selenium Speed    ${DELAY}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered_${key}.png
    PNG Images Should Be Different    initial_${key}.png    rerendered_${key}.png
    Remove Files    initial_${key}.png    rerendered_${key}.png  
    [Teardown]    Kill carta_backend And Close Browser


Load Multiple Images In One Shot
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    IRCp10216
    Wait Until Element Contains    ${FILE_LIST}   IRCp10216_sci.spw0.cube.I.manual.pbcor.fits
    Click Element    //*[contains(text(), "IRCp10216_sci.spw0.cube.I.manual.pbcor.fits")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    ${platform}=    Evaluate    sys.platform    sys
    IF    '${platform}' == 'darwin'
    Click Element    //*[contains(text(), "IRCp10216_sci.spw0.cube.Q.manual.pbcor.fits")]    modifier=COMMAND
    Click Element    //*[contains(text(), "IRCp10216_sci.spw0.cube.U.manual.pbcor.fits")]    modifier=COMMAND
    Click Element    //*[contains(text(), "IRCp10216_sci.spw0.cube.V.manual.pbcor.fits")]    modifier=COMMAND
    ELSE
    Click Element    //*[contains(text(), "IRCp10216_sci.spw0.cube.Q.manual.pbcor.fits")]    modifier=CTRL
    Click Element    //*[contains(text(), "IRCp10216_sci.spw0.cube.U.manual.pbcor.fits")]    modifier=CTRL
    Click Element    //*[contains(text(), "IRCp10216_sci.spw0.cube.V.manual.pbcor.fits")]    modifier=CTRL
    END
    Click Element    //a[contains(., "Load selected")]
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Element Should Contain    ${VIEWER_TAB_TITLE}    IRCp10216_sci.spw0.cube.V.manual.pbcor.fits
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered_${key}.png
    PNG Images Should Be Different    initial_${key}.png    rerendered_${key}.png
    Remove Files    initial_${key}.png    rerendered_${key}.png  
    [Teardown]    Kill carta_backend And Close Browser


Load Images With LEL
    [Setup]    Setup carta_backend And Open Browser To CARTA
    # switch to the image arithmetic mode from the default file filtering mode
    Click Element    //button[contains(., "Filter")]
    Click Element    //*[contains(text(), "Image arithmetic")]
    # fill in the LEL expression
    Input text    //input[@placeholder="Enter an image arithmetic expression"]    "dice_one.fits"+"dice_four.fits"
    Click Element    //*[contains(text(), "Load expression")]
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Element Should Contain    ${VIEWER_TAB_TITLE}    "dice_one.fits"+"dice_four.fits"
    Click Element    ${COLORMAP_DROPDOWN}
    Scroll Element Into View    //*[contains(text(), "tab10")]
    Click Element    //*[contains(text(), "tab10")]
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    380,217,274,110
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser

Load Three Images As A Three-color-blended Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    # ubuntu CI workaround, otherwise files cannot be selected correctly for an unknown reason
    Set Selenium Speed    0.5
    Input Text    ${FILE_FILTER}    m16_f
    Wait Until Element Contains    ${FILE_LIST}    m16_f
    # select three images and load as a RGB-blended image
    ${platform}=    Evaluate    sys.platform    sys
    IF    '${platform}' == 'darwin'
    Click Element    //*[normalize-space(text())='m16_f1130w.fits']
    Click Element    //*[normalize-space(text())='m16_f1500w.fits']    modifier=COMMAND
    Click Element    //*[normalize-space(text())='m16_f0770w.fits']    modifier=COMMAND
    ELSE
    Click Element    //*[normalize-space(text())='m16_f1130w.fits']
    Click Element    //*[normalize-space(text())='m16_f1500w.fits']    modifier=CTRL
    Click Element    //*[normalize-space(text())='m16_f0770w.fits']    modifier=CTRL
    END
    Set Selenium Speed    0.2
    Click Element    //*[normalize-space(text())='Load with RGB blending']
    Wait Until Page Does Not Contain Element    ${PROGRESS_CLOUD} 
    # control FOV for testing
    Mouse Over    ${VIEWER_00_CANVAS}
    Click Element    ${VIEWER_00_ZOOM_TO_FIT_BUTTON}
    Click Element    ${VIEWER_11_CANVAS}
    # apply different color sets
    ${key}=    Generate Random String    8
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    RGB_${key}.png
    Click Element    //*[normalize-space(text())='Apply color set']
    Click Element    //*[normalize-space(text())='CMY']
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    CMY_${key}.png
    Click Element    //*[normalize-space(text())='Apply color set']
    Click Element    //*[normalize-space(text())='Rainbow']    
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    rainbow_${key}.png

    Set Selenium Speed    0.02
    PNG Pixel XY Should Match RGBA    RGB_${key}.png    274,148,255,0,0,255
    PNG Pixel XY Should Match RGBA    RGB_${key}.png    653,154,0,255,0,255
    PNG Pixel XY Should Match RGBA    RGB_${key}.png    271,393,0,0,255,255
    PNG Pixel XY Should Match RGBA    RGB_${key}.png    590,326,226,176,235,255

    PNG Pixel XY Should Match RGBA    CMY_${key}.png    274,148,255,0,255,255
    PNG Pixel XY Should Match RGBA    CMY_${key}.png    653,154,255,255,0,255
    PNG Pixel XY Should Match RGBA    CMY_${key}.png    271,393,0,255,255,255
    PNG Pixel XY Should Match RGBA    CMY_${key}.png    556,372,185,169,180,255

    PNG Pixel XY Should Match RGBA    rainbow_${key}.png    274,148,255,0,0,255
    PNG Pixel XY Should Match RGBA    rainbow_${key}.png    653,154,128,254,179,255
    PNG Pixel XY Should Match RGBA    rainbow_${key}.png    271,393,127,0,255,255
    PNG Pixel XY Should Match RGBA    rainbow_${key}.png    596,350,228,142,178,255

    Remove Files    RGB_${key}.png    CMY_${key}.png    rainbow_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Load Multiple Images As A Multi-color-blended Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    # ubuntu CI workaround, otherwise files cannot be selected correctly for an unknown reason
    Set Selenium Speed    0.5
    Input Text    ${FILE_FILTER}    m16_f
    Wait Until Element Contains    ${FILE_LIST}    m16_f
    # select seven images and load as a multi-color-blended image
    ${platform}=    Evaluate    sys.platform    sys
    IF    '${platform}' == 'darwin'
    Click Element    //*[normalize-space(text())='m16_f1500w.fits']
    Click Element    //*[normalize-space(text())='m16_f1130w.fits']    modifier=COMMAND
    Click Element    //*[normalize-space(text())='m16_f0770w.fits']    modifier=COMMAND
    Click Element    //*[normalize-space(text())='m16_f0444w.fits']    modifier=COMMAND
    Click Element    //*[normalize-space(text())='m16_f0335m.fits']    modifier=COMMAND
    Click Element    //*[normalize-space(text())='m16_f0200w.fits']    modifier=COMMAND
    Click Element    //*[normalize-space(text())='m16_f0090w.fits']    modifier=COMMAND
    ELSE
    Click Element    //*[normalize-space(text())='m16_f1500w.fits']
    Click Element    //*[normalize-space(text())='m16_f1130w.fits']    modifier=CTRL
    Click Element    //*[normalize-space(text())='m16_f0770w.fits']    modifier=CTRL
    Click Element    //*[normalize-space(text())='m16_f0444w.fits']    modifier=CTRL
    Click Element    //*[normalize-space(text())='m16_f0335m.fits']    modifier=CTRL
    Click Element    //*[normalize-space(text())='m16_f0200w.fits']    modifier=CTRL
    Click Element    //*[normalize-space(text())='m16_f0090w.fits']    modifier=CTRL
    END
    Set Selenium Speed    0.2
    Click Element    //*[normalize-space(text())='Load with multi-color blending']
    Wait Until Page Does Not Contain Element    ${PROGRESS_CLOUD} 
    ${key}=    Generate Random String    8
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    multicolor_${key}.png
    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    multicolor_${key}.png    588,347,191,59,174,255
    PNG Pixel XY Should Match RGBA    multicolor_${key}.png    520,397,55,23,17,255
    PNG Pixel XY Should Match RGBA    multicolor_${key}.png    513,252,120,144,142,255
    Remove Files    multicolor_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Load Image Via HiPS2FITS Service
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    m51_151_MHz.fits
    Click Element    ${COLORMAP_DROPDOWN}
    Scroll Element Into View    //*[contains(text(), "tab10")]
    Click Element    //*[contains(text(), "tab10")]
    # launch online data query dialog and switch to hips2fits service
    Click Element    data:testid:online-data-query-dialog-button
    Click Element    id:bp6-tab-title_onlineQueryDialogTabs_1
    # set observation to herschel pacs70
    Click Element    //*[@id="bp6-tab-panel_onlineQueryDialogTabs_1"]/div/div[1]/div/div/div[1]/div/div/input
    Input Text    //*[@id="bp6-tab-panel_onlineQueryDialogTabs_1"]/div/div[1]/div/div/div[1]/div/div/input    PACS70
    Click Element    //*[normalize-space(text())='ESAVO/P/HERSCHEL/PACS70']
    # search by source name
    Input Text    //*[@id="bp6-tab-panel_onlineQueryDialogTabs_1"]/div/div[1]/div/div/div[3]/div/div/input    M51
    # set output image properties
    Input Text    //*[@id="numericInput-7"]    500
    Input Text    //*[@id="numericInput-8"]    500
    Input Text    //*[@id="numericInput-9"]    0.2
    # apply query
    Click Element    //*[@id="bp6-tab-panel_onlineQueryDialogTabs_1"]/div/div[2]/a[2]/span
    Wait Until Page Does Not Contain    Online Data Query    timeout=60
    Click Element    ${COLORMAP_DROPDOWN}
    Scroll Element Into View    //*[contains(text(), "tab10")]
    Click Element    //*[contains(text(), "tab10")]
    # try another query
    # launch online data query dialog and switch to hips2fits service
    Click Element    data:testid:online-data-query-dialog-button
    Click Element    id:bp6-tab-title_onlineQueryDialogTabs_1
    # query by center coordinate in ICRS reference frame
    Click Element    //*[normalize-space(text())='Query by center']
    Input Text    //*[@id="numericInput-19"]    202.4977
    Input Text    //*[@id="numericInput-20"]    47.2667
    # set output image in galactic coordinate
    Click Element    //*[normalize-space(text())='Galactic']
    # set output image projection as SIN
    Click Element    //*[@id="bp6-tab-panel_onlineQueryDialogTabs_1"]/div/div[1]/div/div/div[7]/div/div
    Click Element    //*[normalize-space(text())='SIN - orthographic/synthesis']
    Click Element    //*[normalize-space(text())='Projection']
    # set output image to have a rotation of 45 deg
    Input Text    //*[@id="numericInput-18"]    45    clear=True
    # apply query
    Click Element    //*[@id="bp6-tab-panel_onlineQueryDialogTabs_1"]/div/div[2]/a[2]/span
    Wait Until Page Does Not Contain    Online Data Query    timeout=60
    Click Element    ${COLORMAP_DROPDOWN}
    Scroll Element Into View    //*[contains(text(), "tab10")]
    Click Element    //*[contains(text(), "tab10")]
    # enable spatial matching
    Click Element    ${IMAGE_LIST_SECOND_MATCHING_XY}
    Mouse Over    ${VIEWER_DIV}
    Click Element    ${IMAGE_LIST_THIRD_MATCHING_XY}
    Mouse Over    ${VIEWER_01_CANVAS}
    Click Element    ${VIEWER_01_ZOOM_TO_FIT_BUTTON}
    # get screenshot and check
    Mouse Out    ${VIEWER_DIV}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_hips2fits_${key}.png
    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_hips2fits_${key}.png    190,99,569,100
    PNG Two Pixels Should Have Matched RGBA    check_hips2fits_${key}.png    190,99,191,334
    Remove File    check_hips2fits_${key}.png
    [Teardown]    Kill carta_backend And Close Browser