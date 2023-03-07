*** Settings ***
Documentation     Test region of interest support in CARTA 
Resource          ../resource.robot


*** Test Cases ***
Import World Coordinate ds9 Region Made In ds9
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_with_ds9.reg
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0.02
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Region 1
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[5]    Ellipse
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    17:56:21.6479279877
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    -21:57:15.8104802550
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[7]    1.0000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[7]    1.0000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[8]    0.0
    
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[4]    Region 2
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[5]    Ellipse
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    17:56:21.7054319929
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    -21:57:19.7107203749
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[7]    0.9000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[7]    2.4500000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[8]    270.0
    
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[4]    Region 3
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[5]    Rectangle
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    17:56:21.5293200005
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    -21:57:26.2105199833
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    4.9000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    2.7000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[8]    360.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[4]    Region 4
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[5]    Polygon
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    17:56:21.6659046396
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    -21:57:29.9356134124
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    1.9999904633"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    3.3498060226"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[4]    Region 5
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[5]    Line
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    17:56:20.9093646471
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    -21:57:17.1356442971
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[7]    5.9435115276"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[8]    43.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[4]    Annotation 6
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[5]    Vector - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    17:56:21.2651633747
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    -21:57:15.7105185930
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[7]    4.5329991666"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[8]    7.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[4]    Annotation 7
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[5]    Polyline - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[6]    17:56:21.3316565126
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[6]    -21:57:21.1856425240
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[7]    3.2000076294"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[7]    4.6497558594"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[4]    Annotation 8
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[5]    Text - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[6]    17:56:21.0261599764
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[6]    -21:57:25.9106398420
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[7]    1.1337982178"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[7]    0.5106382979"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[4]    Region 9
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[5]    Point
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[6]    17:56:21.0189840214
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[6]    -21:57:29.4605998495
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[4]    Region 10
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[5]    Point
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[6]    17:56:20.8141199666
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[6]    -21:57:28.2106799170
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[4]    Region 11
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[5]    Point
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[6]    17:56:21.0189840159
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[6]    -21:57:30.5405999647
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[4]    Region 12
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[5]    Point
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[6]    17:56:20.8141199674
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[6]    -21:57:29.2906798413
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[4]    Annotation 13
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[5]    Ruler - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[6]    17:56:21.2615758083
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[6]    -21:57:29.0606406413
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[7]    3.7791013191"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[4]    Annotation 14
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[5]    Compass - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[6]    17:56:20.6991120194
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[6]    -21:57:14.7607192644
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[7]    2.0000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[7]    2.0000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[8]    0.0

    # region 1: ellipse
    PNG Two Pixels Should Have Matched RGBA    check.png    280,69,260,88
    PNG Two Pixels Should Have Matched RGBA    check.png    280,69,280,108
    PNG Two Pixels Should Have Matched RGBA    check.png    280,69,299,88

    # region 2: ellipse
    PNG Two Pixels Should Have Matched RGBA    check.png    264,117,246,165
    PNG Two Pixels Should Have Matched RGBA    check.png    264,117,264,213
    PNG Two Pixels Should Have Matched RGBA    check.png    264,117,282,165

    # region 3: rectangle
    PNG Two Pixels Should Have Matched RGBA    check.png    264,266,264,318
    PNG Two Pixels Should Have Matched RGBA    check.png    264,266,360,318
    PNG Two Pixels Should Have Matched RGBA    check.png    264,266,360,266

    # region 4: polygon
    PNG Two Pixels Should Have Matched RGBA    check.png    255,334,255,371
    PNG Two Pixels Should Have Matched RGBA    check.png    255,334,281,397
    PNG Two Pixels Should Have Matched RGBA    check.png    255,334,294,372
    PNG Two Pixels Should Have Matched RGBA    check.png    255,334,294,333
    PNG Two Pixels Should Have Matched RGBA    check.png    255,334,276,362
    
    # region 5: line
    PNG Two Pixels Should Have Matched RGBA    check.png    443,73,520,156

    # annotation 6: vector
    PNG Two Pixels Should Have Matched RGBA    check.png    389,130,383,121
    PNG Two Pixels Should Have Matched RGBA    check.png    389,130,393,120
    PNG Two Pixels Should Have Matched RGBA    check.png    389,130,379,43

    # annotation 7: polyline
    PNG Two Pixels Should Have Matched RGBA    check.png    335,149,346,204
    PNG Two Pixels Should Have Matched RGBA    check.png    335,149,396,238

    # annotation 8: text
    PNG Two Pixels Should Have Matched RGBA    check.png    439,286,444,284
    PNG Two Pixels Should Have Matched RGBA    check.png    439,286,450,289
    PNG Two Pixels Should Have Matched RGBA    check.png    439,286,453,282
    PNG Two Pixels Should Have Matched RGBA    check.png    439,286,460,289

    # region 9, 10 ,11, 12: point
    PNG Two Pixels Should Have Matched RGBA    check.png    451,356,451,377
    PNG Two Pixels Should Have Matched RGBA    check.png    451,356,507,331
    PNG Two Pixels Should Have Matched RGBA    check.png    451,356,507,353

    # annotation 13: ruler
    PNG Two Pixels Should Have Matched RGBA    check.png    369,315,369,380
    PNG Two Pixels Should Have Matched RGBA    check.png    369,315,400,315
    PNG Two Pixels Should Have Matched RGBA    check.png    366,352,390,350

    # annotation 14: compass
    PNG Two Pixels Should Have Matched RGBA    check.png    538,67,538,31
    PNG Two Pixels Should Have Matched RGBA    check.png    538,67,500,67
    PNG Two Pixels Should Have Matched RGBA    check.png    538,67,536,27
    PNG Two Pixels Should Have Matched RGBA    check.png    538,67,490,64
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser


Import World Coordinate ds9 Region Made In ds9 Without Header
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_with_ds9_no_header.reg
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0.02
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Region 1
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[5]    Ellipse
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    17:56:21.6479279877
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    -21:57:15.8104802550
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[7]    1.0000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[7]    1.0000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[8]    0.0
    
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[4]    Region 2
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[5]    Ellipse
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    17:56:21.7054319929
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    -21:57:19.7107203749
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[7]    0.9000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[7]    2.4500000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[8]    270.0
    
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[4]    Region 3
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[5]    Rectangle
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    17:56:21.5293200005
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    -21:57:26.2105199833
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    4.9000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    2.7000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[8]    360.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[4]    Region 4
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[5]    Polygon
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    17:56:21.6659046396
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    -21:57:29.9356134124
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    1.9999904633"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    3.3498060226"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[4]    Region 5
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[5]    Line
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    17:56:20.9093646471
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    -21:57:17.1356442971
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[7]    5.9435115276"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[8]    43.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[4]    Annotation 6
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[5]    Vector - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    17:56:21.2651633747
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    -21:57:15.7105185930
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[7]    4.5329991666"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[8]    7.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[4]    Annotation 7
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[5]    Polyline - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[6]    17:56:21.3316565126
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[6]    -21:57:21.1856425240
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[7]    3.2000076294"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[7]    4.6497558594"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[4]    Annotation 8
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[5]    Text - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[6]    17:56:21.0261599764
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[6]    -21:57:25.9106398420
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[7]    1.1337982178"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[7]    0.5106382979"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[4]    Region 9
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[5]    Point
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[6]    17:56:21.0189840214
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[6]    -21:57:29.4605998495
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[4]    Region 10
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[5]    Point
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[6]    17:56:20.8141199666
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[6]    -21:57:28.2106799170
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[4]    Region 11
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[5]    Point
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[6]    17:56:21.0189840159
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[6]    -21:57:30.5405999647
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[4]    Region 12
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[5]    Point
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[6]    17:56:20.8141199674
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[6]    -21:57:29.2906798413
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[4]    Annotation 13
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[5]    Ruler - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[6]    17:56:21.2615758083
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[6]    -21:57:29.0606406413
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[7]    3.7791013191"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[4]    Annotation 14
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[5]    Compass - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[6]    17:56:20.6991120194
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[6]    -21:57:14.7607192644
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[7]    2.0000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[7]    2.0000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[8]    0.0

    # region 1: ellipse
    PNG Two Pixels Should Have Matched RGBA    check.png    280,69,260,88
    PNG Two Pixels Should Have Matched RGBA    check.png    280,69,280,108
    PNG Two Pixels Should Have Matched RGBA    check.png    280,69,299,88

    # region 2: ellipse
    PNG Two Pixels Should Have Matched RGBA    check.png    264,117,246,165
    PNG Two Pixels Should Have Matched RGBA    check.png    264,117,264,213
    PNG Two Pixels Should Have Matched RGBA    check.png    264,117,282,165

    # region 3: rectangle
    PNG Two Pixels Should Have Matched RGBA    check.png    264,266,264,318
    PNG Two Pixels Should Have Matched RGBA    check.png    264,266,360,318
    PNG Two Pixels Should Have Matched RGBA    check.png    264,266,360,266

    # region 4: polygon
    PNG Two Pixels Should Have Matched RGBA    check.png    255,334,255,371
    PNG Two Pixels Should Have Matched RGBA    check.png    255,334,281,397
    PNG Two Pixels Should Have Matched RGBA    check.png    255,334,294,372
    PNG Two Pixels Should Have Matched RGBA    check.png    255,334,294,333
    PNG Two Pixels Should Have Matched RGBA    check.png    255,334,276,362
    
    # region 5: line
    PNG Two Pixels Should Have Matched RGBA    check.png    443,73,520,156

    # annotation 6: vector
    PNG Two Pixels Should Have Matched RGBA    check.png    389,130,383,121
    PNG Two Pixels Should Have Matched RGBA    check.png    389,130,393,120
    PNG Two Pixels Should Have Matched RGBA    check.png    389,130,379,43

    # annotation 7: polyline
    PNG Two Pixels Should Have Matched RGBA    check.png    335,149,346,204
    PNG Two Pixels Should Have Matched RGBA    check.png    335,149,396,238

    # annotation 8: text
    PNG Two Pixels Should Have Matched RGBA    check.png    439,286,444,284
    PNG Two Pixels Should Have Matched RGBA    check.png    439,286,450,289
    PNG Two Pixels Should Have Matched RGBA    check.png    439,286,453,282
    PNG Two Pixels Should Have Matched RGBA    check.png    439,286,460,289

    # region 9, 10 ,11, 12: point
    PNG Two Pixels Should Have Matched RGBA    check.png    451,356,451,377
    PNG Two Pixels Should Have Matched RGBA    check.png    451,356,507,331
    PNG Two Pixels Should Have Matched RGBA    check.png    451,356,507,353

    # annotation 13: ruler
    PNG Two Pixels Should Have Matched RGBA    check.png    369,315,369,380
    PNG Two Pixels Should Have Matched RGBA    check.png    369,315,400,315
    PNG Two Pixels Should Have Matched RGBA    check.png    366,352,390,350

    # annotation 14: compass
    PNG Two Pixels Should Have Matched RGBA    check.png    538,67,538,31
    PNG Two Pixels Should Have Matched RGBA    check.png    538,67,500,67
    PNG Two Pixels Should Have Matched RGBA    check.png    538,67,536,27
    PNG Two Pixels Should Have Matched RGBA    check.png    538,67,490,64
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser



Import Image Coordinate ds9 Region Made In ds9
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_with_ds9_pix.reg
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0.02
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Region 1
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[5]    Ellipse
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    17:56:21.6479280152
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    -21:57:15.8104802550
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[7]    1.0000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[7]    1.0000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[8]    0.0
    
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[4]    Region 2
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[5]    Ellipse
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    17:56:21.7054319929
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    -21:57:19.7107203749
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[7]    0.9000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[7]    2.4500000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[8]    270.0
    
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[4]    Region 3
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[5]    Rectangle
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    17:56:21.5293200005
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    -21:57:26.2105199833
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    4.9000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    2.7000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[8]    360.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[4]    Region 4
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[5]    Polygon
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    17:56:21.6659046670
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    -21:57:29.9356134124
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    1.9999897003"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    3.3498060226"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[4]    Region 5
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[5]    Line
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    17:56:20.9093646471
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    -21:57:17.1356442971
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[7]    5.9435115276"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[8]    43.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[4]    Annotation 6
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[5]    Vector - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    17:56:21.2651633472
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    -21:57:15.7105185931
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[7]    4.5329992592"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[8]    7.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[4]    Annotation 7
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[5]    Polyline - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[6]    17:56:21.3316565126
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[6]    -21:57:21.1856425240
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[7]    3.2000076294"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[7]    4.6497558594"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[4]    Annotation 8
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[5]    Text - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[6]    17:56:21.0261599764
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[6]    -21:57:25.9106398420
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[7]    1.1337982178"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[7]    0.5106382979"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[4]    Region 9
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[5]    Point
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[6]    17:56:21.0189840214
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[6]    -21:57:29.4605998495
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[4]    Region 10
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[5]    Point
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[6]    17:56:20.8141199666
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[6]    -21:57:28.2106799170
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[4]    Region 11
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[5]    Point
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[6]    17:56:21.0189840159
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[6]    -21:57:30.5405999647
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[4]    Region 12
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[5]    Point
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[6]    17:56:20.8141199674
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[6]    -21:57:29.2906798413
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[4]    Annotation 13
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[5]    Ruler - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[6]    17:56:21.2615758083
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[6]    -21:57:29.0606406413
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[7]    3.7791013191"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[4]    Annotation 14
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[5]    Compass - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[6]    17:56:20.6991120194
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[6]    -21:57:14.7607207903
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[7]    2.0000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[7]    2.0000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[8]    0.0

    # region 1: ellipse
    PNG Two Pixels Should Have Matched RGBA    check.png    280,69,260,88
    PNG Two Pixels Should Have Matched RGBA    check.png    280,69,280,108
    PNG Two Pixels Should Have Matched RGBA    check.png    280,69,299,88

    # region 2: ellipse
    PNG Two Pixels Should Have Matched RGBA    check.png    264,117,246,165
    PNG Two Pixels Should Have Matched RGBA    check.png    264,117,264,213
    PNG Two Pixels Should Have Matched RGBA    check.png    264,117,282,165

    # region 3: rectangle
    PNG Two Pixels Should Have Matched RGBA    check.png    264,266,264,318
    PNG Two Pixels Should Have Matched RGBA    check.png    264,266,360,318
    PNG Two Pixels Should Have Matched RGBA    check.png    264,266,360,266

    # region 4: polygon
    PNG Two Pixels Should Have Matched RGBA    check.png    255,334,255,371
    PNG Two Pixels Should Have Matched RGBA    check.png    255,334,281,397
    PNG Two Pixels Should Have Matched RGBA    check.png    255,334,294,372
    PNG Two Pixels Should Have Matched RGBA    check.png    255,334,294,333
    PNG Two Pixels Should Have Matched RGBA    check.png    255,334,276,362
    
    # region 5: line
    PNG Two Pixels Should Have Matched RGBA    check.png    443,73,520,156

    # annotation 6: vector
    PNG Two Pixels Should Have Matched RGBA    check.png    389,130,383,121
    PNG Two Pixels Should Have Matched RGBA    check.png    389,130,393,120
    PNG Two Pixels Should Have Matched RGBA    check.png    389,130,379,43

    # annotation 7: polyline
    PNG Two Pixels Should Have Matched RGBA    check.png    335,149,346,204
    PNG Two Pixels Should Have Matched RGBA    check.png    335,149,396,238

    # annotation 8: text
    PNG Two Pixels Should Have Matched RGBA    check.png    439,286,444,284
    PNG Two Pixels Should Have Matched RGBA    check.png    439,286,450,289
    PNG Two Pixels Should Have Matched RGBA    check.png    439,286,453,282
    PNG Two Pixels Should Have Matched RGBA    check.png    439,286,460,289

    # region 9, 10 ,11, 12: point
    PNG Two Pixels Should Have Matched RGBA    check.png    451,356,451,377
    PNG Two Pixels Should Have Matched RGBA    check.png    451,356,507,331
    PNG Two Pixels Should Have Matched RGBA    check.png    451,356,507,353

    # annotation 13: ruler
    PNG Two Pixels Should Have Matched RGBA    check.png    369,315,369,380
    PNG Two Pixels Should Have Matched RGBA    check.png    369,315,400,315
    PNG Two Pixels Should Have Matched RGBA    check.png    366,352,390,350

    # annotation 14: compass
    PNG Two Pixels Should Have Matched RGBA    check.png    538,67,538,31
    PNG Two Pixels Should Have Matched RGBA    check.png    538,67,500,67
    PNG Two Pixels Should Have Matched RGBA    check.png    538,67,536,27
    PNG Two Pixels Should Have Matched RGBA    check.png    538,67,490,64
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser



Import World Coordinate CASA Region Made In CASAViewer
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    # this region file has been patched to show polyline (poly->polyline) and line (box->line) properly in CARTA
    Load Region File    all_region_generated_with_casaviewer.crtf
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0.02
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Region 1
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[5]    Point
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    17:56:21.8283000066
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    -21:57:14.8361006384
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[8]    0.0
    
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[4]    Region 2
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[5]    Rectangle
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    17:56:21.6574699985
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    -21:57:18.2263999360
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[7]    4.9743000031"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[7]    1.3979999542"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[8]    0.0
    
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[4]    Region 3
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[5]    Ellipse
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    17:56:21.7881199926
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    -21:57:24.0808001163
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    1.9746999741"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    0.6640999794"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[4]    Region 4
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[5]    Polygon
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    17:56:21.5280941962
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    -21:57:30.0050709477
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    4.8581291199"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    4.1243021965"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[4]    Region 5
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[5]    Polyline
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    17:56:21.0670757526
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    -21:57:28.2924571925
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[7]    5.4524627686"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[7]    4.0543317795"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[4]    Region 6
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[5]    Line
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    17:56:20.9201110298
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    -21:57:22.7177037411
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[7]    8.3041952513"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[8]    208.4

    PNG Two Pixels Should Have Matched RGBA    check.png    230,69,228,122
    
    PNG Two Pixels Should Have Matched RGBA    check.png    228,122,228,149
    PNG Two Pixels Should Have Matched RGBA    check.png    228,122,326,149
    PNG Two Pixels Should Have Matched RGBA    check.png    228,122,326,122

    PNG Two Pixels Should Have Matched RGBA    check.png    242,212,228,250
    PNG Two Pixels Should Have Matched RGBA    check.png    242,212,242,289
    PNG Two Pixels Should Have Matched RGBA    check.png    242,212,254,250

    PNG Two Pixels Should Have Matched RGBA    check.png    269,326,265,405
    PNG Two Pixels Should Have Matched RGBA    check.png    269,326,358,357
    
    PNG Two Pixels Should Have Matched RGBA    check.png    441,154,515,292
    
    PNG Two Pixels Should Have Matched RGBA    check.png    385,295,405,356
    PNG Two Pixels Should Have Matched RGBA    check.png    385,295,443,315
    PNG Two Pixels Should Have Matched RGBA    check.png    385,295,490,371
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser



Import Image Coordinate CASA Region Made Manually
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_manually.crtf
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0.02
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Region 1
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[5]    Rectangle
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    17:56:21.8114504359
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    -21:57:14.2106005304
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[7]    2.3500000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[7]    1.1000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[8]    0.0
    
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[4]    Region 2
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[5]    Rectangle
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    17:56:21.7629351528
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    -21:57:17.4406101211
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[7]    3.8764999390"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[7]    1.6614999771"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[8]    0.0
    
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[4]    Region 3
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[5]    Rectangle
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    17:56:21.8021146141
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    -21:57:22.5056020838
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    1.4239999771"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    4.5889999390"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[8]    22.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[4]    Region 4
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[5]    Polygon
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    17:56:21.8348270718
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    -21:57:28.9725958282
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    2.2550001144"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    4.7079998016"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[4]    Region 5
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[5]    Ellipse
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    17:56:21.3388460803
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    -21:57:14.6606530567
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[7]    1.1850000381"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[7]    1.1850000381"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[4]    Region 6
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[5]    Ellipse
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    17:56:21.3496294007
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    -21:57:25.6106528022
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[7]    2.3000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[7]    0.7000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[8]    339.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[4]    Region 7
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[5]    Line
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[6]    17:56:20.8182258550
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[6]    -21:57:14.8693632683
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[7]    5.8488571441"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[8]    293.1

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[4]    Annotation 8
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[5]    Vector - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[6]    17:56:20.8324545031
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[6]    -21:57:18.7858658161
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[7]    6.4878224255"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[8]    74.4

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[4]    Annotation 9
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[5]    Text - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[6]    17:56:20.7783967837
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[6]    -21:57:23.0581056880
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[7]    3.9648452759"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[7]    1.0212765957"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[4]    Region 10
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[5]    Point
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[6]    17:56:20.7841056745
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[6]    -21:57:28.7946069373
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[8]    0.0

    # region 1: rectangle
    PNG Two Pixels Should Have Matched RGBA    check.png    212,46,212,68
    PNG Two Pixels Should Have Matched RGBA    check.png    212,46,258,68
    PNG Two Pixels Should Have Matched RGBA    check.png    212,46,258,46
    
    # region 2: rectangle
    PNG Two Pixels Should Have Matched RGBA    check.png    210,104,210,136
    PNG Two Pixels Should Have Matched RGBA    check.png    210,104,286,136
    PNG Two Pixels Should Have Matched RGBA    check.png    210,104,286,104
    
    # region 3: rectangle
    PNG Two Pixels Should Have Matched RGBA    check.png    209,184,242,266
    PNG Two Pixels Should Have Matched RGBA    check.png    209,184,267,256
    PNG Two Pixels Should Have Matched RGBA    check.png    209,184,234,173
    
    # region 4: polygon
    PNG Two Pixels Should Have Matched RGBA    check.png    240,303,208,391
    PNG Two Pixels Should Have Matched RGBA    check.png    240,303,250,375
    
    # region 5: ellipse
    PNG Two Pixels Should Have Matched RGBA    check.png    364,43,341,66
    PNG Two Pixels Should Have Matched RGBA    check.png    364,43,364,90
    PNG Two Pixels Should Have Matched RGBA    check.png    364,43,387,66
    
    # region 6: ellipse
    PNG Two Pixels Should Have Matched RGBA    check.png    376,238,349,274
    PNG Two Pixels Should Have Matched RGBA    check.png    376,238,344,323
    PNG Two Pixels Should Have Matched RGBA    check.png    376,238,374,285
    
    # region 7: line
    PNG Two Pixels Should Have Matched RGBA    check.png    455,92,556,48
    
    # annotation 8: vector
    PNG Two Pixels Should Have Matched RGBA    check.png    442,130,565,164
    PNG Two Pixels Should Have Matched RGBA    check.png    442,130,554,154
    PNG Two Pixels Should Have Matched RGBA    check.png    442,130,551,167

    # annotation 9: text
    PNG Two Pixels Should Have Matched RGBA    check.png    472,222,476,229
    PNG Two Pixels Should Have Matched RGBA    check.png    472,222,502,229
    PNG Two Pixels Should Have Matched RGBA    check.png    472,222,510,239
    PNG Two Pixels Should Have Matched RGBA    check.png    472,222,517,225
    PNG Two Pixels Should Have Matched RGBA    check.png    472,222,531,231
    PNG Two Pixels Should Have Matched RGBA    check.png    472,222,539,222
    PNG Two Pixels Should Have Matched RGBA    check.png    472,222,545,226

    # region 10: point
    PNG Two Pixels Should Have Matched RGBA    check.png    455,92,515,343
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser



Import World Coordinate CASA Region Made In CARTA
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_with_carta.crtf
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0.02
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Region 1
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[5]    Point
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    17:56:21.7651299952
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    -21:57:15.4624999782
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[8]    0.0
    
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[4]    Region 2
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[5]    Line
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    17:56:21.7537553016
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    -21:57:18.9042538983
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[7]    4.4958942179"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[8]    61.6
    
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[4]    Region 3
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[5]    Rectangle
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    17:56:21.7367000130
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    -21:57:22.9789997811
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    4.2724998474"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    1.8197999954"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[8]    25.9

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[4]    Region 4
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[5]    Ellipse
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    17:56:21.7224799881
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    -21:57:29.4669000671
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    2.1363000870"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    0.9098999977"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[8]    42.7

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[4]    Region 5
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[5]    Polygon
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    17:56:21.1395403244
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    -21:57:16.6889534079
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[7]    6.0131179810"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[7]    3.9560943604"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[4]    Region 6
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[5]    Polyline
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    17:56:21.0798244963
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    -21:57:21.3175029214
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[7]    7.9912445068"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[7]    2.8484153748"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[8]    0.0

    PNG Two Pixels Should Have Matched RGBA    check.png    248,82,214,129
    
    PNG Two Pixels Should Have Matched RGBA    check.png    214,129,288,169

    PNG Two Pixels Should Have Matched RGBA    check.png    210,231,225,262
    PNG Two Pixels Should Have Matched RGBA    check.png    210,231,300,226
    PNG Two Pixels Should Have Matched RGBA    check.png    210,231,285,195
    
    PNG Two Pixels Should Have Matched RGBA    check.png    231,325,245,367
    PNG Two Pixels Should Have Matched RGBA    check.png    231,325,288,386
    PNG Two Pixels Should Have Matched RGBA    check.png    231,325,273,345
    
    PNG Two Pixels Should Have Matched RGBA    check.png    390,68,360,130
    PNG Two Pixels Should Have Matched RGBA    check.png    390,68,423,144
    PNG Two Pixels Should Have Matched RGBA    check.png    390,68,476,128
    PNG Two Pixels Should Have Matched RGBA    check.png    390,68,441,67
    
    PNG Two Pixels Should Have Matched RGBA    check.png    358,218,410,169
    PNG Two Pixels Should Have Matched RGBA    check.png    358,218,464,223
    PNG Two Pixels Should Have Matched RGBA    check.png    358,218,511,180

    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser



Import Image Coordinate CASA Region Made In CARTA
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_with_carta_pix.crtf
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0.02
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Region 1
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[5]    Point
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    17:56:21.7651252516
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    -21:57:15.4625350742
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[8]    0.0
    
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[4]    Region 2
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[5]    Line
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    17:56:21.7537540814
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    -21:57:18.9042935714
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[7]    4.4959897458"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[8]    61.6
    
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[4]    Region 3
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[5]    Rectangle
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    17:56:21.7366961742
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    -21:57:22.9790196181
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    4.2725250244"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    1.8197799683"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[8]    25.9

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[4]    Region 4
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[5]    Ellipse
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    17:56:21.7224838544
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    -21:57:29.4669370689
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    2.1362649918"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    0.9098899841"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[8]    42.7

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[4]    Region 5
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[5]    Polygon
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    17:56:21.1395390906
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    -21:57:16.6889473043
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[7]    6.0131843567"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[7]    3.9560455322"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[4]    Region 6
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[5]    Polyline
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    17:56:21.0798222479
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    -21:57:21.3175136024
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[7]    7.9912094116"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[7]    2.8483543396"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[8]    0.0

    PNG Two Pixels Should Have Matched RGBA    check.png    248,82,214,129
    
    PNG Two Pixels Should Have Matched RGBA    check.png    214,129,288,169

    PNG Two Pixels Should Have Matched RGBA    check.png    210,231,225,262
    PNG Two Pixels Should Have Matched RGBA    check.png    210,231,300,226
    PNG Two Pixels Should Have Matched RGBA    check.png    210,231,285,195
    
    PNG Two Pixels Should Have Matched RGBA    check.png    231,325,245,367
    PNG Two Pixels Should Have Matched RGBA    check.png    231,325,288,386
    PNG Two Pixels Should Have Matched RGBA    check.png    231,325,273,345
    
    PNG Two Pixels Should Have Matched RGBA    check.png    390,68,360,130
    PNG Two Pixels Should Have Matched RGBA    check.png    390,68,423,144
    PNG Two Pixels Should Have Matched RGBA    check.png    390,68,476,128
    PNG Two Pixels Should Have Matched RGBA    check.png    390,68,441,67
    
    PNG Two Pixels Should Have Matched RGBA    check.png    358,218,410,169
    PNG Two Pixels Should Have Matched RGBA    check.png    358,218,464,223
    PNG Two Pixels Should Have Matched RGBA    check.png    358,218,511,180

    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser



Import World Coordinate ds9 Region Made In CARTA
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_with_carta.reg
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0.02
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Region 1
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[5]    Point
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    17:56:21.7651252790
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    -21:57:15.4625335483
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[8]    0.0
    
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[4]    Region 2
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[5]    Line
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    17:56:21.7537540129
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    -21:57:18.9042935714
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[7]    4.4959880675"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[8]    61.6
    
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[4]    Region 3
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[5]    Rectangle
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    17:56:21.7366960920
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    -21:57:22.9790196182
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    4.2724998474"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    1.8197999954"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[8]    25.9

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[4]    Region 4
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[5]    Ellipse
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    17:56:21.7224837722
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    -21:57:29.4669359245
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    2.1363000870"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    0.9098999977"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[8]    42.7

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[4]    Region 5
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[5]    Polygon
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    17:56:21.1395390631
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    -21:57:16.6889465414
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[7]    6.0131866455"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[7]    3.9560470581"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[4]    Region 6
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[5]    Polyline
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    17:56:21.0798220560
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    -21:57:21.3175143654
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[7]    7.9912071228"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[7]    2.8483497620"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[8]    0.0

    PNG Two Pixels Should Have Matched RGBA    check.png    248,82,214,129
    
    PNG Two Pixels Should Have Matched RGBA    check.png    214,129,288,169

    PNG Two Pixels Should Have Matched RGBA    check.png    210,231,225,262
    PNG Two Pixels Should Have Matched RGBA    check.png    210,231,300,226
    PNG Two Pixels Should Have Matched RGBA    check.png    210,231,285,195
    
    PNG Two Pixels Should Have Matched RGBA    check.png    231,325,245,367
    PNG Two Pixels Should Have Matched RGBA    check.png    231,325,288,386
    PNG Two Pixels Should Have Matched RGBA    check.png    231,325,273,345
    
    PNG Two Pixels Should Have Matched RGBA    check.png    390,68,360,130
    PNG Two Pixels Should Have Matched RGBA    check.png    390,68,423,144
    PNG Two Pixels Should Have Matched RGBA    check.png    390,68,476,128
    PNG Two Pixels Should Have Matched RGBA    check.png    390,68,441,67
    
    PNG Two Pixels Should Have Matched RGBA    check.png    358,218,410,169
    PNG Two Pixels Should Have Matched RGBA    check.png    358,218,464,223
    PNG Two Pixels Should Have Matched RGBA    check.png    358,218,511,180

    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser


Import Image Coordinate ds9 Region Made In CARTA
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_with_carta_pix.reg
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0.02
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Region 1
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[5]    Point
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    17:56:21.7651256081
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    -21:57:15.4626098422
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[8]    0.0
    
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[4]    Region 2
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[5]    Line
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    17:56:21.7537538964
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    -21:57:18.9043614731
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[7]    4.4965009452"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[8]    61.6
    
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[4]    Region 3
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[5]    Rectangle
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    17:56:21.7367040713
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    -21:57:22.9791142213
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    4.2724998474"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    1.8200000763"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[8]    25.9

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[4]    Region 4
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[5]    Ellipse
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    17:56:21.7224773834
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    -21:57:29.4671167423
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    2.1364999771"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    0.9100000381"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[8]    42.7

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[4]    Region 5
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[5]    Polygon
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    17:56:21.1395428470
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    -21:57:16.6891502464
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[7]    6.0134994507"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[7]    3.9559997559"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[4]    Region 6
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[5]    Polyline
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    17:56:21.0798272384
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    -21:57:21.3173957286
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[7]    7.9910003662"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[7]    2.8485000610"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[8]    0.0

    PNG Two Pixels Should Have Matched RGBA    check.png    248,82,214,129
    
    PNG Two Pixels Should Have Matched RGBA    check.png    214,129,288,169

    PNG Two Pixels Should Have Matched RGBA    check.png    210,231,225,262
    PNG Two Pixels Should Have Matched RGBA    check.png    210,231,300,226
    PNG Two Pixels Should Have Matched RGBA    check.png    210,231,285,195
    
    PNG Two Pixels Should Have Matched RGBA    check.png    231,325,245,367
    PNG Two Pixels Should Have Matched RGBA    check.png    231,325,288,386
    PNG Two Pixels Should Have Matched RGBA    check.png    231,325,273,345
    
    PNG Two Pixels Should Have Matched RGBA    check.png    390,68,360,130
    PNG Two Pixels Should Have Matched RGBA    check.png    390,68,423,144
    PNG Two Pixels Should Have Matched RGBA    check.png    390,68,476,128
    PNG Two Pixels Should Have Matched RGBA    check.png    390,68,441,67
    
    PNG Two Pixels Should Have Matched RGBA    check.png    358,218,410,169
    PNG Two Pixels Should Have Matched RGBA    check.png    358,218,464,223
    PNG Two Pixels Should Have Matched RGBA    check.png    358,218,511,180

    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser



Region selecting, centering, locking, and deleting
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_with_carta.crtf
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0
    Click Element At Coordinates    ${VIEWER_DIV}    50    -150
    Mouse Out    ${VIEWER_DIV}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_selected_from_viewer.png
    Click Element    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[4]
    Capture Element Screenshot    ${VIEWER_DIV}    check_polyline_selected_from_list.png
    Click Element    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[2]
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov.png
    Click Element    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[4]
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov_selected.png
    Click Element    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[1]
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov_selected_locked.png
    Press Keys    None    DELETE
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[4]    Region 5
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[5]    Polygon
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov_selected_locked_tried_delete.png
    Click Element    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[1]
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov_selected_locked_tried_delete_unlocked.png
    Press Keys    None    DELETE
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[4]    Region 6
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[5]    Polyline
    
    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check_polygon_selected_from_viewer.png    290,67,259,130
    PNG Two Pixels Should Have Matched RGBA    check_polygon_selected_from_viewer.png    290,67,323,144
    PNG Two Pixels Should Have Matched RGBA    check_polygon_selected_from_viewer.png    290,67,377,129
    PNG Two Pixels Should Have Matched RGBA    check_polygon_selected_from_viewer.png    290,67,341,67
    PNG Two Pixels Should Not Have Matched RGBA    check_polygon_selected_from_viewer.png    290,67,316,67

    PNG Two Pixels Should Have Matched RGBA    check_polyline_selected_from_list.png    256,220,310,168
    PNG Two Pixels Should Have Matched RGBA    check_polyline_selected_from_list.png    256,220,364,224
    PNG Two Pixels Should Have Matched RGBA    check_polyline_selected_from_list.png    256,220,413,179
    PNG Two Pixels Should Not Have Matched RGBA    check_polyline_selected_from_list.png    256,220,283,195

    PNG Images Should Be Different    check_polyline_selected_from_list.png    check_polygon_center_fov.png    
    PNG Images Should Be Identical    check_polygon_center_fov_selected_locked.png    check_polygon_center_fov_selected_locked_tried_delete.png
    PNG Images Should Be Identical    check_polygon_center_fov_selected.png    check_polygon_center_fov_selected_locked_tried_delete_unlocked.png

    Remove Files    check_polygon_selected_from_viewer.png    check_polyline_selected_from_list.png    check_polygon_center_fov.png
    Remove Files    check_polygon_center_fov_selected.png    check_polygon_center_fov_selected_locked.png
    Remove Files    check_polygon_center_fov_selected_locked_tried_delete.png    check_polygon_center_fov_selected_locked_tried_delete_unlocked.png
    [Teardown]    Kill carta_backend And Close Browser


Creating regions
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    # point
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[1]/a
    Click Element At Coordinates    ${VIEWER_DIV}    -100    -100
    # line
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[2]/a
    Drag And Drop By Offset    ${VIEWER_DIV}    -65    50
    # rectangle
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[3]/a
    Drag And Drop By Offset    ${VIEWER_DIV}    -60    80
    # ellipse
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[4]/a
    Drag And Drop By Offset    ${VIEWER_DIV}    -100    50
    # polygon
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[5]/a
    Click Element At Coordinates    ${VIEWER_DIV}    75    -75
    Click Element At Coordinates    ${VIEWER_DIV}    50    120
    Double Click Element    ${VIEWER_DIV}
    # polyline
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[6]/a
    Click Element At Coordinates    ${VIEWER_DIV}    0    100
    Click Element At Coordinates    ${VIEWER_DIV}    -80    80
    Click Element At Coordinates    ${VIEWER_DIV}    80    60
    Double Click Element    ${VIEWER_DIV} 
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0
    Click Element At Coordinates    ${VIEWER_DIV}    50    -150

    Set Selenium Speed    0.02
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Region 1
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[5]    Point
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    17:56:21.6556900185
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    -21:57:18.1728612209
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[8]    0.0
    
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[4]    Region 2
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[5]    Line
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    17:56:21.2886455617
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    -21:57:23.2792706952
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[7]    8.3750907916"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[8]    307.6
    
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[4]    Region 3
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[5]    Rectangle
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    17:56:21.2886455617
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    -21:57:23.2792706952
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    6.1276595745"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    8.1702127660"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[4]    Region 4
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[5]    Ellipse
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    17:56:21.2886455617
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    -21:57:23.2792706952
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    2.5531914894"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    5.1063829787"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[4]    Region 5
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[5]    Polygon
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    17:56:21.1510021967
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    -21:57:24.4282036623
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[7]    3.8297872340"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[7]    9.9574468085"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[4]    Region 6
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[5]    Polyline
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    17:56:21.2886455981
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    -21:57:25.8324621846
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[7]    8.1702127660"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[7]    5.1063829787"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[8]    0.0
    [Teardown]    Kill carta_backend And Close Browser


Shared Region And Region Inheritance
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0
    Click Element At Coordinates    ${VIEWER_DIV}    50    -150

    # create a point region
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[1]/a
    Click Element At Coordinates    ${VIEWER_DIV}    -50    -50

    Append Image    HD163296_CO_2_1.mom1.fits
    Page Should Not Contain Element    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]
    # match image with the XY button
    Click Element    xpath://*[contains(text(), "Image List")]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div/span[1]/a
    Click Element    xpath://*[contains(text(), "Region List")]
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Region 1

    # unmatch image with the XY button
    Click Element    xpath://*[contains(text(), "Image List")]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div/span[1]/a
    Click Element    xpath://*[contains(text(), "Region List")]
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Region 2
    # set a new active image
    Click Element    xpath://*[contains(text(), "Image List")]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div
    Click Element    xpath://*[contains(text(), "Region List")]
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Region 1

    # set the 2nd image as active by clicking it in the image list
    Click Element    xpath://*[contains(text(), "Image List")]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[6]/div/div
    # create a new region on the unmatched 2nd image
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[1]/a
    Click Element At Coordinates    //*[@id="image-panel-1-0"]/div[8]/div/div/canvas    20    -50
    Click Element    xpath://*[contains(text(), "Region List")]
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[4]    Region 3

    # match the 2nd image
    Click Element    xpath://*[contains(text(), "Image List")]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div/span[1]/a
    Click Element    xpath://*[contains(text(), "Region List")]
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Region 1
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[4]    Region 4
    # set a new active image
    Click Element    xpath://*[contains(text(), "Image List")]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div
    Click Element    xpath://*[contains(text(), "Region List")]
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Region 1
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[4]    Region 4

    # unmatch again
    Click Element    xpath://*[contains(text(), "Image List")]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div/span[1]/a
    Click Element    xpath://*[contains(text(), "Region List")]
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Region 1
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[4]    Region 4
    # set a new active image
    Click Element    xpath://*[contains(text(), "Image List")]
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[6]/div/div
    Click Element    xpath://*[contains(text(), "Region List")]
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Region 5
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[4]    Region 6

    [Teardown]    Kill carta_backend And Close Browser



Loading 4000 Regions From A File
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0
    Click Element At Coordinates    ${VIEWER_DIV}    50    -150

    Load Region File    box_region_n_4000.crtf
    Wait Until Page Does Not Contain    Importing regions    timeout=10
    Sleep    1

    # scroll the region list to the very bottom
    Assign Id To Element    //*[@id="root"]/div/div[16]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]    tmp_REGIONLIST
    Execute Javascript    window.document.getElementById("tmp_REGIONLIST").scrollTo(0, 200000)

    Page Should Contain    Region 4000
    [Teardown]    Kill carta_backend And Close Browser


Loading Regions on Active Matched Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    m51cm3i_8_small.fits
    Append Image    m51_151_MHz.fits
    # match m51_151_MHz.fits to m51cm3i_8_small.fits by clicking the XY button in the image list
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div/div[3]/div[5]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div/span[1]/a
    Load Region File    region_004.crtf
    Capture Element Screenshot    ${VIEWER_DIV}    check.png

    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check.png    118,72,497,72
    PNG Two Pixels Should Have Matched RGBA    check.png    139,149,518,149
    PNG Two Pixels Should Have Matched RGBA    check.png    163,120,542,120
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser


Loading Regions on Active Reference Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    m51cm3i_8_small.fits
    Append Image    m51_151_MHz.fits
    # match m51_151_MHz.fits to m51cm3i_8_small.fits by clicking the XY button in the image list
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div/div[3]/div[5]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div/span[1]/a
    # set m51cm3i_8_small.fits as active by clicking it in the image list
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div/div[3]/div[5]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]
    Load Region File    region_004.crtf
    Capture Element Screenshot    ${VIEWER_DIV}    check.png

    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check.png    118,72,497,72
    PNG Two Pixels Should Have Matched RGBA    check.png    139,149,518,149
    PNG Two Pixels Should Have Matched RGBA    check.png    163,120,542,120
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser


Import World Coordinate CASA Annotation Made In CARTA
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_annotation_generated_with_carta.crtf
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0.02
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Annotation 1
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    17:56:21.8622799970
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    -21:57:14.5188997856
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[4]    Annotation 2
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    17:56:21.8622800016
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    -21:57:16.0808001164
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[4]    Annotation 3
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    17:56:21.8622800021
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    -21:57:17.5664995800
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[4]    Annotation 4
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    17:56:21.8650199954
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    -21:57:19.0904003441
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[4]    Annotation 5
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    17:56:21.8677600050
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    -21:57:20.6141996342
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[4]    Annotation 6
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    17:56:21.8705000036
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    -21:57:22.1379996844
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[4]    Annotation 7
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[6]    17:56:21.8677700042
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[6]    -21:57:23.7760999620
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[4]    Annotation 8
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[6]    17:56:21.8705099978
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[6]    -21:57:25.3761001160
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[4]    Annotation 9
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[5]    Line - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[6]    17:56:21.8321745956
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[6]    -21:57:29.0332029572
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[7]    4.7976272658"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[8]    313.1

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[4]    Annotation 10
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[5]    Rectangle - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[6]    17:56:21.5419000247
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[6]    -21:57:14.6333001431
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[7]    3.5048000336"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[7]    1.3713999748"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[8]    331.9

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[4]    Annotation 11
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[5]    Ellipse - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[6]    17:56:21.5419100234
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[6]    -21:57:18.9760995214
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[7]    1.6761999130"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[7]    0.7237999916"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[8]    320.8

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[4]    Annotation 12
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[5]    Polygon - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[6]    17:56:21.5405385943
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[6]    -21:57:24.9951559767
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[7]    2.4000770569"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[7]    6.0191078186"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[4]    Annotation 13
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[5]    Polyline - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[6]    17:56:21.1037804120
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[6]    -21:57:15.3570443563
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[7]    4.4190711975"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[7]    2.6667007446"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[4]    Annotation 14
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[5]    Vector - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[6]    17:56:21.0298495452
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[6]    -21:57:19.3189566166
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[7]    5.8607129519"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[8]    296.2

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[4]    Annotation 15
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[5]    Text - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[6]    17:56:21.1174700257
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[6]    -21:57:23.0142000880
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[7]    7.8475997925"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[7]    0.9904999733"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[4]    Annotation 16
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[5]    Compass - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[6]    17:56:21.0654400173
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[6]    -21:57:28.1570998702
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[7]    2.5808000565"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[7]    2.5808000565"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[4]    Annotation 17
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[5]    Ruler - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[6]    17:56:20.7231545943
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[6]    -21:57:26.1189020202
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[7]    4.9764497926"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[8]    0.0

    # annotation 1, 2: filled square point and open square point
    PNG Two Pixels Should Have Matched RGBA    check.png    218,66,218,97
    PNG Two Pixels Should Not Have Matched RGBA    check.png    222,63,221,94

    # annotation 3, 4: filled circle point and open circle point
    PNG Two Pixels Should Have Matched RGBA    check.png    221,120,220,150
    PNG Two Pixels Should Not Have Matched RGBA    check.png    221,123,220,152

    # annotation 5, 6: filled diamond point and open diamond point
    PNG Two Pixels Should Have Matched RGBA    check.png    220,180,219,209
    PNG Two Pixels Should Not Have Matched RGBA    check.png    220,182,219,212   

    # annotation 7, 8: plus point and cross point 
    PNG Two Pixels Should Have Matched RGBA    check.png    220,244,219,275

    # annotation 9: line
    PNG Two Pixels Should Have Matched RGBA    check.png    196,378,263,316

    # annotation 10: rectangle
    PNG Two Pixels Should Have Matched RGBA    check.png    285,37,272,61
    PNG Two Pixels Should Have Matched RGBA    check.png    285,37,332,93
    PNG Two Pixels Should Have Matched RGBA    check.png    285,37,345,69

    # annotation 11: ellipse
    PNG Two Pixels Should Have Matched RGBA    check.png    329,125,296,143
    PNG Two Pixels Should Have Matched RGBA    check.png    329,125,287,175
    PNG Two Pixels Should Have Matched RGBA    check.png    329,125,319,160

    # annotation 12: polygon
    PNG Two Pixels Should Have Matched RGBA    check.png    304,211,286,326
    PNG Two Pixels Should Have Matched RGBA    check.png    304,211,332,313

    # annotation 13: polyline
    PNG Two Pixels Should Have Matched RGBA    check.png    385,54,394,105
    PNG Two Pixels Should Have Matched RGBA    check.png    385,54,438,60
    PNG Two Pixels Should Have Matched RGBA    check.png    385,54,470,103

    # annotation 14: vector
    PNG Two Pixels Should Have Matched RGBA    check.png    498,132,397,182
    PNG Two Pixels Should Have Matched RGBA    check.png    498,132,403,174
    PNG Two Pixels Should Have Matched RGBA    check.png    498,132,407,182

    # annotation 15: text
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,400,228
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,411,225
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,429,231
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,436,229
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,451,235
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,454,233
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,473,224

    # annotation 16: compass
    PNG Two Pixels Should Have Matched RGBA    check.png    438,329,438,280
    PNG Two Pixels Should Have Matched RGBA    check.png    438,329,388,330
    PNG Two Pixels Should Have Matched RGBA    check.png    438,329,442,257
    PNG Two Pixels Should Have Matched RGBA    check.png    438,329,380,335

    # annotation 17: ruler
    PNG Two Pixels Should Have Matched RGBA    check.png    558,250,505,330
    PNG Two Pixels Should Have Matched RGBA    check.png    558,250,558,330
    PNG Two Pixels Should Have Matched RGBA    check.png    558,250,507,298
    PNG Two Pixels Should Have Matched RGBA    check.png    558,250,555,298
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser


Import Image Coordinate CASA Annotation Made In CARTA
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_annotation_generated_with_carta_pix.crtf
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0.02
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Annotation 1
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    17:56:21.8622796543
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    -21:57:14.5189241998
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[4]    Annotation 2
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    17:56:21.8622814275
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    -21:57:16.0808291077
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[4]    Annotation 3
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    17:56:21.8622831143
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    -21:57:17.5665392521
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[4]    Annotation 4
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    17:56:21.8650231075
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    -21:57:19.0903499894
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[4]    Annotation 5
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    17:56:21.8677631034
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    -21:57:20.6141584348
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[4]    Annotation 6
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    17:56:21.8705031294
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    -21:57:22.1379684032
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[4]    Annotation 7
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[6]    17:56:21.8677667274
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[6]    -21:57:23.7760633416
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[4]    Annotation 8
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[6]    17:56:21.8705068581
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[6]    -21:57:25.3760627327
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[4]    Annotation 9
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[5]    Line - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[6]    17:56:21.8321743762
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[6]    -21:57:29.0332162133
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[7]    4.7975788400"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[8]    313.1

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[4]    Annotation 10
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[5]    Rectangle - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[6]    17:56:21.5419044118
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[6]    -21:57:14.6332604698
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[7]    3.5047599792"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[7]    1.3714300156"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[8]    331.9

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[4]    Annotation 11
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[5]    Ellipse - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[6]    17:56:21.5419066233
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[6]    -21:57:18.9761163063
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[7]    1.6761899948"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[7]    0.7238100052"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[8]    320.8

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[4]    Annotation 12
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[5]    Polygon - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[6]    17:56:21.5405403767
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[6]    -21:57:24.9951658948
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[7]    2.4000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[7]    6.0190498352"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[4]    Annotation 13
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[5]    Polyline - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[6]    17:56:21.1037842233
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[6]    -21:57:15.3570756371
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[7]    4.4190460205"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[7]    2.6666656494"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[4]    Annotation 14
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[5]    Vector - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[6]    17:56:21.0298493532
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[6]    -21:57:19.3189741642
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[7]    5.8607238324"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[8]    296.2

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[4]    Annotation 15
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[5]    Text - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[6]    17:56:21.1174730967
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[6]    -21:57:23.0142183987
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[7]    7.8476196289"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[7]    0.9904749870"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[4]    Annotation 16
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[5]    Compass - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[6]    17:56:21.0654433078
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[6]    -21:57:28.1570746934
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[7]    2.5808450699"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[7]    2.5808450699"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[4]    Annotation 17
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[5]    Ruler - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[6]    17:56:20.7231550878
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[6]    -21:57:26.1189296768
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[7]    4.9764956886"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[8]    0.0

    # annotation 1, 2: filled square point and open square point
    PNG Two Pixels Should Have Matched RGBA    check.png    218,66,218,97
    PNG Two Pixels Should Not Have Matched RGBA    check.png    222,63,221,94

    # annotation 3, 4: filled circle point and open circle point
    PNG Two Pixels Should Have Matched RGBA    check.png    221,120,220,150
    PNG Two Pixels Should Not Have Matched RGBA    check.png    221,123,220,152

    # annotation 5, 6: filled diamond point and open diamond point
    PNG Two Pixels Should Have Matched RGBA    check.png    220,180,219,209
    PNG Two Pixels Should Not Have Matched RGBA    check.png    220,182,219,212   

    # annotation 7, 8: plus point and cross point 
    PNG Two Pixels Should Have Matched RGBA    check.png    220,244,219,275

    # annotation 9: line
    PNG Two Pixels Should Have Matched RGBA    check.png    196,378,263,316

    # annotation 10: rectangle
    PNG Two Pixels Should Have Matched RGBA    check.png    285,37,272,61
    PNG Two Pixels Should Have Matched RGBA    check.png    285,37,332,93
    PNG Two Pixels Should Have Matched RGBA    check.png    285,37,345,69

    # annotation 11: ellipse
    PNG Two Pixels Should Have Matched RGBA    check.png    329,125,296,143
    PNG Two Pixels Should Have Matched RGBA    check.png    329,125,287,175
    PNG Two Pixels Should Have Matched RGBA    check.png    329,125,319,160

    # annotation 12: polygon
    PNG Two Pixels Should Have Matched RGBA    check.png    304,211,286,326
    PNG Two Pixels Should Have Matched RGBA    check.png    304,211,332,313

    # annotation 13: polyline
    PNG Two Pixels Should Have Matched RGBA    check.png    385,54,394,105
    PNG Two Pixels Should Have Matched RGBA    check.png    385,54,438,60
    PNG Two Pixels Should Have Matched RGBA    check.png    385,54,470,103

    # annotation 14: vector
    PNG Two Pixels Should Have Matched RGBA    check.png    498,132,397,182
    PNG Two Pixels Should Have Matched RGBA    check.png    498,132,403,174
    PNG Two Pixels Should Have Matched RGBA    check.png    498,132,407,182

    # annotation 15: text
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,400,228
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,411,225
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,429,231
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,436,229
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,451,235
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,454,233
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,473,224

    # annotation 16: compass
    PNG Two Pixels Should Have Matched RGBA    check.png    438,329,438,280
    PNG Two Pixels Should Have Matched RGBA    check.png    438,329,388,330
    PNG Two Pixels Should Have Matched RGBA    check.png    438,329,442,257
    PNG Two Pixels Should Have Matched RGBA    check.png    438,329,380,335

    # annotation 17: ruler
    PNG Two Pixels Should Have Matched RGBA    check.png    558,250,505,330
    PNG Two Pixels Should Have Matched RGBA    check.png    558,250,558,330
    PNG Two Pixels Should Have Matched RGBA    check.png    558,250,507,298
    PNG Two Pixels Should Have Matched RGBA    check.png    558,250,555,299
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser



Import World Coordinate ds9 Annotation Made In CARTA
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_annotation_generated_with_carta.reg
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0.02
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Annotation 1
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    17:56:21.8622794349
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    -21:57:14.5189226740
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[4]    Annotation 2
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    17:56:21.8622813589
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    -21:57:16.0808291077
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[4]    Annotation 3
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    17:56:21.8622830457
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    -21:57:17.5665423039
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[4]    Annotation 4
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    17:56:21.8650228745
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    -21:57:19.0903499894
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[4]    Annotation 5
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    17:56:21.8677629663
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    -21:57:20.6141614866
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[4]    Annotation 6
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    17:56:21.8705030334
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    -21:57:22.1379699291
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[4]    Annotation 7
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[6]    17:56:21.8677665629
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[6]    -21:57:23.7760633417
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[4]    Annotation 8
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[6]    17:56:21.8705066388
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[6]    -21:57:25.3760650216
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[4]    Annotation 9
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[5]    Line - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[6]    17:56:21.8321743968
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[6]    -21:57:29.0332146874
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[7]    4.7975781796"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[8]    313.1

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[4]    Annotation 10
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[5]    Rectangle - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[6]    17:56:21.5419044118
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[6]    -21:57:14.6332619957
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[7]    3.5048000336"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[7]    1.3713999748"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[8]    331.9

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[4]    Annotation 11
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[5]    Ellipse - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[6]    17:56:21.5419065685
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[6]    -21:57:18.9761147805
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[7]    1.6761999130"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[7]    0.7237999916"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[8]    320.8

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[4]    Annotation 12
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[5]    Polygon - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[6]    17:56:21.5405405138
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[6]    -21:57:24.9951639874
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[7]    2.3999992371"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[7]    6.0190460205"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[4]    Annotation 13
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[5]    Polyline - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[6]    17:56:21.1037841959
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[6]    -21:57:15.3570764000
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[7]    4.4190483093"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[7]    2.6666641235"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[4]    Annotation 14
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[5]    Vector - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[6]    17:56:21.0298485581
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[6]    -21:57:19.3189684421
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[7]    5.8607003160"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[8]    296.2

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[4]    Annotation 15
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[5]    Text - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[6]    17:56:21.1174729871
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[6]    -21:57:23.0142206875
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[7]    7.8475997925"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[7]    0.9904999733"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[4]    Annotation 16
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[5]    Compass - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[6]    17:56:21.0654431981
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[6]    -21:57:28.1570724046
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[7]    2.5808000565"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[7]    2.5808000565"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[4]    Annotation 17
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[5]    Ruler - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[6]    17:56:20.7231551427
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[6]    -21:57:26.1189289139
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[7]    4.9764994849"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[8]    0.0

    # annotation 1, 2: filled square point and open square point
    PNG Two Pixels Should Have Matched RGBA    check.png    218,66,218,97
    PNG Two Pixels Should Not Have Matched RGBA    check.png    222,63,221,94

    # annotation 3, 4: filled circle point and open circle point
    PNG Two Pixels Should Have Matched RGBA    check.png    221,120,220,150
    PNG Two Pixels Should Not Have Matched RGBA    check.png    221,123,220,152

    # annotation 5, 6: filled diamond point and open diamond point
    PNG Two Pixels Should Have Matched RGBA    check.png    220,180,219,209
    PNG Two Pixels Should Not Have Matched RGBA    check.png    220,182,219,212   

    # annotation 7, 8: plus point and cross point 
    PNG Two Pixels Should Have Matched RGBA    check.png    220,244,219,275

    # annotation 9: line
    PNG Two Pixels Should Have Matched RGBA    check.png    196,378,263,316

    # annotation 10: rectangle
    PNG Two Pixels Should Have Matched RGBA    check.png    285,37,272,61
    PNG Two Pixels Should Have Matched RGBA    check.png    285,37,332,93
    PNG Two Pixels Should Have Matched RGBA    check.png    285,37,345,69

    # annotation 11: ellipse
    PNG Two Pixels Should Have Matched RGBA    check.png    329,125,296,143
    PNG Two Pixels Should Have Matched RGBA    check.png    329,125,287,175
    PNG Two Pixels Should Have Matched RGBA    check.png    329,125,319,160

    # annotation 12: polygon
    PNG Two Pixels Should Have Matched RGBA    check.png    304,211,286,326
    PNG Two Pixels Should Have Matched RGBA    check.png    304,211,332,313

    # annotation 13: polyline
    PNG Two Pixels Should Have Matched RGBA    check.png    385,54,394,105
    PNG Two Pixels Should Have Matched RGBA    check.png    385,54,438,60
    PNG Two Pixels Should Have Matched RGBA    check.png    385,54,470,103

    # annotation 14: vector
    PNG Two Pixels Should Have Matched RGBA    check.png    498,132,397,182
    PNG Two Pixels Should Have Matched RGBA    check.png    498,132,403,174
    PNG Two Pixels Should Have Matched RGBA    check.png    498,132,407,182

    # annotation 15: text
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,400,228
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,411,225
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,429,231
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,436,229
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,451,235
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,454,233
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,473,224

    # annotation 16: compass
    PNG Two Pixels Should Have Matched RGBA    check.png    438,329,438,280
    PNG Two Pixels Should Have Matched RGBA    check.png    438,329,388,330
    PNG Two Pixels Should Have Matched RGBA    check.png    438,329,442,257
    PNG Two Pixels Should Have Matched RGBA    check.png    438,329,380,335

    # annotation 17: ruler
    PNG Two Pixels Should Have Matched RGBA    check.png    558,250,505,330
    PNG Two Pixels Should Have Matched RGBA    check.png    558,250,558,330
    PNG Two Pixels Should Have Matched RGBA    check.png    558,250,513,296
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser



Import Image Coordinate ds9 Annotation Made In CARTA
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_annotation_generated_with_carta_pix.reg
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0.02
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Annotation 1
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    17:56:21.8622692350
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[6]    -21:57:14.5190905229
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[4]    Annotation 2
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    17:56:21.8622710077
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[6]    -21:57:16.0805895470
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[4]    Annotation 3
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    17:56:21.8622726948
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[6]    -21:57:17.5665896084
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[4]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[4]    Annotation 4
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    17:56:21.8650058607
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[6]    -21:57:19.0905895562
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[5]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[4]    Annotation 5
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    17:56:21.8677749625
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[6]    -21:57:20.6140890047
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[4]    Annotation 6
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    17:56:21.8705081611
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[6]    -21:57:22.1380881836
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[4]    Annotation 7
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[6]    17:56:21.8677785867
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[6]    -21:57:23.7760885160
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[8]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[4]    Annotation 8
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[5]    Point - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[6]    17:56:21.8705118898
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[6]    -21:57:25.3760879086
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[4]    Annotation 9
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[5]    Line - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[6]    17:56:21.8321675415
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[6]    -21:57:29.0330963379
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[7]    4.7976244157"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[8]    313.1

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[4]    Annotation 10
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[5]    Rectangle - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[6]    17:56:21.5419044118
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[6]    -21:57:14.6331414513
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[7]    3.5049999237"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[7]    1.3715000153"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[8]    331.9

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[4]    Annotation 11
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[5]    Ellipse - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[6]    17:56:21.5419066233
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[6]    -21:57:18.9761407204
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[7]    1.6760000229"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[7]    0.7239999771"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[12]/div[8]    320.8

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[4]    Annotation 12
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[5]    Polygon - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[6]    17:56:21.5405439550
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[6]    -21:57:24.9951409081
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[7]    2.4000003815"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[7]    6.0189998627"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[13]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[4]    Annotation 13
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[5]    Polyline - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[6]    17:56:21.1037833185
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[6]    -21:57:15.3571481162
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[7]    4.4194999695"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[7]    2.6669998169"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[4]    Annotation 14
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[5]    Vector - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[6]    17:56:21.0298367128
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[6]    -21:57:19.3187410850
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[7]    5.8604994530"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[8]    296.2

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[4]    Annotation 15
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[5]    Text - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[6]    17:56:21.1174558769
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[6]    -21:57:23.0141489702
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[7]    7.8474998474"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[7]    0.9904999733"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[16]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[4]    Annotation 16
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[5]    Compass - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[6]    17:56:21.0654483531
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[6]    -21:57:28.1571448843
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[7]    2.5809999466"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[7]    2.5809999466"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[17]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[4]    Annotation 17
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[5]    Ruler - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[6]    17:56:20.7231534976
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[6]    -21:57:26.1188447995
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[7]    4.9766758483"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[8]    0.0

    # annotation 1, 2: filled square point and open square point
    PNG Two Pixels Should Have Matched RGBA    check.png    218,66,218,97
    PNG Two Pixels Should Not Have Matched RGBA    check.png    222,63,221,94

    # annotation 3, 4: filled circle point and open circle point
    PNG Two Pixels Should Have Matched RGBA    check.png    221,120,220,150
    PNG Two Pixels Should Not Have Matched RGBA    check.png    221,123,220,152

    # annotation 5, 6: filled diamond point and open diamond point
    PNG Two Pixels Should Have Matched RGBA    check.png    220,180,219,209
    PNG Two Pixels Should Not Have Matched RGBA    check.png    220,182,219,212   

    # annotation 7, 8: plus point and cross point 
    PNG Two Pixels Should Have Matched RGBA    check.png    220,244,219,275

    # annotation 9: line
    PNG Two Pixels Should Have Matched RGBA    check.png    196,378,263,316

    # annotation 10: rectangle
    PNG Two Pixels Should Have Matched RGBA    check.png    285,37,272,61
    PNG Two Pixels Should Have Matched RGBA    check.png    285,37,332,93
    PNG Two Pixels Should Have Matched RGBA    check.png    285,37,345,69

    # annotation 11: ellipse
    PNG Two Pixels Should Have Matched RGBA    check.png    329,125,296,143
    PNG Two Pixels Should Have Matched RGBA    check.png    329,125,287,175
    PNG Two Pixels Should Have Matched RGBA    check.png    329,125,319,160

    # annotation 12: polygon
    PNG Two Pixels Should Have Matched RGBA    check.png    304,211,286,326
    PNG Two Pixels Should Have Matched RGBA    check.png    304,211,332,313

    # annotation 13: polyline
    PNG Two Pixels Should Have Matched RGBA    check.png    385,54,394,105
    PNG Two Pixels Should Have Matched RGBA    check.png    385,54,438,60
    PNG Two Pixels Should Have Matched RGBA    check.png    385,54,470,103

    # annotation 14: vector
    PNG Two Pixels Should Have Matched RGBA    check.png    498,132,397,182
    PNG Two Pixels Should Have Matched RGBA    check.png    498,132,403,174
    PNG Two Pixels Should Have Matched RGBA    check.png    498,132,407,182

    # annotation 15: text
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,400,228
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,411,225
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,429,231
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,436,229
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,451,235
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,454,233
    PNG Two Pixels Should Have Matched RGBA    check.png    385,233,473,224

    # annotation 16: compass
    PNG Two Pixels Should Have Matched RGBA    check.png    438,329,438,280
    PNG Two Pixels Should Have Matched RGBA    check.png    438,329,388,330
    PNG Two Pixels Should Have Matched RGBA    check.png    438,329,442,257
    PNG Two Pixels Should Have Matched RGBA    check.png    438,329,380,335

    # annotation 17: ruler
    PNG Two Pixels Should Have Matched RGBA    check.png    558,250,505,330
    PNG Two Pixels Should Have Matched RGBA    check.png    558,250,558,330
    PNG Two Pixels Should Have Matched RGBA    check.png    558,250,513,296
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser


Creating annotations
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Pass Execution    to be implemented...
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    

    Sleep    5
    #Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser





# add a test to have two image matched and load a region file when the 2nd image is active 