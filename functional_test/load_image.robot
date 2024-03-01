*** Settings ***
Documentation     Load an image and check if the image is loaded properly
Resource          ../resource.robot


*** Variables ***
${MAGIC_INDEX1}    14
${MAGIC_INDEX2}    17 


*** Test Cases ***
Load FITS image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered_${key}.png
    PNG Images Should Be Different    initial_${key}.png    rerendered_${key}.png
    Remove Files    initial_${key}.png    rerendered_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.image
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered_${key}.png
    PNG Images Should Be Different    initial_${key}.png    rerendered_${key}.png
    Remove Files    initial_${key}.png    rerendered_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Load HDF5 image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.hdf5
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered_${key}.png
    PNG Images Should Be Different    initial_${key}.png    rerendered_${key}.png
    Remove Files    initial_${key}.png    rerendered_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Load MIRIAD image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.miriad
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered_${key}.png
    PNG Images Should Be Different    initial_${key}.png    rerendered_${key}.png
    Remove Files    initial_${key}.png    rerendered_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Load FITS gz image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    tu2310418.fits.gz
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered_${key}.png
    PNG Images Should Be Different    initial_${key}.png    rerendered_${key}.png
    Remove Files    initial_${key}.png    rerendered_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Load FITS fz image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    tu2310418.fits.fz
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered_${key}.png
    PNG Images Should Be Different    initial_${key}.png    rerendered_${key}.png
    Remove Files    initial_${key}.png    rerendered_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Load FITS pv image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    carta_pv.fits
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered_${key}.png
    PNG Images Should Be Different    initial_${key}.png    rerendered_${key}.png
    Remove Files    initial_${key}.png    rerendered_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA pv image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    casa_pv.image
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered_${key}.png
    PNG Images Should Be Different    initial_${key}.png    rerendered_${key}.png
    Remove Files    initial_${key}.png    rerendered_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA uv image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    UVamp.image
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered_${key}.png
    PNG Images Should Be Different    initial_${key}.png    rerendered_${key}.png
    Remove Files    initial_${key}.png    rerendered_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA boolean image
    Pass Execution    Not yet supported...
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    boolean.image
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered_${key}.png
    PNG Images Should Be Different    initial_${key}.png    rerendered_${key}.png
    Remove Files    initial_${key}.png    rerendered_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA complex image as amplitude
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    complex.image
    Wait Until Element Contains    ${FIRST_FILE_IN_THE_FILE_LIST}   complex.image
    Click Element    xpath://*[contains(text(), "complex.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Click Element    xpath://*[contains(text(), "Amplitude")]
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Element Should Contain    ${VIEWER_TAB_TITLE}    AMPLITUDE("complex.image")
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered_${key}.png
    PNG Images Should Be Different    initial_${key}.png    rerendered_${key}.png
    Remove Files    initial_${key}.png    rerendered_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA complex image as phase
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    complex.image
    Wait Until Element Contains    ${FIRST_FILE_IN_THE_FILE_LIST}   complex.image
    Click Element    xpath://*[contains(text(), "complex.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Click Element    xpath://*[contains(text(), "Phase")]
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Element Should Contain    ${VIEWER_TAB_TITLE}    PHASE("complex.image")
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered_${key}.png
    PNG Images Should Be Different    initial_${key}.png    rerendered_${key}.png
    Remove Files    initial_${key}.png    rerendered_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA complex image as real
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    complex.image
    Wait Until Element Contains    ${FIRST_FILE_IN_THE_FILE_LIST}   complex.image
    Click Element    xpath://*[contains(text(), "complex.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Click Element    xpath://*[contains(text(), "Real")]
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Element Should Contain    ${VIEWER_TAB_TITLE}    REAL("complex.image")
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered_${key}.png
    PNG Images Should Be Different    initial_${key}.png    rerendered_${key}.png
    Remove Files    initial_${key}.png    rerendered_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA complex image as imaginary
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    complex.image
    Wait Until Element Contains    ${FIRST_FILE_IN_THE_FILE_LIST}   complex.image
    Click Element    xpath://*[contains(text(), "complex.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Click Element    xpath://*[contains(text(), "Imaginary")]
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Element Should Contain    ${VIEWER_TAB_TITLE}    IMAG("complex.image")
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered_${key}.png
    PNG Images Should Be Different    initial_${key}.png    rerendered_${key}.png
    Remove Files    initial_${key}.png    rerendered_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA integer image
    Pass Execution    Not yet supported...
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    integer.image
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered_${key}.png
    PNG Images Should Be Different    initial_${key}.png    rerendered_${key}.png
    Remove Files    initial_${key}.png    rerendered_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA componentlist image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    componentlist.image
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered_${key}.png
    PNG Images Should Be Different    initial_${key}.png    rerendered_${key}.png
    Remove Files    initial_${key}.png    rerendered_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA concatenated image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    concatenated.image
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    initial_${key}.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered_${key}.png
    PNG Images Should Be Different    initial_${key}.png    rerendered_${key}.png
    Remove Files    initial_${key}.png    rerendered_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Load Images As A Stokes Hypercube
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    IRCp10216
    Wait Until Element Contains    ${FIRST_FILE_IN_THE_FILE_LIST}   IRCp10216_sci.spw0.cube.I.manual.pbcor.fits
    Click Element    xpath://*[contains(text(), "IRCp10216_sci.spw0.cube.I.manual.pbcor.fits")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    ${platform}=    Evaluate    sys.platform    sys
    IF    '${platform}' == 'darwin'
    Click Element    xpath://*[contains(text(), "IRCp10216_sci.spw0.cube.Q.manual.pbcor.fits")]    modifier=COMMAND
    Click Element    xpath://*[contains(text(), "IRCp10216_sci.spw0.cube.U.manual.pbcor.fits")]    modifier=COMMAND
    Click Element    xpath://*[contains(text(), "IRCp10216_sci.spw0.cube.V.manual.pbcor.fits")]    modifier=COMMAND
    ELSE
    Click Element    xpath://*[contains(text(), "IRCp10216_sci.spw0.cube.Q.manual.pbcor.fits")]    modifier=CTRL
    Click Element    xpath://*[contains(text(), "IRCp10216_sci.spw0.cube.U.manual.pbcor.fits")]    modifier=CTRL
    Click Element    xpath://*[contains(text(), "IRCp10216_sci.spw0.cube.V.manual.pbcor.fits")]    modifier=CTRL
    END
    # click the "load as hypercube" button
    Click Element    //*[@id="root"]/div/div[7]/div[1]/div/div[2]/div/div[4]/div/div/span[2]/a
    # check the popup title 
    Wait Until Page Contains Element    //*[@id="root"]/div/div[${MAGIC_INDEX1}]/div[1]/div/div[2]/div/div[1]/h4
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX1}]/div[1]/div/div[2]/div/div[1]/h4    Merging polarization hypercube
    Set Selenium Speed    0.02
    # verify the context in the popup window
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX1}]/div[1]/div/div[2]/div/div[2]/div/div[1]/div[1]/div/div[2]/div/div/div/div/div[1]/div    IRCp10216_sci.spw0.cube.I.manual.pbcor.fits
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX1}]/div[1]/div/div[2]/div/div[2]/div/div[1]/div[1]/div/div[2]/div/div/div/div/div[2]/div/span/span/div/button/span[1]    Stokes I
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX1}]/div[1]/div/div[2]/div/div[2]/div/div[1]/div[1]/div/div[2]/div/div/div/div/div[3]/div    IRCp10216_sci.spw0.cube.Q.manual.pbcor.fits
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX1}]/div[1]/div/div[2]/div/div[2]/div/div[1]/div[1]/div/div[2]/div/div/div/div/div[4]/div/span/span/div/button/span[1]    Stokes Q
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX1}]/div[1]/div/div[2]/div/div[2]/div/div[1]/div[1]/div/div[2]/div/div/div/div/div[5]/div    IRCp10216_sci.spw0.cube.U.manual.pbcor.fits
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX1}]/div[1]/div/div[2]/div/div[2]/div/div[1]/div[1]/div/div[2]/div/div/div/div/div[6]/div/span/span/div/button/span[1]    Stokes U
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX1}]/div[1]/div/div[2]/div/div[2]/div/div[1]/div[1]/div/div[2]/div/div/div/div/div[7]/div    IRCp10216_sci.spw0.cube.V.manual.pbcor.fits
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX1}]/div[1]/div/div[2]/div/div[2]/div/div[1]/div[1]/div/div[2]/div/div/div/div/div[8]/div/span/span/div/button/span[1]    Stokes V
    Set Selenium Speed    ${DELAY}
    # click the load button
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX1}]/div/div[1]/div[2]/div/div[3]/div/a
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Element Should Contain    ${VIEWER_TAB_TITLE}    IRCp10216_sci.spw0.cube.hypercube_IQUV.manual.pbcor.fits
    Click Element    xpath://*[contains(text(), "Animator")]
    Set Selenium Speed    0.02
    # check the labels in the polarization slider to ensure native and computed polarization components are there
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div    Stokes I
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div    Stokes Q
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div    Stokes U
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div    Stokes V
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div    Ptotal
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div    Plinear
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div    PFtotal
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div    PFlinear
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div    Pangle
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
    Wait Until Element Contains    ${FIRST_FILE_IN_THE_FILE_LIST}   IRCp10216_sci.spw0.cube.I.manual.pbcor.fits
    Click Element    xpath://*[contains(text(), "IRCp10216_sci.spw0.cube.I.manual.pbcor.fits")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    ${platform}=    Evaluate    sys.platform    sys
    IF    '${platform}' == 'darwin'
    Click Element    xpath://*[contains(text(), "IRCp10216_sci.spw0.cube.Q.manual.pbcor.fits")]    modifier=COMMAND
    Click Element    xpath://*[contains(text(), "IRCp10216_sci.spw0.cube.U.manual.pbcor.fits")]    modifier=COMMAND
    Click Element    xpath://*[contains(text(), "IRCp10216_sci.spw0.cube.V.manual.pbcor.fits")]    modifier=COMMAND
    ELSE
    Click Element    xpath://*[contains(text(), "IRCp10216_sci.spw0.cube.Q.manual.pbcor.fits")]    modifier=CTRL
    Click Element    xpath://*[contains(text(), "IRCp10216_sci.spw0.cube.U.manual.pbcor.fits")]    modifier=CTRL
    Click Element    xpath://*[contains(text(), "IRCp10216_sci.spw0.cube.V.manual.pbcor.fits")]    modifier=CTRL
    END
    Click Element    //*[@id="root"]/div/div[7]/div[1]/div/div[2]/div/div[4]/div/div/span[1]/a
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
    Click Element    //*[@id="root"]/div/div[7]/div[1]/div/div[2]/div/div[3]/div[2]/span[1]/span/button
    Click Element    xpath://*[contains(text(), "Image arithmetic")]
    # fill in the LEL expression
    Input text    //*[@id="root"]/div/div[7]/div[1]/div/div[2]/div/div[3]/div[2]/input    "dice_one.fits"+"dice_four.fits"
    Click Element    xpath://*[contains(text(), "Load expression")]
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Element Should Contain    ${VIEWER_TAB_TITLE}    "dice_one.fits"+"dice_four.fits"
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    xpath://*[contains(text(), "tab10")]
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    380,217,274,110
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Load Axes-Swapped Cubes
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    gaussian_array_large_1032.image
    # enable gridline rendering
    Mouse Over    ${VIEWER_DIV}
    Click Element    //*[@id="image-panel-0-0"]/div[8]/span[11]/a
    # make grid line thicker
    Click Element    ${VIEWER_SETTINGS_DIALOG}
    Click Element    //*[@id="bp3-tab-title_imageViewSettingsTabs_Grids"]
    Repeat Keyword    3    Click Element    //*[@id="bp3-tab-panel_imageViewSettingsTabs_Grids"]/div/div[4]/div/div/div[2]/button[1]
    Click Element    ${VIEWER_SETTINGS_DIALOG_CLOSE_BUTTON}
    # check slider label in the animator
    Click Element    xpath://*[contains(text(), "Animator")]
    Element Text Should Be   //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[1]/label    Channel
    # switch to a different Stokes (Q)
    Click Element    ${ANIMATOR_POLARIZATION_RADIO_BUTTON}
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    # check the new clip min and max
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -0.02925218516611667
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    0.0030942637323668337
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_1032_${key}.png
    # check cursor info
    Mouse Over    ${VIEWER_DIV}
    Element Should Contain    ${VIEWER_CURSOR_INFO_BAR}    WCS: (9:44:48, 10:09:26); Image: (273, 252); Value: -2.84779e-4 Jy/pixel ; Frequency (LSRK): 1419.9000 MHz; Velocity: 106.7445 km/s; Polarization: Stokes Q
    Set Selenium Speed    0.02
    # check source locations
    PNG Two Pixels Should Have Matched RGBA    check_1032_${key}.png    498,370,570,355
    PNG Two Pixels Should Not Have Matched RGBA    check_1032_${key}.png    498,370,539,407
    Set Selenium Speed    ${DELAY}

    Load Image    gaussian_array_large_GALACTIC_0213.image
    # enable gridline rendering
    Mouse Over    ${VIEWER_DIV}
    Click Element    //*[@id="image-panel-0-0"]/div[8]/span[11]/a
    Element Text Should Be   //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[1]/label    Channel
    # switch to a different Stokes (Q)
    Click Element    ${ANIMATOR_POLARIZATION_RADIO_BUTTON}
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    # check the new clip min and max
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -0.029219418991124884
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    0.0022093053485489067
    Capture Element Screenshot    ${VIEWER_DIV}    check_g_0213_${key}.png
    # check cursor info
    Mouse Over    ${VIEWER_DIV}
    Element Should Contain    ${VIEWER_CURSOR_INFO_BAR}    WCS: (228.0, 43.2); Image: (370, 342); Value:  2.16926e-5 Jy/pixel ; Frequency (LSRK): 1419.9000 MHz; Velocity: 106.7445 km/s; Polarization: Stokes Q
    Set Selenium Speed    0.02
    # check source locations
    PNG Two Pixels Should Have Matched RGBA    check_g_0213_${key}.png        379,218,402,77
    Set Selenium Speed    ${DELAY}

    Load Image    gaussian_array_large_1230.image
    # enable gridline rendering
    Mouse Over    ${VIEWER_DIV}
    Click Element    //*[@id="image-panel-0-0"]/div[8]/span[11]/a
    Element Text Should Be   //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[1]/label    RA
    # switch to a different RA
    Click Element    ${ANIMATOR_SLIDER}
    # switch to a different Stokes (Q)
    Click Element    ${ANIMATOR_POLARIZATION_RADIO_BUTTON}
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    # check the new clip min and max
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -0.039907573853270185
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    0.0030997400288470325
    Capture Element Screenshot    ${VIEWER_DIV}    check_1230_${key}.png
    # check cursor info
    Mouse Over    ${VIEWER_DIV}
    Element Should Contain    ${VIEWER_CURSOR_INFO_BAR}    WCS: (9:49:38, 1.420309E+09); Image: (273, 4); Value: -3.61129e-2 Jy/pixel ; Frequency (LSRK): 1420.3000 MHz; Velocity: 22.3201 km/s; Polarization: Stokes Q
    Set Selenium Speed    0.02
    # check grid line locations
    PNG Two Pixels Should Have Matched RGBA    check_1230_${key}.png        83,69,676,407
    Set Selenium Speed    ${DELAY}

    Load Image    gaussian_array_large_3021.image
    # enable gridline rendering
    Mouse Over    ${VIEWER_DIV}
    Click Element    //*[@id="image-panel-0-0"]/div[8]/span[11]/a
    Element Text Should Be   //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[1]/label    DEC
    # switch to a different DEC
    Click Element    ${ANIMATOR_SLIDER}
    # switch to a different Stokes (Q)
    Click Element    ${ANIMATOR_POLARIZATION_RADIO_BUTTON}
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    # check the new clip min and max
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -0.04001756319485144
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    0.0031459159769216052
    Capture Element Screenshot    ${VIEWER_DIV}    check_3021_${key}.png
    # check cursor info
    Mouse Over    ${VIEWER_DIV}
    Element Should Contain    ${VIEWER_CURSOR_INFO_BAR}    WCS: (1.420348E+09, 10:09:26.5); Image: (4, 252); Value: -7.21823e-4 Jy/pixel ; Frequency (LSRK): 1420.3000 MHz; Velocity: 22.3201 km/s; Polarization: Stokes Q
    Set Selenium Speed    0.02
    # check grid line locations
    PNG Two Pixels Should Have Matched RGBA    check_3021_${key}.png        76,50,682,383
    Set Selenium Speed    ${DELAY}

    Load Image    gaussian_array_large_GALACTIC_2031.image
    # enable gridline rendering
    Mouse Over    ${VIEWER_DIV}
    Click Element    //*[@id="image-panel-0-0"]/div[8]/span[11]/a
    Element Text Should Be   //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[1]/label    GLAT
    # switch to a different GLAT
    Click Element    ${ANIMATOR_SLIDER}
    # switch to a different Stokes (Q)
    Click Element    ${ANIMATOR_POLARIZATION_RADIO_BUTTON}
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    # check the new clip min and max
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -0.03939278678037231
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    0.002182948510162576
    Capture Element Screenshot    ${VIEWER_DIV}    check_g_2031_${key}.png
    # check cursor info
    Mouse Over    ${VIEWER_DIV}
    Element Should Contain    ${VIEWER_CURSOR_INFO_BAR}    WCS: (15:11:25.0, 1.420309E+09); Image: (371, 4); Value: -3.54482e-2 Jy/pixel ; Frequency (LSRK): 1420.3000 MHz; Velocity: 22.3201 km/s; Polarization: Stokes Q
    Set Selenium Speed    0.02
    # check grid line locations
    PNG Two Pixels Should Have Matched RGBA    check_g_2031_${key}.png        102,69,589,407
    Set Selenium Speed    ${DELAY}

    Load Image    gaussian_array_large_GALACTIC_3102.image
    # enable gridline rendering
    Mouse Over    ${VIEWER_DIV}
    Click Element    //*[@id="image-panel-0-0"]/div[8]/span[11]/a
    Element Text Should Be   //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[1]/label    GLON
    # switch to a different GLON
    Click Element    ${ANIMATOR_SLIDER}
    # switch to a different Stokes (Q)
    Click Element    ${ANIMATOR_POLARIZATION_RADIO_BUTTON}
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    # check the new clip min and max
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -0.034293831676934936
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    0.0022011746039559063
    Capture Element Screenshot    ${VIEWER_DIV}    check_g_3102_${key}.png
    # check cursor info
    Mouse Over    ${VIEWER_DIV}
    Element Should Contain    ${VIEWER_CURSOR_INFO_BAR}    WCS: (1.420348E+09, 43.1527); Image: (4, 342); Value:  8.33026e-4 Jy/pixel ; Frequency (LSRK): 1420.3000 MHz; Velocity: 22.3201 km/s; Polarization: Stokes Q
    Set Selenium Speed    0.02
    # check grid line locations
    PNG Two Pixels Should Have Matched RGBA    check_g_3102_${key}.png        76,86,682,361
    Remove Files    check_1032_${key}.png    check_g_0213_${key}.png    check_1230_${key}.png    check_3021_${key}.png    check_g_2031_${key}.png    check_g_3102_${key}.png
    [Teardown]    Kill carta_backend And Close Browser
