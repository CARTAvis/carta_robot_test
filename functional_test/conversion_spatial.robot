*** Settings ***
Documentation     Test conversions of wcs
Resource          ../resource.robot

*** Test Cases ***
WCS Conversion from FK5 J2000
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Click Element    data:testid:online-data-query-dialog-button
    # check initial coordinate in AUTO (FK5)
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    17:56:21.2831398356
    Should Be Equal As Strings    ${y_coord}    -21:57:22.3856536834
    # switch to Ecliptic
    Click Element    ${ONLINE_DATA_QUERY_WCS_DROPDOWN}
    Click Element    //*[@id="listbox-4"]/li[2]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    269.1545027510
    Should Be Equal As Strings    ${y_coord}    1.4803885501
    # switch to FK4
    Click Element    ${ONLINE_DATA_QUERY_WCS_DROPDOWN}
    Click Element    //*[@id="listbox-4"]/li[3]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    17:53:20.5714838115
    Should Be Equal As Strings    ${y_coord}    -21:56:59.8770223606
    # switch to FK5
    Click Element    ${ONLINE_DATA_QUERY_WCS_DROPDOWN}
    Click Element    //*[@id="listbox-4"]/li[4]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    17:56:21.2831398356
    Should Be Equal As Strings    ${y_coord}    -21:57:22.3856536834 
    # switch to Galactic
    Click Element    ${ONLINE_DATA_QUERY_WCS_DROPDOWN}
    Click Element    //*[@id="listbox-4"]/li[5]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    7.2369196314
    Should Be Equal As Strings    ${y_coord}    1.4895372987
    # switch to ICRS
    Click Element    ${ONLINE_DATA_QUERY_WCS_DROPDOWN}
    Click Element    //*[@id="listbox-4"]/li[6]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    17:56:21.2813601233
    Should Be Equal As Strings    ${y_coord}    -21:57:22.4054064313
    [Teardown]    Kill carta_backend And Close Browser


WCS Conversion from Galactic
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    model_imregrid_galactic.fits
    Click Element    data:testid:online-data-query-dialog-button
    # check initial coordinate in AUTO (GAL)
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    84.2007267086
    Should Be Equal As Strings    ${y_coord}    -19.7102272277
    # switch to Ecliptic
    Click Element    ${ONLINE_DATA_QUERY_WCS_DROPDOWN}
    Click Element    //*[@id="listbox-4"]/li[2]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    345.1884844745
    Should Be Equal As Strings    ${y_coord}    39.1064677066
    # switch to FK4
    Click Element    ${ONLINE_DATA_QUERY_WCS_DROPDOWN}
    Click Element    //*[@id="listbox-4"]/li[3]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    21:57:48.5633392682
    Should Be Equal As Strings    ${y_coord}    29:44:48.5313454438
    # switch to FK5
    Click Element    ${ONLINE_DATA_QUERY_WCS_DROPDOWN}
    Click Element    //*[@id="listbox-4"]/li[4]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    22:00:03.0045335688
    Should Be Equal As Strings    ${y_coord}    29:59:14.0468892630
    # switch to Galactic
    Click Element    ${ONLINE_DATA_QUERY_WCS_DROPDOWN}
    Click Element    //*[@id="listbox-4"]/li[5]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    84.2007267086
    Should Be Equal As Strings    ${y_coord}    -19.7102272277
    # switch to ICRS
    Click Element    ${ONLINE_DATA_QUERY_WCS_DROPDOWN}
    Click Element    //*[@id="listbox-4"]/li[6]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    22:00:03.0025187998
    Should Be Equal As Strings    ${y_coord}    29:59:14.0290612027
    [Teardown]    Kill carta_backend And Close Browser


WCS Conversion from FK4 B1950
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    binary_FK4.fits
    Click Element    data:testid:online-data-query-dialog-button
    # check initial coordinate in AUTO (FK4)
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    9:57:20.2590863020
    Should Be Equal As Strings    ${y_coord}    10:14:24.2946741144
    # switch to Ecliptic
    Click Element    ${ONLINE_DATA_QUERY_WCS_DROPDOWN}
    Click Element    //*[@id="listbox-4"]/li[2]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    148.5878560640
    Should Be Equal As Strings    ${y_coord}    -2.0945812049
    # switch to FK4
    Click Element    ${ONLINE_DATA_QUERY_WCS_DROPDOWN}
    Click Element    //*[@id="listbox-4"]/li[3]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    9:57:20.2590863020
    Should Be Equal As Strings    ${y_coord}    10:14:24.2946741144
    # switch to FK5
    Click Element    ${ONLINE_DATA_QUERY_WCS_DROPDOWN}
    Click Element    //*[@id="listbox-4"]/li[4]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    10:00:00.0337629953
    Should Be Equal As Strings    ${y_coord}    9:59:59.4987492977
    # switch to Galactic
    Click Element    ${ONLINE_DATA_QUERY_WCS_DROPDOWN}
    Click Element    //*[@id="listbox-4"]/li[5]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    227.5431304534
    Should Be Equal As Strings    ${y_coord}    46.1911215465
    # switch to ICRS
    Click Element    ${ONLINE_DATA_QUERY_WCS_DROPDOWN}
    Click Element    //*[@id="listbox-4"]/li[6]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    10:00:00.0323854281
    Should Be Equal As Strings    ${y_coord}    9:59:59.5165800984
    [Teardown]    Kill carta_backend And Close Browser


WCS Conversion from ICRS
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    Click Element    data:testid:online-data-query-dialog-button
    # check initial coordinate in AUTO (ICRS)
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    18:20:21.0138848648
    Should Be Equal As Strings    ${y_coord}    -16:12:10.2000000158
    # switch to Ecliptic
    Click Element    ${ONLINE_DATA_QUERY_WCS_DROPDOWN}
    Sleep    0.2
    # not sure why the listbox id changes to listbox-5 here 
    Click Element    //*[@id="listbox-5"]/li[2]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    274.9233616872
    Should Be Equal As Strings    ${y_coord}    7.1495470092
    # switch to FK4
    Click Element    ${ONLINE_DATA_QUERY_WCS_DROPDOWN}
    Click Element    //*[@id="listbox-5"]/li[3]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    18:17:27.8654359548
    Should Be Equal As Strings    ${y_coord}    -16:13:32.8026574804
    # switch to FK5
    Click Element    ${ONLINE_DATA_QUERY_WCS_DROPDOWN}
    Click Element    //*[@id="listbox-5"]/li[4]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    18:20:21.0155529367
    Should Be Equal As Strings    ${y_coord}    -16:12:10.1793714447
    # switch to Galactic
    Click Element    ${ONLINE_DATA_QUERY_WCS_DROPDOWN}
    Click Element    //*[@id="listbox-5"]/li[5]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    15.0187522929
    Should Be Equal As Strings    ${y_coord}    -0.6683380389
    # switch to ICRS
    Click Element    ${ONLINE_DATA_QUERY_WCS_DROPDOWN}
    Click Element    //*[@id="listbox-5"]/li[6]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    Should Be Equal As Strings    ${x_coord}    18:20:21.0138848648
    Should Be Equal As Strings    ${y_coord}    -16:12:10.2000000158
    [Teardown]    Kill carta_backend And Close Browser


Region Dialog WCS Conversion from FK5 J2000
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    # create a point region
    Click Element    data:testid:point-region-shortcut-button
    Click Element    ${VIEWER_DIV}
    # open region dialog
    Double Click Element    ${VIEWER_DIV}
    # check initial coordinate in AUTO (FK5 J2000)
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    17:56:21.2886455617
    Should Be Equal As Strings    ${y_coord}    -21:57:23.2792706952
    Should Be Equal As Strings    ${image_coord}    Image: (213.968 px, 197.628 px)
    # switch to Ecliptic
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[2]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    269.1545256058
    Should Be Equal As Strings    ${y_coord}    1.4801404628
    Should Be Equal As Strings    ${image_coord}    Image: (213.968 px, 197.628 px)
    # switch to FK4
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[3]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    17:53:20.5766527698
    Should Be Equal As Strings    ${y_coord}    -21:57:00.7710279818
    Should Be Equal As Strings    ${image_coord}    Image: (213.968 px, 197.628 px)
    # switch to FK5
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[4]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    17:56:21.2886455617
    Should Be Equal As Strings    ${y_coord}    -21:57:23.2792706952
    Should Be Equal As Strings    ${image_coord}    Image: (213.968 px, 197.628 px)
    # switch to Galactic
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[5]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    7.2367156081
    Should Be Equal As Strings    ${y_coord}    1.4893942185
    Should Be Equal As Strings    ${image_coord}    Image: (213.968 px, 197.628 px)
    # switch to ICRS
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[6]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    17:56:21.2868658464
    Should Be Equal As Strings    ${y_coord}    -21:57:23.2990234469
    Should Be Equal As Strings    ${image_coord}    Image: (213.968 px, 197.628 px)
    # switch to IMAGE
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[7] 
    Element Should Be Disabled    //*[@id="numericInput-3"]
    Element Should Be Disabled    //*[@id="numericInput-4"]
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${image_coord}    Image: (213.968 px, 197.628 px)
    # switch to IMAGE input options
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[1]/label[1]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-6"]    value    
    Should Be Equal As Strings    ${x_coord}    213.968085106383
    Should Be Equal As Strings    ${y_coord}    197.62765957446808
    [Teardown]    Kill carta_backend And Close Browser


Region Dialog WCS Conversion from Galactic
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    model_imregrid_galactic.fits
    # create a point region
    Click Element    data:testid:point-region-shortcut-button
    Click Element    ${VIEWER_DIV}
    # open region dialog
    Double Click Element    ${VIEWER_DIV}
    # check initial coordinate in AUTO (GAL)
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    84.4050393062
    Should Be Equal As Strings    ${y_coord}    -21.9219635221
    Should Be Equal As Strings    ${image_coord}    Image: (1763.628 px, 1470.323 px)
    # switch to Ecliptic
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[2]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    346.0725092853
    Should Be Equal As Strings    ${y_coord}    36.9984318682
    Should Be Equal As Strings    ${image_coord}    Image: (1763.628 px, 1470.323 px)
    # switch to FK4
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[3]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    22:04:53.9370055236
    Should Be Equal As Strings    ${y_coord}    28:09:29.8874768605
    Should Be Equal As Strings    ${image_coord}    Image: (1763.628 px, 1470.323 px)
    # switch to FK5
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[4]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    22:07:10.5696037016
    Should Be Equal As Strings    ${y_coord}    28:24:10.6539950159
    Should Be Equal As Strings    ${image_coord}    Image: (1763.628 px, 1470.323 px)
    # switch to Galactic
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[5]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    84.4050393062
    Should Be Equal As Strings    ${y_coord}    -21.9219635221
    Should Be Equal As Strings    ${image_coord}    Image: (1763.628 px, 1470.323 px)
    # switch to ICRS
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[6]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    22:07:10.5675998673
    Should Be Equal As Strings    ${y_coord}    28:24:10.6365700164
    Should Be Equal As Strings    ${image_coord}    Image: (1763.628 px, 1470.323 px)
    # switch to IMAGE
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[7]
    Element Should Be Disabled    //*[@id="numericInput-3"]
    Element Should Be Disabled    //*[@id="numericInput-4"]
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${image_coord}    Image: (1763.628 px, 1470.323 px)
    # switch to IMAGE input options
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[1]/label[1]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-6"]    value    
    Should Be Equal As Strings    ${x_coord}    1763.6276595744675
    Should Be Equal As Strings    ${y_coord}    1470.322695035461
    [Teardown]    Kill carta_backend And Close Browser


Region Dialog WCS Conversion from FK4 B1950
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    binary_FK4.fits
    # create a point region
    Click Element    data:testid:point-region-shortcut-button
    Click Element    ${VIEWER_DIV}
    # open region dialog
    Double Click Element    ${VIEWER_DIV}
    # check initial coordinate in AUTO (FK4 B1950)
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    9:57:21.4629108422
    Should Be Equal As Strings    ${y_coord}    10:10:56.9422469881
    Should Be Equal As Strings    ${image_coord}    Image: (2487.727 px, 2298.148 px)
    # switch to Ecliptic
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[2]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    148.6122318595
    Should Be Equal As Strings    ${y_coord}    -2.1470076186
    Should Be Equal As Strings    ${image_coord}    Image: (2487.727 px, 2298.148 px)
    # switch to FK4
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[3]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    9:57:21.4629108422
    Should Be Equal As Strings    ${y_coord}    10:10:56.9422469881
    Should Be Equal As Strings    ${image_coord}    Image: (2487.727 px, 2298.148 px)
    # switch to FK5
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[4]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    10:00:01.2017165463
    Should Be Equal As Strings    ${y_coord}    9:56:32.1024407761
    Should Be Equal As Strings    ${image_coord}    Image: (2487.727 px, 2298.148 px)
    # switch to Galactic
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[5]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    227.6192320001
    Should Be Equal As Strings    ${y_coord}    46.1673447687
    Should Be Equal As Strings    ${image_coord}    Image: (2487.727 px, 2298.148 px)
    # switch to ICRS
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[6]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    10:00:01.2003381203
    Should Be Equal As Strings    ${y_coord}    9:56:32.1202704993
    Should Be Equal As Strings    ${image_coord}    Image: (2487.727 px, 2298.148 px)
    # switch to IMAGE
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[7]
    Element Should Be Disabled    //*[@id="numericInput-3"]
    Element Should Be Disabled    //*[@id="numericInput-4"]
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${image_coord}    Image: (2487.727 px, 2298.148 px)
    # switch to IMAGE input options
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[1]/label[1]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-6"]    value    
    Should Be Equal As Strings    ${x_coord}    2487.72695035461
    Should Be Equal As Strings    ${y_coord}    2298.147754137116
    [Teardown]    Kill carta_backend And Close Browser



Region Dialog WCS Conversion from ICRS
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    M17_SWex.fits
    # create a point region
    Click Element    data:testid:point-region-shortcut-button
    Click Element    ${VIEWER_DIV}
    # open region dialog
    Double Click Element    ${VIEWER_DIV}
    # check initial coordinate in AUTO (ICRS)
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    18:20:21.0926658316
    Should Be Equal As Strings    ${y_coord}    -16:12:23.4387694842
    Should Be Equal As Strings    ${image_coord}    Image: (316.663 px, 366.403 px)
    # switch to Ecliptic
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[2]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    274.9235474053
    Should Be Equal As Strings    ${y_coord}    7.1458606916
    Should Be Equal As Strings    ${image_coord}    Image: (316.663 px, 366.403 px)
    # switch to FK4
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[3]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    18:17:27.9395890808
    Should Be Equal As Strings    ${y_coord}    -16:13:46.0469787537
    Should Be Equal As Strings    ${image_coord}    Image: (316.663 px, 366.403 px)
    # switch to FK5
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[4]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    18:20:21.0943339351
    Should Be Equal As Strings    ${y_coord}    -16:12:23.4181408712
    Should Be Equal As Strings    ${image_coord}    Image: (316.663 px, 366.403 px)
    # switch to Galactic
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[5]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    15.0156576674
    Should Be Equal As Strings    ${y_coord}    -0.6703498775
    Should Be Equal As Strings    ${image_coord}    Image: (316.663 px, 366.403 px)
    # switch to ICRS
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[6]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-3"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-4"]    value
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${x_coord}    18:20:21.0926658316
    Should Be Equal As Strings    ${y_coord}    -16:12:23.4387694842
    Should Be Equal As Strings    ${image_coord}    Image: (316.663 px, 366.403 px)
    # switch to IMAGE
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[2]/select/option[7]
    Element Should Be Disabled    //*[@id="numericInput-3"]
    Element Should Be Disabled    //*[@id="numericInput-4"]
    ${image_coord} =    Get Text   //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[3]/div/span[3]    
    Should Be Equal As Strings    ${image_coord}    Image: (316.663 px, 366.403 px)
    # switch to IMAGE input options
    Click Element    //*[@id="bp6-tab-panel_regionDialogTabs_0"]/div/div[2]/div/div/div[1]/label[1]
    ${x_coord} =    Get Element Attribute    //*[@id="numericInput-5"]    value
    ${y_coord} =    Get Element Attribute    //*[@id="numericInput-6"]    value    
    Should Be Equal As Strings    ${x_coord}    316.6631205673759
    Should Be Equal As Strings    ${y_coord}    366.403073286052
    [Teardown]    Kill carta_backend And Close Browser

WCS Sexagesimal to Degree
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    # enable the image viewer settings dialog
    Click Element    ${VIEWER_SETTINGS_DIALOG}
    Click Element    id:bp6-tab-title_imageViewSettingsTabs_Numbers
    # customize to show degrees
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Numbers"]/div/div/div/div[5]/div
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Numbers"]/div/div/div/div[6]/div/div[1]/div/div/select/option[3]
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Numbers"]/div/div/div/div[6]/div/div[2]/div/div/select/option[3]
    # close the image viewer settings dialog
    Click Element    ${VIEWER_SETTINGS_DIALOG_CLOSE_BUTTON}
    # update cursor position
    Mouse Over    ${VIEWER_DIV}
    # check text in cursor info bar
    Element Text Should Be    ${VIEWER_CURSOR_INFO_BAR}    WCS: (269.08870, -21.95647); Image: (214, 198); Value: 1.35843 Jy/beam.km/s ; Polarization: Stokes I
    [Teardown]    Kill carta_backend And Close Browser


WCS Degree to Sexagesimal
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    model_imregrid_galactic.fits
    # enable the image viewer settings dialog
    Click Element    ${VIEWER_SETTINGS_DIALOG}
    Click Element    id:bp6-tab-title_imageViewSettingsTabs_Numbers
    # customize to show degrees
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Numbers"]/div/div/div/div[5]/div
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Numbers"]/div/div/div/div[6]/div/div[1]/div/div/select/option[1]
    Click Element    //*[@id="bp6-tab-panel_imageViewSettingsTabs_Numbers"]/div/div/div/div[6]/div/div[2]/div/div/select/option[2]
    # close the image viewer settings dialog
    Click Element    ${VIEWER_SETTINGS_DIALOG_CLOSE_BUTTON}
    # update cursor position
    Mouse Over    ${VIEWER_DIV}
    # check text in cursor info bar
    Element Text Should Be    ${VIEWER_CURSOR_INFO_BAR}    WCS: (5:37:37, -21:55:19); Image: (1764, 1470); Value: 0.0 Jy/beam
    [Teardown]    Kill carta_backend And Close Browser
