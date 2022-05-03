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


Load CASA complex image
    Pass Execution    Not yet supported...
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    complex.image
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