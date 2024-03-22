*** Settings ***
Documentation     Load an image and check if the image is loaded properly
Resource          ../resource.robot


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
    Wait Until Element Contains    ${FILE_LIST}   complex.image
    Click Element    //*[contains(text(), "complex.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Click Element    //*[contains(text(), "Amplitude")]
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
    Wait Until Element Contains    ${FILE_LIST}   complex.image
    Click Element    //*[contains(text(), "complex.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Click Element    //*[contains(text(), "Phase")]
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
    Wait Until Element Contains    ${FILE_LIST}   complex.image
    Click Element    //*[contains(text(), "complex.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Click Element    //*[contains(text(), "Real")]
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
    Wait Until Element Contains    ${FILE_LIST}   complex.image
    Click Element    //*[contains(text(), "complex.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Click Element    //*[contains(text(), "Imaginary")]
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
    Wait Until Page Contains Element    //h4[contains(text(), "Merging polarization hypercube")]
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
    Click Element    //*[contains(text(), "tab10")]
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
    Click Element    css:#image-panel-0-0 [data-testid="grid-button"]
    # make grid line thicker
    Click Element    ${VIEWER_SETTINGS_DIALOG}
    Click Element    data:testid:image-view-settings-grid-tab-title
    Repeat Keyword    3    Click Element    //input[@data-testid="image-view-settings-grid-width-input"]/parent::div/parent::div//button[.//span[@icon="chevron-up"]]
    Click Element    ${VIEWER_SETTINGS_DIALOG_CLOSE_BUTTON}
    # check slider label in the animator
    Click Element    //*[contains(text(), "Animator")]
    Element Text Should Be   css:[data-testid="animator-slider"] label    Channel
    # switch to a different Stokes (Q)
    Click Element    ${ANIMATOR_POLARIZATION_RADIO_BUTTON}
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Element Contains    ${VIEWER_CURSOR_INFO_BAR}    Stokes Q
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
    Click Element    css:#image-panel-0-0 [data-testid="grid-button"]
    Element Text Should Be   css:[data-testid="animator-slider"] label    Channel
    # switch to a different Stokes (Q)
    Click Element    ${ANIMATOR_POLARIZATION_RADIO_BUTTON}
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Element Contains    ${VIEWER_CURSOR_INFO_BAR}    Stokes Q
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
    Click Element    css:#image-panel-0-0 [data-testid="grid-button"]
    Element Text Should Be   css:[data-testid="animator-slider"] label    RA
    # switch to a different RA
    Click Element    ${ANIMATOR_SLIDER}
    # switch to a different Stokes (Q)
    Click Element    ${ANIMATOR_POLARIZATION_RADIO_BUTTON}
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Element Contains    ${VIEWER_CURSOR_INFO_BAR}    Stokes Q
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
    Click Element    css:#image-panel-0-0 [data-testid="grid-button"]
    Element Text Should Be   css:[data-testid="animator-slider"] label    DEC
    # switch to a different DEC
    Click Element    ${ANIMATOR_SLIDER}
    # switch to a different Stokes (Q)
    Click Element    ${ANIMATOR_POLARIZATION_RADIO_BUTTON}
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Element Contains    ${VIEWER_CURSOR_INFO_BAR}    Stokes Q
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
    Click Element    css:#image-panel-0-0 [data-testid="grid-button"]
    Element Text Should Be   css:[data-testid="animator-slider"] label    GLAT
    # switch to a different GLAT
    Click Element    ${ANIMATOR_SLIDER}
    # switch to a different Stokes (Q)
    Click Element    ${ANIMATOR_POLARIZATION_RADIO_BUTTON}
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Element Contains    ${VIEWER_CURSOR_INFO_BAR}    Stokes Q
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
    Click Element    css:#image-panel-0-0 [data-testid="grid-button"]
    Element Text Should Be   css:[data-testid="animator-slider"] label    GLON
    # switch to a different GLON
    Click Element    ${ANIMATOR_SLIDER}
    # switch to a different Stokes (Q)
    Click Element    ${ANIMATOR_POLARIZATION_RADIO_BUTTON}
    Click Element    ${ANIMATOR_NEXT_BUTTON}
    Wait Until Element Contains    ${VIEWER_CURSOR_INFO_BAR}    Stokes Q
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
