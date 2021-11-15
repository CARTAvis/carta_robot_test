*** Settings ***
Documentation     Load an image and check if the image is loaded properly
Resource          ../resource.robot

*** Test Cases ***
Load FITS image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    #Sleep     1
    Wait Until Page Contains Element    xpath://*[contains(text(), "M17_SWex.fits")]    timeout=2
    Click Element    xpath://*[contains(text(), "M17_SWex.fits")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=10
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    #Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    #Sleep    1
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    #Sleep    1
    PNG Images Should Be Different    initial.png    rerendered.png
    #Sleep    1
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load CASA image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    #Sleep     1
    Wait Until Page Contains Element    xpath://*[contains(text(), "M17_SWex.image")]    timeout=2
    Click Element    xpath://*[contains(text(), "M17_SWex.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=10
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    #Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    #Sleep    1
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    #Sleep    1
    PNG Images Should Be Different    initial.png    rerendered.png
    #Sleep    1
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load HDF5 image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    #Sleep     1
    Wait Until Page Contains Element    xpath://*[contains(text(), "M17_SWex.hdf5")]    timeout=2
    Click Element    xpath://*[contains(text(), "M17_SWex.hdf5")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=10
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    #Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    #Sleep    1
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    #Sleep    1
    PNG Images Should Be Different    initial.png    rerendered.png
    #Sleep    1
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser


Load MIRIAD image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    #Sleep     1
    Wait Until Page Contains Element    xpath://*[contains(text(), "M17_SWex.miriad")]    timeout=2
    Click Element    xpath://*[contains(text(), "M17_SWex.miriad")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=10
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    #Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    initial.png
    #Sleep    1
    Click Element    ${CLIP_BUTTON_90}
    Capture Element Screenshot    ${VIEWER_DIV}    rerendered.png
    #Sleep    1
    PNG Images Should Be Different    initial.png    rerendered.png
    #Sleep    1
    Remove Files    initial.png    rerendered.png
    [Teardown]    Kill carta_backend And Close Browser



# TODO: add tests for PV and UV images and other CASA varients