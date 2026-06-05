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
    
    Click Element    //*[contains(text(), "Region List")]
    Click Element    ${X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
    Verify Region List Table Cell Content    2    5    Region 1
    Verify Region List Table Cell Content    2    6    Ellipse
    Verify Region List Table Cell Content    2    7    17:56:21.6479279877
    Verify Region List Table Cell Content    2    7    -21:57:15.8104802550
    Verify Region List Table Cell Content    2    8    1.0000000000"
    Verify Region List Table Cell Content    2    8    1.0000000000"
    Verify Region List Table Cell Content    2    9    0.0
    
    Verify Region List Table Cell Content    3    5    Region 2
    Verify Region List Table Cell Content    3    6    Ellipse
    Verify Region List Table Cell Content    3    7    17:56:21.7054319929
    Verify Region List Table Cell Content    3    7    -21:57:19.7107203749
    Verify Region List Table Cell Content    3    8    0.9000000000"
    Verify Region List Table Cell Content    3    8    2.4500000000"
    Verify Region List Table Cell Content    3    9    270.0
    
    Verify Region List Table Cell Content    4    5    Region 3
    Verify Region List Table Cell Content    4    6    Rectangle
    Verify Region List Table Cell Content    4    7    17:56:21.5293200005
    Verify Region List Table Cell Content    4    7    -21:57:26.2105199833
    Verify Region List Table Cell Content    4    8    4.9000000000"
    Verify Region List Table Cell Content    4    8    2.7000000000"
    Verify Region List Table Cell Content    4    9    360.0

    Verify Region List Table Cell Content    5    5    Region 4
    Verify Region List Table Cell Content    5    6    Polygon
    Verify Region List Table Cell Content    5    7    17:56:21.6659046396
    Verify Region List Table Cell Content    5    7    -21:57:29.9356134124
    Verify Region List Table Cell Content    5    8    1.9999904633"
    Verify Region List Table Cell Content    5    8    3.3498060226"
    Verify Region List Table Cell Content    5    9    0.0

    Verify Region List Table Cell Content    6    5    Region 5
    Verify Region List Table Cell Content    6    6    Line
    Verify Region List Table Cell Content    6    7    17:56:20.9093646471
    Verify Region List Table Cell Content    6    7    -21:57:17.1356442971
    Verify Region List Table Cell Content    6    8    5.9435115276"
    Verify Region List Table Cell Content    6    9    43.0

    Verify Region List Table Cell Content    7    5    Annotation 6
    Verify Region List Table Cell Content    7    6    Vector - Ann
    Verify Region List Table Cell Content    7    7    17:56:21.2651633747
    Verify Region List Table Cell Content    7    7    -21:57:15.7105185930
    Verify Region List Table Cell Content    7    8    4.5329991666"
    Verify Region List Table Cell Content    7    9    7.0

    Verify Region List Table Cell Content    8    5    Annotation 7
    Verify Region List Table Cell Content    8    6    Polyline - Ann
    Verify Region List Table Cell Content    8    7    17:56:21.3316565126
    Verify Region List Table Cell Content    8    7    -21:57:21.1856425240
    Verify Region List Table Cell Content    8    8    3.2000076294"
    Verify Region List Table Cell Content    8    8    4.6497558594"
    Verify Region List Table Cell Content    8    9    0.0

    Verify Region List Table Cell Content    9    5    Annotation 8
    Verify Region List Table Cell Content    9    6    Text - Ann
    Verify Region List Table Cell Content    9    7    17:56:21.0261599764
    Verify Region List Table Cell Content    9    7    -21:57:25.9106398420
    #Verify Region List Table Cell Content    9    8    1.1337982178"
    Verify Region List Table Cell Content    9    8    0.5106382979"
    Verify Region List Table Cell Content    9    9    0.0

    Verify Region List Table Cell Content    10    5    Region 9
    Verify Region List Table Cell Content    10    6    Point
    Verify Region List Table Cell Content    10    7    17:56:21.0189840214
    Verify Region List Table Cell Content    10    7    -21:57:29.4605998495
    Verify Region List Table Cell Content    10    8    ${EMPTY}
    Verify Region List Table Cell Content    10    9    0.0

    Verify Region List Table Cell Content    11    5    Region 10
    Verify Region List Table Cell Content    11    6    Point
    Verify Region List Table Cell Content    11    7    17:56:20.8141199666
    Verify Region List Table Cell Content    11    7    -21:57:28.2106799170
    Verify Region List Table Cell Content    11    8    ${EMPTY}
    Verify Region List Table Cell Content    11    9    0.0

    Verify Region List Table Cell Content    12    5    Region 11
    Verify Region List Table Cell Content    12    6   Point
    Verify Region List Table Cell Content    12    7    17:56:21.0189840159
    Verify Region List Table Cell Content    12    7    -21:57:30.5405999647
    Verify Region List Table Cell Content    12    8    ${EMPTY}
    Verify Region List Table Cell Content    12    9    0.0

    Verify Region List Table Cell Content    13    5    Region 12
    Verify Region List Table Cell Content    13    6    Point
    Verify Region List Table Cell Content    13    7    17:56:20.8141199674
    Verify Region List Table Cell Content    13    7    -21:57:29.2906798413
    Verify Region List Table Cell Content    13    8    ${EMPTY}
    Verify Region List Table Cell Content    13    9    0.0

    Verify Region List Table Cell Content    14    5    Annotation 13
    Verify Region List Table Cell Content    14    6    Ruler - Ann
    Verify Region List Table Cell Content    14    7    17:56:21.2615758083
    Verify Region List Table Cell Content    14    7    -21:57:29.0606406413
    Verify Region List Table Cell Content    14    8    3.7791013191"
    Verify Region List Table Cell Content    14    9    334.1

    Verify Region List Table Cell Content    15    5    Annotation 14
    Verify Region List Table Cell Content    15    6    Compass - Ann
    Verify Region List Table Cell Content    15    7    17:56:20.6991120194
    Verify Region List Table Cell Content    15    7    -21:57:14.7607192644
    Verify Region List Table Cell Content    15    8    2.0000000000"
    Verify Region List Table Cell Content    15    8    2.0000000000"
    Verify Region List Table Cell Content    15    9    0.0

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
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,538,27
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,501,68
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,537,68
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,492,68
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Import World Coordinate ds9 Region Made In ds9 Without Header
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_with_ds9_no_header.reg
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    
    Click Element    //*[contains(text(), "Region List")]
    Click Element    ${X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
    Verify Region List Table Cell Content    2    5    Region 1
    Verify Region List Table Cell Content    2    6    Ellipse
    Verify Region List Table Cell Content    2    7    17:56:21.6479279877
    Verify Region List Table Cell Content    2    7    -21:57:15.8104802550
    Verify Region List Table Cell Content    2    8    1.0000000000"
    Verify Region List Table Cell Content    2    8    1.0000000000"
    Verify Region List Table Cell Content    2    9    0.0
    
    Verify Region List Table Cell Content    3    5    Region 2
    Verify Region List Table Cell Content    3    6    Ellipse
    Verify Region List Table Cell Content    3    7    17:56:21.7054319929
    Verify Region List Table Cell Content    3    7    -21:57:19.7107203749
    Verify Region List Table Cell Content    3    8    0.9000000000"
    Verify Region List Table Cell Content    3    8    2.4500000000"
    Verify Region List Table Cell Content    3    9    270.0
    
    Verify Region List Table Cell Content    4    5    Region 3
    Verify Region List Table Cell Content    4    6    Rectangle
    Verify Region List Table Cell Content    4    7    17:56:21.5293200005
    Verify Region List Table Cell Content    4    7    -21:57:26.2105199833
    Verify Region List Table Cell Content    4    8    4.9000000000"
    Verify Region List Table Cell Content    4    8    2.7000000000"
    Verify Region List Table Cell Content    4    9    360.0

    Verify Region List Table Cell Content    5    5    Region 4
    Verify Region List Table Cell Content    5    6    Polygon
    Verify Region List Table Cell Content    5    7    17:56:21.6659046396
    Verify Region List Table Cell Content    5    7    -21:57:29.9356134124
    Verify Region List Table Cell Content    5    8    1.9999904633"
    Verify Region List Table Cell Content    5    8    3.3498060226"
    Verify Region List Table Cell Content    5    9    0.0

    Verify Region List Table Cell Content    6    5    Region 5
    Verify Region List Table Cell Content    6    6    Line
    Verify Region List Table Cell Content    6    7    17:56:20.9093646471
    Verify Region List Table Cell Content    6    7    -21:57:17.1356442971
    Verify Region List Table Cell Content    6    8    5.9435115276"
    Verify Region List Table Cell Content    6    9    43.0

    Verify Region List Table Cell Content    7    5    Annotation 6
    Verify Region List Table Cell Content    7    6    Vector - Ann
    Verify Region List Table Cell Content    7    7    17:56:21.2651633747
    Verify Region List Table Cell Content    7    7    -21:57:15.7105185930
    Verify Region List Table Cell Content    7    8    4.5329991666"
    Verify Region List Table Cell Content    7    9    7.0

    Verify Region List Table Cell Content    8    5    Annotation 7
    Verify Region List Table Cell Content    8    6    Polyline - Ann
    Verify Region List Table Cell Content    8    7    17:56:21.3316565126
    Verify Region List Table Cell Content    8    7    -21:57:21.1856425240
    Verify Region List Table Cell Content    8    8    3.2000076294"
    Verify Region List Table Cell Content    8    8    4.6497558594"
    Verify Region List Table Cell Content    8    9    0.0

    Verify Region List Table Cell Content    9    5    Annotation 8
    Verify Region List Table Cell Content    9    6    Text - Ann
    Verify Region List Table Cell Content    9    7    17:56:21.0261599764
    Verify Region List Table Cell Content    9    7    -21:57:25.9106398420
    #Verify Region List Table Cell Content    9    8    1.1337982178"
    Verify Region List Table Cell Content    9    8    0.5106382979"
    Verify Region List Table Cell Content    9    9    0.0

    Verify Region List Table Cell Content    10    5    Region 9
    Verify Region List Table Cell Content    10    6    Point
    Verify Region List Table Cell Content    10    7    17:56:21.0189840214
    Verify Region List Table Cell Content    10    7    -21:57:29.4605998495
    Verify Region List Table Cell Content    10    8    ${EMPTY}
    Verify Region List Table Cell Content    10    9    0.0

    Verify Region List Table Cell Content    11    5    Region 10
    Verify Region List Table Cell Content    11    6    Point
    Verify Region List Table Cell Content    11    7    17:56:20.8141199666
    Verify Region List Table Cell Content    11    7    -21:57:28.2106799170
    Verify Region List Table Cell Content    11    8    ${EMPTY}
    Verify Region List Table Cell Content    11    9    0.0

    Verify Region List Table Cell Content    12    5    Region 11
    Verify Region List Table Cell Content    12    6    Point
    Verify Region List Table Cell Content    12    7    17:56:21.0189840159
    Verify Region List Table Cell Content    12    7    -21:57:30.5405999647
    Verify Region List Table Cell Content    12    8    ${EMPTY}
    Verify Region List Table Cell Content    12    9    0.0

    Verify Region List Table Cell Content    13    5    Region 12
    Verify Region List Table Cell Content    13    6    Point
    Verify Region List Table Cell Content    13    7    17:56:20.8141199674
    Verify Region List Table Cell Content    13    7    -21:57:29.2906798413
    Verify Region List Table Cell Content    13    8    ${EMPTY}
    Verify Region List Table Cell Content    13    9    0.0

    Verify Region List Table Cell Content    14    5    Annotation 13
    Verify Region List Table Cell Content    14    6    Ruler - Ann
    Verify Region List Table Cell Content    14    7    17:56:21.2615758083
    Verify Region List Table Cell Content    14    7    -21:57:29.0606406413
    Verify Region List Table Cell Content    14    8    3.7791013191"
    Verify Region List Table Cell Content    14    9    334.1

    Verify Region List Table Cell Content    15    5    Annotation 14
    Verify Region List Table Cell Content    15    6    Compass - Ann
    Verify Region List Table Cell Content    15    7    17:56:20.6991120194
    Verify Region List Table Cell Content    15    7    -21:57:14.7607192644
    Verify Region List Table Cell Content    15    8    2.0000000000"
    Verify Region List Table Cell Content    15    8    2.0000000000"
    Verify Region List Table Cell Content    15    9    0.0

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
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,538,27
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,501,68
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,537,68
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,492,68
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Import Image Coordinate ds9 Region Made In ds9
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_with_ds9_pix.reg
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    
    Click Element    //*[contains(text(), "Region List")]
    Click Element    ${X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
    Verify Region List Table Cell Content    2    5    Region 1
    Verify Region List Table Cell Content    2    6    Ellipse
    Verify Region List Table Cell Content    2    7    17:56:21.6479280152
    Verify Region List Table Cell Content    2    7    -21:57:15.8104802550
    Verify Region List Table Cell Content    2    8    1.0000000000"
    Verify Region List Table Cell Content    2    8    1.0000000000"
    Verify Region List Table Cell Content    2    9    0.0
    
    Verify Region List Table Cell Content    3    5    Region 2
    Verify Region List Table Cell Content    3    6    Ellipse
    Verify Region List Table Cell Content    3    7    17:56:21.7054319929
    Verify Region List Table Cell Content    3    7    -21:57:19.7107203749
    Verify Region List Table Cell Content    3    8    0.9000000000"
    Verify Region List Table Cell Content    3    8    2.4500000000"
    Verify Region List Table Cell Content    3    9    270.0
    
    Verify Region List Table Cell Content    4    5    Region 3
    Verify Region List Table Cell Content    4    6    Rectangle
    Verify Region List Table Cell Content    4    7    17:56:21.5293200005
    Verify Region List Table Cell Content    4    7    -21:57:26.2105199833
    Verify Region List Table Cell Content    4    8    4.9000000000"
    Verify Region List Table Cell Content    4    8    2.7000000000"
    Verify Region List Table Cell Content    4    9    360.0

    Verify Region List Table Cell Content    5    5    Region 4
    Verify Region List Table Cell Content    5    6    Polygon
    Verify Region List Table Cell Content    5    7    17:56:21.6659046670
    Verify Region List Table Cell Content    5    7    -21:57:29.9356134124
    Verify Region List Table Cell Content    5    8    1.9999897003"
    Verify Region List Table Cell Content    5    8    3.3498060226"
    Verify Region List Table Cell Content    5    9    0.0

    Verify Region List Table Cell Content    6    5    Region 5
    Verify Region List Table Cell Content    6    6    Line
    Verify Region List Table Cell Content    6    7    17:56:20.9093646471
    Verify Region List Table Cell Content    6    7    -21:57:17.1356442971
    Verify Region List Table Cell Content    6    8    5.9435115276"
    Verify Region List Table Cell Content    6    9    43.0

    Verify Region List Table Cell Content    7    5    Annotation 6
    Verify Region List Table Cell Content    7    6    Vector - Ann
    Verify Region List Table Cell Content    7    7    17:56:21.2651633472
    Verify Region List Table Cell Content    7    7    -21:57:15.7105185931
    Verify Region List Table Cell Content    7    8    4.5329992592"
    Verify Region List Table Cell Content    7    9    7.0

    Verify Region List Table Cell Content    8    5    Annotation 7
    Verify Region List Table Cell Content    8    6    Polyline - Ann
    Verify Region List Table Cell Content    8    7    17:56:21.3316565126
    Verify Region List Table Cell Content    8    7    -21:57:21.1856425240
    Verify Region List Table Cell Content    8    8    3.2000076294"
    Verify Region List Table Cell Content    8    8    4.6497558594"
    Verify Region List Table Cell Content    8    9    0.0

    Verify Region List Table Cell Content    9    5    Annotation 8
    Verify Region List Table Cell Content    9    6    Text - Ann
    Verify Region List Table Cell Content    9    7    17:56:21.0261599764
    Verify Region List Table Cell Content    9    7    -21:57:25.9106398420
    #Verify Region List Table Cell Content    9    8    1.1337982178"
    Verify Region List Table Cell Content    9    8    0.5106382979"
    Verify Region List Table Cell Content    9    9    0.0

    Verify Region List Table Cell Content    10    5    Region 9
    Verify Region List Table Cell Content    10    6    Point
    Verify Region List Table Cell Content    10    7    17:56:21.0189840214
    Verify Region List Table Cell Content    10    7    -21:57:29.4605998495
    Verify Region List Table Cell Content    10    8    ${EMPTY}
    Verify Region List Table Cell Content    10    9    0.0

    Verify Region List Table Cell Content    11    5    Region 10
    Verify Region List Table Cell Content    11    6    Point
    Verify Region List Table Cell Content    11    7    17:56:20.8141199666
    Verify Region List Table Cell Content    11    7    -21:57:28.2106799170
    Verify Region List Table Cell Content    11    8    ${EMPTY}
    Verify Region List Table Cell Content    11    9    0.0

    Verify Region List Table Cell Content    12    5    Region 11
    Verify Region List Table Cell Content    12    6    Point
    Verify Region List Table Cell Content    12    7    17:56:21.0189840159
    Verify Region List Table Cell Content    12    7    -21:57:30.5405999647
    Verify Region List Table Cell Content    12    8    ${EMPTY}
    Verify Region List Table Cell Content    12    9    0.0

    Verify Region List Table Cell Content    13    5    Region 12
    Verify Region List Table Cell Content    13    6    Point
    Verify Region List Table Cell Content    13    7    17:56:20.8141199674
    Verify Region List Table Cell Content    13    7    -21:57:29.2906798413
    Verify Region List Table Cell Content    13    8    ${EMPTY}
    Verify Region List Table Cell Content    13    9    0.0

    Verify Region List Table Cell Content    14    5    Annotation 13
    Verify Region List Table Cell Content    14    6    Ruler - Ann
    Verify Region List Table Cell Content    14    7    17:56:21.2615758083
    Verify Region List Table Cell Content    14    7    -21:57:29.0606406413
    Verify Region List Table Cell Content    14    8    3.7791013191"
    Verify Region List Table Cell Content    14    9    334.1

    Verify Region List Table Cell Content    15    5    Annotation 14
    Verify Region List Table Cell Content    15    6    Compass - Ann
    Verify Region List Table Cell Content    15    7    17:56:20.6991120194
    Verify Region List Table Cell Content    15    7    -21:57:14.7607207903
    Verify Region List Table Cell Content    15    8    2.0000000000"
    Verify Region List Table Cell Content    15    8    2.0000000000"
    Verify Region List Table Cell Content    15    9    0.0

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
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,538,27
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,501,68
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,537,68
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    538,67,492,68
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Import World Coordinate CASA Region Made In CASAViewer
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    # this region file has been patched to show polyline (poly->polyline) and line (box->line) properly in CARTA
    Load Region File    all_region_generated_with_casaviewer.crtf
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    
    Click Element    //*[contains(text(), "Region List")]
    Click Element    ${X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
    Verify Region List Table Cell Content    2    5    Region 1
    Verify Region List Table Cell Content    2    6    Point
    Verify Region List Table Cell Content    2    7    17:56:21.8283000066
    Verify Region List Table Cell Content    2    7    -21:57:14.8361006384
    Verify Region List Table Cell Content    2    8    ${EMPTY}
    Verify Region List Table Cell Content    2    9    0.0
    
    Verify Region List Table Cell Content    3    5    Region 2
    Verify Region List Table Cell Content    3    6    Rectangle
    Verify Region List Table Cell Content    3    7    17:56:21.6574699985
    Verify Region List Table Cell Content    3    7    -21:57:18.2263999360
    Verify Region List Table Cell Content    3    8    4.9743000031"
    Verify Region List Table Cell Content    3    8    1.3979999542"
    Verify Region List Table Cell Content    3    9    0.0
    
    Verify Region List Table Cell Content    4    5    Region 3
    Verify Region List Table Cell Content    4    6    Ellipse
    Verify Region List Table Cell Content    4    7    17:56:21.7881199926
    Verify Region List Table Cell Content    4    7    -21:57:24.0808001163
    Verify Region List Table Cell Content    4    8    1.9746999741"
    Verify Region List Table Cell Content    4    8    0.6640999794"
    Verify Region List Table Cell Content    4    9    0.0

    Verify Region List Table Cell Content    5    5    Region 4
    Verify Region List Table Cell Content    5    6    Polygon
    Verify Region List Table Cell Content    5    7    17:56:21.5280941962
    Verify Region List Table Cell Content    5    7    -21:57:30.0050709477
    Verify Region List Table Cell Content    5    8    4.8581291199"
    Verify Region List Table Cell Content    5    8    4.1243021965"
    Verify Region List Table Cell Content    5    9    0.0

    Verify Region List Table Cell Content    6    5    Region 5
    Verify Region List Table Cell Content    6    6    Polyline
    Verify Region List Table Cell Content    6    7    17:56:21.0670757526
    Verify Region List Table Cell Content    6    7    -21:57:28.2924571925
    Verify Region List Table Cell Content    6    8    5.4524627686"
    Verify Region List Table Cell Content    6    8    4.0543317795"
    Verify Region List Table Cell Content    6    9    0.0

    Verify Region List Table Cell Content    7    5    Region 6
    Verify Region List Table Cell Content    7    6    Line
    Verify Region List Table Cell Content    7    7    17:56:20.9201110298
    Verify Region List Table Cell Content    7    7    -21:57:22.7177037411
    Verify Region List Table Cell Content    7    8    8.3041952513"
    Verify Region List Table Cell Content    7    9    208.4

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
    
    Click Element    //*[contains(text(), "Region List")]
    Click Element    ${X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
    Verify Region List Table Cell Content    2    5    Region 1
    Verify Region List Table Cell Content    2    6    Rectangle
    Verify Region List Table Cell Content    2    7    17:56:21.8114504359
    Verify Region List Table Cell Content    2    7    -21:57:14.2106005304
    Verify Region List Table Cell Content    2    8    2.3500000000"
    Verify Region List Table Cell Content    2    8    1.1000000000"
    Verify Region List Table Cell Content    2    9    0.0
    
    Verify Region List Table Cell Content    3    5    Region 2
    Verify Region List Table Cell Content    3    6    Rectangle
    Verify Region List Table Cell Content    3    7    17:56:21.7629351528
    Verify Region List Table Cell Content    3    7    -21:57:17.4406101211
    Verify Region List Table Cell Content    3    8    3.8764999390"
    Verify Region List Table Cell Content    3    8    1.6614999771"
    Verify Region List Table Cell Content    3    9    0.0
    
    Verify Region List Table Cell Content    4    5    Region 3
    Verify Region List Table Cell Content    4    6    Rectangle
    Verify Region List Table Cell Content    4    7    17:56:21.8021146141
    Verify Region List Table Cell Content    4    7    -21:57:22.5056020838
    Verify Region List Table Cell Content    4    8    1.4239999771"
    Verify Region List Table Cell Content    4    8    4.5889999390"
    Verify Region List Table Cell Content    4    9    22.0

    Verify Region List Table Cell Content    5    5    Region 4
    Verify Region List Table Cell Content    5    6    Polygon
    Verify Region List Table Cell Content    5    7    17:56:21.8348270718
    Verify Region List Table Cell Content    5    7    -21:57:28.9725958282
    Verify Region List Table Cell Content    5    8    2.2550001144"
    Verify Region List Table Cell Content    5    8    4.7079998016"
    Verify Region List Table Cell Content    5    9    0.0

    Verify Region List Table Cell Content    6    5    Region 5
    Verify Region List Table Cell Content    6    6    Ellipse
    Verify Region List Table Cell Content    6    7    17:56:21.3388460803
    Verify Region List Table Cell Content    6    7    -21:57:14.6606530567
    Verify Region List Table Cell Content    6    8    1.1850000381"
    Verify Region List Table Cell Content    6    8    1.1850000381"
    Verify Region List Table Cell Content    6    9    0.0

    Verify Region List Table Cell Content    7    5    Region 6
    Verify Region List Table Cell Content    7    6    Ellipse
    Verify Region List Table Cell Content    7    7    17:56:21.3496294007
    Verify Region List Table Cell Content    7    7    -21:57:25.6106528022
    Verify Region List Table Cell Content    7    8    2.3000000000"
    Verify Region List Table Cell Content    7    8    0.7000000000"
    Verify Region List Table Cell Content    7    9    339.0

    Verify Region List Table Cell Content    8    5    Region 7
    Verify Region List Table Cell Content    8    6   Line
    Verify Region List Table Cell Content    8    7    17:56:20.8182258550
    Verify Region List Table Cell Content    8    7    -21:57:14.8693632683
    Verify Region List Table Cell Content    8    8    5.8488571441"
    Verify Region List Table Cell Content    8    9    293.1

    Verify Region List Table Cell Content    9    5    Annotation 8
    Verify Region List Table Cell Content    9    6    Vector - Ann
    Verify Region List Table Cell Content    9    7    17:56:20.8324545031
    Verify Region List Table Cell Content    9    7    -21:57:18.7858658161
    Verify Region List Table Cell Content    9    8    6.4878224255"
    Verify Region List Table Cell Content    9    9    74.4

    Verify Region List Table Cell Content    10    5    Annotation 9
    Verify Region List Table Cell Content    10    6    Text - Ann
    Verify Region List Table Cell Content    10    7    17:56:20.7783967837
    Verify Region List Table Cell Content    10    7    -21:57:23.0581056880
    #Verify Region List Table Cell Content    10    8    3.9648452759"
    Verify Region List Table Cell Content    10    8    1.0212765957"
    Verify Region List Table Cell Content    10    9    0.0

    Verify Region List Table Cell Content    11    5    Region 10
    Verify Region List Table Cell Content    11    6    Point
    Verify Region List Table Cell Content    11    7    17:56:20.7841056745
    Verify Region List Table Cell Content    11    7    -21:57:28.7946069373
    Verify Region List Table Cell Content    11    8    ${EMPTY}
    Verify Region List Table Cell Content    11    9    0.0

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
    
    Click Element    //*[contains(text(), "Region List")]
    Click Element    ${X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
    Verify Region List Table Cell Content    2    5    Region 1
    Verify Region List Table Cell Content    2    6    Point
    Verify Region List Table Cell Content    2    7    17:56:21.7651299952
    Verify Region List Table Cell Content    2    7    -21:57:15.4624999782
    Verify Region List Table Cell Content    2    8    ${EMPTY}
    Verify Region List Table Cell Content    2    9    0.0
    
    Verify Region List Table Cell Content    3    5    Region 2
    Verify Region List Table Cell Content    3    6    Line
    Verify Region List Table Cell Content    3    7    17:56:21.7537553016
    Verify Region List Table Cell Content    3    7    -21:57:18.9042538983
    Verify Region List Table Cell Content    3    8    4.4958942179"
    Verify Region List Table Cell Content    3    9    61.6
    
    Verify Region List Table Cell Content    4    5    Region 3
    Verify Region List Table Cell Content    4    6    Rectangle
    Verify Region List Table Cell Content    4    7    17:56:21.7367000130
    Verify Region List Table Cell Content    4    7    -21:57:22.9789997811
    Verify Region List Table Cell Content    4    8    4.2724998474"
    Verify Region List Table Cell Content    4    8    1.8197999954"
    Verify Region List Table Cell Content    4    9    25.9

    Verify Region List Table Cell Content    5    5    Region 4
    Verify Region List Table Cell Content    5    6    Ellipse
    Verify Region List Table Cell Content    5    7    17:56:21.7224799881
    Verify Region List Table Cell Content    5    7    -21:57:29.4669000671
    Verify Region List Table Cell Content    5    8    2.1363000870"
    Verify Region List Table Cell Content    5    8    0.9098999977"
    Verify Region List Table Cell Content    5    9    42.7

    Verify Region List Table Cell Content    6    5    Region 5
    Verify Region List Table Cell Content    6    6    Polygon
    Verify Region List Table Cell Content    6    7    17:56:21.1395403244
    Verify Region List Table Cell Content    6    7    -21:57:16.6889534079
    Verify Region List Table Cell Content    6    8    6.0131179810"
    Verify Region List Table Cell Content    6    8    3.9560943604"
    Verify Region List Table Cell Content    6    9    0.0

    Verify Region List Table Cell Content    7    5    Region 6
    Verify Region List Table Cell Content    7    6    Polyline
    Verify Region List Table Cell Content    7    7    17:56:21.0798244963
    Verify Region List Table Cell Content    7    7    -21:57:21.3175029214
    Verify Region List Table Cell Content    7    8    7.9912445068"
    Verify Region List Table Cell Content    7    8    2.8484153748"
    Verify Region List Table Cell Content    7    9    0.0

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
    
    Click Element    //*[contains(text(), "Region List")]
    Click Element    ${X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
    Verify Region List Table Cell Content    2    5    Region 1
    Verify Region List Table Cell Content    2    6    Point
    Verify Region List Table Cell Content    2    7    17:56:21.7651252516
    Verify Region List Table Cell Content    2    7    -21:57:15.4625350742
    Verify Region List Table Cell Content    2    8    ${EMPTY}
    Verify Region List Table Cell Content    2    9    0.0
    
    Verify Region List Table Cell Content    3    5    Region 2
    Verify Region List Table Cell Content    3    6    Line
    Verify Region List Table Cell Content    3    7    17:56:21.7537540814
    Verify Region List Table Cell Content    3    7    -21:57:18.9042935714
    Verify Region List Table Cell Content    3    8    4.4959897458"
    Verify Region List Table Cell Content    3    9    61.6
    
    Verify Region List Table Cell Content    4    5    Region 3
    Verify Region List Table Cell Content    4    6    Rectangle
    Verify Region List Table Cell Content    4    7    17:56:21.7366961742
    Verify Region List Table Cell Content    4    7    -21:57:22.9790196181
    Verify Region List Table Cell Content    4    8    4.2725250244"
    Verify Region List Table Cell Content    4    8    1.8197799683"
    Verify Region List Table Cell Content    4    9    25.9

    Verify Region List Table Cell Content    5    5    Region 4
    Verify Region List Table Cell Content    5    6    Ellipse
    Verify Region List Table Cell Content    5    7    17:56:21.7224838544
    Verify Region List Table Cell Content    5    7    -21:57:29.4669370689
    Verify Region List Table Cell Content    5    8    2.1362649918"
    Verify Region List Table Cell Content    5    8    0.9098899841"
    Verify Region List Table Cell Content    5    9    42.7

    Verify Region List Table Cell Content    6    5    Region 5
    Verify Region List Table Cell Content    6    6    Polygon
    Verify Region List Table Cell Content    6    7    17:56:21.1395390906
    Verify Region List Table Cell Content    6    7    -21:57:16.6889473043
    Verify Region List Table Cell Content    6    8    6.0131843567"
    Verify Region List Table Cell Content    6    8    3.9560455322"
    Verify Region List Table Cell Content    6    9    0.0

    Verify Region List Table Cell Content    7    5    Region 6
    Verify Region List Table Cell Content    7    6    Polyline
    Verify Region List Table Cell Content    7    7    17:56:21.0798222479
    Verify Region List Table Cell Content    7    7    -21:57:21.3175136024
    Verify Region List Table Cell Content    7    8    7.9912094116"
    Verify Region List Table Cell Content    7    8    2.8483543396"
    Verify Region List Table Cell Content    7    9    0.0

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
    
    Click Element    //*[contains(text(), "Region List")]
    Click Element    ${X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
    Verify Region List Table Cell Content    2    5    Region 1
    Verify Region List Table Cell Content    2    6    Point
    Verify Region List Table Cell Content    2    7    17:56:21.7651252790
    Verify Region List Table Cell Content    2    7    -21:57:15.4625335483
    Verify Region List Table Cell Content    2    8    ${EMPTY}
    Verify Region List Table Cell Content    2    9    0.0
    
    Verify Region List Table Cell Content    3    5    Region 2
    Verify Region List Table Cell Content    3    6    Line
    Verify Region List Table Cell Content    3    7    17:56:21.7537540129
    Verify Region List Table Cell Content    3    7    -21:57:18.9042935714
    Verify Region List Table Cell Content    3    8    4.4959880675"
    Verify Region List Table Cell Content    3    9    61.6
    
    Verify Region List Table Cell Content    4    5    Region 3
    Verify Region List Table Cell Content    4    6    Rectangle
    Verify Region List Table Cell Content    4    7    17:56:21.7366960920
    Verify Region List Table Cell Content    4    7    -21:57:22.9790196182
    Verify Region List Table Cell Content    4    8    4.2724998474"
    Verify Region List Table Cell Content    4    8    1.8197999954"
    Verify Region List Table Cell Content    4    9    25.9

    Verify Region List Table Cell Content    5    5    Region 4
    Verify Region List Table Cell Content    5    6    Ellipse
    Verify Region List Table Cell Content    5    7    17:56:21.7224837722
    Verify Region List Table Cell Content    5    7    -21:57:29.4669359245
    Verify Region List Table Cell Content    5    8    2.1363000870"
    Verify Region List Table Cell Content    5    8    0.9098999977"
    Verify Region List Table Cell Content    5    9    42.7

    Verify Region List Table Cell Content    6    5    Region 5
    Verify Region List Table Cell Content    6    6    Polygon
    Verify Region List Table Cell Content    6    7    17:56:21.1395390631
    Verify Region List Table Cell Content    6    7    -21:57:16.6889465414
    Verify Region List Table Cell Content    6    8    6.0131866455"
    Verify Region List Table Cell Content    6    8    3.9560470581"
    Verify Region List Table Cell Content    6    9    0.0

    Verify Region List Table Cell Content    7    5    Region 6
    Verify Region List Table Cell Content    7    6    Polyline
    Verify Region List Table Cell Content    7    7    17:56:21.0798220560
    Verify Region List Table Cell Content    7    7    -21:57:21.3175143654
    Verify Region List Table Cell Content    7    8    7.9912071228"
    Verify Region List Table Cell Content    7    8    2.8483497620"
    Verify Region List Table Cell Content    7    9    0.0

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
    
    Click Element    //*[contains(text(), "Region List")]
    Click Element    ${X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
    Verify Region List Table Cell Content    2    5    Region 1
    Verify Region List Table Cell Content    2    6    Point
    Verify Region List Table Cell Content    2    7    17:56:21.7651256081
    Verify Region List Table Cell Content    2    7    -21:57:15.4626098422
    Verify Region List Table Cell Content    2    8    ${EMPTY}
    Verify Region List Table Cell Content    2    9    0.0
    
    Verify Region List Table Cell Content    3    5    Region 2
    Verify Region List Table Cell Content    3    6    Line
    Verify Region List Table Cell Content    3    7    17:56:21.7537538964
    Verify Region List Table Cell Content    3    7    -21:57:18.9043614731
    Verify Region List Table Cell Content    3    8    4.4965009452"
    Verify Region List Table Cell Content    3    9    61.6
    
    Verify Region List Table Cell Content    4    5    Region 3
    Verify Region List Table Cell Content    4    6    Rectangle
    Verify Region List Table Cell Content    4    7    17:56:21.7367040713
    Verify Region List Table Cell Content    4    7    -21:57:22.9791142213
    Verify Region List Table Cell Content    4    8    4.2724998474"
    Verify Region List Table Cell Content    4    8    1.8200000763"
    Verify Region List Table Cell Content    4    9    25.9

    Verify Region List Table Cell Content    5    5    Region 4
    Verify Region List Table Cell Content    5    6    Ellipse
    Verify Region List Table Cell Content    5    7    17:56:21.7224773834
    Verify Region List Table Cell Content    5    7    -21:57:29.4671167423
    Verify Region List Table Cell Content    5    8    2.1364999771"
    Verify Region List Table Cell Content    5    8    0.9100000381"
    Verify Region List Table Cell Content    5    9    42.7

    Verify Region List Table Cell Content    6    5    Region 5
    Verify Region List Table Cell Content    6    6    Polygon
    Verify Region List Table Cell Content    6    7    17:56:21.1395428470
    Verify Region List Table Cell Content    6    7    -21:57:16.6891502464
    Verify Region List Table Cell Content    6    8    6.0134994507"
    Verify Region List Table Cell Content    6    8    3.9559997559"
    Verify Region List Table Cell Content    6    9    0.0

    Verify Region List Table Cell Content    7    5    Region 6
    Verify Region List Table Cell Content    7    6    Polyline
    Verify Region List Table Cell Content    7    7    17:56:21.0798272384
    Verify Region List Table Cell Content    7    7    -21:57:21.3173957286
    Verify Region List Table Cell Content    7    8    7.9910003662"
    Verify Region List Table Cell Content    7    8    2.8485000610"
    Verify Region List Table Cell Content    7    9    0.0

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
    
    Click Element    //*[contains(text(), "Region List")]
    Click Element    ${X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0
    Click Element At Coordinates    ${VIEWER_DIV}    50    -150
    Mouse Out    ${VIEWER_DIV}
    #Sleep    1
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_selected_from_viewer_${key}.png
    Click Element    data:testid:region-list-table-row-7
    Capture Element Screenshot    ${VIEWER_DIV}    check_polyline_selected_from_list_${key}.png
    Click Element    data:testid:region-list-table-row-6-center-cell
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov_${key}.png
    Click Element    data:testid:region-list-table-row-6
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov_selected_${key}.png
    Click Element    data:testid:region-list-table-row-6-lock-cell
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov_selected_locked_${key}.png
    Press Keys    None    DELETE
    Verify Region List Table Cell Content    6    5    Region 5
    Verify Region List Table Cell Content    6    6    Polygon
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov_selected_locked_tried_delete_${key}.png
    Click Element    data:testid:region-list-table-row-6-lock-cell
    Mouse Out    data:testid:region-list-table-row-6-lock-cell
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov_selected_locked_tried_delete_unlocked_${key}.png
    Press Keys    None    DELETE
    Verify Region List Table Cell Content    6    5    Region 6
    Verify Region List Table Cell Content    6    6    Polyline
    
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
    Click Element    ${POINT_REGION_SHORTCUT_BUTTON}
    Click Element At Coordinates    ${VIEWER_DIV}    -100    -100
    # line
    Click Element    ${LINE_REGION_SHORTCUT_BUTTON}
    Drag And Drop By Offset    ${VIEWER_DIV}    -65    50
    # rectangle
    Click Element    ${RECTANGLE_REGION_SHORTCUT_BUTTON}
    Drag And Drop By Offset    ${VIEWER_DIV}    -60    80
    # ellipse
    Click Element    ${ELLIPSE_REGION_SHORTCUT_BUTTON}
    Drag And Drop By Offset    ${VIEWER_DIV}    -100    50
    # polygon
    Click Element    ${POLYGON_REGION_SHORTCUT_BUTTON}
    Click Element At Coordinates    ${VIEWER_DIV}    75    -75
    Click Element At Coordinates    ${VIEWER_DIV}    50    120
    Double Click Element    ${VIEWER_DIV}
    # polyline
    Click Element    ${POLYLINE_REGION_SHORTCUT_BUTTON}
    Click Element At Coordinates    ${VIEWER_DIV}    0    100
    Click Element At Coordinates    ${VIEWER_DIV}    -80    80
    Click Element At Coordinates    ${VIEWER_DIV}    80    60
    Double Click Element    ${VIEWER_DIV} 
    
    Click Element    //*[contains(text(), "Region List")]
    Click Element    ${X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0
    Click Element At Coordinates    ${VIEWER_DIV}    50    -150

    Set Selenium Speed    0
    Verify Region List Table Cell Content    2    5    Region 1
    Verify Region List Table Cell Content    2    6    Point
    Verify Region List Table Cell Content    2    7    17:56:21.6556900185
    Verify Region List Table Cell Content    2    7    -21:57:18.1728612209
    Verify Region List Table Cell Content    2    8    ${EMPTY}
    Verify Region List Table Cell Content    2    9    0.0
    
    Verify Region List Table Cell Content    3    5    Region 2
    Verify Region List Table Cell Content    3    6    Line
    Verify Region List Table Cell Content    3    7    17:56:21.2886455617
    Verify Region List Table Cell Content    3    7    -21:57:23.2792706952
    Verify Region List Table Cell Content    3    8    8.3750907916"
    Verify Region List Table Cell Content    3    9    307.6
    
    Verify Region List Table Cell Content    4    5    Region 3
    Verify Region List Table Cell Content    4    6    Rectangle
    Verify Region List Table Cell Content    4    7    17:56:21.2886455617
    Verify Region List Table Cell Content    4    7    -21:57:23.2792706952
    Verify Region List Table Cell Content    4    8    6.1276595745"
    Verify Region List Table Cell Content    4    8    8.1702127660"
    Verify Region List Table Cell Content    4    9    0.0

    Verify Region List Table Cell Content    5    5    Region 4
    Verify Region List Table Cell Content    5    6    Ellipse
    Verify Region List Table Cell Content    5    7    17:56:21.2886455617
    Verify Region List Table Cell Content    5    7    -21:57:23.2792706952
    Verify Region List Table Cell Content    5    8    2.5531914894"
    Verify Region List Table Cell Content    5    8    5.1063829787"
    Verify Region List Table Cell Content    5    9    0.0

    Verify Region List Table Cell Content    6    5    Region 5
    Verify Region List Table Cell Content    6    6    Polygon
    Verify Region List Table Cell Content    6    7    17:56:21.1510021967
    Verify Region List Table Cell Content    6    7    -21:57:24.4282036623
    Verify Region List Table Cell Content    6    8    3.8297872340"
    Verify Region List Table Cell Content    6    8    9.9574468085"
    Verify Region List Table Cell Content    6    9    0.0

    Verify Region List Table Cell Content    7    5    Region 6
    Verify Region List Table Cell Content    7    6    Polyline
    Verify Region List Table Cell Content    7    7    17:56:21.2886455981
    Verify Region List Table Cell Content    7    7    -21:57:25.8324621846
    Verify Region List Table Cell Content    7    8    8.1702127660"
    Verify Region List Table Cell Content    7    8    5.1063829787"
    Verify Region List Table Cell Content    7    9    0.0

    # export as region files
    Set Selenium Speed    ${DELAY}
    ${system}=    Evaluate    platform.system()    platform
    
    # delete region files from previous tests if any
    Remove Files    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_world.crtf    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_pixel.crtf    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_pixel.reg    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_world.reg

    # save as a crtf region file in world coordinate
    Click Element    //*[contains(text(), "File")]
    Click Element    //*[contains(text(), "Export Regions")]
    Input Text    //input[@placeholder="Enter file name"]    e2e_check_region_world.crtf
    Click Element    //*[contains(text(), "Export regions")]

    # save as a crtf region file in pixel coordinate
    Click Element    //*[contains(text(), "File")]
    Click Element    //*[contains(text(), "Export Regions")]
    Click Element    //*[contains(text(), "World")]
    Click Element    //*[contains(text(), "Pixel coordinates")]
    Input Text    //input[@placeholder="Enter file name"]    e2e_check_region_pixel.crtf
    Click Element    //*[contains(text(), "Export regions")]

    # save as a ds9 region file in pixel coordinate
    Click Element    //*[contains(text(), "File")]
    Click Element    //*[contains(text(), "Export Regions")]
    Click Element    data:testid:export-region-file-type-dropdown
    Click Element    //*[contains(text(), "DS9 region file")]
    Input Text    //input[@placeholder="Enter file name"]    e2e_check_region_pixel.reg
    Click Element    //*[contains(text(), "Export regions")]

    # save as a ds9 region file in world coordinate
    Click Element    //*[contains(text(), "File")]
    Click Element    //*[contains(text(), "Export Regions")]
    Click Element    //*[contains(text(), "Pixel")]
    Click Element    //*[contains(text(), "World coordinates")]
    Input Text    //input[@placeholder="Enter file name"]    e2e_check_region_world.reg
    Click Element    //*[contains(text(), "Export regions")]

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
    Click Element    //*[contains(text(), "Region List")]
    Click Element    ${X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0
    Click Element At Coordinates    ${VIEWER_DIV}    50    -150

    # create a point region
    Click Element    ${POINT_REGION_SHORTCUT_BUTTON}
    Click Element At Coordinates    ${VIEWER_DIV}    -50    -50

    Append Image    HD163296_CO_2_1.mom1.fits
    Page Should Not Contain Element    data:testid:region-list-table-row-2
    # match image with the XY button
    Click Element    //*[contains(text(), "Image List")]
    Click Element    ${IMAGE_LIST_SECOND_MATCHING_XY}
    Click Element    //*[contains(text(), "Region List")]
    Verify Region List Table Cell Content    2    5    Region 1

    # unmatch image with the XY button
    Click Element    //*[contains(text(), "Image List")]
    Click Element    ${IMAGE_LIST_SECOND_MATCHING_XY}
    Click Element    //*[contains(text(), "Region List")]
    Verify Region List Table Cell Content    2    5    Region 2
    # set a new active image
    Click Element    //*[contains(text(), "Image List")]
    Click Element    ${IMAGE_LIST_FIRST_IMAGE_NAME}
    Click Element    //*[contains(text(), "Region List")]
    Verify Region List Table Cell Content    2    5    Region 1

    # set the 2nd image as active by clicking it in the image list
    Click Element    //*[contains(text(), "Image List")]
    Click Element    ${IMAGE_LIST_SECOND_IMAGE_NAME}
    # create a new region on the unmatched 2nd image
    Click Element    ${POINT_REGION_SHORTCUT_BUTTON}
    Click Element At Coordinates    ${VIEWER_10_CANVAS}    20    -50
    Click Element    //*[contains(text(), "Region List")]
    Verify Region List Table Cell Content    3    5    Region 3

    # match the 2nd image
    Click Element    //*[contains(text(), "Image List")]
    Click Element    ${IMAGE_LIST_SECOND_MATCHING_XY}
    Click Element    //*[contains(text(), "Region List")]
    Verify Region List Table Cell Content    2    5    Region 1
    Verify Region List Table Cell Content    3    5    Region 4
    # set a new active image
    Click Element    //*[contains(text(), "Image List")]
    Click Element    ${IMAGE_LIST_FIRST_IMAGE_NAME}
    Click Element    //*[contains(text(), "Region List")]
    Verify Region List Table Cell Content    2    5    Region 1
    Verify Region List Table Cell Content    3    5    Region 4

    # unmatch again
    Click Element    //*[contains(text(), "Image List")]
    Click Element    ${IMAGE_LIST_SECOND_MATCHING_XY}
    Click Element    //*[contains(text(), "Region List")]
    Verify Region List Table Cell Content    2    5    Region 1
    Verify Region List Table Cell Content    3    5    Region 4
    # set a new active image
    Click Element    //*[contains(text(), "Image List")]
    Click Element    ${IMAGE_LIST_SECOND_IMAGE_NAME}
    Click Element    //*[contains(text(), "Region List")]
    Verify Region List Table Cell Content    2    5    Region 5
    Verify Region List Table Cell Content    3    5    Region 6

    [Teardown]    Kill carta_backend And Close Browser



Loading 4000 Regions From A File
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Click Element    //*[contains(text(), "Region List")]
    Click Element    ${X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0
    Click Element At Coordinates    ${VIEWER_DIV}    50    -150

    Load Region File    box_region_n_4000.crtf
    Wait Until Page Does Not Contain    Importing regions    timeout=10
    #Sleep    1

    # scroll the region list to the very bottom
    Assign Id To Element    css:[data-testid="region-list-table"] > div:nth-child(2)    tmp_REGIONLIST
    Execute Javascript    window.document.getElementById("tmp_REGIONLIST").scrollTo(0, 200000)

    Page Should Contain    Region 4000
    [Teardown]    Kill carta_backend And Close Browser


Loading Regions on Active Matched Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    m51cm3i_8_small.fits
    Append Image    m51_151_MHz.fits
    # match m51_151_MHz.fits to m51cm3i_8_small.fits by clicking the XY button in the image list
    Click Element    ${IMAGE_LIST_SECOND_MATCHING_XY}
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
    Click Element    ${IMAGE_LIST_SECOND_MATCHING_XY}
    # set m51cm3i_8_small.fits as active by clicking it in the image list
    Click Element    ${IMAGE_LIST_FIRST_IMAGE_NAME}
    Load Region File    region_004.crtf
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png

    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    118,72,497,72
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    139,149,518,149
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    163,120,542,120
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser




Manipulating Multiple Regions
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Append Image    HD163296_CO_2_1.mom1.fits
    Click Element    ${IMAGE_LIST_SECOND_MATCHING_XY}
    # create two regions on the 2nd image
    Click Element    ${RECTANGLE_REGION_SHORTCUT_BUTTON}
    Drag And Drop By Offset    ${VIEWER_10_CANVAS}    -50    -50
    Click Element    ${LINE_REGION_SHORTCUT_BUTTON}
    Drag And Drop By Offset    ${VIEWER_10_CANVAS}    -80    120
    # multi-select the two regions
    Click Element    //*[contains(text(), "Region List")]
    Click Element    //*[contains(text(), "Region 1")]    SHIFT
    # take a screenshot of the multi-selected regions
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_multi-selected_regions_${key}.png
    # enable region config dialog
    Double Click Element    ${VIEWER_10_CANVAS}
    # Check the content in the region config dialog
    Element Should Contain    data:testid:region-dialog    Editing 2 Regions (HD163296_CO_2_1.mom1.fits)
    Element Should Contain    data:testid:region-dialog    Color
    Element Should Contain    data:testid:region-dialog    Line width (px)
    Element Should Contain    data:testid:region-dialog    Dash length (px)
    # set different color, line width, and dash length for the two regions
    Click Element    //*[@id="root"]/div/div[2]/div/div[1]/div[3]/div/div[2]/div/div/div/div[1]/div/span/button
    Clear Element Text    //*[@id="rc-editable-input-1"]
    Input Text    //*[@id="rc-editable-input-1"]    00FF16    Clear=True
    Click Element    //*[@id="root"]/div/div[2]/div/div[1]/div[3]/div/div[2]/div/div/div/div[1]/div/span/button     
    Input Text    data:testid:region-dialog-line-width-input    4    
    Input Text    //input[@placeholder="Dash length"]    4
    Click Element    data:testid:region-dialog-header-close-button
    # take a screenshot after changing the config
    Capture Element Screenshot    ${VIEWER_DIV}    check_multi-selected_regions_config_changed_${key}.png
    # enable region config dialog again
    Double Click Element    ${VIEWER_10_CANVAS}
    # lock region
    Click Element    data:testid:region-dialog-lock-button
    Click Element    data:testid:region-dialog-header-close-button
    Capture Element Screenshot    ${VIEWER_DIV}    check_multi-selected_regions_locked_${key}.png
    # unlock region
    Click Element    //*[contains(text(), "Region 2")]
    Click Element    //*[contains(text(), "Region 1")]    SHIFT
    Double Click Element    //*[contains(text(), "Region 1")]
    Click Element    data:testid:region-dialog-lock-button
    # semi-hide region
    Click Element    data:testid:region-dialog-visibility-button
    Click Element    data:testid:region-dialog-header-close-button
    Capture Element Screenshot    ${VIEWER_DIV}    check_multi-selected_regions_semi_hidden_${key}.png
    # unhide region
    Double Click Element    ${VIEWER_10_CANVAS}
    Repeat Keyword    2    Click Element    data:testid:region-dialog-visibility-button
    # export region 
    Click Element    data:testid:region-dialog-export-button
    Element Should Contain    data:testid:file-browser-dialog    Selected 2 / 2 elements.
    Click Element    data:testid:file-browser-dialog-header-close-button
    Click Element    data:testid:region-dialog-header-close-button
    # copy and paste region
    Click Element    ${VIEWER_10_CANVAS}
    ${platform}=    Evaluate    sys.platform    sys
    IF    '${platform}' == 'darwin'
    Press Keys    None    COMMAND+c
    Press Keys    None    COMMAND+v
    ELSE
    Press Keys    None    CONTROL+c
    Press Keys    None    CONTROL+v
    END
    # take a screenshot after copying and pasting the regions
    Capture Element Screenshot    ${VIEWER_DIV}    check_multi-selected_regions_copied_pasted_${key}.png

    # verify props of the copied and moved regions
    Verify Region List Table Cell Content    4    5    Region 3
    Verify Region List Table Cell Content    4    6    Rectangle
    Verify Region List Table Cell Content    4    7    17:56:21.2134006686
    Verify Region List Table Cell Content    4    7    -21:57:23.3813974917
    Verify Region List Table Cell Content    4    8    0.0
    
    Verify Region List Table Cell Content    5    5    Region 4
    Verify Region List Table Cell Content    5    6    Line
    Verify Region List Table Cell Content    5    7    17:56:21.3602197126
    Verify Region List Table Cell Content    5    7    -21:57:21.6792695287
    Verify Region List Table Cell Content    5    8    326.3

    # move region by keyboard
    Click Element    ${VIEWER_10_CANVAS}    
    Repeat Keyword    5    Press Keys    None    ARROW_RIGHT
    Mouse Out    ${VIEWER_DIV}
    # take a screenshot after moving the regions
    Capture Element Screenshot    ${VIEWER_DIV}    check_multi-selected_region_moved_${key}.png
    # verify props of the moved region
    Verify Region List Table Cell Content    3    5    Region 2
    Verify Region List Table Cell Content    3    6    Line
    Verify Region List Table Cell Content    3    7    17:56:21.1032865442
    Verify Region List Table Cell Content    3    7    -21:57:22.3601157729
    Verify Region List Table Cell Content    3    8    326.3
        
    # delete region
    Press Keys    None    DELETE
    # take a screenshot after delete a region
    Capture Element Screenshot    ${VIEWER_DIV}    check_delete_a_region_${key}.png
    # verify the regions are deleted
    Page Should Contain    Region 1
    Page Should Not Contain    Region 2
    Page Should Contain    Region 3
    Page Should Contain    Region 4

    # verify screenshots
    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    check_multi-selected_regions_${key}.png    138,267,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_multi-selected_regions_${key}.png    109,337,181,181,181,255
    PNG Two Pixels Should Have Matched RGBA    check_multi-selected_regions_${key}.png    138,267,517,266
    PNG Two Pixels Should Have Matched RGBA    check_multi-selected_regions_${key}.png    109,337,488,337

    PNG Images Should Be Different    check_multi-selected_regions_${key}.png    check_multi-selected_regions_config_changed_${key}.png
    PNG Images Should Be Different    check_multi-selected_regions_config_changed_${key}.png    check_multi-selected_regions_locked_${key}.png
    PNG Images Should Be Different    check_multi-selected_regions_config_changed_${key}.png    check_multi-selected_regions_semi_hidden_${key}.png
    
    PNG Pixel XY Should Match RGBA    check_multi-selected_regions_copied_pasted_${key}.png    537,286,181,181,181,255
    PNG Pixel XY Should Match RGBA    check_multi-selected_regions_copied_pasted_${key}.png    467,323,255,255,255,255

    PNG Pixel XY Should Match RGBA    check_multi-selected_region_moved_${key}.png    537,336,255,255,255,255

    PNG Pixel XY Should Match RGBA    check_delete_a_region_${key}.png    537,336,19,124,189,255
    PNG Pixel XY Should Match RGBA    check_delete_a_region_${key}.png    537,286,255,255,255,255

    Remove Files    check_multi-selected_regions_${key}.png    check_multi-selected_regions_config_changed_${key}.png    check_multi-selected_regions_locked_${key}.png    check_multi-selected_regions_semi_hidden_${key}.png    check_multi-selected_regions_copied_pasted_${key}.png    check_multi-selected_region_moved_${key}.png_moved_${key}.png    check_delete_a_region_${key}.png
    [Teardown]    Kill carta_backend And Close Browser

Dynamic Region Dialog For Multiple Regions
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    # create annotations
    Click Element    data:testid:annotation-shortcut-dropdown
    Click Element    data:testid:annotation-shortcut-dropdown-vector
    Click Element    ${VIEWER_DIV}
    Click Element    data:testid:annotation-shortcut-dropdown
    Click Element    data:testid:annotation-shortcut-dropdown-vector
    Click Element    ${VIEWER_DIV}
    Click Element    data:testid:annotation-shortcut-dropdown
    Click Element    data:testid:annotation-shortcut-dropdown-text
    Click Element    ${VIEWER_DIV}
    Click Element    data:testid:annotation-shortcut-dropdown
    Click Element    data:testid:annotation-shortcut-dropdown-text
    Click Element    ${VIEWER_DIV}
    Click Element    data:testid:annotation-shortcut-dropdown        
    Click Element    data:testid:annotation-shortcut-dropdown-compass
    Click Element    ${VIEWER_DIV}
    Click Element    data:testid:annotation-shortcut-dropdown
    Click Element    data:testid:annotation-shortcut-dropdown-compass
    Click Element    ${VIEWER_DIV}
    Click Element    data:testid:annotation-shortcut-dropdown        
    Click Element    data:testid:annotation-shortcut-dropdown-ruler
    Click Element    ${VIEWER_DIV}
    Click Element    data:testid:annotation-shortcut-dropdown
    Click Element    data:testid:annotation-shortcut-dropdown-ruler
    Click Element    ${VIEWER_DIV}        

    # activate region list widget
    Click Element    //*[contains(text(), "Region List")]

    # Check vector common parameters
    Click Element    //*[contains(text(), "Annotation 1")]
    Click Element    //*[contains(text(), "Annotation 2")]    modifier=SHIFT
    Double Click Element    //*[contains(text(), "Annotation 2")]
    # relocate the region dialog
    Drag And Drop By Offset    id:title-bp-dialog-12    -300    0

    Element Should Contain    data:testid:region-dialog    Color
    Element Should Contain    data:testid:region-dialog    Line width (px)
    Element Should Contain    data:testid:region-dialog    Dash length (px)
    Element Should Contain    data:testid:region-dialog    Arrowhead length (px)
    Element Should Contain    data:testid:region-dialog    Arrowhead width (px)

    # Check text common parameters
    Click Element    //*[contains(text(), "Annotation 3")]
    Click Element    //*[contains(text(), "Annotation 4")]    modifier=SHIFT
    Element Should Contain    data:testid:region-dialog    Color
    Element Should Contain    data:testid:region-dialog    Font size (px)
    Element Should Contain    data:testid:region-dialog    Font
    Element Should Contain    data:testid:region-dialog    Font style
    Element Should Contain    data:testid:region-dialog    Text alignment

    # Check compass common parameters
    Click Element    //*[contains(text(), "Annotation 5")]
    Click Element    //*[contains(text(), "Annotation 6")]    modifier=SHIFT
    Element Should Contain    data:testid:region-dialog    North label offset
    Element Should Contain    data:testid:region-dialog    East label offset
    Element Should Contain    data:testid:region-dialog    Show arrowhead

    # Check ruler common parameters
    Click Element    //*[contains(text(), "Annotation 7")]
    Click Element    //*[contains(text(), "Annotation 8")]    modifier=SHIFT
    Element Should Contain    data:testid:region-dialog    Number of decimals
    Element Should Contain    data:testid:region-dialog    Show auxiliary lines
    Element Should Contain    data:testid:region-dialog    Show auxiliary labels

    # check vector and text common parameters
    Click Element    //*[contains(text(), "Annotation 2")]
    Click Element    //*[contains(text(), "Annotation 3")]    modifier=SHIFT
    Element Should Contain    data:testid:region-dialog    Color
    Element Should Not Contain    data:testid:region-dialog    Arrowhead length (px)

    # check text and compass common parameters
    Click Element    //*[contains(text(), "Annotation 4")]
    Click Element    //*[contains(text(), "Annotation 5")]    modifier=SHIFT
    Element Should Contain    data:testid:region-dialog    Color
    Element Should Contain    data:testid:region-dialog    Font size (px)
    Element Should Not Contain    data:testid:region-dialog    North label offset

    # check compass and ruler common parameters
    Click Element    //*[contains(text(), "Annotation 6")]
    Click Element    //*[contains(text(), "Annotation 7")]    modifier=SHIFT
    Element Should Contain    data:testid:region-dialog    Font style
    Element Should Not Contain    data:testid:region-dialog    Number of decimals

    [Teardown]    Kill carta_backend And Close Browser

Region Control Point Keyboard Interaction
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Click Element    ${RECTANGLE_REGION_SHORTCUT_BUTTON}
    Click Element    ${VIEWER_DIV}
    # Select bottom-left control point
    Click Element At Coordinates    ${VIEWER_DIV}    -17    14
    # resize
    Repeat Keyword    5    Press Keys    None    ARROW_LEFT
    Repeat Keyword    5    Press Keys    None    ARROW_DOWN
    # select rotation control point
    Click Element At Coordinates    ${VIEWER_DIV}    -27    -30
    # rotate
    Repeat Keyword    10    Press Keys    None    ARROW_LEFT
    Capture Element Screenshot    ${VIEWER_DIV}    check.png

    # verify screenshot
    PNG Pixel XY Should Match RGBA    check.png    343,205,0,124,187,255
    PNG Pixel XY Should Match RGBA    check.png    320,306,255,255,255,255
    
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser
