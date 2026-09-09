*** Settings ***
Documentation     Check features in the file browser dialog
Resource          ../resource.robot


*** Test Cases ***
File Path Display and Edit Test
    [Setup]    Setup carta_backend And Open Browser To CARTA
    # check current file path display
    Click Element    ${FILE_BROWSER_EDIT_PATH_BUTTON}
    ${file_path}    Get Element Attribute    ${FILE_BROWSER_EDIT_PATH_INPUT}    value
    Should End With    ${file_path}    set_QA_e2e_v2
    # edit file path to subfolder
    Click Element    ${FILE_BROWSER_EDIT_PATH_INPUT}
    Input Text    ${FILE_BROWSER_EDIT_PATH_INPUT}    /subfolder    clear=False
    Press Keys    ${FILE_BROWSER_EDIT_PATH_INPUT}    RETURN
    # verify we are in subfolder
    Element Should Contain    ${FILE_LIST}    subsubfolder
    Element Should Contain    ${FILE_LIST}    HD163296_CO_2_1.fits
    # check current file path display
    Click Element    ${FILE_BROWSER_EDIT_PATH_BUTTON}
    ${file_path}    Get Element Attribute    ${FILE_BROWSER_EDIT_PATH_INPUT}    value
    Should End With    ${file_path}    /subfolder
    # invalid path
    Input Text    ${FILE_BROWSER_EDIT_PATH_INPUT}    /subfolder    clear=False
    Press Keys    ${FILE_BROWSER_EDIT_PATH_INPUT}    RETURN        
    # error toast display for invalid path
    Page Should Contain    Error loading file list for directory
    # go to root directory
    Click Element    ${FILE_BROWSER_GO_TO_ROOT_BUTTON}
    # verify we are at root
    Click Element    ${FILE_BROWSER_EDIT_PATH_BUTTON}
    ${file_path}    Get Element Attribute    ${FILE_BROWSER_EDIT_PATH_INPUT}    value
    Should Be Equal    ${file_path}    /

    # missing test for the refresh button
    [Teardown]    Kill carta_backend And Close Browser


Filter Mode Test
    [Setup]    Setup carta_backend And Open Browser To CARTA
    # fuzzy search test
    Click Element    ${FILE_BROWSER_FILTER_MODE_BUTTON}
    Click Element    //*[normalize-space(text())='Fuzzy search']
    Input Text    ${FILE_FILTER}    m16
    Wait Until Element Contains    ${FILE_LIST}    m16_f0200w.fits    timeout=5s
    Element Should Contain    ${FILE_LIST}    m16_f0770w.fits
    Element Should Contain    ${FILE_LIST}    m16_f1500w.fits
    Element Should Contain    ${FILE_LIST}    m16_f1130w.fits
    Element Should Contain    ${FILE_LIST}    m16_f0444w-f0470n.fits
    Element Should Contain    ${FILE_LIST}    m16_f0444w.fits
    Element Should Contain    ${FILE_LIST}    m16_f0335m.fits
    Element Should Contain    ${FILE_LIST}    m16_f0187n.fits
    Element Should Contain    ${FILE_LIST}    m16_f0090w.fits   
    Element Should Not Contain    ${FILE_LIST}    m16_f2000w.fits 
    # unix pattern test
    Click Element    ${FILE_BROWSER_FILTER_MODE_BUTTON}
    Click Element    //*[normalize-space(text())='Unix pattern']
    Input Text    ${FILE_FILTER_UNIX_PATTERN}     m16_f1*.fits
    Wait Until Element Contains    ${FILE_LIST}    m16_f1500w.fits    timeout=5s
    Element Should Contain    ${FILE_LIST}    m16_f1130w.fits
    Element Should Not Contain    ${FILE_LIST}    m16_f0200w.fits
    # regex test
    Click Element    ${FILE_BROWSER_FILTER_MODE_BUTTON}
    Click Element    //*[normalize-space(text())='Regular expression']
    Input Text    ${FILE_FILTER_REGEX}    m16_f0[0-4][0-9][0-9]w\.fits
    Wait Until Element Contains    ${FILE_LIST}    m16_f0200w.fits    timeout=5s
    Element Should Contain    ${FILE_LIST}    m16_f0444w.fits
    Element Should Contain    ${FILE_LIST}    m16_f0090w.fits 
    Element Should Not Contain    ${FILE_LIST}    m16_f0335m.fits
    # reset filter
    Click Element    ${FILE_BROWSER_FILTER_MODE_BUTTON}
    Click Element    //*[normalize-space(text())='Fuzzy search']
    [Teardown]    Kill carta_backend And Close Browser


Dynamic Loading Button Rendering
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Click Element    ${FILE_BROWSER_FILTER_MODE_BUTTON}
    Click Element    //*[normalize-space(text())='Fuzzy search']
    Input Text    ${FILE_FILTER}    m16
    Wait Until Element Contains    ${FILE_LIST}    m16_f0200w.fits    timeout=5s

    ${platform}=    Evaluate    sys.platform    sys
    IF    '${platform}' == 'darwin'
    Click Element    //*[normalize-space(text())='m16_f1500w.fits']
    Page Should Contain Element    //*[normalize-space(text())='Load']
    Click Element    //*[normalize-space(text())='m16_f1130w.fits']    modifier=COMMAND
    Page Should Contain Element    //*[normalize-space(text())='Load selected']
    Page Should Contain Element    //*[normalize-space(text())='Load as hypercube']
    Page Should Contain Element    //*[normalize-space(text())='Load as time series']
    Page Should Contain Element    //*[normalize-space(text())='Load with RGB blending']
    Click Element    //*[normalize-space(text())='m16_f0770w.fits']    modifier=COMMAND
    Page Should Contain Element    //*[normalize-space(text())='Load selected']
    Page Should Contain Element    //*[normalize-space(text())='Load as hypercube']
    Page Should Contain Element    //*[normalize-space(text())='Load as time series']
    Page Should Contain Element    //*[normalize-space(text())='Load with RGB blending']    
    Click Element    //*[normalize-space(text())='m16_f0444w.fits']    modifier=COMMAND
    Page Should Contain Element    //*[normalize-space(text())='Load selected']
    Page Should Contain Element    //*[normalize-space(text())='Load as hypercube']
    Page Should Contain Element    //*[normalize-space(text())='Load as time series']
    Page Should Contain Element    //*[normalize-space(text())='Load with multi-color blending']
    Click Element    //*[normalize-space(text())='m16_f0335m.fits']    modifier=COMMAND
    Page Should Not Contain Element    //*[normalize-space(text())='Load as hypercube']
    ELSE
    Click Element    //*[normalize-space(text())='m16_f1500w.fits']
    Page Should Contain Element    //*[normalize-space(text())='Load']
    Click Element    //*[normalize-space(text())='m16_f1130w.fits']    modifier=CTRL
    Page Should Contain Element    //*[normalize-space(text())='Load selected']
    Page Should Contain Element    //*[normalize-space(text())='Load as hypercube']
    Page Should Contain Element    //*[normalize-space(text())='Load as time series']
    Page Should Contain Element    //*[normalize-space(text())='Load with RGB blending']
    Click Element    //*[normalize-space(text())='m16_f0770w.fits']    modifier=CTRL
    Page Should Contain Element    //*[normalize-space(text())='Load selected']
    Page Should Contain Element    //*[normalize-space(text())='Load as hypercube']
    Page Should Contain Element    //*[normalize-space(text())='Load as time series']
    Page Should Contain Element    //*[normalize-space(text())='Load with RGB blending']
    Click Element    //*[normalize-space(text())='m16_f0444w.fits']    modifier=CTRL
    Page Should Contain Element    //*[normalize-space(text())='Load selected']
    Page Should Contain Element    //*[normalize-space(text())='Load as hypercube']
    Page Should Contain Element    //*[normalize-space(text())='Load as time series']
    Page Should Contain Element    //*[normalize-space(text())='Load with multi-color blending']
    Click Element    //*[normalize-space(text())='m16_f0335m.fits']    modifier=CTRL
    Page Should Not Contain Element    //*[normalize-space(text())='Load as hypercube']
    END
    [Teardown]    Kill carta_backend And Close Browser


File List Generation Mode Test
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Pass Execution    To be implemented...
    [Teardown]    Kill carta_backend And Close Browser


File Header Search Test
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Click Element    ${FILE_BROWSER_FILTER_MODE_BUTTON}
    Click Element    //*[normalize-space(text())='Fuzzy search']
    Input Text    ${FILE_FILTER}    S255
    Wait Until Element Contains    ${FILE_LIST}    S255_CH3CN_subcube.fits    timeout=5s

    Click Element    //*[normalize-space(text())='S255_CH3CN_subcube.fits']
    Wait Until Element Contains    data:testid:header-entry-0    Name
    Click Element    id:bp6-tab-title_file-info-tabs_image-header
    Mouse Over    //*[@id="root"]/div/div[7]/div/div[1]/div[3]/div/div[3]/div[1]/div[2]/div/div[2]
    Click Element    //*[@id="root"]/div/div[7]/div/div[1]/div[3]/div/div[3]/div[1]/div[2]/div/div[3]/span/button
    Input Text    //*[@id="root"]/div/div[7]/div/div[1]/div[3]/div/div[3]/div[1]/div[2]/div/div[3]/div/div[2]/div/div/div/input    CTYPE

    Element Should Contain    //*[@id="root"]/div/div[7]/div/div[1]/div[3]/div/div[3]/div[1]/div[2]/div/div[3]/div/div[2]/div/div/div/span[2]/div/span    1 of 4
    [Teardown]    Kill carta_backend And Close Browser

Compose LEL With Keyboard and Mouse Test
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Click Element    //*[normalize-space(text())='subfolder']
    # switch to the image arithmetic mode from the default file filtering mode
    Click Element    //button[contains(., "Filter")]
    Click Element    //*[contains(text(), "Image arithmetic")]
    # compose LEL with mouse click
    Click Element    //*[normalize-space(text())='dice_one.fits']
    ${LEL}    Get Element Attribute    //input[@placeholder="Enter an image arithmetic expression"]     value
    Should Be Equal    ${LEL}    "dice_one.fits"
    Input Text    //input[@placeholder="Enter an image arithmetic expression"]     +     clear=False
    Click Element    //*[normalize-space(text())='dice_four.fits']
    ${LEL}    Get Element Attribute    //input[@placeholder="Enter an image arithmetic expression"]     value
    Should Be Equal    ${LEL}    "dice_one.fits"+"dice_four.fits"
    [Teardown]    Kill carta_backend And Close Browser