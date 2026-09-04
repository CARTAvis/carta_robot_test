*** Settings ***
Documentation     Check workspace features
Resource          ../resource.robot


*** Test Cases ***
Workspace Image Viewer - Save and Reload
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   spire500_ext.fits
    # create a region
    Click Element    data:testid:rectangle-region-shortcut-button
    Drag And Drop By Offset    ${VIEWER_DIV}    100    100
    # append the same image but with a different HDU
    Click Element    //*[normalize-space(text())='File']
    Click Element    //*[normalize-space(text())='Append Image']
    Click Element    ${FILE_BROWSER_FILTER_MODE_BUTTON}
    Click Element    //*[normalize-space(text())='Fuzzy search']
    Input Text    ${FILE_FILTER}    spire500_ext.fits
    Wait Until Element Contains    ${FILE_LIST}   spire500_ext.fits
    Sleep    0.2
    Click Element    //*[normalize-space(text())='spire500_ext.fits']
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    //*[normalize-space(text())='Append']    timeout=2
    # select HDU
    Click Element    //*[normalize-space(text())='7: coverage']
    # append the image with a custom HDU
    Click Element    //*[normalize-space(text())='Append']

    # match them
    Click Element    data:testid:image-list-0-matching-xy
    # generate contours
    Click Element    data:testid:contour-dialog-button
    Input Text    css:[data-testid="contour-config-level-input-form"] input    10
    Click Element    //*[contains(text(), "Styling")]
    Input Text    data:testid:contour-thickness-input    5
    Click Element    ${CONTOUR_CONFIG_DIALOG_APPLY_BUTTON}
    Click Element    ${CONTOUR_CONFIG_DIALOG_CLOSE_BUTTON}

    # generate vector overlay
    Click Element    data:testid:vector-dialog-button
    Click Element    ${VECTOR_FIELD_RENDERING_THRESHOLD_TOGGLE}
    Press Keys    ${VECTOR_FIELD_RENDERING_THRESHOLD_INPUT}    DELETE
    Input Text    ${VECTOR_FIELD_RENDERING_THRESHOLD_INPUT}    16.5
    Click Element    ${VECTOR_FIELD_RENDERING_APPLY_BUTTON}
    Click Element    ${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}

    # take a screenshot of the viewer
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    original_${key}.png

    # save as a workspace
    Click Element    //*[normalize-space(text())='File']
    Click Element    //*[normalize-space(text())='Save Workspace']
    Input Text    //input[@placeholder="Enter workspace name"]    tmp
    Click Element    //*[normalize-space(text())='Save']

    # load a new image
    Load Image    m51_151_MHz.fits

    # restore workspace
    Click Element    //*[normalize-space(text())='File']
    Click Element    //*[normalize-space(text())='Open Workspace']    
    Wait Until Element Contains    //*[@id="root"]/div/div[10]/div/div[1]/div[3]/div/div[2]/div[1]/div[1]/div/div[1]/div[5]/div/div[2]/div/div/div    tmp
    Click Element    //*[normalize-space(text())='tmp']
    Click Element    //*[normalize-space(text())='Open']
    Sleep    2
    # take a screenshot of the restored viewer
    Capture Element Screenshot    ${VIEWER_DIV}    restored_${key}.png

    # check screenshots
    PNG Images Should Be Identical    original_${key}.png    restored_${key}.png

    Remove Files    original_${key}.png    restored_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Workspace - Multicolor Blending
    [Setup]    Setup carta_backend And Open Browser To CARTA

    Input Text    ${FILE_FILTER}    disk
    Wait Until Element Contains    ${FILE_LIST}   disk_0.fits
    Click Element    //*[contains(text(), "disk_0.fits")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    ${platform}=    Evaluate    sys.platform    sys
    IF    '${platform}' == 'darwin'
    Click Element    //*[contains(text(), "disk_1.fits")]    modifier=COMMAND
    Click Element    //*[contains(text(), "disk_2.fits")]    modifier=COMMAND
    ELSE
    Click Element    //*[contains(text(), "disk_1.fits")]    modifier=CTRL
    Click Element    //*[contains(text(), "disk_2.fits")]    modifier=CTRL
    END
    # click the "Load with RGB blending" button
    Click Element    //a[contains(., "Load with RGB blending")]
    Sleep    2

    # change blue channel colormap
    Click Element    //*[@id="root"]/div/div[16]/div/div[6]/div/div/div/div[4]/div/span[2]/div/button
    Click Element    //*[normalize-space(text())='tab10']

    # change green channel opacity to 0.5
    Repeat Keyword    5    Click Element    //*[@id="root"]/div/div[16]/div/div[6]/div/div/div/div[3]/div/div/span[1]/div/div[2]/button[2]

    # take a screenshot of the viewer
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    original_${key}.png

    # save as a workspace
    Click Element    //*[normalize-space(text())='File']
    Click Element    //*[normalize-space(text())='Save Workspace']
    Input Text    //input[@placeholder="Enter workspace name"]    tmp
    Click Element    //*[normalize-space(text())='Save']

    # load a new image
    Load Image    m51_151_MHz.fits

    # restore workspace
    Click Element    //*[normalize-space(text())='File']
    Click Element    //*[normalize-space(text())='Open Workspace']    
    Wait Until Element Contains    //*[@id="root"]/div/div[10]/div/div[1]/div[3]/div/div[2]/div[1]/div[1]/div/div[1]/div[5]/div/div[2]/div/div/div    tmp
    Click Element    //*[normalize-space(text())='tmp']
    Click Element    //*[normalize-space(text())='Open']
    Sleep    2
    # take a screenshot of the restored viewer
    Capture Element Screenshot    ${VIEWER_DIV}    restored_${key}.png

    # check screenshots
    PNG Images Should Be Identical    original_${key}.png    restored_${key}.png

    #Remove Files    original_${key}.png    restored_${key}.png
    [Teardown]    Kill carta_backend And Close Browser

