*** Settings ***
Documentation     Computing cube histogram and using psrecord to 
...               monitor ram and cpu usages.
Resource          ../resource.robot

*** Test Cases ***
Get Cube Histogram FITS With Psrecord
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Sleep     1
    Go To E2E QA Folder
    Load Initial Image    ${FITS_supermosaic}
    Click Element    xpath://*[contains(text(), "Per-Channel")]
    Click Element    xpath://*[contains(text(), "Per-Cube")]
    Run psrecord    psrecord_cube_histogram_fits.png
    Sleep    0.5
    Click Element    xpath://*[contains(text(), "OK")]
    Wait Until Page Contains Element    xpath://*[contains(text(), "Cancel")]
    Wait Until Page Does Not Contain    Calculating cube histogram    timeout=120
    Sleep    0.5
    Terminate psrecord
    Sleep    1
    [Teardown]    Kill carta_backend And Close Browser
