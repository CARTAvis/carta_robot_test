*** Settings ***
Documentation     Test region of interest support in CARTA 
Resource          ../resource.robot


*** Test Cases ***
Import World Coordinate ds9 Region Made In ds9
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_with_ds9.reg
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
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
    #Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[7]    1.1337982178"
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
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[8]    334.1

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[4]    Annotation 14
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[5]    Compass - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[6]    17:56:20.6991120194
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[6]    -21:57:14.7607192644
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[7]    2.0000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[7]    2.0000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[8]    0.0

    # region 1: ellipse
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    280,69,260,88
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    280,69,280,108
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    280,69,299,88

    # region 2: ellipse
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    264,117,246,165
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    264,117,264,213
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    264,117,282,165

    # region 3: rectangle
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    264,266,264,318
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    264,266,360,318
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    264,266,360,266

    # region 4: polygon
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    255,334,255,371
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    255,334,281,397
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    255,334,294,372
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    255,334,294,333
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    255,334,276,362
    
    # region 5: line
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    443,73,520,156

    # annotation 6: vector
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    389,130,383,121
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    389,130,393,120
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    389,130,379,43

    # annotation 7: polyline
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    335,149,346,204
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    335,149,396,238

    # annotation 8: text
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    439,286,444,284
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    439,286,450,289
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    439,286,453,282
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    439,286,460,289

    # region 9, 10 ,11, 12: point
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    451,356,451,377
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    451,356,507,331
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    451,356,507,353

    # annotation 13: ruler
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    369,315,369,380
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    369,315,400,315
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    366,352,390,350

    # annotation 14: compass
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,538,31
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,500,67
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,536,27
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,490,64
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Import World Coordinate ds9 Region Made In ds9 Without Header
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_with_ds9_no_header.reg
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
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
    #Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[7]    1.1337982178"
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
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[8]    334.1

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[4]    Annotation 14
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[5]    Compass - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[6]    17:56:20.6991120194
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[6]    -21:57:14.7607192644
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[7]    2.0000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[7]    2.0000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[8]    0.0

    # region 1: ellipse
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    280,69,260,88
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    280,69,280,108
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    280,69,299,88

    # region 2: ellipse
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    264,117,246,165
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    264,117,264,213
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    264,117,282,165

    # region 3: rectangle
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    264,266,264,318
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    264,266,360,318
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    264,266,360,266

    # region 4: polygon
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    255,334,255,371
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    255,334,281,397
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    255,334,294,372
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    255,334,294,333
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    255,334,276,362
    
    # region 5: line
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    443,73,520,156

    # annotation 6: vector
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    389,130,383,121
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    389,130,393,120
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    389,130,379,43

    # annotation 7: polyline
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    335,149,346,204
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    335,149,396,238

    # annotation 8: text
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    439,286,444,284
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    439,286,450,289
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    439,286,453,282
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    439,286,460,289

    # region 9, 10 ,11, 12: point
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    451,356,451,377
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    451,356,507,331
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    451,356,507,353

    # annotation 13: ruler
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    369,315,369,380
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    369,315,400,315
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    366,352,390,350

    # annotation 14: compass
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,538,31
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,500,67
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,536,27
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,490,64
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Import Image Coordinate ds9 Region Made In ds9
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_with_ds9_pix.reg
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
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
    #Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[9]/div[7]    1.1337982178"
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
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[14]/div[8]    334.1

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[4]    Annotation 14
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[5]    Compass - Ann
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[6]    17:56:20.6991120194
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[6]    -21:57:14.7607207903
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[7]    2.0000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[7]    2.0000000000"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[15]/div[8]    0.0

    # region 1: ellipse
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    280,69,260,88
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    280,69,280,108
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    280,69,299,88

    # region 2: ellipse
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    264,117,246,165
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    264,117,264,213
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    264,117,282,165

    # region 3: rectangle
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    264,266,264,318
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    264,266,360,318
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    264,266,360,266

    # region 4: polygon
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    255,334,255,371
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    255,334,281,397
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    255,334,294,372
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    255,334,294,333
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    255,334,276,362
    
    # region 5: line
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    443,73,520,156

    # annotation 6: vector
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    389,130,383,121
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    389,130,393,120
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    389,130,379,43

    # annotation 7: polyline
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    335,149,346,204
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    335,149,396,238

    # annotation 8: text
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    439,286,444,284
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    439,286,450,289
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    439,286,453,282
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    439,286,460,289

    # region 9, 10 ,11, 12: point
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    451,356,451,377
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    451,356,507,331
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    451,356,507,353

    # annotation 13: ruler
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    369,315,369,380
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    369,315,400,315
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    366,352,390,350

    # annotation 14: compass
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,538,31
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,500,67
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,536,27
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,490,64
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Import World Coordinate CASA Region Made In CASAViewer
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    # this region file has been patched to show polyline (poly->polyline) and line (box->line) properly in CARTA
    Load Region File    all_region_generated_with_casaviewer.crtf
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
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

    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    230,69,228,122
    
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    228,122,228,149
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    228,122,326,149
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    228,122,326,122

    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    242,212,228,250
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    242,212,242,289
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    242,212,254,250

    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    269,326,265,405
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    269,326,358,357
    
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    441,154,515,292
    
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,295,405,356
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,295,443,315
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,295,490,371
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Import Image Coordinate CASA Region Made Manually
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_manually.crtf
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
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
    #Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[7]    3.9648452759"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[7]    1.0212765957"
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[10]/div[8]    0.0

    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[4]    Region 10
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[5]    Point
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[6]    17:56:20.7841056745
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[6]    -21:57:28.7946069373
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[7]    ${EMPTY}
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[11]/div[8]    0.0

    # region 1: rectangle
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    212,46,212,68
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    212,46,258,68
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    212,46,258,46
    
    # region 2: rectangle
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    210,104,210,136
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    210,104,286,136
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    210,104,286,104
    
    # region 3: rectangle
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    209,184,242,266
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    209,184,267,256
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    209,184,234,173
    
    # region 4: polygon
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    240,303,208,391
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    240,303,250,375
    
    # region 5: ellipse
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    364,43,341,66
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    364,43,364,90
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    364,43,387,66
    
    # region 6: ellipse
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    376,238,349,274
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    376,238,344,323
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    376,238,374,285
    
    # region 7: line
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    455,92,556,48
    
    # annotation 8: vector
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    442,130,565,164
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    442,130,554,154
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    442,130,551,167

    # annotation 9: text
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    480,225,484,229
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    480,225,498,229
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    480,225,510,229
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    480,225,517,239
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    480,225,530,229
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    480,225,537,231
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    480,225,547,230
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    480,225,554,226

    # region 10: point
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    455,92,515,343
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Import World Coordinate CASA Region Made In CARTA
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_with_carta.crtf
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
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

    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    248,82,214,129
    
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    214,129,288,169

    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    210,231,225,262
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    210,231,300,226
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    210,231,285,195
    
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    231,325,245,367
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    231,325,288,386
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    231,325,273,345
    
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    390,68,360,130
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    390,68,423,144
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    390,68,476,128
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    390,68,441,67
    
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    358,218,410,169
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    358,218,464,223
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    358,218,511,180

    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Import Image Coordinate CASA Region Made In CARTA
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_with_carta_pix.crtf
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
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

    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    248,82,214,129
    
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    214,129,288,169

    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    210,231,225,262
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    210,231,300,226
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    210,231,285,195
    
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    231,325,245,367
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    231,325,288,386
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    231,325,273,345
    
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    390,68,360,130
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    390,68,423,144
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    390,68,476,128
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    390,68,441,67
    
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    358,218,410,169
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    358,218,464,223
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    358,218,511,180

    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Import World Coordinate ds9 Region Made In CARTA
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_with_carta.reg
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
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

    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    248,82,214,129
    
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    214,129,288,169

    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    210,231,225,262
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    210,231,300,226
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    210,231,285,195
    
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    231,325,245,367
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    231,325,288,386
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    231,325,273,345
    
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    390,68,360,130
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    390,68,423,144
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    390,68,476,128
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    390,68,441,67
    
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    358,218,410,169
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    358,218,464,223
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    358,218,511,180

    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Import Image Coordinate ds9 Region Made In CARTA
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_with_carta_pix.reg
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
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

    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    248,82,214,129
    
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    214,129,288,169

    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    210,231,225,262
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    210,231,300,226
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    210,231,285,195
    
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    231,325,245,367
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    231,325,288,386
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    231,325,273,345
    
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    390,68,360,130
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    390,68,423,144
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    390,68,476,128
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    390,68,441,67
    
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    358,218,410,169
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    358,218,464,223
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    358,218,511,180

    Remove Files    check_${key}.png
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
    #Sleep    1
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_selected_from_viewer_${key}.png
    Click Element    ${REGION_LIST_TABLE_ROOT_XPATH}/div[7]/div[4]
    Capture Element Screenshot    ${VIEWER_DIV}    check_polyline_selected_from_list_${key}.png
    Click Element    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[2]
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov_${key}.png
    Click Element    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[4]
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov_selected_${key}.png
    Click Element    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[1]
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov_selected_locked_${key}.png
    Press Keys    None    DELETE
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[4]    Region 5
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[5]    Polygon
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov_selected_locked_tried_delete_${key}.png
    Click Element    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[1]
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov_selected_locked_tried_delete_unlocked_${key}.png
    Press Keys    None    DELETE
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[4]    Region 6
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[6]/div[5]    Polyline
    
    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_polygon_selected_from_viewer_${key}.png    290,67,259,130
    PNG Two Pixels Should Have Matched RGBA    check_polygon_selected_from_viewer_${key}.png    290,67,323,144
    PNG Two Pixels Should Have Matched RGBA    check_polygon_selected_from_viewer_${key}.png    290,67,377,129
    PNG Two Pixels Should Have Matched RGBA    check_polygon_selected_from_viewer_${key}.png    290,67,341,67
    PNG Two Pixels Should Not Have Matched RGBA    check_polygon_selected_from_viewer_${key}.png    290,67,316,67

    PNG Two Pixels Should Have Matched RGBA    check_polyline_selected_from_list_${key}.png    256,220,310,168
    PNG Two Pixels Should Have Matched RGBA    check_polyline_selected_from_list_${key}.png    256,220,364,224
    PNG Two Pixels Should Have Matched RGBA    check_polyline_selected_from_list_${key}.png    256,220,413,179
    PNG Two Pixels Should Not Have Matched RGBA    check_polyline_selected_from_list_${key}.png    256,220,283,195

    PNG Images Should Be Different    check_polyline_selected_from_list_${key}.png    check_polygon_center_fov_${key}.png    
    PNG Images Should Be Identical    check_polygon_center_fov_selected_locked_${key}.png    check_polygon_center_fov_selected_locked_tried_delete_${key}.png
    PNG Images Should Be Identical    check_polygon_center_fov_selected_${key}.png    check_polygon_center_fov_selected_locked_tried_delete_unlocked_${key}.png

    Remove Files    check_polygon_selected_from_viewer_${key}.png    check_polyline_selected_from_list_${key}.png    check_polygon_center_fov_${key}.png
    Remove Files    check_polygon_center_fov_selected_${key}.png    check_polygon_center_fov_selected_locked_${key}.png
    Remove Files    check_polygon_center_fov_selected_locked_tried_delete_${key}.png    check_polygon_center_fov_selected_locked_tried_delete_unlocked_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Creating Regions And Export As Region Files
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

    Set Selenium Speed    0
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

    # export as region files
    Set Selenium Speed    ${DELAY}
    ${system}=    Evaluate    platform.system()    platform
    
    # delete region files from previous tests if any
    Remove Files    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_world.crtf    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_pixel.crtf    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_pixel.reg    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_world.reg

    # save as a crtf region file in world coordinate
    Click Element    //*[@id="root"]/div/div[1]/span[1]/ul/li
    Click Element    xpath://*[contains(text(), "Export Regions")]
    Input Text    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[3]/div[2]/input    e2e_check_region_world.crtf
    Click Element    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[4]/div/span/a

    # save as a crtf region file in pixel coordinate
    Click Element    //*[@id="root"]/div/div[1]/span[1]/ul/li
    Click Element    xpath://*[contains(text(), "Export Regions")]
    Click Element    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[3]/div[2]/span/div/span[2]/button
    Click Element    xpath://*[contains(text(), "Pixel coordinates")]
    Input Text    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[3]/div[2]/input    e2e_check_region_pixel.crtf
    Click Element    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[4]/div/span/a

    # save as a ds9 region file in pixel coordinate
    Click Element    //*[@id="root"]/div/div[1]/span[1]/ul/li
    Click Element    xpath://*[contains(text(), "Export Regions")]
    Click Element    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[3]/div[2]/span/div/span[1]/button
    Click Element    xpath://*[contains(text(), "DS9 region file")]
    Input Text    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[3]/div[2]/input    e2e_check_region_pixel.reg
    Click Element    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[4]/div/span/a

    # save as a ds9 region file in world coordinate
    Click Element    //*[@id="root"]/div/div[1]/span[1]/ul/li
    Click Element    xpath://*[contains(text(), "Export Regions")]
    Click Element    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[3]/div[2]/span/div/span[2]/button
    Click Element    xpath://*[contains(text(), "World coordinates")]
    Input Text    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[3]/div[2]/input    e2e_check_region_world.reg
    Click Element    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[4]/div/span/a

    # compare generated regions files with snapshot region files
    Set Selenium Speed    0
    ${test_world_crtf} =    Get File    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_world.crtf
    ${snapshot_world_crtf} =    Get File    ${SNAPSHOT_FOLDER}/e2e_check_region_world.crtf
    Should Be Equal As Strings    ${test_world_crtf}    ${snapshot_world_crtf}

    ${test_pixel_crtf} =    Get File    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_pixel.crtf
    ${snapshot_pixel_crtf} =    Get File    ${SNAPSHOT_FOLDER}/e2e_check_region_pixel.crtf
    Should Be Equal As Strings    ${test_pixel_crtf}    ${snapshot_pixel_crtf}

    ${test_pixel_ds9} =    Get File    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_pixel.reg
    ${snapshot_pixel_ds9} =    Get File    ${SNAPSHOT_FOLDER}/e2e_check_region_pixel.reg
    Should Be Equal As Strings    ${test_pixel_ds9}    ${snapshot_pixel_ds9}

    ${test_world_ds9} =    Get File    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_world.reg
    ${snapshot_world_ds9} =    Get File    ${SNAPSHOT_FOLDER}/e2e_check_region_world.reg
    Should Be Equal As Strings    ${test_world_ds9}    ${snapshot_world_ds9}

    Remove Files    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_world.crtf    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_pixel.crtf    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_pixel.reg    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_world.reg
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
    Click Element    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div/span[1]/a
    Click Element    xpath://*[contains(text(), "Region List")]
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Region 1

    # unmatch image with the XY button
    Click Element    xpath://*[contains(text(), "Image List")]
    Click Element    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div/span[1]/a
    Click Element    xpath://*[contains(text(), "Region List")]
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Region 2
    # set a new active image
    Click Element    xpath://*[contains(text(), "Image List")]
    Click Element    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div
    Click Element    xpath://*[contains(text(), "Region List")]
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Region 1

    # set the 2nd image as active by clicking it in the image list
    Click Element    xpath://*[contains(text(), "Image List")]
    Click Element    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[6]/div/div
    # create a new region on the unmatched 2nd image
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[1]/a
    Click Element At Coordinates    //*[@id="image-panel-1-0"]/div[8]/div/div/canvas    20    -50
    Click Element    xpath://*[contains(text(), "Region List")]
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[4]    Region 3

    # match the 2nd image
    Click Element    xpath://*[contains(text(), "Image List")]
    Click Element    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div/span[1]/a
    Click Element    xpath://*[contains(text(), "Region List")]
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Region 1
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[4]    Region 4
    # set a new active image
    Click Element    xpath://*[contains(text(), "Image List")]
    Click Element    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div
    Click Element    xpath://*[contains(text(), "Region List")]
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Region 1
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[4]    Region 4

    # unmatch again
    Click Element    xpath://*[contains(text(), "Image List")]
    Click Element    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div/span[1]/a
    Click Element    xpath://*[contains(text(), "Region List")]
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[2]/div[4]    Region 1
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[3]/div[4]    Region 4
    # set a new active image
    Click Element    xpath://*[contains(text(), "Image List")]
    Click Element    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[6]/div/div
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
    #Sleep    1

    # scroll the region list to the very bottom
    Assign Id To Element    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]    tmp_REGIONLIST
    Execute Javascript    window.document.getElementById("tmp_REGIONLIST").scrollTo(0, 200000)

    Page Should Contain    Region 4000
    [Teardown]    Kill carta_backend And Close Browser


Loading Regions on Active Matched Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    m51cm3i_8_small.fits
    Append Image    m51_151_MHz.fits
    # match m51_151_MHz.fits to m51cm3i_8_small.fits by clicking the XY button in the image list
    Click Element    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div/span[1]/a
    Load Region File    region_004.crtf
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png

    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    118,72,497,72
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    139,149,518,149
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    163,120,542,120
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Loading Regions on Active Reference Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    m51cm3i_8_small.fits
    Append Image    m51_151_MHz.fits
    # match m51_151_MHz.fits to m51cm3i_8_small.fits by clicking the XY button in the image list
    Click Element    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div/span[1]/a
    # set m51cm3i_8_small.fits as active by clicking it in the image list
    Click Element    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]
    Load Region File    region_004.crtf
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png

    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    118,72,497,72
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    139,149,518,149
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    163,120,542,120
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


# add a test to have two image matched and load a region file when the 2nd image is active 