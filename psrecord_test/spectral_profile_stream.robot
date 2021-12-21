*** Settings ***
Documentation     Requesting region spectral profile and using psrecord to 
...               monitor ram and cpu usages while streaming.
Resource          ../resource.robot

*** Test Cases ***
Stream FITS spectral profile With Psrecord
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Sleep     1
    Go To E2E QA Folder
    Wait Until Page Contains Element    ${FITS_S255_IR}    timeout=2
    Click Element    ${FITS_S255_IR}
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10
    # enter rectangle region creation mode
    Click Element    xpath://*[@id="root"]/div/div[1]/div[1]/span[2]/span/a
    # create a region at the image center
    Click Element    xpath://*[@id="root"]/div/div[11]/div[2]/div/div[1]/div[1]/div[2]/div/div/div/div[5]/div/div
    # enter region configuration dialog
    Double Click Element    xpath://*[@id="root"]/div/div[11]/div[2]/div/div[1]/div[1]/div[2]/div/div/div/div[5]/div/div
    # enlarge the size of the region
    Double Click Element    //*[@id="root"]/div/div[4]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[4]/td[3]/span/span/div/div/input
    Input Text    //*[@id="root"]/div/div[4]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[4]/td[3]/span/span/div/div/input    10.0    clear=False
    Click Element    xpath://*[contains(text(), "Close")]
    Run psrecord    psrecord_spectral_profile_stream_fits.png
    Sleep    0.5
    Click Element    xpath://*[@id="spectralProfilerButton"]
    Wait Until Element Contains    //*[@id="root"]/div/div[12]/div/div[1]/div[1]    complete
    Wait Until Element Does Not Contain    //*[@id="root"]/div/div[12]/div/div[1]/div[1]    complete    timeout=30
    Sleep    0.5
    Terminate psrecord
    Sleep    1
    [Teardown]    Kill carta_backend And Close Browser

