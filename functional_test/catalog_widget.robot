*** Settings ***
Documentation     Catalog file loading, sorting, filtering, and rendering tests
Resource          ../resource.robot
#Library    XML

*** Variables ***
${MAGIC_INDEX}    17
${MAGIC_INDEX2}    18

*** Test Cases ***
Catalog Filtering And Sorting
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cosmos_spitzer3.6micron.fits
    Load Catalog File    cosmos_mega_simbad.xml
    # dock the catalog widget and close widgets to create more space
    Drag And Drop    ${CATALOG_WIDGET_DOCK_BUTTON}    ${X_SPATIAL_PROFILER_TAB}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${IMAGE_LIST_CLOSE_BUTTON}
    Click Element    ${ANIMATOR_CLOSE_BUTTON}
    Click Element    ${REGION_LIST_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    # apply a filter to the ANG_DIST column
    Input Text    data:testid:filterable-table-filter-input-1    50..100
    Click Element    ${CATALOG_WIDGET_FILTER_BUTTON}

    # check the context in the filtering info field and the context in the lower table
    Element Should Contain    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    Showing 1 to 50 of 1732 filtered entries. Total 100000 entries
    Element Should Contain    data:testid:filterable-table-0-1    50.060001373291016
    Element Should Contain    data:testid:filterable-table-0-2    COSMOS 1611507
    Element Should Contain    data:testid:filterable-table-0-3    Galaxy
    # workaround for Blueprint Table: two duplicated tables are created, and only the second one is interactable
    Click Element    (//label[@data-testid="filterable-table-header-1"])[2]
    Element Should Contain    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    Showing 1 to 50 of 1732 filtered entries. Total 100000 entries
    Element Should Contain    data:testid:filterable-table-0-1    50.060001373291016
    Element Should Contain    data:testid:filterable-table-0-2    COSMOS 1611507
    Element Should Contain    data:testid:filterable-table-0-3    Galaxy
    Click Element     (//label[@data-testid="filterable-table-header-1"])[2]
    Element Should Contain    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    Showing 1 to 50 of 1732 filtered entries. Total 100000 entries
    Element Should Contain    data:testid:filterable-table-0-1    99.9800033569336
    Element Should Contain    data:testid:filterable-table-0-2    COSMOS 1612741
    Element Should Contain    data:testid:filterable-table-0-3    Galaxy
    Click Element     (//label[@data-testid="filterable-table-header-2"])[2]
    Element Should Contain    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    Showing 1 to 50 of 1732 filtered entries. Total 100000 entries
    Element Should Contain    data:testid:filterable-table-0-1    54.189998626708984
    Element Should Contain    data:testid:filterable-table-0-2    2MASS J09583283+0144413
    Element Should Contain    data:testid:filterable-table-0-3    Star

    Click Element    ${CATALOG_WIDGET_RESET_BUTTON}
    Element Should Contain    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    Showing 1 to 50 of total 100000 entries

    # apply a filter to the OTYPE_S column
    Input Text    data:testid:filterable-table-filter-input-3    SN
    Click Element    ${CATALOG_WIDGET_FILTER_BUTTON}

    # check the context in the filtering info field and the context in the lower table
    Element Should Contain    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    Showing 1 to 50 of 60 filtered entries. Total 100000 entries
    Element Should Contain    data:testid:filterable-table-0-1    29.3799991607666
    Element Should Contain    data:testid:filterable-table-0-2    SNLS 07D2kh
    Element Should Contain    data:testid:filterable-table-0-3    SN

    # apply another filter to the ANG_DIST column
    Input Text     data:testid:filterable-table-filter-input-1    50..100
    Click Element    ${CATALOG_WIDGET_FILTER_BUTTON}

    # check the context in the filtering info field and the context in the lower table
    Element Should Contain    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    Showing 1 to 2 of 2 filtered entries. Total 100000 entries
    Element Should Contain    data:testid:filterable-table-0-1    58.400001525878906
    Element Should Contain    data:testid:filterable-table-0-2    [RRS2014] COS12Rea
    Element Should Contain    data:testid:filterable-table-0-3    SN

    [Teardown]    Kill carta_backend And Close Browser


Catalog Column Show And Hide
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cosmos_spitzer3.6micron.fits
    Load Catalog File    cosmos_mega_simbad.xml
    # dock the catalog widget and close widgets to create more space
    Drag And Drop    ${CATALOG_WIDGET_DOCK_BUTTON}    ${X_SPATIAL_PROFILER_TAB}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${IMAGE_LIST_CLOSE_BUTTON}
    Click Element    ${ANIMATOR_CLOSE_BUTTON}
    Click Element    ${REGION_LIST_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    # hide TYPED_ID column by setting the toggle to OFF
    Click Element    css:[data-testid="catalog-header-table-switch-0"] + span
    # hide ANG_DIST column by setting the toggle to OFF
    Click Element    css:[data-testid="catalog-header-table-switch-1"] + span
    # hide MAIN_ID column by setting the toggle to OFF
    Click Element    css:[data-testid="catalog-header-table-switch-2"] + span
    # check the context in the lower table
    Element Should Contain    data:testid:filterable-table-0-0    Galaxy
    Element Should Contain    data:testid:filterable-table-0-1    150.116684
    Element Should Contain    data:testid:filterable-table-0-2    2.235136
    Element Should Contain    data:testid:filterable-table-0-3    NaN

    # show ANG_DIST column by setting the toggle to ON
    Click Element    css:[data-testid="catalog-header-table-switch-1"] + span
    # check the context in the lower table
    Element Should Contain    data:testid:filterable-table-0-0    1.2400000095367432
    Element Should Contain    data:testid:filterable-table-0-1    Galaxy
    Element Should Contain    data:testid:filterable-table-0-2    150.116684
    Element Should Contain    data:testid:filterable-table-0-3    2.235136

    # show TYPED_ID column by setting the toggle to ON
    Click Element    css:[data-testid="catalog-header-table-switch-0"] + span
    # check the context in the lower table
    Element Should Contain    data:testid:filterable-table-0-0    ${EMPTY}
    Element Should Contain    data:testid:filterable-table-0-1    1.2400000095367432
    Element Should Contain    data:testid:filterable-table-0-2    Galaxy
    Element Should Contain    data:testid:filterable-table-0-3    150.116684

    # show MAIN_ID column by setting the toggle to ON
    Click Element    css:[data-testid="catalog-header-table-switch-2"] + span
    # check the context in the lower table
    Element Should Contain    data:testid:filterable-table-0-0    ${EMPTY}
    Element Should Contain    data:testid:filterable-table-0-1    1.2400000095367432
    Element Should Contain    data:testid:filterable-table-0-2    ZFOURGE COSMOS  5366
    Element Should Contain    data:testid:filterable-table-0-3    Galaxy    
    [Teardown]    Kill carta_backend And Close Browser


Catalog Rendering As Image Overlay With Column Mapping
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cosmos_spitzer3.6micron.fits
    Load Catalog File    cosmos_0_simbad.xml
    # dock the catalog widget and close widgets to create more space
    Drag And Drop    ${CATALOG_WIDGET_DOCK_BUTTON}    ${X_SPATIAL_PROFILER_TAB}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${IMAGE_LIST_CLOSE_BUTTON}
    Click Element    ${ANIMATOR_CLOSE_BUTTON}
    Click Element    ${REGION_LIST_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    # set up ra and dec column for rendering image overlay
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_X_DROPDOWN}
    Click Element    //a[contains(., "RA_d")]
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_Y_DROPDOWN}
    Click Element    //a[contains(., "DEC_d")]
    Click Element    ${CATALOG_WIDGET_PLOT_BUTTON}

    # set up size mapping
    # click the size button to launch the settings dialog
    Click Element    data:testid:catalog-size-button
    # click the shape dropdown menu to see its context
    Click Element    data:testid:catalog-settings-shape-dropdown
    # select the line segment shape
    Click Element    data:testid:catalog-settings-shape-linesegment-filled
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
    
    # use the zoom-in button to zoom in
    Mouse Over    ${VIEWER_DIV}
    Repeat Keyword    4    Click Element   ${VIEWER_00_ZOOM_IN_BUTTON}
    Mouse Out    ${VIEWER_DIV}
    
    #Sleep    1
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png

    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    233,216,331,225
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    215,142,383,218
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    237,352,299,68
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    454,114,112,338
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    64,69,459,382

    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    233,216,215,142
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    233,216,236,352
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    233,216,454,114
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    233,216,64,69
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    215,142,236,352
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    215,142,454,114
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    215,142,64,69
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    236,352,454,114
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    236,352,64,69
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    454,114,64,69

    # remove the catalog image overlay by clicking the reset button
    Click Element    ${CATALOG_WIDGET_RESET_BUTTON}
    Capture Element Screenshot    ${VIEWER_DIV}    check2_${key}.png
    PNG Images Should Be Different    check_${key}.png    check2_${key}.png

    Remove Files    check_${key}.png    check2_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Catalog Rendering As Scatter Plot
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cosmos_spitzer3.6micron.fits
    Load Catalog File    cosmos_0_simbad.xml
    # dock the catalog widget and close widgets to create more space
    Drag And Drop    ${CATALOG_WIDGET_DOCK_BUTTON}    ${X_SPATIAL_PROFILER_TAB}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${IMAGE_LIST_CLOSE_BUTTON}
    Click Element    ${ANIMATOR_CLOSE_BUTTON}
    Click Element    ${REGION_LIST_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    # enable scatter plot with x=ANG_DIST y=RA_d
    Click Element    ${CATALOG_WIDGET_RENDERING_TYPE_DROPDOWN}
    Click Element    //a[contains(., "2D scatter")]
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_X_DROPDOWN}
    Click Element    //a[contains(., "ANG_DIST")]
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_Y_DROPDOWN}
    Click Element    //a[contains(., "RA_d")]
    Click Element    ${CATALOG_WIDGET_PLOT_BUTTON}
    
    ${key}=    Generate Random String    8
    Capture Element Screenshot    data:testid:catalog-scatter-plot    check_${key}.png
    # click the plot button in the catalog scatter plot widget
    Click Element    data:testid:catalog-plot-widget-plot-button
    Capture Element Screenshot    data:testid:catalog-scatter-plot    check2_${key}.png
    # click the x dropdown menu in the catalog scatter plot widget to select DEC_d
    Click Element    data:testid:catalog-plot-widget-x-dropdown
    Click Element    //a[contains(., "DEC_d")]
    Capture Element Screenshot    data:testid:catalog-scatter-plot    check3_${key}.png

    # click the statistic source dropdown menu to select ANG_DIST
    Click Element    data:testid:catalog-plot-widget-stat-dropdown
    Click Element    //a[contains(., "ANG_DIST")]
    # mouse over the scatter plot element
    Mouse Over    data:testid:catalog-scatter-plot
    # check the context in the info field of the scatter plot widget
    Element Should Contain    data:testid:catalog-plot-info    DEC_d: 2.21421, RA_d: 150.08293
    Element Should Contain    data:testid:catalog-plot-info    ANG_DIST - count: 20000, valid count: 20000, mean: 2.9599e+2, rms: 3.1643e+2, stddev: 1.1191e+2, min: 1.2400e+0, max: 4.6845e+2

    # click the linear fit button in the catalog scatter plot widget
    Click Element    data:testid:catalog-plot-widget-fit-button
    Capture Element Screenshot    data:testid:catalog-scatter-plot    check4_${key}.png

    # close the catalog file and check the state of the scatter plot widget
    Click Element    ${CATALOG_WIDGET_CLOSE_BUTTON}
    Element Should Contain    data:testid:catalog-plot-0-header-title    Catalog 2D scatter
    Element Should Contain    data:testid:catalog-plot-0-content    No catalog file loaded

    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    243,93,579,117
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    243,93,300,155
    PNG Images Should Be Different    check_${key}.png    check2_${key}.png
    PNG Images Should Be Different    check_${key}.png    check3_${key}.png
    PNG Images Should Be Different    check_${key}.png    check4_${key}.png
    PNG Images Should Be Different    check2_${key}.png    check3_${key}.png
    PNG Images Should Be Different    check2_${key}.png    check4_${key}.png
    PNG Images Should Be Different    check3_${key}.png    check4_${key}.png
    
    Remove Files    check_${key}.png    check2_${key}.png    check3_${key}.png    check4_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Catalog Rendering As Histogram Plot
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cosmos_spitzer3.6micron.fits
    Load Catalog File    cosmos_0_simbad.xml
    # dock the catalog widget and close widgets to create more space
    Drag And Drop    ${CATALOG_WIDGET_DOCK_BUTTON}    ${X_SPATIAL_PROFILER_TAB}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${IMAGE_LIST_CLOSE_BUTTON}
    Click Element    ${ANIMATOR_CLOSE_BUTTON}
    Click Element    ${REGION_LIST_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    # enable histogram plot
    Click Element    ${CATALOG_WIDGET_RENDERING_TYPE_DROPDOWN}
    Click Element    //a[contains(., "Histogram")]
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_X_DROPDOWN}
    Click Element    //a[contains(., "ANG_DIST")]
    Click Element    ${CATALOG_WIDGET_PLOT_BUTTON}

    ${key}=    Generate Random String    8
    Capture Element Screenshot    data:testid:catalog-histogram-plot    check_${key}.png
    # click the plot button in the catalog histogram plot widget
    Click Element    data:testid:catalog-plot-widget-plot-button
    # click the bins text field and enter 0 to set the bins from 8 to 80
    Input Text    data:testid:catalog-plot-widget-bin-input    0
    Capture Element Screenshot    data:testid:catalog-histogram-plot    check2_${key}.png
    # click the x dropdown menu in the catalog histogram plot widget to select DEC_d 
    Click Element    data:testid:catalog-plot-widget-x-dropdown
    Click Element    //a[contains(., "DEC_d")]
    Capture Element Screenshot    data:testid:catalog-histogram-plot    check3_${key}.png
    
    # mouse over the histogram plot element
    Mouse Over    data:testid:catalog-histogram-plot
    # click the statistic source dropdown menu to select DEC_d
    Click Element    data:testid:catalog-plot-widget-stat-dropdown
    Click Element    //a[contains(., "DEC_d")]
    # check the context in the info field of the catalog histogram plot widget
    Element Should Contain    data:testid:catalog-plot-info    DEC_d: 2.2141465077500007, Count: 378
    Element Should Contain    data:testid:catalog-plot-info    DEC_d - count: 20000, valid count: 20000, mean: 2.2492e+0, rms: 2.2500e+0, stddev: 6.0720e-2, min: 2.1053e+0, max: 2.3650e+0

    # close the catalog file and check the state of the histogram plot widget
    Click Element    ${CATALOG_WIDGET_CLOSE_BUTTON}
    Element Should Contain    data:testid:catalog-plot-0-header-title    Catalog Histogram
    Element Should Contain    data:testid:catalog-plot-0-content    No catalog file loaded

    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    243,170,530,68
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    243,170,115,22
    PNG Two Pixels Should Have Matched RGBA    check2_${key}.png    172,122,458,25
    PNG Two Pixels Should Not Have Matched RGBA    check2_${key}.png    172,122,115,22
    PNG Two Pixels Should Have Matched RGBA    check3_${key}.png    186,119,665,123
    PNG Two Pixels Should Not Have Matched RGBA    check3_${key}.png    186,119,115,22
    PNG Images Should Be Different    check_${key}.png    check2_${key}.png
    PNG Images Should Be Different    check_${key}.png    check2_${key}.png
    PNG Images Should Be Different    check_${key}.png    check3_${key}.png
    PNG Images Should Be Different    check2_${key}.png    check3_${key}.png
    
    Remove Files    check_${key}.png    check2_${key}.png    check3_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Linked Catalog Visualization
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cosmos_spitzer3.6micron.fits
    Load Catalog File    cosmos_0_simbad.xml
    # dock the catalog widget and close widgets to create more space
    Drag And Drop    ${CATALOG_WIDGET_DOCK_BUTTON}    ${X_SPATIAL_PROFILER_TAB}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${IMAGE_LIST_CLOSE_BUTTON}
    Click Element    ${ANIMATOR_CLOSE_BUTTON}
    Click Element    ${REGION_LIST_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    # set up image overlay, scatter plot and histogram plot
    # plot image overlay with x=RA_d and y=DEC_d
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_X_DROPDOWN}
    Click Element    //a[contains(., "RA_d")]
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_Y_DROPDOWN}
    Click Element    //a[contains(., "DEC_d")]
    Click Element    ${CATALOG_WIDGET_PLOT_BUTTON}

    # plot scatter plot with x=RA_d
    Click Element    ${CATALOG_WIDGET_RENDERING_TYPE_DROPDOWN}
    Click Element    //a[contains(., "2D scatter")]
    Click Element    ${CATALOG_WIDGET_PLOT_BUTTON}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    data:testid:catalog-scatter-plot    check_scatter_${key}.png

    # plot histogram plot with x=RA_d
    Click Element    ${CATALOG_WIDGET_RENDERING_TYPE_DROPDOWN}
    Click Element    //a[contains(., "Histogram")]
    Click Element    ${CATALOG_WIDGET_PLOT_BUTTON}

    Capture Element Screenshot    data:testid:catalog-histogram-plot    check_histogram_${key}.png
    # click the histogram plot element
    Click Element    data:testid:catalog-histogram-plot
    Capture Element Screenshot    data:testid:catalog-histogram-plot    check_histogram_selected_${key}.png
    # close the catalog histogram plot widget
    Click Element    data:testid:catalog-plot-1-header-close-button
    Capture Element Screenshot    data:testid:catalog-scatter-plot    check_scatter_selected_${key}.png
    # close the catalog scatter plot widget
    Click Element    data:testid:catalog-plot-0-header-close-button

    #Sleep    1
    # check the context in the catalog table
    Element Should Contain    data:testid:filterable-table-582-1    73.06999969482422
    Capture Element Screenshot    ${VIEWER_DIV}    check_image_overlay_selected_${key}.png
    Capture Element Screenshot    css:[class*="catalog-overlay-data-container"]    check_table_selected_${key}.png
    
    Click Element    ${CATALOG_WIDGET_RESET_BUTTON}
    #Sleep    1
    # on the mac mini, this is not always true. sometimes it is 8.279999732971191, the cell above 9.220000267028809
    #Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[12]/div    9.220000267028809
    Capture Element Screenshot    css:[class*="catalog-overlay-data-container"]    check_table_reset_${key}.png
    Capture Element Screenshot    ${VIEWER_DIV}    check_image_overlay_reset_${key}.png

    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_histogram_selected_${key}.png    338,21,338,227
    PNG Two Pixels Should Not Have Matched RGBA    check_histogram_selected_${key}.png    338,21,342,16
    PNG Images Should Be Different    check_histogram_selected_${key}.png    check_histogram_${key}.png
    PNG Two Pixels Should Have Matched RGBA    check_scatter_selected_${key}.png    340,16,340,225
    PNG Two Pixels Should Not Have Matched RGBA    check_scatter_selected_${key}.png    340,16,350,142
    PNG Images Should Be Different    check_scatter_selected_${key}.png    check_scatter_${key}.png
    PNG Images Should Be Different    check_image_overlay_selected_${key}.png    check_image_overlay_reset_${key}.png
    PNG Two Pixels Should Have Matched RGBA    check_table_selected_${key}.png    120,70,580,70
    PNG Two Pixels Should Not Have Matched RGBA    check_table_selected_${key}.png    120,70,120,90
    PNG Images Should Be Different    check_table_selected_${key}.png    check_table_reset_${key}.png

    Remove Files    check_scatter_${key}.png    check_scatter_selected_${key}.png    check_histogram_${key}.png    check_histogram_selected_${key}.png    check_image_overlay_selected_${key}.png    check_image_overlay_reset_${key}.png    check_table_selected_${key}.png    check_table_reset_${key}.png
    [Teardown]    Kill carta_backend And Close Browser

