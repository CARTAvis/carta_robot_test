*** Settings ***
Documentation     Generating moment images and using psrecord to 
...               monitor ram and cpu usages.
Resource          ../resource.robot

*** Test Cases ***
Generate single moment image FITS With Psrecord
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
    Click Element    xpath://*[@id="spectralProfilerButton"]
    Wait Until Element Does Not Contain    //*[@id="root"]/div/div[12]/div/div[1]/div[1]    complete    timeout=10
    # enable moment generator configration dialog
    Click Element    xpath://*[@id="root"]/div/div[12]/div/div[1]/div[2]/div/div[1]/div[1]/div[5]/span[2]/span/button
    # set up a proper channel range for moment calculations
    Click Element    xpath://*[contains(text(), "Frequency")]
    Click Element    xpath://*[contains(text(), "Channel")]
    Double Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[6]/div/div/div[1]/div/div/div/input
    Input Text    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[6]/div/div/div[1]/div/div/div/input    100    clear=False
    Double Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[6]/div/div/div[2]/div/div/div/input
    Input Text    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[6]/div/div/div[2]/div/div/div/input    300    clear=False
    Run psrecord    psrecord_moment_generator_fits_single.png
    Sleep    0.5
    Click Element    xpath://*[contains(text(), "Generate")]
    Wait Until Page Does Not Contain    Generating moments
    Sleep    0.5
    Terminate psrecord
    Sleep    1
    [Teardown]    Kill carta_backend And Close Browser


Generate multiple moment images FITS With Psrecord
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
    Click Element    xpath://*[@id="spectralProfilerButton"]
    Wait Until Element Does Not Contain    //*[@id="root"]/div/div[12]/div/div[1]/div[1]    complete    timeout=10
    # enable moment generator configration dialog
    Click Element    xpath://*[@id="root"]/div/div[12]/div/div[1]/div[2]/div/div[1]/div[1]/div[5]/span[2]/span/button
    # set up a proper channel range for moment calculations
    Click Element    xpath://*[contains(text(), "Frequency")]
    Click Element    xpath://*[contains(text(), "Channel")]
    Double Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[6]/div/div/div[1]/div/div/div/input
    Input Text    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[6]/div/div/div[1]/div/div/div/input    500    clear=False
    Double Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[6]/div/div/div[2]/div/div/div/input
    Input Text    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[6]/div/div/div[2]/div/div/div/input    700    clear=False
    # set up multiple moments for calculations
    Click Element    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[11]/div/div/div/div/div/div/input
    Click Element    xpath://*[contains(text(), "1: Intensity weighted coordinate")]
    Click Element    xpath://*[contains(text(), "2: Intensity weighted dispersion of the coordinate")]
    Run psrecord    psrecord_moment_generator_fits_multiple.png
    Sleep    0.5
    Click Element    xpath://*[contains(text(), "Generate")]
    Wait Until Page Does Not Contain    Generating moments
    Sleep    0.5
    Terminate psrecord
    Sleep    1
    [Teardown]    Kill carta_backend And Close Browser