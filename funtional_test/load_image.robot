*** Settings ***
Documentation     Load an image and check if the image is loaded properly
Resource          ../resource.robot

*** Test Cases ***
Load FITS image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Sleep     1
    Wait Until Page Contains Element    ${FITS_M17_SWex}    timeout=2
    Click Element    ${FITS_M17_SWex}
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Sleep    1
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    Sleep    1
    Compare Images To Be Different    initial.png    rerendered.png    0.0748111
    Sleep    1
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Sleep     1
    Wait Until Page Contains Element    ${CASA_M17_SWex}    timeout=2
    Click Element    ${CASA_M17_SWex}
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Sleep    1
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    Sleep    1
    Compare Images To Be Different    initial.png    rerendered.png    0.0748111
    Sleep    1
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load HDF5 image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Sleep     1
    Wait Until Page Contains Element    ${HDF5_M17_SWex}    timeout=2
    Click Element    ${HDF5_M17_SWex}
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Sleep    1
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    Sleep    1
    Compare Images To Be Different    initial.png    rerendered.png    0.0748111
    Sleep    1
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load MIRIAD image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Sleep     1
    Wait Until Page Contains Element    ${MIRIAD_M17_SWex}    timeout=2
    Click Element    ${MIRIAD_M17_SWex}
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    Sleep    1
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    Sleep    1
    Compare Images To Be Different    initial.png    rerendered.png    0.0748111
    Sleep    1
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser



# TODO: add tests for PV and UV images and other CASA varients