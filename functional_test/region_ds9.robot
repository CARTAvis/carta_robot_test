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

