*** Settings ***
Documentation     Load an image and check if the image is loaded properly
Resource          ../resource.robot

*** Test Cases ***
Load FITS image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.image
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load HDF5 image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.hdf5
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load MIRIAD image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.miriad
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load FITS gz image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    tu2310418.fits.gz
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load FITS fz image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    tu2310418.fits.fz
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load FITS pv image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    carta_pv.fits
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA pv image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    casa_pv.image
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA uv image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    UVamp.image
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA boolean image
    Pass Execution    Not yet supported...
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    boolean.image
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA complex image as amplitude
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    complex.image
    Sleep    0.2
    Wait Until Page Contains Element    xpath://*[contains(text(), "complex.image")]
    Click Element    xpath://*[contains(text(), "complex.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Click Element    xpath://*[contains(text(), "Amplitude")]
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    AMPLITUDE("complex.image")
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA complex image as phase
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    complex.image
    Sleep    0.2
    Wait Until Page Contains Element    xpath://*[contains(text(), "complex.image")]
    Click Element    xpath://*[contains(text(), "complex.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Click Element    xpath://*[contains(text(), "Phase")]
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    PHASE("complex.image")
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA complex image as real
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    complex.image
    Sleep    0.2
    Wait Until Page Contains Element    xpath://*[contains(text(), "complex.image")]
    Click Element    xpath://*[contains(text(), "complex.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Click Element    xpath://*[contains(text(), "Real")]
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    REAL("complex.image")
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA complex image as imaginary
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    complex.image
    Sleep    0.2
    Wait Until Page Contains Element    xpath://*[contains(text(), "complex.image")]
    Click Element    xpath://*[contains(text(), "complex.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Click Element    xpath://*[contains(text(), "Imaginary")]
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    IMAG("complex.image")
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA integer image
    Pass Execution    Not yet supported...
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    integer.image
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA componentlist image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    componentlist.image
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA concatenated image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    concatenated.image
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load Images As A Stokes Hypercube
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    IRCp10216
    Sleep    0.2
    Wait Until Page Contains Element    xpath://*[contains(text(), "IRCp10216_sci.spw0.cube.I.manual.pbcor.fits")]
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
    Click Element    //*[@id="root"]/div/div[7]/div[1]/div/div[2]/div/div[4]/div/div/span[2]/a
    Wait Until Page Contains Element    //*[@id="root"]/div/div[13]/div[1]/div/div[2]/div/div[1]/h4
    Element Should Contain    //*[@id="root"]/div/div[13]/div[1]/div/div[2]/div/div[1]/h4    Merging polarization hypercube
    Set Selenium Speed    0.02
    Element Should Contain    //*[@id="root"]/div/div[13]/div[1]/div/div[2]/div/div[2]/div/div[1]/div[1]/div/div[2]/div/div/div/div/div[1]/div    IRCp10216_sci.spw0.cube.I.manual.pbcor.fits
    Element Should Contain    //*[@id="root"]/div/div[13]/div[1]/div/div[2]/div/div[2]/div/div[1]/div[1]/div/div[2]/div/div/div/div/div[2]/div/span/span/div/button/span[1]    Stokes I
    Element Should Contain    //*[@id="root"]/div/div[13]/div[1]/div/div[2]/div/div[2]/div/div[1]/div[1]/div/div[2]/div/div/div/div/div[3]/div    IRCp10216_sci.spw0.cube.Q.manual.pbcor.fits
    Element Should Contain    //*[@id="root"]/div/div[13]/div[1]/div/div[2]/div/div[2]/div/div[1]/div[1]/div/div[2]/div/div/div/div/div[4]/div/span/span/div/button/span[1]    Stokes Q
    Element Should Contain    //*[@id="root"]/div/div[13]/div[1]/div/div[2]/div/div[2]/div/div[1]/div[1]/div/div[2]/div/div/div/div/div[5]/div    IRCp10216_sci.spw0.cube.U.manual.pbcor.fits
    Element Should Contain    //*[@id="root"]/div/div[13]/div[1]/div/div[2]/div/div[2]/div/div[1]/div[1]/div/div[2]/div/div/div/div/div[6]/div/span/span/div/button/span[1]    Stokes U
    Element Should Contain    //*[@id="root"]/div/div[13]/div[1]/div/div[2]/div/div[2]/div/div[1]/div[1]/div/div[2]/div/div/div/div/div[7]/div    IRCp10216_sci.spw0.cube.V.manual.pbcor.fits
    Element Should Contain    //*[@id="root"]/div/div[13]/div[1]/div/div[2]/div/div[2]/div/div[1]/div[1]/div/div[2]/div/div/div/div/div[8]/div/span/span/div/button/span[1]    Stokes V
    Set Selenium Speed    0.2
    Click Element    //*[@id="root"]/div/div[13]/div[1]/div/div[2]/div/div[3]/div/a[2]
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    IRCp10216_sci.spw0.cube.hypercube_IQUV.manual.pbcor.fits
    Click Element    xpath://*[contains(text(), "Animator")]
    Set Selenium Speed    0.02
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div    Stokes I
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div    Stokes Q
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div    Stokes U
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div    Stokes V
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div    Ptotal
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div    Plinear
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div    PFtotal
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div    PFlinear
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div    Pangle
    Set Selenium Speed    0.2
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png  
    [Teardown]    Kill carta_backend And Close Browser


Load Multiple Images In One Shot
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    IRCp10216
    Sleep    0.2
    Wait Until Page Contains Element    xpath://*[contains(text(), "IRCp10216_sci.spw0.cube.I.manual.pbcor.fits")]
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
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    IRCp10216_sci.spw0.cube.V.manual.pbcor.fits
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png  
    [Teardown]    Kill carta_backend And Close Browser
