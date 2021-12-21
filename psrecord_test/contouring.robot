*** Settings ***
Documentation     Generating contours and using psrecord to 
...               monitor ram and cpu usages.
Resource          ../resource.robot

*** Test Cases ***
Contouring With Gaussian Smooth FITS With Psrecord
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Sleep     1
    Go To E2E QA Folder
    Load Initial Image    ${FITS_h_m51_b}
    Click Element    xpath://*[@id="root"]/div/div[1]/div[3]/span[3]/span/button
    Click Element    xpath://*[contains(text(), "start-step-multiplier")]
    Click Element    xpath://*[contains(text(), "min-max-scaling")]
    Input Text    //*[@id="bp3-tab-panel_undefined_0"]/div/div[2]/div[2]/div/div/div/div[2]/div[1]/div/div/div[1]/input    20
    Click Element    xpath://*[contains(text(), "Generate")]
    Run psrecord    psrecord_contouring_with_gaussian_smooth_FITS.png
    Sleep    0.5
    Click Element    xpath://*[contains(text(), "Apply")]
    Click Element    xpath://*[@id="root"]/div/div[7]/div[1]/div/div[2]/div/div[1]/button
    Mouse Over    ${PROGRESS_CLOUD}
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Sleep    0.5
    Terminate psrecord
    Sleep    1
    [Teardown]    Kill carta_backend And Close Browser

Contouring With Block Smooth FITS With Psrecord
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Sleep     1
    Go To E2E QA Folder
    Load Initial Image    ${FITS_h_m51_b}
    Click Element    xpath://*[@id="root"]/div/div[1]/div[3]/span[3]/span/button
    Click Element    xpath://*[contains(text(), "start-step-multiplier")]
    Click Element    xpath://*[contains(text(), "min-max-scaling")]
    Input Text    xpath://*[@id="bp3-tab-panel_undefined_0"]/div/div[2]/div[2]/div/div/div/div[2]/div[1]/div/div/div[1]/input    20
    Click Element    xpath://*[contains(text(), "Generate")]
    Click Element    xpath://*[@id="bp3-tab-title_undefined_1"]
    Wait until Page Contains    Gaussian
    Click Element    xpath://*[contains(text(), "Gaussian")]
    Click Element    xpath://*[contains(text(), "Block")]
    Run psrecord    psrecord_contouring_with_block_smooth_FITS.png
    Sleep    0.5
    Click Element    xpath://*[contains(text(), "Apply")]
    Click Element    xpath://*[@id="root"]/div/div[7]/div[1]/div/div[2]/div/div[1]/button
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    Sleep    0.5
    Terminate psrecord
    Sleep    1
    [Teardown]    Kill carta_backend And Close Browser


Contouring With No Smooth FITS With Psrecord
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Sleep     1
    Go To E2E QA Folder
    Load Initial Image    ${FITS_h_m51_b}
    Click Element    xpath://*[@id="root"]/div/div[1]/div[3]/span[3]/span/button
    Click Element    xpath://*[contains(text(), "start-step-multiplier")]
    Click Element    xpath://*[contains(text(), "min-max-scaling")]
    Input Text    xpath://*[@id="bp3-tab-panel_undefined_0"]/div/div[2]/div[2]/div/div/div/div[2]/div[1]/div/div/div[1]/input    20
    Click Element    xpath://*[contains(text(), "Generate")]
    Click Element    xpath://*[@id="bp3-tab-title_undefined_1"]
    Wait until Page Contains    Gaussian
    Click Element    xpath://*[contains(text(), "Gaussian")]
    Click Element    xpath://*[contains(text(), "No Smoothing")]
    Run psrecord    psrecord_contouring_with_no_smooth_FITS.png
    Sleep    0.5
    Click Element    xpath://*[contains(text(), "Apply")]
    Click Element    xpath://*[@id="root"]/div/div[7]/div[1]/div/div[2]/div/div[1]/button
    Mouse Over    ${PROGRESS_CLOUD}
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=60
    Sleep    0.5
    Terminate psrecord
    Sleep    1
    [Teardown]    Kill carta_backend And Close Browser