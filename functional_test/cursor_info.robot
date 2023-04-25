*** Settings ***
Documentation     Check the features in the cursor info widget
Resource          ../resource.robot

*** Variables ***
${MAGIC_INDEX}    16


*** Test Cases ***
Cursor Info For Matched And Unmatched Images
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   HD163296_13CO_2-1_subimage.fits
    Append Image    HD163296_C18O_2-1_subimage.fits
    Append Image    HD163296_CO_2_1_subimage.fits
    # enable the cursor info widget and dock to the panel with render config widget
    Drag And Drop    //*[@id="CursorInfoWidgetButton"]    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[1]
    # click the bottom-left panel with an offset to make HD163296_CO_2_1_subimage.fits active
    Click Element At Coordinates    //*[@id="image-panel-0-1"]/div[8]/div/div/canvas    0    10
    Set Selenium Speed    0.02
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div    HD163296_13CO_2-1_subimage.fits
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    -
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    -
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    -
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[5]/div    -
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[6]/div    LSRK 220.4009 GHz\n-2.9720 km/s
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[7]/div    0
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div    Stokes I
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[9]/div    HD163296_C18O_2-1_subimage.fits
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[10]/div    -
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[11]/div    -
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[12]/div    -
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[13]/div    -
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[14]/div    LSRK 219.5708 GHz\n-14.3044 km/s
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[15]/div    0
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[16]/div    Stokes I
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[17]/div    HD163296_CO_2_1_subimage.fits
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[18]/div    -4.95158e-3\nJy/beam
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[19]/div    FK5
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[20]/div    17:56:21.218\n-21:57:22.06
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[21]/div    161.500\n124.980
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[22]/div    LSRK 230.5121 GHz\n33.7063 km/s
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[23]/div    0
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[24]/div    Stokes I
    Set Selenium Speed    0.2
    # click the top-right panel to make HD163296_C18O_2-1_subimage.fits
    Click Element    //*[@id="image-panel-1-0"]
    # click the matching button and trigger spatial+spectral matching
    Click Element    //*[@id="image-panel-1-0"]/div[9]/span[9]/span/a
    Click Element    xpath://*[contains(text(), "Spectral (VRAD) and spatial")]
    # mouse over the top-left panel, ie HD163296_13CO_2-1_subimage.fits
    Mouse Over    //*[@id="image-panel-0-0"]
    Set Selenium Speed    0.02
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div    HD163296_13CO_2-1_subimage.fits
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    -5.81883e-3\nJy/beam
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    FK5
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    17:56:21.385\n-21:57:23.05
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[5]/div    114.044\n88.243
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[6]/div    LSRK 220.4009 GHz\n-2.9720 km/s
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[7]/div    0
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div    Stokes I
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[9]/div    HD163296_C18O_2-1_subimage.fits
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[10]/div    -2.48593e-3\nJy/beam
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[11]/div    FK5
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[12]/div    17:56:21.385\n-21:57:23.05
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[13]/div    71.044\n86.243
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[14]/div    LSRK 219.5625 GHz\n-2.9710 km/s
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[15]/div    34
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[16]/div    Stokes I
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[17]/div    HD163296_CO_2_1_subimage.fits
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[18]/div    -
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[19]/div    -
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[20]/div    -
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[21]/div    -
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[22]/div    LSRK 230.5121 GHz\n33.7063 km/s
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[23]/div    0
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[1]/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[24]/div    Stokes I
    [Teardown]    Kill carta_backend And Close Browser



