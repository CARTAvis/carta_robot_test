*** Settings ***
Documentation     Animating a cube and using psrecord to 
...               monitor ram and cpu usages.
Resource          ../resource.robot

*** Test Cases ***
Animation Playback FITS With Psrecord
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Sleep     1
    Go To E2E QA Folder
    #Load Initial Image    ${FITS_supermosaic}
    Load Initial Image    ${FITS_HD163296_CO_2_1}
    Click Element    xpath://*[contains(text(), "Animator")]
    Input Text    xpath://*[@id="framerate-numeric"]    15
    Run psrecord    psrecord_animation_playback_fits.png
    Sleep    0.5
    Click Element    xpath://*[@id="root"]/div/div[11]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[1]/div[1]/button[3]
    Sleep    20
    Click Element    xpath://*[@id="root"]/div/div[11]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[1]/div[1]/button[3]
    Sleep    2
    Click Element    xpath://*[@id="root"]/div/div[11]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[1]/div[1]/button[3]
    Sleep    20
    Click Element    xpath://*[@id="root"]/div/div[11]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[1]/div[1]/button[3]
    Sleep    2
    Click Element    xpath://*[@id="root"]/div/div[11]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[1]/div[1]/button[3]
    Sleep    20
    Click Element    xpath://*[@id="root"]/div/div[11]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[1]/div[1]/button[3]       
    Sleep    0.5
    Terminate psrecord
    Sleep    1
    [Teardown]    Kill carta_backend And Close Browser
