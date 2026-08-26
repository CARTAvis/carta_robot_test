*** Settings ***
Documentation     Test region of interest support in CARTA 
Resource          ../resource.robot


*** Test Cases ***
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

