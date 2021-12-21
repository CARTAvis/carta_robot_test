*** Settings ***
Documentation     Loading images and using psrecord to 
...               monitor ram and cpu usages.
Resource          ../resource.robot

*** Test Cases ***
Load FITS Image With Psrecord
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Sleep     1
    Go To E2E QA Folder
    Wait Until Page Contains Element    ${FITS_hugeGaussian20k}    timeout=2
    Click Element    ${FITS_hugeGaussian20k}
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Run psrecord    psrecord_load_fits_image.png
    Sleep    0.5
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Sleep    0.5
    Terminate psrecord
    Sleep    1
    [Teardown]    Kill carta_backend And Close Browser
