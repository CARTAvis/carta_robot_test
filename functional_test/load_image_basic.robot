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


Load Axes-Swapped Cubes
    [Setup]    Setup carta_backend And Open Browser To CARTA    
    Load Initial Image    gaussian_array_large_1032.image
    # enable gridline rendering
    Mouse Over    ${VIEWER_DIV}
    Click Element    css:#image-panel-0-0 [data-testid="grid-button"]
    # make grid line thicker
    Click Element    ${VIEWER_SETTINGS_DIALOG}
    Click Element    data:testid:image-view-settings-grid-tab-title
    Repeat Keyword    3    Click Element    data:testid:image-view-settings-grid-width-input-increment-button
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
    Click Element    ${VIEWER_00_ZOOM_IN_BUTTON}
    Click Element    ${VIEWER_00_ZOOM_TO_FIT_BUTTON}
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
    Click Element    ${VIEWER_00_ZOOM_IN_BUTTON}
    Click Element    ${VIEWER_00_ZOOM_TO_FIT_BUTTON}
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
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -0.04319079584092838
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    0.0031714495620690647
    Capture Element Screenshot    ${VIEWER_DIV}    check_1230_${key}.png
    # check cursor info
    Mouse Over    ${VIEWER_DIV}
    Click Element    ${VIEWER_00_ZOOM_IN_BUTTON}
    Click Element    ${VIEWER_00_ZOOM_TO_FIT_BUTTON}
    Mouse Over    ${VIEWER_DIV}
    Element Should Contain    ${VIEWER_CURSOR_INFO_BAR}    WCS: (9:49:39, 1.420309); Image: (273, 4); Value: -3.69371e-2 Jy/pixel ; Frequency (LSRK): 1420.3000 MHz; Velocity: 22.3201 km/s; Polarization: Stokes Q
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
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -0.042869671873631936
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    0.003215339596626246
    Capture Element Screenshot    ${VIEWER_DIV}    check_3021_${key}.png
    # check cursor info
    Mouse Over    ${VIEWER_DIV}
    Click Element    ${VIEWER_00_ZOOM_IN_BUTTON}
    Click Element    ${VIEWER_00_ZOOM_TO_FIT_BUTTON}
    Mouse Over    ${VIEWER_DIV}
    Element Should Contain    ${VIEWER_CURSOR_INFO_BAR}    WCS: (1.420348, 10:09:26.7); Image: (4, 252); Value: 5.08979e-4 Jy/pixel ; Frequency (LSRK): 1420.3000 MHz; Velocity: 22.3201 km/s; Polarization: Stokes Q
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
    Capture Page Screenshot    test.png
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -0.04236642293471964
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    0.0023210009619462207
    Capture Element Screenshot    ${VIEWER_DIV}    check_g_2031_${key}.png
    # check cursor info
    Mouse Over    ${VIEWER_DIV}
    Click Element    ${VIEWER_00_ZOOM_IN_BUTTON}
    Click Element    ${VIEWER_00_ZOOM_TO_FIT_BUTTON}
    Mouse Over    ${VIEWER_DIV}
    Element Should Contain    ${VIEWER_CURSOR_INFO_BAR}    WCS: (15:11:25.2, 1.420309); Image: (371, 4); Value: -3.73602e-2 Jy/pixel ; Frequency (LSRK): 1420.3000 MHz; Velocity: 22.3201 km/s; Polarization: Stokes Q
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
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -0.039658265542471816
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    0.002447188806587064
    Capture Element Screenshot    ${VIEWER_DIV}    check_g_3102_${key}.png
    # check cursor info
    Mouse Over    ${VIEWER_DIV}
    Click Element    ${VIEWER_00_ZOOM_IN_BUTTON}
    Click Element    ${VIEWER_00_ZOOM_TO_FIT_BUTTON}
    Mouse Over    ${VIEWER_DIV}
    Element Should Contain    ${VIEWER_CURSOR_INFO_BAR}    WCS: (1.420348, 43.1531); Image: (4, 342); Value: 7.85461e-4 Jy/pixel ; Frequency (LSRK): 1420.3000 MHz; Velocity: 22.3201 km/s; Polarization: Stokes Q
    Set Selenium Speed    0.02
    # check grid line locations
    PNG Two Pixels Should Have Matched RGBA    check_g_3102_${key}.png        76,86,682,361
    Remove Files    check_1032_${key}.png    check_g_0213_${key}.png    check_1230_${key}.png    check_3021_${key}.png    check_g_2031_${key}.png    check_g_3102_${key}.png
    [Teardown]    Kill carta_backend And Close Browser





