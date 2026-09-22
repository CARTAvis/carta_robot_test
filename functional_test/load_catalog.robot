*** Settings ***
Documentation     Catalog file loading, sorting, filtering, and rendering tests
Resource          ../resource.robot
#Library    XML

*** Variables ***
${MAGIC_INDEX}    17
${MAGIC_INDEX2}    18

*** Test Cases ***
Load Catalog File In VOTable Format
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
    Set Selenium Speed    0
    Element Should Contain    ${CATALOG_WIDGET_TITLE}    Catalog : cosmos_mega_simbad.xml
    Element Should Contain    ${CATALOG_WIDGET_SYSTEM_DROPDOWN_ACTIVE_CONTEXT}    ICRS
    
    # check the context of the upper table
    Element Should Contain    data:testid:catalog-header-table-0-0    TYPED_ID
    Element Should Contain    data:testid:catalog-header-table-0-1    ${EMPTY}
    Element Should Contain    data:testid:catalog-header-table-0-2    string
    Checkbox Should Be Selected    data:testid:catalog-header-table-switch-0
    Element Should Contain    data:testid:catalog-header-table-0-4    Raw identifier as typed in the query
   
    Element Should Contain    data:testid:catalog-header-table-1-0    ANG_DIST
    Element Should Contain    data:testid:catalog-header-table-1-1    arcsec
    Element Should Contain    data:testid:catalog-header-table-1-2    float
    Checkbox Should Be Selected    data:testid:catalog-header-table-switch-1
    Element Should Contain    data:testid:catalog-header-table-1-4    Angular distance from the center

    Element Should Contain    data:testid:catalog-header-table-4-0    RA_d
    Element Should Contain    data:testid:catalog-header-table-4-1    deg
    Element Should Contain    data:testid:catalog-header-table-4-2    double
    Checkbox Should Be Selected    data:testid:catalog-header-table-switch-4
    Element Should Contain    data:testid:catalog-header-table-4-4    Right ascension

    # check the context of the lower table
    Element Should Contain    data:testid:filterable-table-header-0    TYPED_ID
    Element Should Contain    data:testid:filterable-table-header-1    ANG_DIST
    Element Should Contain    data:testid:filterable-table-header-2    MAIN_ID
    Element Should Contain    data:testid:filterable-table-header-3    OTYPE_S
    
    Element Should Contain    data:testid:filterable-table-0-1    1.2400000095367432
    Element Should Contain    data:testid:filterable-table-0-2    ZFOURGE COSMOS 5366
    Element Should Contain    data:testid:filterable-table-0-3    Galaxy
    
    # check the context in the filtering info field
    Element Should Contain    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    Showing 1 to 50 of total 100000 entries
    [Teardown]    Kill carta_backend And Close Browser



Load Catalog File In FITS Format
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cosmos_spitzer3.6micron.fits
    Load Catalog File    cosmos_mega_simbad.fits
    # dock the catalog widget and close widgets to create more space
    Drag And Drop    ${CATALOG_WIDGET_DOCK_BUTTON}    ${X_SPATIAL_PROFILER_TAB}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${IMAGE_LIST_CLOSE_BUTTON}
    Click Element    ${ANIMATOR_CLOSE_BUTTON}
    Click Element    ${REGION_LIST_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0
    Set Selenium Speed    0
    Element Should Contain    ${CATALOG_WIDGET_TITLE}    Catalog : cosmos_mega_simbad.fits
    Element Should Contain    ${CATALOG_WIDGET_SYSTEM_DROPDOWN_ACTIVE_CONTEXT}    ICRS

    # check the context of the upper table
    Element Should Contain    data:testid:catalog-header-table-0-0    TYPED_ID
    Element Should Contain    data:testid:catalog-header-table-0-1    ${EMPTY}
    Element Should Contain    data:testid:catalog-header-table-0-2    string
    Checkbox Should Be Selected    data:testid:catalog-header-table-switch-0
    Element Should Contain    data:testid:catalog-header-table-0-4    Raw identifier as typed in the query
   
    Element Should Contain    data:testid:catalog-header-table-1-0    ANG_DIST
    Element Should Contain    data:testid:catalog-header-table-1-1    arcsec
    Element Should Contain    data:testid:catalog-header-table-1-2    float
    Checkbox Should Be Selected    data:testid:catalog-header-table-switch-1
    Element Should Contain    data:testid:catalog-header-table-1-4    Angular distance from the center

    Element Should Contain    data:testid:catalog-header-table-4-0    RA_d
    Element Should Contain    data:testid:catalog-header-table-4-1    deg
    Element Should Contain    data:testid:catalog-header-table-4-2    double
    Checkbox Should Be Selected    data:testid:catalog-header-table-switch-4
    Element Should Contain    data:testid:catalog-header-table-4-4    Right ascension

    # check the context of the lower table
    Element Should Contain    data:testid:filterable-table-header-0    TYPED_ID
    Element Should Contain    data:testid:filterable-table-header-1    ANG_DIST
    Element Should Contain    data:testid:filterable-table-header-2    MAIN_ID
    Element Should Contain    data:testid:filterable-table-header-3    OTYPE_S
    
    Element Should Contain    data:testid:filterable-table-0-1    1.2400000095367432
    Element Should Contain    data:testid:filterable-table-0-2    ZFOURGE COSMOS 5366
    Element Should Contain    data:testid:filterable-table-0-3    Galaxy
    
    # check the context in the filtering info field
    Element Should Contain    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    Showing 1 to 50 of total 100000 entries
    [Teardown]    Kill carta_backend And Close Browser


Load And Manage Two Catalog Files
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

    Element Should Contain    ${CATALOG_WIDGET_TITLE}    Catalog : cosmos_mega_simbad.xml 
    Element Should Contain    ${CATALOG_WIDGET_FILE_DROPDOWN}    1
    Element Should Contain    ${CATALOG_WIDGET_SYSTEM_DROPDOWN_ACTIVE_CONTEXT}    ICRS
    Element Should Contain    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    Showing 1 to 50 of total 100000 entries
    
    Load Catalog File    cosmos_0_simbad.xml
    Element Should Contain    ${CATALOG_WIDGET_TITLE}    Catalog : cosmos_0_simbad.xml 
    Element Should Contain    ${CATALOG_WIDGET_FILE_DROPDOWN}    2
    Element Should Contain    ${CATALOG_WIDGET_SYSTEM_DROPDOWN_ACTIVE_CONTEXT}    ICRS
    Element Should Contain    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    Showing 1 to 50 of total 20000 entries    

    Click Element    ${CATALOG_WIDGET_FILE_DROPDOWN}
    Click Element At Coordinates    ${CATALOG_WIDGET_FILE_DROPDOWN}    0    30
    Element Should Contain    ${CATALOG_WIDGET_TITLE}    Catalog : cosmos_mega_simbad.xml
    Element Should Contain    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    Showing 1 to 50 of total 100000 entries
    Click Element    ${CATALOG_WIDGET_CLOSE_BUTTON}
    Element Should Contain    ${CATALOG_WIDGET_TITLE}    Catalog : cosmos_0_simbad.xml
    Element Should Contain    ${CATALOG_WIDGET_FILE_DROPDOWN}    2
    Element Should Contain    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    Showing 1 to 50 of total 20000 entries    
    Click Element    ${CATALOG_WIDGET_CLOSE_BUTTON}
    # check for the non-ideal state of the catalog widget 
    Element Should Contain    data:testid:catalog-overlay-component-0-content    No catalog file loaded
    
    [Teardown]    Kill carta_backend And Close Browser


Fetch VizieR Catalog And Visualize
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    m51_151_MHz.fits
    # enable catalog query dialog
    Click Element    data:testid:online-data-query-dialog-button
    # switch to VizieR catalog
    Click Element    //button[contains(., "SIMBAD")]
    Click Element    //*[contains(text(), "VizieR")]
    # reset mirror site list to default order
    Click Element    data:testid:catalog-query-mirror-select-button
    Click Element    data:testid:catalog-query-reset-mirrors-button
    Mouse Out    data:testid:catalog-query-reset-mirrors-button
    Click Element    data:testid:catalog-query-use-mirror-url-0-button
    Click Element    data:testid:catalog-query-mirror-select-button
    # set up keyword for query
    Input Text    data:testid:catalog-query-keyword-input    SDSS
    # make query
    Click Element    //a[contains(., "Query")]
    Wait Until Element Does Not Contain    data:testid:catalog-query-info    Querying VizieR    timeout=60
    # select a catalog
    Click Element    //input[@placeholder="Please select catalog tables"]
    # 4. Sloan Digital Sky Surveys (SDSS), Release 16 (DR16) (Ahumada+, 2020) * output of the SDSS photometric catalog
    Click Element    //a[contains(., "V/154/sdss16")]
    # retrive 
    Click Element   //a[contains(., "Load selected")]
    Wait Until Page Does Not Contain    Online Catalog Query    timeout=60
    Wait Until Page Contains Element    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    timeout=30
    # enable catalog image overlay
    # workaround for element not found issue [TODO: investigate this]
    Set Selenium Speed    0.2
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_X_DROPDOWN}
    Click Element    //a[contains(., "RA_ICRS")]
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_Y_DROPDOWN}
    Click Element    //a[contains(., "DE_ICRS")]
    Click Element    ${CATALOG_WIDGET_PLOT_BUTTON}
    Set Selenium Speed    ${DELAY}
    # enable scatter plot
    Click Element    ${CATALOG_WIDGET_RENDERING_TYPE_DROPDOWN}
    Click Element    //a[contains(., "2D scatter")]
    Click Element    ${CATALOG_WIDGET_PLOT_BUTTON}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    data:testid:catalog-scatter-plot    scatter_${key}.png
    Click Element    data:testid:catalog-plot-0-header-close-button
    # enable histogram plot
    Click Element    ${CATALOG_WIDGET_RENDERING_TYPE_DROPDOWN}
    Click Element    //a[contains(., "Histogram")]
    Click Element    ${CATALOG_WIDGET_PLOT_BUTTON}
    Capture Element Screenshot    data:testid:catalog-histogram-plot    histogram_${key}.png
    Click Element    data:testid:catalog-plot-0-header-close-button
    # close catalog widget
    Click Element    data:testid:catalog-overlay-component-0-header-close-button
    
    Capture Element Screenshot    ${VIEWER_DIV}    image_${key}.png
    # check png images
    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    image_${key}.png    375,245,232,213
    PNG Two Pixels Should Have Matched RGBA    scatter_${key}.png    366,184,591,150
    PNG Two Pixels Should Have Matched RGBA    histogram_${key}.png    242,98,655,72
    Remove Files    image_${key}.png    scatter_${key}.png    histogram_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Fetch SIMBAD Catalog And Visualize
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    spire500_ext.fits
    Mouse Over    ${VIEWER_DIV}
    Repeat Keyword    2    Click Element    data:testid:zoom-in-button
    Mouse Out    ${VIEWER_DIV}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    image_before_${key}.png
    # enable catalog query dialog
    Click Element    data:testid:online-data-query-dialog-button
    # reset mirror site list to default order
    Click Element    data:testid:catalog-query-mirror-select-button
    Click Element    data:testid:catalog-query-reset-mirrors-button
    Mouse Out    data:testid:catalog-query-reset-mirrors-button
    Click Element    data:testid:catalog-query-use-mirror-url-0-button
    Click Element    data:testid:catalog-query-mirror-select-button
    # set search radius
    Click Element    //button[contains(., "Set to viewer")]
    Element Attribute Value Should Be    data:testid:catalog-query-search-radius-input    value    0.8045196532714395
    # set search center
    Click Element    data:testid:catalog-query-reset-center-button
    Element Attribute Value Should Be    data:testid:catalog-query-center-x-input    value    7:08:30.8601970197
    Element Attribute Value Should Be    data:testid:catalog-query-center-y-input    value    -10:33:15.4199949321
    # make query
    Click Element    //a[contains(., "Query")]
    Wait Until Page Does Not Contain    Online Data Query    timeout=30    
    # enable catalog image overlay
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_X_DROPDOWN}
    Click Element    //a[contains(., "ra")]
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_Y_DROPDOWN}
    Click Element    //a[contains(., "dec")]
    Click Element    ${CATALOG_WIDGET_PLOT_BUTTON}
    # enable scatter plot
    Click Element    ${CATALOG_WIDGET_RENDERING_TYPE_DROPDOWN}
    Click Element    //a[contains(., "2D scatter")]
    Click Element    ${CATALOG_WIDGET_PLOT_BUTTON}
    Capture Element Screenshot    data:testid:catalog-scatter-plot    scatter_${key}.png
    Click Element    data:testid:catalog-plot-0-header-close-button
    # enable histogram plot
    Click Element    ${CATALOG_WIDGET_RENDERING_TYPE_DROPDOWN}
    Click Element    //a[contains(., "Histogram")]
    Click Element    ${CATALOG_WIDGET_PLOT_BUTTON}
    Capture Element Screenshot    data:testid:catalog-histogram-plot    histogram_${key}.png
    Click Element    data:testid:catalog-plot-0-header-close-button
    # close catalog widget
    Click Element    data:testid:catalog-overlay-component-0-header-close-button
    
    Capture Element Screenshot    ${VIEWER_DIV}    image_after_${key}.png
    
    # check png images
    Set Selenium Speed    0
    PNG Images Should Be Different    image_before_${key}.png    image_after_${key}.png
    #PNG Two Pixels Should Have Matched RGBA    scatter_${key}.png    200,162,572,61
    #PNG Two Pixels Should Have Matched RGBA    scatter_${key}.png    200,162,565,63
    PNG Two Pixels Should Have Matched RGBA    scatter_${key}.png    157,189,574,54
    PNG Two Pixels Should Have Matched RGBA    histogram_${key}.png    136,140,584,100
    Remove Files    image_before_${key}.png    image_after_${key}.png    scatter_${key}.png    histogram_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


SIMBAD and VizieR Mirror Sites
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    m51_151_MHz.fits
    # enable catalog query dialog
    Click Element    data:testid:online-data-query-dialog-button
    # check SIMBAD mirror sites
    Click Element    data:testid:catalog-query-mirror-select-button
    Element Should Contain    data:testid:catalog-query-use-mirror-url-0-button    simbad.u-strasbg.fr
    Element Should Contain    data:testid:catalog-query-use-mirror-url-1-button    simbad.cfa.harvard.edu
    # switch to VizieR and check mirror sites
    Click Element    //button[contains(., "SIMBAD")]
    Click Element    //*[contains(text(), "VizieR")]
    Click Element    data:testid:catalog-query-mirror-select-button
    # reset list to default order
    Click Element    data:testid:catalog-query-reset-mirrors-button
    Mouse Out    data:testid:catalog-query-reset-mirrors-button
    Element Should Contain    data:testid:catalog-query-use-mirror-url-0-button    vizier.cds.unistra.fr
    Element Should Contain    data:testid:catalog-query-use-mirror-url-1-button    vizier.nao.ac.jp
    Element Should Contain    data:testid:catalog-query-use-mirror-url-2-button    vizier.iucaa.in    
    Element Should Contain    data:testid:catalog-query-use-mirror-url-3-button    vizier.inasan.ru
    Element Should Contain    data:testid:catalog-query-use-mirror-url-4-button    vizier.china-vo.org
    Element Should Contain    data:testid:catalog-query-use-mirror-url-5-button    vizier.cfa.harvard.edu
    Element Should Contain    data:testid:catalog-query-use-mirror-url-6-button    vizier.idia.ac.za
    # disable vizier.inasan.ru (a workaround is applied due to an unknown issue, something blocks the toggle)
    Click Element At Coordinates    data:testid:catalog-query-use-mirror-url-3-button    -100    0

    # perform speed test
    Click Element    data:testid:catalog-query-test-mirror-speed-button
    Sleep    2
    # cancel the speed test
    Click Element    data:testid:catalog-query-test-mirror-speed-button
    # perform speed test again
    Click Element    data:testid:catalog-query-test-mirror-speed-button
    Wait Until Page Contains    Test speed    timeout=30
    # check the fastest mirror site (vizier.nao.ac.jp or vizier.cfa.harvard.edu in our test environment)
    # get text and verify the fastest mirror site
    ${fastest_mirror}=    Get Text    data:testid:catalog-query-use-mirror-url-0-button
    Should Be True    '${fastest_mirror}' == 'vizier.nao.ac.jp' or '${fastest_mirror}' == 'vizier.cfa.harvard.edu'
    # check the last mirror site which is disabled (vizier.inasan.ru in our test environment)
    Element Should Contain    data:testid:catalog-query-use-mirror-url-6-button    vizier.inasan.ru
    # load catalog from the fastest mirror site
    Click Element    data:testid:catalog-query-mirror-select-button
    # set up keyword for query
    Input Text    data:testid:catalog-query-keyword-input    SDSS
    # make query
    Click Element    //a[contains(., "Query")]
    Wait Until Element Does Not Contain    data:testid:catalog-query-info    Querying VizieR    timeout=60
    # select a catalog
    Click Element    //input[@placeholder="Please select catalog tables"]
    # 4. Sloan Digital Sky Surveys (SDSS), Release 16 (DR16) (Ahumada+, 2020) * output of the SDSS photometric catalog
    Click Element    //a[contains(., "V/154/sdss16")]
    # retrive 
    Click Element   //a[contains(., "Load selected")]
    Wait Until Page Does Not Contain    Online Catalog Query    timeout=60
    Wait Until Page Contains Element    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    timeout=30
    # close the catalog widget
    Click Element    data:testid:catalog-overlay-component-0-header-close-button    
    # load a new image
    Load Image    m51_151_MHz.fits
    # check the mirror site list order to see if it is persistent
    Click Element    data:testid:online-data-query-dialog-button
    Click Element    data:testid:catalog-query-mirror-select-button
    ${fastest_mirror}=    Get Text    data:testid:catalog-query-use-mirror-url-0-button
    Should Be True    '${fastest_mirror}' == 'vizier.nao.ac.jp' or '${fastest_mirror}' == 'vizier.cfa.harvard.edu'
    Element Should Contain    data:testid:catalog-query-use-mirror-url-6-button    vizier.inasan.ru
    # reset list to default order
    Click Element    data:testid:catalog-query-reset-mirrors-button
    [Teardown]    Kill carta_backend And Close Browser



Load Catalogs With Various Spatial Column Formats
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    mosaic_SCI.fits
    Load Catalog File    00_baseline_decimal_deg.vot
    # dock the catalog widget and close widgets to create more space
    Drag And Drop    ${CATALOG_WIDGET_DOCK_BUTTON}    ${X_SPATIAL_PROFILER_TAB}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${IMAGE_LIST_CLOSE_BUTTON}
    Click Element    ${ANIMATOR_CLOSE_BUTTON}
    Click Element    ${REGION_LIST_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0
    Mouse Over    ${VIEWER_DIV}
    Click Element    data:testid:zoom-to-fit-button
    Mouse Out    ${VIEWER_DIV}
    Sleep    2

    # take a screenshot of the viewer without catalog overlay
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_no_overlay_${key}.png

    # render the catalog overlay and take a screenshot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_00_baseline_decimal_deg_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_00_baseline_decimal_deg_${key}.png
    Remove Files    check_00_baseline_decimal_deg_${key}.png

    # 01_sexagesimal_colon_units.vot
    Load Catalog File    01_sexagesimal_colon_units.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_01_sexagesimal_colon_units_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_01_sexagesimal_colon_units_${key}.png
    Remove Files    check_01_sexagesimal_colon_units_${key}.png

    # 02_sexagesimal_colon_nounits.vot
    Load Catalog File    02_sexagesimal_colon_nounits.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_02_sexagesimal_colon_nounits_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_02_sexagesimal_colon_nounits_${key}.png
    Remove Files    check_02_sexagesimal_colon_nounits_${key}.png

    # 03_sexagesimal_letters.vot
    Load Catalog File    03_sexagesimal_letters.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_03_sexagesimal_letters_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_03_sexagesimal_letters_${key}.png
    Remove Files    check_03_sexagesimal_letters_${key}.png
    # 04_sexagesimal_space.vot
    Load Catalog File    04_sexagesimal_space.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_04_sexagesimal_space_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_04_sexagesimal_space_${key}.png
    Remove Files    check_04_sexagesimal_space_${key}.png
    # 05_compact_hhmmss.vot
    Load Catalog File    05_compact_hhmmss.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_05_compact_hhmmss_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_05_compact_hhmmss_${key}.png
    Remove Files    check_05_compact_hhmmss_${key}.png
    # 06_decimal_hours.vot
    Load Catalog File    06_decimal_hours.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_06_decimal_hours_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_06_decimal_hours_${key}.png
    Remove Files    check_06_decimal_hours_${key}.png
    # 07_radians.vot
    Load Catalog File    07_radians.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_07_radians_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_07_radians_${key}.png
    Remove Files    check_07_radians_${key}.png
    # 08_unicode_dms.vot
    Load Catalog File    08_unicode_dms.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_08_unicode_dms_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_08_unicode_dms_${key}.png
    Remove Files    check_08_unicode_dms_${key}.png
    # 09_casa_dot_dec.vot
    Load Catalog File    09_casa_dot_dec.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_09_casa_dot_dec_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_09_casa_dot_dec_${key}.png
    Remove Files    check_09_casa_dot_dec_${key}.png
    # 10_numeric_hours.vot
    Load Catalog File    10_numeric_hours.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_10_numeric_hours_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_10_numeric_hours_${key}.png
    Remove Files    check_10_numeric_hours_${key}.png
    # 11_numeric_radians.vot
    Load Catalog File    11_numeric_radians.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_11_numeric_radians_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_11_numeric_radians_${key}.png
    Remove Files    check_11_numeric_radians_${key}.png
    # 12_unicode_minus.vot
    Load Catalog File    12_unicode_minus.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_12_unicode_minus_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Identical    check_no_overlay_${key}.png    check_12_unicode_minus_${key}.png
    Remove Files    check_12_unicode_minus_${key}.png
    # 20_FAIL_compact_no_units.vot
    Load Catalog File    20_FAIL_compact_no_units.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_20_FAIL_compact_no_units_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Identical    check_no_overlay_${key}.png    check_20_FAIL_compact_no_units_${key}.png
    Remove Files    check_20_FAIL_compact_no_units_${key}.png
    # 21_PARTIAL_out_of_range_lat.vot
    Load Catalog File    21_PARTIAL_out_of_range_lat.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_21_PARTIAL_out_of_range_lat_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_21_PARTIAL_out_of_range_lat_${key}.png
    Remove Files    check_21_PARTIAL_out_of_range_lat_${key}.png
    # 22_PARTIAL_unparseable_rows.vot
    Load Catalog File    22_PARTIAL_unparseable_rows.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_22_PARTIAL_unparseable_rows_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_22_PARTIAL_unparseable_rows_${key}.png
    Remove Files    check_22_PARTIAL_unparseable_rows_${key}.png
    # 30_coords_past_display_cut.vot
    Load Catalog File    30_coords_past_display_cut.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_30_coords_past_display_cut_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_30_coords_past_display_cut_${key}.png
    Remove Files    check_30_coords_past_display_cut_${key}.png
    # 31_coords_past_display_cut_string_nounits.vot
    Load Catalog File    31_coords_past_display_cut_string_nounits.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_31_coords_past_display_cut_string_nounits_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_31_coords_past_display_cut_string_nounits_${key}.png
    Remove Files    check_31_coords_past_display_cut_string_nounits_${key}.png
    # 32_decoy_error_columns.vot
    Load Catalog File    32_decoy_error_columns.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_32_decoy_error_columns_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_32_decoy_error_columns_${key}.png
    Remove Files    check_32_decoy_error_columns_${key}.png
    # 33_swapped_names.vot
    Load Catalog File    33_swapped_names.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_33_swapped_names_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Identical    check_no_overlay_${key}.png    check_33_swapped_names_${key}.png
    Remove Files    check_33_swapped_names_${key}.png
    # 34_no_coordinate_names.vot
    Load Catalog File    34_no_coordinate_names.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_34_no_coordinate_names_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Identical    check_no_overlay_${key}.png    check_34_no_coordinate_names_${key}.png
    Remove Files    check_34_no_coordinate_names_${key}.png
    # 35_system_priority_icrs.vot
    Load Catalog File    35_system_priority_icrs.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_35_system_priority_icrs_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_35_system_priority_icrs_${key}.png
    Remove Files    check_35_system_priority_icrs_${key}.png
    # 36_system_priority_fk4.vot
    Load Catalog File    36_system_priority_fk4.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_36_system_priority_fk4_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_36_system_priority_fk4_${key}.png
    Remove Files    check_36_system_priority_fk4_${key}.png
    # 40_galactic_decimal.vot
    Load Catalog File    40_galactic_decimal.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_40_galactic_decimal_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_40_galactic_decimal_${key}.png
    Remove Files    check_40_galactic_decimal_${key}.png
    # 41_galactic_sexagesimal.vot
    Load Catalog File    41_galactic_sexagesimal.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_41_galactic_sexagesimal_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_41_galactic_sexagesimal_${key}.png
    Remove Files    check_41_galactic_sexagesimal_${key}.png
    # 42_ecliptic_decimal.vot
    Load Catalog File    42_ecliptic_decimal.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_42_ecliptic_decimal_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_42_ecliptic_decimal_${key}.png
    Remove Files    check_42_ecliptic_decimal_${key}.png
    # 43_ecliptic_sexagesimal.vot
    Load Catalog File    43_ecliptic_sexagesimal.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_43_ecliptic_sexagesimal_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_43_ecliptic_sexagesimal_${key}.png
    Remove Files    check_43_ecliptic_sexagesimal_${key}.png
    # 44_ecliptic_fk4.vot
    Load Catalog File    44_ecliptic_fk4.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_44_ecliptic_fk4_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_44_ecliptic_fk4_${key}.png
    Remove Files    check_44_ecliptic_fk4_${key}.png
    # 45_fk4_b1900.vot
    Load Catalog File    45_fk4_b1900.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_45_fk4_b1900_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_45_fk4_b1900_${key}.png
    Remove Files    check_45_fk4_b1900_${key}.png
    # 50_pixel0_numeric.vot
    Load Catalog File    50_pixel0_numeric.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_50_pixel0_numeric_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_50_pixel0_numeric_${key}.png
    Remove Files    check_50_pixel0_numeric_${key}.png
    # 51_pixel0_string_nounits.vot
    Load Catalog File    51_pixel0_string_nounits.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_51_pixel0_string_nounits_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_51_pixel0_string_nounits_${key}.png
    Remove Files    check_51_pixel0_string_nounits_${key}.png
    # 52_pixel1_numeric.vot
    Load Catalog File    52_pixel1_numeric.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_52_pixel1_numeric_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_52_pixel1_numeric_${key}.png
    Remove Files    check_52_pixel1_numeric_${key}.png
    # 53_pixel0_angular_decoy.vot
    Load Catalog File    53_pixel0_angular_decoy.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_53_pixel0_angular_decoy_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_53_pixel0_angular_decoy_${key}.png
    Remove Files    check_53_pixel0_angular_decoy_${key}.png
    # 60_stream_late_string_format.vot
    Load Catalog File    60_stream_late_string_format.vot
    Click Element    data:testid:catalog-plot-button
    Mouse Out    ${VIEWER_DIV}
    Capture Element Screenshot    ${VIEWER_DIV}    check_60_stream_late_string_format_${key}.png
    Click Element    data:testid:catalog-close-button
    PNG Images Should Be Different    check_no_overlay_${key}.png    check_60_stream_late_string_format_${key}.png
    Remove Files    check_60_stream_late_string_format_${key}.png

    Remove Files    check_no_overlay_${key}.png
    [Teardown]    Kill carta_backend And Close Browser

