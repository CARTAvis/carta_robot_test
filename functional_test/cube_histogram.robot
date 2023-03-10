*** Settings ***
Documentation     Check cube histogram calculations
Resource          ../resource.robot

*** Test Cases ***
Request Cube Histogram
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    IRCp10216_sci.spw0.cube.IQUV.manual.pbcor.fits
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -0.0950858666347767
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    0.6745078593480897
    Click Element    ${RENDER_CONFIG_HISTOGRAM_MODE_DROPDOWN}
    Click Element    //*[contains(text(), "Per-cube")]
    Click Element    //*[contains(text(), "OK")]
    Wait Until Page Does Not Contain    Calculating cube histogram    timeout=10
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -2.521146852663114
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    6.420911069399297
    Capture Element Screenshot    ${VIEWER_DIV}    per-cube_histogram.png
    Click Element    ${RENDER_CONFIG_HISTOGRAM_MODE_DROPDOWN}
    Click Element    //*[contains(text(), "Per-channel")]
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -0.0950858666347767
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    0.6745078593480897
    Capture Element Screenshot    ${VIEWER_DIV}    per-channel_histogram.png
    PNG Images Should Be Different    per-cube_histogram.png    per-channel_histogram.png
    Click Element    ${RENDER_CONFIG_HISTOGRAM_MODE_DROPDOWN}
    Click Element    //*[contains(text(), "Per-cube")]
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -2.521146852663114
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    6.420911069399297            
    Remove Files    per-cube_histogram.png    per-channel_histogram.png
    [Teardown]    Kill carta_backend And Close Browser


Request Stokes Cube Histogram
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    IRCp10216_sci.spw0.cube.IQUV.manual.pbcor.fits
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -0.0950858666347767
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    0.6745078593480897
    Click Element    ${RENDER_CONFIG_HISTOGRAM_MODE_DROPDOWN}
    Click Element    //*[contains(text(), "Per-cube")]
    Click Element    //*[contains(text(), "OK")]
    Wait Until Page Does Not Contain    Calculating cube histogram    timeout=10
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -2.521146852663114
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    6.420911069399297
    Capture Element Screenshot    ${VIEWER_DIV}    per-cube_histogram.png
    Click Element    ${RENDER_CONFIG_HISTOGRAM_MODE_DROPDOWN}
    Click Element    //*[contains(text(), "Per-channel")]
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -0.0950858666347767
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    0.6745078593480897
    Capture Element Screenshot    ${VIEWER_DIV}    per-channel_histogram.png
    PNG Images Should Be Different    per-cube_histogram.png    per-channel_histogram.png
    Click Element    ${RENDER_CONFIG_HISTOGRAM_MODE_DROPDOWN}
    Click Element    //*[contains(text(), "Per-cube")]
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -2.521146852663114
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    6.420911069399297            
    Remove Files    per-cube_histogram.png    per-channel_histogram.png
    [Teardown]    Kill carta_backend And Close Browser


Request HDF5 Cube Histogram
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.hdf5
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -0.02200994330457944
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    0.021808325930004945
    Click Element    ${RENDER_CONFIG_HISTOGRAM_MODE_DROPDOWN}
    Click Element    //*[contains(text(), "Per-cube")]
    Wait Until Page Does Not Contain    Calculating cube histogram    timeout=1
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -0.055519239840650936
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    0.12933487483421768
    Capture Element Screenshot    ${VIEWER_DIV}    per-cube_histogram.png
    Click Element    ${RENDER_CONFIG_HISTOGRAM_MODE_DROPDOWN}
    Click Element    //*[contains(text(), "Per-channel")]
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -0.02200994330457944
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    0.021808325930004945
    PNG Images Should Be Different    per-cube_histogram.png    per-channel_histogram.png
    PNG Images Should Be Different    per-cube_histogram.png    per-channel_histogram.png
    Click Element    ${RENDER_CONFIG_HISTOGRAM_MODE_DROPDOWN}
    Click Element    //*[contains(text(), "Per-cube")]
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -0.055519239840650936
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    0.12933487483421768          
    Remove Files    per-cube_histogram.png    per-channel_histogram.png
    [Teardown]    Kill carta_backend And Close Browser


Cancel Cube Histogram Request And Rerequest
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    IRCp10216_sci.spw0.cube.IQUV.manual.pbcor.fits
    Click Element    ${RENDER_CONFIG_HISTOGRAM_MODE_DROPDOWN}
    Click Element    //*[contains(text(), "Per-cube")]
    Click Element    //*[contains(text(), "OK")]
    Wait Until Page Contains    Calculating cube histogram    timeout=5
    Sleep    1
    Click Element    //*[contains(text(), "Cancel")]
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -0.0950858666347767
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    0.6745078593480897
    Click Element    ${RENDER_CONFIG_HISTOGRAM_MODE_DROPDOWN}
    Click Element    //*[contains(text(), "Per-cube")]
    Click Element    //*[contains(text(), "OK")]
    Wait Until Page Does Not Contain    Calculating cube histogram    timeout=10
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MIN_CUBE}    value    -2.521146852663114
    Element Attribute Value Should Be    ${RENDER_CONFIG_CLIP_MAX_CUBE}    value    6.420911069399297            
    [Teardown]    Kill carta_backend And Close Browser


