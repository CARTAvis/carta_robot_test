*** Settings ***
Documentation     Check workspace features
Resource          ../resource.robot


*** Test Cases ***
Workspace - Image Viewer
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
    Mouse Over    ${VIEWER_10_CANVAS}
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

    Test Workspace Snapshot
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

    Mouse Over    ${VIEWER_11_CANVAS}
    Test Workspace Snapshot
    [Teardown]    Kill carta_backend And Close Browser


Workspace - Catalog
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    m51_151_MHz.fits
    Mouse Over    ${VIEWER_DIV}
    Change Raster Colormap    greys
    Load Catalog File    m51_simbad.xml
    # dock the catalog widget and close widgets to create more space
    Drag And Drop    ${CATALOG_WIDGET_DOCK_BUTTON}    ${X_SPATIAL_PROFILER_TAB}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${IMAGE_LIST_CLOSE_BUTTON}
    Click Element    ${ANIMATOR_CLOSE_BUTTON}
    Click Element    ${REGION_LIST_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0    
    # disable TYPED_ID column
    Click Element    //*[@id="root"]/div/div[16]/div/div[8]/div/div/div[2]/div[1]/div/div[1]/div[5]/div/div[2]/div[2]/div/div/div/div[3]/div/label
    Sleep    1
    # apply a filter 
    Input Text    data:testid:filterable-table-filter-input-0    50..100
    Click Element    data:testid:catalog-filter-button
    # enable catalog image overlay
    Click Element    data:testid:catalog-plot-button

    # set up size mapping
    # click the size button to launch the settings dialog
    Click Element    data:testid:catalog-size-button
    # click the shape dropdown menu to see its context
    Click Element    data:testid:catalog-settings-shape-dropdown
    # select the line segment shape
    Click Element    data:testid:catalog-settings-shape-ellipse-lined
    # click the column dropdown menu to set up size mapping with respect to the ANG_DIST column
    Click Element    data:testid:catalog-settings-major-size-column-dropdown
    Click Element    //a[contains(., "ANG_DIST")]
    # click the thickness spinbox to increase the thickness of the line segment shape
    Repeat Keyword    4    Click Element    data:testid:catalog-settings-thickness-input-increment-button
    # set up color mapping
    # click the color tab
    Click Element    data:testid:catalog-settings-color-tab-title
    # click the column dropdown menu to set up color mapping with respect to the ANG_DIST column
    Click Element    data:testid:catalog-settings-color-column-dropdown
    Click Element    //a[contains(., "ANG_DIST")]
    # click the color map dropdown menu to select the tab10 color map
    Click Element    css:[data-testid="catalog-settings-color-tab"] [data-testid="colormap-dropdown"]
    Scroll Element Into View    //*[contains(text(), "tab10")]
    Click Element    //*[contains(text(), "tab10")]  
    # set up orientation mapping
    # click the orientation tab
    Click Element    data:testid:catalog-settings-orientation-tab-title
    # click the column dropdown menu to set up orientation mapping with respect to the ANG_DIST column
    Click Element    data:testid:catalog-settings-orientation-column-dropdown
    Click Element    //a[contains(., "ANG_DIST")]
    # close the settings dialog by clicking the x button at the top-right corner
    Click Element    data:testid:catalog-overlay-component-0-floating-settings-0-header-close-button

    # enable scatter plot with x=ANG_DIST y=RA_d
    Click Element    ${CATALOG_WIDGET_RENDERING_TYPE_DROPDOWN}
    Click Element    //a[contains(., "2D scatter")]
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_X_DROPDOWN}
    Click Element    //a[contains(., "ANG_DIST")]
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_Y_DROPDOWN}
    Click Element    //a[contains(., "RA_d")]
    Click Element    ${CATALOG_WIDGET_PLOT_BUTTON}
    # dock the scatter plot widget
    Drag And Drop    data:testid:catalog-plot-0-header-dock-button    data:testid:render-config-0-header-title

    # enable histogram plot
    Click Element    ${CATALOG_WIDGET_RENDERING_TYPE_DROPDOWN}
    Click Element    //a[contains(., "Histogram")]
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_X_DROPDOWN}
    Click Element    //a[contains(., "ANG_DIST")]
    Click Element    ${CATALOG_WIDGET_PLOT_BUTTON}
    # relocate the histogram plot widget
    Drag And Drop By Offset    data:testid:catalog-plot-1-header-title    100    0
    # select sources in the histogram
    Click Element At Coordinates    data:testid:catalog-histogram-plot    -200    0

    # fetch sources from SIMBAD
    Click Element    data:testid:online-data-query-dialog-button
    # reset mirror site list to default order
    Click Element    data:testid:catalog-query-mirror-select-button
    Click Element    data:testid:catalog-query-reset-mirrors-button
    Mouse Out    data:testid:catalog-query-reset-mirrors-button
    Click Element    data:testid:catalog-query-use-mirror-url-1-button
    Click Element    data:testid:catalog-query-mirror-select-button
    # limit to <=100 sources
    Press Keys    data:testid:catalog-query-max-objects-input    DELETE
    Click Element    data:testid:catalog-query-query-button
    Wait Until Page Does Not Contain    Online Data Query    timeout=30 
    # enable catalog image overlay
    Click Element    data:testid:catalog-plot-button

    # make the catalog widget to display catalog 1
    Click Element    data:testid:catalog-file-dropdown
    Click Element    //*[@id="listbox-7"]/li[1]/a
    Sleep    2

    Test Workspace Snapshot    98.885    # due to anti-aliasing error
    [Teardown]    Kill carta_backend And Close Browser


