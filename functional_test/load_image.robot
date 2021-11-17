*** Settings ***
Documentation     Load an image and check if the image is loaded properly
Resource          ../resource.robot

*** Test Cases ***
Load FITS image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Wait Until Page Contains Element    xpath://*[contains(text(), "M17_SWex.fits")]    timeout=2
    Click Element    xpath://*[contains(text(), "M17_SWex.fits")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=10
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Wait Until Page Contains Element    xpath://*[contains(text(), "M17_SWex.image")]    timeout=2
    Click Element    xpath://*[contains(text(), "M17_SWex.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=10
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load HDF5 image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Wait Until Page Contains Element    xpath://*[contains(text(), "M17_SWex.hdf5")]    timeout=2
    Click Element    xpath://*[contains(text(), "M17_SWex.hdf5")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=10
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load MIRIAD image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Wait Until Page Contains Element    xpath://*[contains(text(), "M17_SWex.miriad")]    timeout=2
    Click Element    xpath://*[contains(text(), "M17_SWex.miriad")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=10
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load FITS gz image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Wait Until Page Contains Element    xpath://*[contains(text(), "tu2310418.fits.gz")]    timeout=2
    Click Element    xpath://*[contains(text(), "tu2310418.fits.gz")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=10
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load FITS fz image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Wait Until Page Contains Element    xpath://*[contains(text(), "tu2310418.fits.fz")]    timeout=2
    Click Element    xpath://*[contains(text(), "tu2310418.fits.fz")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=10
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load FITS pv image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Wait Until Page Contains Element    xpath://*[contains(text(), "carta_pv.fits")]    timeout=2
    Click Element    xpath://*[contains(text(), "carta_pv.fits")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=10
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA pv image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Wait Until Page Contains Element    xpath://*[contains(text(), "casa_pv.image")]    timeout=2
    Click Element    xpath://*[contains(text(), "casa_pv.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=10
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA uv image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Wait Until Page Contains Element    xpath://*[contains(text(), "UVamp.image")]    timeout=2
    Click Element    xpath://*[contains(text(), "UVamp.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=10
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser



Load CASA boolean image
    Pass Execution    Not yet supported...
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Wait Until Page Contains Element    xpath://*[contains(text(), "boolean.image")]    timeout=2
    Click Element    xpath://*[contains(text(), "boolean.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=10
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA complex image
    Pass Execution    Not yet supported...
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Wait Until Page Contains Element    xpath://*[contains(text(), "complex.image")]    timeout=2
    Click Element    xpath://*[contains(text(), "complex.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=10
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA integer image
    Pass Execution    Not yet supported...
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Wait Until Page Contains Element    xpath://*[contains(text(), "integer.image")]    timeout=2
    Click Element    xpath://*[contains(text(), "integer.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=10
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA componentlist image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Wait Until Page Contains Element    xpath://*[contains(text(), "componentlist.image")]    timeout=2
    Click Element    xpath://*[contains(text(), "componentlist.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=10
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA concatenated image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Wait Until Page Contains Element    xpath://*[contains(text(), "concatenated.image")]    timeout=2
    Click Element    xpath://*[contains(text(), "concatenated.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=10
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    PNG Images Should Be Different    initial.png    rerendered.png
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser