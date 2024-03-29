*** Settings ***
Documentation     Check the features in the cursor info widget
Resource          ../resource.robot

*** Variables ***
${MAGIC_INDEX}    17


*** Test Cases ***
Cursor Info For Matched And Unmatched Images
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   HD163296_13CO_2-1_subimage.fits
    Append Image    HD163296_C18O_2-1_subimage.fits
    Append Image    HD163296_CO_2_1_subimage.fits
    # enable the cursor info widget and dock to the panel with render config widget
    Drag And Drop    CursorInfoWidgetButton    data:testid:render-config-0-header-title
    # click the bottom-left panel with an offset to make HD163296_CO_2_1_subimage.fits active
    Click Element At Coordinates    css:#image-panel-0-1 .region-stage    0    10
    Set Selenium Speed    0
    Element Should Contain    data:testid:simple-table-0-0    HD163296_13CO_2-1_subimage.fits
    Element Should Contain    data:testid:simple-table-0-1    -
    Element Should Contain    data:testid:simple-table-0-2    -
    Element Should Contain    data:testid:simple-table-0-3    -
    Element Should Contain    data:testid:simple-table-0-4    -
    Element Should Contain    data:testid:simple-table-0-5    LSRK 220.4009 GHz\n-2.9720 km/s
    Element Should Contain    data:testid:simple-table-0-6    0
    Element Should Contain    data:testid:simple-table-0-7    Stokes I
    Element Should Contain    data:testid:simple-table-1-0    HD163296_C18O_2-1_subimage.fits
    Element Should Contain    data:testid:simple-table-1-1    -
    Element Should Contain    data:testid:simple-table-1-2    -
    Element Should Contain    data:testid:simple-table-1-3    -
    Element Should Contain    data:testid:simple-table-1-4    -
    Element Should Contain    data:testid:simple-table-1-5    LSRK 219.5708 GHz\n-14.3044 km/s
    Element Should Contain    data:testid:simple-table-1-6    0
    Element Should Contain    data:testid:simple-table-1-7    Stokes I
    Element Should Contain    data:testid:simple-table-2-0    HD163296_CO_2_1_subimage.fits
    Element Should Contain    data:testid:simple-table-2-1    -4.95158e-3\nJy/beam
    Element Should Contain    data:testid:simple-table-2-2    FK5
    Element Should Contain    data:testid:simple-table-2-3    17:56:21.218\n-21:57:22.06
    Element Should Contain    data:testid:simple-table-2-4    161.500\n124.980
    Element Should Contain    data:testid:simple-table-2-5    LSRK 230.5121 GHz\n33.7063 km/s
    Element Should Contain    data:testid:simple-table-2-6    0
    Element Should Contain    data:testid:simple-table-2-7    Stokes I
    Set Selenium Speed    ${DELAY}
    # click the top-right panel to make HD163296_C18O_2-1_subimage.fits
    Click Element    image-panel-1-0
    # click the matching button and trigger spatial+spectral matching
    Click Element    ${VIEWER_10_MATCH_BUTTON}
    Click Element    //*[contains(text(), "Spectral (VRAD) and spatial")]
    # mouse over the top-left panel, ie HD163296_13CO_2-1_subimage.fits
    Mouse Over    image-panel-0-0
    Set Selenium Speed    0
    Element Should Contain    data:testid:simple-table-0-0    HD163296_13CO_2-1_subimage.fits
    Element Should Contain    data:testid:simple-table-0-1    -5.81883e-3\nJy/beam
    Element Should Contain    data:testid:simple-table-0-2    FK5
    Element Should Contain    data:testid:simple-table-0-3    17:56:21.385\n-21:57:23.05
    Element Should Contain    data:testid:simple-table-0-4    114.044\n88.243
    Element Should Contain    data:testid:simple-table-0-5    LSRK 220.4009 GHz\n-2.9720 km/s
    Element Should Contain    data:testid:simple-table-0-6    0
    Element Should Contain    data:testid:simple-table-0-7    Stokes I
    Element Should Contain    data:testid:simple-table-1-0    HD163296_C18O_2-1_subimage.fits
    Element Should Contain    data:testid:simple-table-1-1    -2.48593e-3\nJy/beam
    Element Should Contain    data:testid:simple-table-1-2    FK5
    Element Should Contain    data:testid:simple-table-1-3    17:56:21.385\n-21:57:23.05
    Element Should Contain    data:testid:simple-table-1-4    71.044\n86.243
    Element Should Contain    data:testid:simple-table-1-5    LSRK 219.5625 GHz\n-2.9710 km/s
    Element Should Contain    data:testid:simple-table-1-6    34
    Element Should Contain    data:testid:simple-table-1-7    Stokes I
    Element Should Contain    data:testid:simple-table-2-0    HD163296_CO_2_1_subimage.fits
    Element Should Contain    data:testid:simple-table-2-1    -
    Element Should Contain    data:testid:simple-table-2-2    -
    Element Should Contain    data:testid:simple-table-2-3    -
    Element Should Contain    data:testid:simple-table-2-4    -
    Element Should Contain    data:testid:simple-table-2-5    LSRK 230.5121 GHz\n33.7063 km/s
    Element Should Contain    data:testid:simple-table-2-6    0
    Element Should Contain    data:testid:simple-table-2-7    Stokes I
    [Teardown]    Kill carta_backend And Close Browser



