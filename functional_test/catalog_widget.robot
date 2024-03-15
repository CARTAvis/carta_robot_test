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
    Click Element    ${SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop    ${CATALOG_WIDGET_DOCK_BUTTON}    ${SPATIAL_PROFILER_TAB}
    Click Element    ${IMAGE_LIST_CLOSE_BUTTON}
    Click Element    ${ANIMATOR_CLOSE_BUTTON}
    Click Element    ${REGION_LIST_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0
    Set Selenium Speed    0
    Element Should Contain    ${CATALOG_WIDGET_TITLE}    Catalog : cosmos_mega_simbad.xml
    Element Should Contain    ${CATALOG_WIDGET_SYSTEM_DROPDOWN_ACTIVE_CONTEXT}    ICRS
    
    # check the context of the upper table
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[3]/div/div[2]/div[2]/div/div/div/div[1]/div    TYPED_ID
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    string
    Checkbox Should Be Selected    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div/label/input
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    Raw identifier as typed in the query
   
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[3]/div/div[2]/div[2]/div/div/div/div[2]/div    ANG_DIST
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[5]/div    arcsec
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[6]/div    float
    Checkbox Should Be Selected    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[7]/div/label/input
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div    Angular distance from the center

    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[3]/div/div[2]/div[2]/div/div/div/div[5]/div    RA_d
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[17]/div    deg
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[18]/div    double
    Checkbox Should Be Selected    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[19]/div/label/input
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[20]/div    Right ascension

    # check the context of the lower table
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[1]/div[2]/div[1]/div[1]/div/div/label/span[2]/span    TYPED_ID
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[2]/div[1]/div[1]/div/div/label/span[2]/span    ANG_DIST
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[3]/div[2]/div[1]/div[1]/div/div/label/span[2]/span    MAIN_ID
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[4]/div[2]/div[1]/div[1]/div/div/label/span[2]/span    OTYPE_S
    
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    1.2400000095367432
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    ZFOURGE COSMOS 5366
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    Galaxy
    
    # check the context in the filtering info field
    Element Should Contain    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    Showing 1 to 50 of total 100000 entries
    [Teardown]    Kill carta_backend And Close Browser



Load Catalog File In FITS Format
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cosmos_spitzer3.6micron.fits
    Load Catalog File    cosmos_mega_simbad.fits
    # dock the catalog widget and close widgets to create more space
    Click Element    ${SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop    ${CATALOG_WIDGET_DOCK_BUTTON}    ${SPATIAL_PROFILER_TAB}
    Click Element    ${IMAGE_LIST_CLOSE_BUTTON}
    Click Element    ${ANIMATOR_CLOSE_BUTTON}
    Click Element    ${REGION_LIST_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0
    Set Selenium Speed    0
    Element Should Contain    ${CATALOG_WIDGET_TITLE}    Catalog : cosmos_mega_simbad.fits
    Element Should Contain    ${CATALOG_WIDGET_SYSTEM_DROPDOWN_ACTIVE_CONTEXT}    ICRS

    # check the context of the upper table
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[3]/div/div[2]/div[2]/div/div/div/div[1]/div    TYPED_ID
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    string
    Checkbox Should Be Selected    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div/label/input
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    Raw identifier as typed in the query
   
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[3]/div/div[2]/div[2]/div/div/div/div[2]/div    ANG_DIST
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[5]/div    arcsec
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[6]/div    float
    Checkbox Should Be Selected    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[7]/div/label/input
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div    Angular distance from the center

    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[3]/div/div[2]/div[2]/div/div/div/div[5]/div    RA_d
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[17]/div    deg
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[18]/div    double
    Checkbox Should Be Selected    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[19]/div/label/input
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[20]/div    Right ascension

    # check the context of the lower table
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[1]/div[2]/div[1]/div[1]/div/div/label/span[2]/span    TYPED_ID
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[2]/div[1]/div[1]/div/div/label/span[2]/span    ANG_DIST
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[3]/div[2]/div[1]/div[1]/div/div/label/span[2]/span    MAIN_ID
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[4]/div[2]/div[1]/div[1]/div/div/label/span[2]/span    OTYPE_S
    
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    1.2400000095367432
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    ZFOURGE COSMOS 5366
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    Galaxy
    
    # check the context in the filtering info field
    Element Should Contain    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    Showing 1 to 50 of total 100000 entries
    [Teardown]    Kill carta_backend And Close Browser


Catalog Filtering And Sorting
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cosmos_spitzer3.6micron.fits
    Load Catalog File    cosmos_mega_simbad.xml
    # dock the catalog widget and close widgets to create more space
    Click Element    ${SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop    ${CATALOG_WIDGET_DOCK_BUTTON}    ${SPATIAL_PROFILER_TAB}
    Click Element    ${IMAGE_LIST_CLOSE_BUTTON}
    Click Element    ${ANIMATOR_CLOSE_BUTTON}
    Click Element    ${REGION_LIST_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    # apply a filter to the ANG_DIST column
    Input Text    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[2]/div[2]/div[2]/span/div/input    50..100
    Click Element    ${CATALOG_WIDGET_FILTER_BUTTON}

    # check the context in the filtering info field and the context in the lower table
    Element Should Contain    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    Showing 1 to 50 of 1732 filtered entries. Total 100000 entries
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    50.060001373291016
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    COSMOS 1611507
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    Galaxy
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[2]/div[1]/div[1]/div/div/label
    Element Should Contain    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    Showing 1 to 50 of 1732 filtered entries. Total 100000 entries
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    50.060001373291016
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    COSMOS 1611507
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    Galaxy
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[2]/div[1]/div[1]/div/div/label
    Element Should Contain    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    Showing 1 to 50 of 1732 filtered entries. Total 100000 entries
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    99.9800033569336
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    COSMOS 1612741
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    Galaxy
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[3]/div[2]/div[1]/div[1]/div/div/label
    Element Should Contain    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    Showing 1 to 50 of 1732 filtered entries. Total 100000 entries
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    54.189998626708984
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    2MASS J09583283+0144413
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    Star

    Click Element    ${CATALOG_WIDGET_RESET_BUTTON}
    Element Should Contain    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    Showing 1 to 50 of total 100000 entries

    # apply a filter to the OTYPE_S column
    Input Text    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[4]/div[2]/div[2]/div[2]/span/div/input    SN
    Click Element    ${CATALOG_WIDGET_FILTER_BUTTON}

    # check the context in the filtering info field and the context in the lower table
    Element Should Contain    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    Showing 1 to 50 of 60 filtered entries. Total 100000 entries
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    29.3799991607666
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    SNLS 07D2kh
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    SN

    # apply another filter to the ANG_DIST column
    Input Text    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[2]/div[2]/div[2]/span/div/input    50..100
    Click Element    ${CATALOG_WIDGET_FILTER_BUTTON}

    # check the context in the filtering info field and the context in the lower table
    Element Should Contain    ${CATALOG_WIDGET_TABLE_FILTERING_INFO}    Showing 1 to 2 of 2 filtered entries. Total 100000 entries
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    58.400001525878906
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    [RRS2014] COS12Rea
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    SN    

    [Teardown]    Kill carta_backend And Close Browser


Catalog Column Show And Hide
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cosmos_spitzer3.6micron.fits
    Load Catalog File    cosmos_mega_simbad.xml
    # dock the catalog widget and close widgets to create more space
    Click Element    ${SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop    ${CATALOG_WIDGET_DOCK_BUTTON}    ${SPATIAL_PROFILER_TAB}
    Click Element    ${IMAGE_LIST_CLOSE_BUTTON}
    Click Element    ${ANIMATOR_CLOSE_BUTTON}
    Click Element    ${REGION_LIST_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    # hide TYPED_ID column by setting the toggle to OFF
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div/label
    # hide ANG_DIST column by setting the toggle to OFF
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[7]/div/label
    # hide MAIN_ID column by setting the toggle to OFF
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[11]/div/label
    # check the context in the lower table
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div    Galaxy
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    150.116684
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    2.235136
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    NaN

    # show ANG_DIST column by setting the toggle to ON
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[7]/div/label
    # check the context in the lower table
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div    1.2400000095367432
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    Galaxy
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    150.116684
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    2.235136

    # show TYPED_ID column by setting the toggle to ON
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div/label
    # check the context in the lower table
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    1.2400000095367432
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    Galaxy
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    150.116684

    # show MAIN_ID column by setting the toggle to ON
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[11]/div/label
    # check the context in the lower table
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    1.2400000095367432
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    ZFOURGE COSMOS  5366
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    Galaxy    
    [Teardown]    Kill carta_backend And Close Browser


Catalog Rendering As Image Overlay With Column Mapping
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cosmos_spitzer3.6micron.fits
    Load Catalog File    cosmos_0_simbad.xml
    # dock the catalog widget and close widgets to create more space
    Click Element    ${SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop    ${CATALOG_WIDGET_DOCK_BUTTON}    ${SPATIAL_PROFILER_TAB}
    Click Element    ${IMAGE_LIST_CLOSE_BUTTON}
    Click Element    ${ANIMATOR_CLOSE_BUTTON}
    Click Element    ${REGION_LIST_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    # set up ra and dec column for rendering image overlay
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_X_DROPDOWN}
    Click Element    xpath:/html/body/div[7]/div/div/div/div/div/ul/li[3]/a/div
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_Y_DROPDOWN}
    Click Element    xpath:/html/body/div[8]/div/div/div/div/div/ul/li[4]/a/div
    Click Element    ${CATALOG_WIDGET_PLOT_BUTTON}

    # set up size mapping
    # click the size button to launch the settings dialog
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[1]/div[3]/a[1]
    # click the shape dropdown menu to see its context
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[2]/div/span/span/div/button
    # select the line segment shape
    Click Element    xpath:/html/body/div[9]/div/div/div/div/div/ul/li[12]
    # click the column dropdown menu to set up size mapping with respect to the ANG_DIST column
    Click Element    //*[@id="bp3-tab-panel_catalogSettings_5"]/div/div[1]/div/span/span/div/button
    Click Element At Coordinates    //*[@id="bp3-tab-panel_catalogSettings_5"]/div/div[1]/div/span/span/div/button    0    -220
    # click the thickness spinbox to increase the thickness of the line segment shape
    Repeat Keyword    4    Click Element    //*[@id="bp3-tab-panel_catalogSettings_3"]/div/div[2]/div/span/div/div[2]/button[1]

    # set up color mapping
    # click the color tab
    Click Element    //*[@id="bp3-tab-title_catalogSettings_2"]
    # click the column dropdown menu to set up color mapping with respect to the ANG_DIST column
    Click Element    //*[@id="bp3-tab-panel_catalogSettings_2"]/div/div[3]/div/span/span/div/button
    Click Element At Coordinates    //*[@id="bp3-tab-panel_catalogSettings_2"]/div/div[3]/div/span/span/div/button    0    -180
    # click the color map dropdown menu to select the tab10 color map
    Click Element    //*[@id="bp3-tab-panel_catalogSettings_2"]/div/div[5]/div/span/span/div/button
    Click Element    xpath://*[contains(text(), "tab10")]  

    # set up orientation mapping
    # click the orientation tab
    Click Element    //*[@id="bp3-tab-title_catalogSettings_4"]
    # click the column dropdown menu to set up orientation mapping with respect to the ANG_DIST column
    Click Element    //*[@id="bp3-tab-panel_catalogSettings_4"]/div/div[1]/div/span/span/div/button
    Click Element At Coordinates    //*[@id="bp3-tab-panel_catalogSettings_4"]/div/div[1]/div/span/span/div/button    0    100

    # close the settings dialog by clicking the x button at the top-right corner
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[1]/div[3]
    
    # use the zoom-in button to zoom in
    Mouse Over    ${VIEWER_DIV}
    Repeat Keyword    4    Click Element   //*[@id="image-panel-0-0"]/div[8]/span[5]/a
    Mouse Out    ${VIEWER_DIV}
    
    #Sleep    1
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png

    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    233,216,331,225
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    215,142,383,218
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    236,352,299,68
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
    Click Element    ${SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop    ${CATALOG_WIDGET_DOCK_BUTTON}    ${SPATIAL_PROFILER_TAB}
    Click Element    ${IMAGE_LIST_CLOSE_BUTTON}
    Click Element    ${ANIMATOR_CLOSE_BUTTON}
    Click Element    ${REGION_LIST_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    # enable scatter plot with x=ANG_DIST y=RA_d
    Click Element    ${CATALOG_WIDGET_RENDERING_TYPE_DROPDOWN}
    Click Element    xpath:/html/body/div[7]/div/div/div/div/div/ul/li[3]
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_X_DROPDOWN}
    Click Element    xpath:/html/body/div[8]/div/div/div/div/div/ul/li[2]
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_Y_DROPDOWN}
    Click Element    xpath:/html/body/div[9]/div/div/div/div/div/ul/li[3]
    Click Element    ${CATALOG_WIDGET_PLOT_BUTTON}
    
    ${key}=    Generate Random String    8
    Capture Element Screenshot    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[2]    check_${key}.png
    # click the plot button in the catalog scatter plot widget
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[3]/div[2]/a[2]
    Capture Element Screenshot    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[2]    check2_${key}.png
    # click the x dropdown menu in the catalog scatter plot widget to select DEC_d
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[1]/div[2]/div/span/span/div/button
    Click Element At Coordinates    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[1]/div[2]/div/span/span/div/button    0    150
    Capture Element Screenshot    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[2]    check3_${key}.png

    # click the statistic source dropdown menu to select ANG_DIST
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[1]/div[4]/div/span/span/div/button
    Click Element    xpath:/html/body/div[11]/div/div/div/div/div/ul/li[2]
    # mouse over the scatter plot element
    Mouse Over    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[2]
    # check the context in the info field of the scatter plot widget
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[3]/div[1]/div/pre    DEC_d: 2.21421, RA_d: 150.08293
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[3]/div[1]/div/pre    ANG_DIST - count: 20000, valid count: 20000, mean: 2.9599e+2, rms: 3.1643e+2, stddev: 1.1191e+2, min: 1.2400e+0, max: 4.6845e+2

    # click the linear fit button in the catalog scatter plot widget
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[3]/div[2]/a[1]
    Capture Element Screenshot    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[2]    check4_${key}.png

    # close the catalog file and check the state of the scatter plot widget
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[3]/div/a[3]
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div/div[1]/div[1]    Catalog 2D scatter
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div/div[2]/div    No catalog file loaded

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
    Click Element    ${SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop    ${CATALOG_WIDGET_DOCK_BUTTON}    ${SPATIAL_PROFILER_TAB}
    Click Element    ${IMAGE_LIST_CLOSE_BUTTON}
    Click Element    ${ANIMATOR_CLOSE_BUTTON}
    Click Element    ${REGION_LIST_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    # enable histogram plot
    Click Element    ${CATALOG_WIDGET_RENDERING_TYPE_DROPDOWN}
    Click Element    xpath:/html/body/div[7]/div/div/div/div/div/ul/li[2]
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_X_DROPDOWN}
    Click Element    xpath:/html/body/div[8]/div/div/div/div/div/ul/li[2]
    Click Element    ${CATALOG_WIDGET_PLOT_BUTTON}

    ${key}=    Generate Random String    8
    Capture Element Screenshot    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[2]    check_${key}.png
    # click the plot button in the catalog histogram plot widget
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[3]/div[2]/a
    # click the bins text field and enter 0 to set the bins from 8 to 80
    Input Text    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[1]/div[3]/div/div/div/input    0
    Capture Element Screenshot    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[2]    check2_${key}.png
    # click the x dropdown menu in the catalog histogram plot widget to select DEC_d 
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[1]/div[2]/div/span/span/div/button
    Click Element At Coordinates    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[1]/div[2]/div/span/span/div/button    0    150
    Capture Element Screenshot    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[2]    check3_${key}.png
    
    # mouse over the histogram plot element
    Mouse Over    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[2]
    # click the statistic source dropdown menu to select DEC_d
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[1]/div[5]/div/span/span/div/button
    Click Element    xpath:/html/body/div[10]/div/div/div/div/div/ul/li[4]
    # check the context in the info field of the catalog histogram plot widget
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[3]/div[1]/div/pre    DEC_d: 2.2141465077500007, Count: 378
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[3]/div[1]/div/pre    DEC_d - count: 20000, valid count: 20000, mean: 2.2492e+0, rms: 2.2500e+0, stddev: 6.0720e-2, min: 2.1053e+0, max: 2.3650e+0

    # close the catalog file and check the state of the histogram plot widget
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[3]/div/a[3]
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div/div[1]/div[1]    Catalog Histogram
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div/div[2]/div    No catalog file loaded

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
    Click Element    ${SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop    ${CATALOG_WIDGET_DOCK_BUTTON}    ${SPATIAL_PROFILER_TAB}
    Click Element    ${IMAGE_LIST_CLOSE_BUTTON}
    Click Element    ${ANIMATOR_CLOSE_BUTTON}
    Click Element    ${REGION_LIST_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    # set up image overlay, scatter plot and histogram plot
    # plot image overlay with x=RA_d and y=DEC_d
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_X_DROPDOWN}
    Click Element    xpath:/html/body/div[7]/div/div/div/div/div/ul/li[3]/a/div
    Click Element    ${CATALOG_WIDGET_RENDERING_COLUMN_Y_DROPDOWN}
    Click Element    xpath:/html/body/div[8]/div/div/div/div/div/ul/li[4]/a/div
    Click Element    ${CATALOG_WIDGET_PLOT_BUTTON}

    # plot scatter plot with x=RA_d
    Click Element    ${CATALOG_WIDGET_RENDERING_TYPE_DROPDOWN}
    Click Element At Coordinates    ${CATALOG_WIDGET_RENDERING_TYPE_DROPDOWN}    0    -30
    Click Element    ${CATALOG_WIDGET_PLOT_BUTTON}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[2]    check_scatter_${key}.png

    # plot histogram plot with x=RA_d
    Click Element    ${CATALOG_WIDGET_RENDERING_TYPE_DROPDOWN}
    Click Element At Coordinates    ${CATALOG_WIDGET_RENDERING_TYPE_DROPDOWN}    0    -60
    Click Element    ${CATALOG_WIDGET_PLOT_BUTTON}

    Capture Element Screenshot    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div[2]/div[1]/div[2]/div/div[2]    check_histogram_${key}.png
    # click the histogram plot element
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div[2]/div[1]/div[2]/div/div[2]
    Capture Element Screenshot    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div[2]/div[1]/div[2]/div/div[2]    check_histogram_selected_${key}.png
    # close the catalog histogram plot widget
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div[2]/div[1]/div[1]/div[4]
    Capture Element Screenshot    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[2]/div/div[2]    check_scatter_selected_${key}.png
    # close the catalog scatter plot widget
    Click Element    //*[@id="root"]/div/div[${MAGIC_INDEX2}]/div/div[1]/div[1]/div[4]

    #Sleep    1
    # check the context in the catalog table
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[17]/div    73.06999969482422
    Capture Element Screenshot    ${VIEWER_DIV}    check_image_overlay_selected_${key}.png
    Capture Element Screenshot    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div    check_table_selected_${key}.png
    
    Click Element    ${CATALOG_WIDGET_RESET_BUTTON}
    #Sleep    1
    # on the mac mini, this is not always true. sometimes it is 8.279999732971191, the cell above 9.220000267028809
    #Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[12]/div    9.220000267028809
    Capture Element Screenshot    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div    check_table_reset_${key}.png
    Capture Element Screenshot    ${VIEWER_DIV}    check_image_overlay_reset_${key}.png

    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_histogram_selected_${key}.png    338,20,338,227
    PNG Two Pixels Should Not Have Matched RGBA    check_histogram_selected_${key}.png    338,20,342,16
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


Load And Manage Two Catalog Files
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cosmos_spitzer3.6micron.fits
    Load Catalog File    cosmos_mega_simbad.xml
    # dock the catalog widget and close widgets to create more space
    Click Element    ${SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop    ${CATALOG_WIDGET_DOCK_BUTTON}    ${SPATIAL_PROFILER_TAB}
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
    Element Should Contain    //*[@id="root"]/div/div[${MAGIC_INDEX}]/div[2]/div/div[3]/div[2]/div[2]/div/div/div/h4    No catalog file loaded
    [Teardown]    Kill carta_backend And Close Browser


Fetch VizieR Catalog And Visualize 
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    m51_151_MHz.fits
    # enable catalog query dialog
    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[6]/a
    # switch to VizieR catalog
    Click Element    //*[@id="root"]/div/div[3]/div/div[1]/div[2]/div/div[2]/div/div[1]/div/span/span/div/button
    Click Element    xpath://*[contains(text(), "VizieR")]
    # set up keyword for query
    Input Text    //*[@id="root"]/div/div[3]/div/div[1]/div[2]/div/div[2]/div/div[2]/div/div/input    SDSS
    # make query
    Click Element    //*[@id="root"]/div/div[3]/div/div[1]/div[2]/div/div[3]/div[2]/a[1]
    Wait Until Element Does Not Contain    //*[@id="root"]/div/div[3]/div/div[1]/div[2]/div/div[4]/div[1]    Querying VizieR    timeout=30
    # select a catalog
    Click Element    //*[@id="root"]/div/div[3]/div/div[1]/div[2]/div/div[2]/div/div[7]/div/div/div/div/div/div/input
    #Click Element    xpath://*[contains(text(), "v/154/sdss16")]     
    # 4. Sloan Digital Sky Surveys (SDSS), Release 16 (DR16) (Ahumada+, 2020) * output of the SDSS photometric catalog
    Click Element    xpath:/html/body/div[7]/div/div/div/div/div/ul/li[4]/a/div
    # retrive 
    Click Element   //*[@id="root"]/div/div[3]/div/div[1]/div[2]/div/div[4]/div[2]/a[3]
    Wait Until Page Does Not Contain    Online Catalog Query    timeout=30
    Wait Until Page Contains Element    //*[@id="root"]/div/div[18]/div/div/div[2]/div/div[3]/div[1]/table/tbody/tr/td/pre
    # enable catalog image overlay
    # workaround for element not found issue [TODO: investigate this]
    Set Selenium Speed    0.2
    Click Element    //*[@id="root"]/div/div[18]/div/div/div[2]/div/div[3]/div[2]/div/div[1]/div/span/span/div/button    
    Click Element    xpath:/html/body/div[6]/div/div/div/div/div/ul/li[6]/a/div
    Click Element    //*[@id="root"]/div/div[18]/div/div/div[2]/div/div[3]/div[2]/div/div[2]/div/span/span/div/button
    Click Element    xpath:/html/body/div[7]/div/div/div/div/div/ul/li[7]/a/div
    Click Element    //*[@id="root"]/div/div[18]/div/div/div[2]/div/div[3]/div[3]/div/a[4]
    Set Selenium Speed    ${DELAY}
    # enable scatter plot
    Click Element    //*[@id="root"]/div/div[18]/div/div/div[2]/div/div[3]/div[2]/div/span/span/div/button
    Click Element    xpath:/html/body/div[8]/div/div/div/div/div/ul/li[3]/a/div
    Click Element    //*[@id="root"]/div/div[18]/div/div/div[2]/div/div[3]/div[3]/div/a[4]
    ${key}=    Generate Random String    8
    Capture Element Screenshot    //*[@id="root"]/div/div[18]/div[2]/div/div[2]/div/div[2]    scatter_${key}.png
    Click Element    //*[@id="root"]/div/div[18]/div[2]/div/div[1]/div[4]
    # enable histogram plot
    Click Element    //*[@id="root"]/div/div[18]/div/div/div[2]/div/div[3]/div[2]/div/span/span/div/button
    Click Element    xpath:/html/body/div[8]/div/div/div/div/div/ul/li[2]/a/div
    Click Element    //*[@id="root"]/div/div[18]/div/div/div[2]/div/div[3]/div[3]/div/a[4]
    Capture Element Screenshot    //*[@id="root"]/div/div[18]/div[2]/div/div[2]/div/div[2]    histogram_${key}.png
    Click Element    //*[@id="root"]/div/div[18]/div[2]/div/div[1]/div[4]
    # close catalog widget
    Click Element    //*[@id="root"]/div/div[18]/div/div/div[1]/div[5]
    
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
    Repeat Keyword    2    Click Element    //*[@id="image-panel-0-0"]/div[8]/span[5]/a
    Mouse Out    ${VIEWER_DIV}
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    image_before_${key}.png
    # enable catalog query dialog
    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[6]/a
    # set search radius
    Click Element    //*[@id="root"]/div/div[3]/div/div[1]/div[2]/div/div[2]/div/div[3]/div/span[3]/button
    Element Attribute Value Should Be    //*[@id="root"]/div/div[3]/div/div[1]/div[2]/div/div[2]/div/div[3]/div/span[1]/div/div/input    value    0.8045196532714395
    # set search center
    Click Element    //*[@id="root"]/div/div[3]/div/div[1]/div[2]/div/div[2]/div/div[4]/div/span[4]/button
    Element Attribute Value Should Be    //*[@id="root"]/div/div[3]/div/div[1]/div[2]/div/div[2]/div/div[4]/div/span[2]/div/div/input    value    7:08:30.8601970197
    Element Attribute Value Should Be    //*[@id="root"]/div/div[3]/div/div[1]/div[2]/div/div[2]/div/div[4]/div/span[3]/div/div/input    value    -10:33:15.4199949321
    # make query
    Click Element    //*[@id="root"]/div/div[3]/div/div[1]/div[2]/div/div[3]/div[2]/a[1]
    Wait Until Page Does Not Contain    Online Catalog Query    timeout=30    
    # enable catalog image overlay
    Click Element    //*[@id="root"]/div/div[18]/div/div/div[2]/div/div[3]/div[2]/div/div[1]/div/span/span/div/button
    Click Element    xpath:/html/body/div[7]/div/div/div/div/div/ul/li[2]/a/div
    Click Element    //*[@id="root"]/div/div[18]/div/div/div[2]/div/div[3]/div[2]/div/div[2]/div/span/span/div/button
    Click Element    xpath:/html/body/div[8]/div/div/div/div/div/ul/li[3]/a/div
    Click Element    //*[@id="root"]/div/div[18]/div/div/div[2]/div/div[3]/div[3]/div/a[4]
    # enable scatter plot
    Click Element    //*[@id="root"]/div/div[18]/div/div/div[2]/div/div[3]/div[2]/div/span/span/div/button
    Click Element    xpath:/html/body/div[9]/div/div/div/div/div/ul/li[3]/a/div
    Click Element    //*[@id="root"]/div/div[18]/div/div/div[2]/div/div[3]/div[3]/div/a[4]
    Capture Element Screenshot    //*[@id="root"]/div/div[18]/div[2]/div/div[2]/div/div[2]    scatter_${key}.png
    Click Element    //*[@id="root"]/div/div[18]/div[2]/div/div[1]/div[4]
    # enable histogram plot
    Click Element    //*[@id="root"]/div/div[18]/div/div/div[2]/div/div[3]/div[2]/div/span/span/div/button
    Click Element    xpath:/html/body/div[9]/div/div/div/div/div/ul/li[2]/a/div
    Click Element    //*[@id="root"]/div/div[18]/div/div/div[2]/div/div[3]/div[3]/div/a[4]
    Capture Element Screenshot    //*[@id="root"]/div/div[18]/div[2]/div/div[2]/div/div[2]    histogram_${key}.png
    Click Element    //*[@id="root"]/div/div[18]/div[2]/div/div[1]/div[4]
    # close catalog widget
    Click Element    //*[@id="root"]/div/div[18]/div/div/div[1]/div[5]
    
    Capture Element Screenshot    ${VIEWER_DIV}    image_after_${key}.png
    
    # check png images
    Set Selenium Speed    0
    PNG Images Should Be Different    image_before_${key}.png    image_after_${key}.png
    PNG Two Pixels Should Have Matched RGBA    scatter_${key}.png    157,189,563,65
    PNG Two Pixels Should Have Matched RGBA    histogram_${key}.png    118,162,583,89
    Remove Files    image_before_${key}.png    image_after_${key}.png    scatter_${key}.png    histogram_${key}.png
    [Teardown]    Kill carta_backend And Close Browser