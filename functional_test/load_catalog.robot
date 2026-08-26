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
    PNG Two Pixels Should Have Matched RGBA    histogram_${key}.png    279,227,655,76
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
    # check the fastest mirror site (vizier.nao.ac.jp in our test environment)
    Element Should Contain    data:testid:catalog-query-use-mirror-url-0-button    vizier.nao.ac.jp
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
    Element Should Contain    data:testid:catalog-query-use-mirror-url-0-button    vizier.nao.ac.jp
    Element Should Contain    data:testid:catalog-query-use-mirror-url-6-button    vizier.inasan.ru
    # reset list to default order
    Click Element    data:testid:catalog-query-reset-mirrors-button
    [Teardown]    Kill carta_backend And Close Browser
