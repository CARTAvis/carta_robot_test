*** Settings ***
Documentation     Test annotation support in CARTA 
Resource          ../resource.robot

*** Test Cases ***
Import World Coordinate CASA Annotation Made In CARTA
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_annotation_generated_with_carta.crtf
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
    Verify Region List Table Cell Content    2    4    Annotation 1
    Verify Region List Table Cell Content    2    5    Point - Ann
    Verify Region List Table Cell Content    2    6    17:56:21.8622799970
    Verify Region List Table Cell Content    2    6    -21:57:14.5188997856
    Verify Region List Table Cell Content    2    7    ${EMPTY}
    Verify Region List Table Cell Content    2    8    0.0

    Verify Region List Table Cell Content    3    4    Annotation 2
    Verify Region List Table Cell Content    3    5    Point - Ann
    Verify Region List Table Cell Content    3    6    17:56:21.8622800016
    Verify Region List Table Cell Content    3    6    -21:57:16.0808001164
    Verify Region List Table Cell Content    3    7    ${EMPTY}
    Verify Region List Table Cell Content    3    8    0.0

    Verify Region List Table Cell Content    4    4    Annotation 3
    Verify Region List Table Cell Content    4    5    Point - Ann
    Verify Region List Table Cell Content    4    6    17:56:21.8622800021
    Verify Region List Table Cell Content    4    6    -21:57:17.5664995800
    Verify Region List Table Cell Content    4    7    ${EMPTY}
    Verify Region List Table Cell Content    4    8    0.0

    Verify Region List Table Cell Content    5    4    Annotation 4
    Verify Region List Table Cell Content    5    5    Point - Ann
    Verify Region List Table Cell Content    5    6    17:56:21.8650199954
    Verify Region List Table Cell Content    5    6    -21:57:19.0904003441
    Verify Region List Table Cell Content    5    7    ${EMPTY}
    Verify Region List Table Cell Content    5    8    0.0

    Verify Region List Table Cell Content    6    4    Annotation 5
    Verify Region List Table Cell Content    6    5    Point - Ann
    Verify Region List Table Cell Content    6    6    17:56:21.8677600050
    Verify Region List Table Cell Content    6    6    -21:57:20.6141996342
    Verify Region List Table Cell Content    6    7    ${EMPTY}
    Verify Region List Table Cell Content    6    8    0.0

    Verify Region List Table Cell Content    7    4    Annotation 6
    Verify Region List Table Cell Content    7    5    Point - Ann
    Verify Region List Table Cell Content    7    6    17:56:21.8705000036
    Verify Region List Table Cell Content    7    6    -21:57:22.1379996844
    Verify Region List Table Cell Content    7    7    ${EMPTY}
    Verify Region List Table Cell Content    7    8    0.0

    Verify Region List Table Cell Content    8    4    Annotation 7
    Verify Region List Table Cell Content    8    5    Point - Ann
    Verify Region List Table Cell Content    8    6    17:56:21.8677700042
    Verify Region List Table Cell Content    8    6    -21:57:23.7760999620
    Verify Region List Table Cell Content    8    7    ${EMPTY}
    Verify Region List Table Cell Content    8    8    0.0

    Verify Region List Table Cell Content    9    4    Annotation 8
    Verify Region List Table Cell Content    9    5    Point - Ann
    Verify Region List Table Cell Content    9    6    17:56:21.8705099978
    Verify Region List Table Cell Content    9    6    -21:57:25.3761001160
    Verify Region List Table Cell Content    9    7    ${EMPTY}
    Verify Region List Table Cell Content    9    8    0.0

    Verify Region List Table Cell Content    10    4    Annotation 9
    Verify Region List Table Cell Content    10    5    Line - Ann
    Verify Region List Table Cell Content    10    6    17:56:21.8321745956
    Verify Region List Table Cell Content    10    6    -21:57:29.0332029572
    Verify Region List Table Cell Content    10    7    4.7976272658"
    Verify Region List Table Cell Content    10    8    313.1

    Verify Region List Table Cell Content    11    4    Annotation 10
    Verify Region List Table Cell Content    11    5    Rectangle - Ann
    Verify Region List Table Cell Content    11    6    17:56:21.5419000247
    Verify Region List Table Cell Content    11    6    -21:57:14.6333001431
    Verify Region List Table Cell Content    11    7    3.5048000336"
    Verify Region List Table Cell Content    11    7    1.3713999748"
    Verify Region List Table Cell Content    11    8    331.9

    Verify Region List Table Cell Content    12    4    Annotation 11
    Verify Region List Table Cell Content    12    5    Ellipse - Ann
    Verify Region List Table Cell Content    12    6    17:56:21.5419100234
    Verify Region List Table Cell Content    12    6    -21:57:18.9760995214
    Verify Region List Table Cell Content    12    7    1.6761999130"
    Verify Region List Table Cell Content    12    7    0.7237999916"
    Verify Region List Table Cell Content    12    8    320.8

    Verify Region List Table Cell Content    13    4    Annotation 12
    Verify Region List Table Cell Content    13    5    Polygon - Ann
    Verify Region List Table Cell Content    13    6    17:56:21.5405385943
    Verify Region List Table Cell Content    13    6    -21:57:24.9951559767
    Verify Region List Table Cell Content    13    7    2.4000770569"
    Verify Region List Table Cell Content    13    7    6.0191078186"
    Verify Region List Table Cell Content    13    8    0.0

    Verify Region List Table Cell Content    14    4    Annotation 13
    Verify Region List Table Cell Content    14    5    Polyline - Ann
    Verify Region List Table Cell Content    14    6    17:56:21.1037804120
    Verify Region List Table Cell Content    14    6    -21:57:15.3570443563
    Verify Region List Table Cell Content    14    7    4.4190711975"
    Verify Region List Table Cell Content    14    7    2.6667007446"
    Verify Region List Table Cell Content    14    8    0.0

    Verify Region List Table Cell Content    15    4    Annotation 14
    Verify Region List Table Cell Content    15    5    Vector - Ann
    Verify Region List Table Cell Content    15    6    17:56:21.0298495452
    Verify Region List Table Cell Content    15    6    -21:57:19.3189566166
    Verify Region List Table Cell Content    15    7    5.8607129519"
    Verify Region List Table Cell Content    15    8    296.2

    Verify Region List Table Cell Content    16    4    Annotation 15
    Verify Region List Table Cell Content    16    5    Text - Ann
    Verify Region List Table Cell Content    16    6    17:56:21.1174700257
    Verify Region List Table Cell Content    16    6    -21:57:23.0142000880
    Verify Region List Table Cell Content    16    7    7.8475997925"
    Verify Region List Table Cell Content    16    7    0.9904999733"
    Verify Region List Table Cell Content    16    8    0.0

    Verify Region List Table Cell Content    17    4    Annotation 16
    Verify Region List Table Cell Content    17    5    Compass - Ann
    Verify Region List Table Cell Content    17    6    17:56:21.0654400173
    Verify Region List Table Cell Content    17    6    -21:57:28.1570998702
    Verify Region List Table Cell Content    17    7    2.5808000565"
    Verify Region List Table Cell Content    17    7    2.5808000565"
    Verify Region List Table Cell Content    17    8    0.0

    Verify Region List Table Cell Content    18    4    Annotation 17
    Verify Region List Table Cell Content    18    5    Ruler - Ann
    Verify Region List Table Cell Content    18    6    17:56:20.7231545943
    Verify Region List Table Cell Content    18    6    -21:57:26.1189020202
    Verify Region List Table Cell Content    18    7    4.9764497926"
    Verify Region List Table Cell Content    18    8    146.6

    # annotation 1, 2: filled square point and open square point
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    218,66,218,97
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    222,63,221,94

    # annotation 3, 4: filled circle point and open circle point
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    221,120,220,150
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    221,123,220,152

    # annotation 5, 6: filled diamond point and open diamond point
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    220,180,219,209
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    220,182,219,212   

    # annotation 7, 8: plus point and cross point 
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    220,244,219,275

    # annotation 9: line
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    196,378,263,316

    # annotation 10: rectangle
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    285,37,272,61
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    285,37,332,93
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    285,37,345,69

    # annotation 11: ellipse
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    329,125,296,143
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    329,125,287,175
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    329,125,319,160

    # annotation 12: polygon
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    304,211,286,326
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    304,211,332,313

    # annotation 13: polyline
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,54,394,105
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,54,438,60
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,54,470,103

    # annotation 14: vector
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    498,132,397,182
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    498,132,403,174
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    498,132,407,182

    # annotation 15: text
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,400,228
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,411,225
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,429,231
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,436,229
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,451,235
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,454,233
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,473,224

    # annotation 16: compass
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    438,329,438,280
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    438,329,388,330
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    438,329,442,257
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    438,329,380,335

    # annotation 17: ruler
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    558,250,505,330
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    558,250,558,330
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    558,250,507,298
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    558,250,555,298
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Import Image Coordinate CASA Annotation Made In CARTA
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_annotation_generated_with_carta_pix.crtf
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
    Verify Region List Table Cell Content    2    4    Annotation 1
    Verify Region List Table Cell Content    2    5    Point - Ann
    Verify Region List Table Cell Content    2    6    17:56:21.8622796543
    Verify Region List Table Cell Content    2    6    -21:57:14.5189241998
    Verify Region List Table Cell Content    2    7    ${EMPTY}
    Verify Region List Table Cell Content    2    8    0.0

    Verify Region List Table Cell Content    3    4    Annotation 2
    Verify Region List Table Cell Content    3    5    Point - Ann
    Verify Region List Table Cell Content    3    6    17:56:21.8622814275
    Verify Region List Table Cell Content    3    6    -21:57:16.0808291077
    Verify Region List Table Cell Content    3    7    ${EMPTY}
    Verify Region List Table Cell Content    3    8    0.0

    Verify Region List Table Cell Content    4    4    Annotation 3
    Verify Region List Table Cell Content    4    5    Point - Ann
    Verify Region List Table Cell Content    4    6    17:56:21.8622831143
    Verify Region List Table Cell Content    4    6    -21:57:17.5665392521
    Verify Region List Table Cell Content    4    7    ${EMPTY}
    Verify Region List Table Cell Content    4    8    0.0

    Verify Region List Table Cell Content    5    4    Annotation 4
    Verify Region List Table Cell Content    5    5    Point - Ann
    Verify Region List Table Cell Content    5    6    17:56:21.8650231075
    Verify Region List Table Cell Content    5    6    -21:57:19.0903499894
    Verify Region List Table Cell Content    5    7    ${EMPTY}
    Verify Region List Table Cell Content    5    8    0.0

    Verify Region List Table Cell Content    6    4    Annotation 5
    Verify Region List Table Cell Content    6    5    Point - Ann
    Verify Region List Table Cell Content    6    6    17:56:21.8677631034
    Verify Region List Table Cell Content    6    6    -21:57:20.6141584348
    Verify Region List Table Cell Content    6    7    ${EMPTY}
    Verify Region List Table Cell Content    6    8    0.0

    Verify Region List Table Cell Content    7    4    Annotation 6
    Verify Region List Table Cell Content    7    5    Point - Ann
    Verify Region List Table Cell Content    7    6    17:56:21.8705031294
    Verify Region List Table Cell Content    7    6    -21:57:22.1379684032
    Verify Region List Table Cell Content    7    7    ${EMPTY}
    Verify Region List Table Cell Content    7    8    0.0

    Verify Region List Table Cell Content    8    4    Annotation 7
    Verify Region List Table Cell Content    8    5    Point - Ann
    Verify Region List Table Cell Content    8    6    17:56:21.8677667274
    Verify Region List Table Cell Content    8    6    -21:57:23.7760633416
    Verify Region List Table Cell Content    8    7    ${EMPTY}
    Verify Region List Table Cell Content    8    8    0.0

    Verify Region List Table Cell Content    9    4    Annotation 8
    Verify Region List Table Cell Content    9    5    Point - Ann
    Verify Region List Table Cell Content    9    6    17:56:21.8705068581
    Verify Region List Table Cell Content    9    6    -21:57:25.3760627327
    Verify Region List Table Cell Content    9    7    ${EMPTY}
    Verify Region List Table Cell Content    9    8    0.0

    Verify Region List Table Cell Content    10    4    Annotation 9
    Verify Region List Table Cell Content    10    5    Line - Ann
    Verify Region List Table Cell Content    10    6    17:56:21.8321743762
    Verify Region List Table Cell Content    10    6    -21:57:29.0332162133
    Verify Region List Table Cell Content    10    7    4.7975788400"
    Verify Region List Table Cell Content    10    8    313.1

    Verify Region List Table Cell Content    11    4    Annotation 10
    Verify Region List Table Cell Content    11    5    Rectangle - Ann
    Verify Region List Table Cell Content    11    6    17:56:21.5419044118
    Verify Region List Table Cell Content    11    6    -21:57:14.6332604698
    Verify Region List Table Cell Content    11    7    3.5047599792"
    Verify Region List Table Cell Content    11    7    1.3714300156"
    Verify Region List Table Cell Content    11    8    331.9

    Verify Region List Table Cell Content    12    4    Annotation 11
    Verify Region List Table Cell Content    12    5    Ellipse - Ann
    Verify Region List Table Cell Content    12    6    17:56:21.5419066233
    Verify Region List Table Cell Content    12    6    -21:57:18.9761163063
    Verify Region List Table Cell Content    12    7    1.6761899948"
    Verify Region List Table Cell Content    12    7    0.7238100052"
    Verify Region List Table Cell Content    12    8    320.8

    Verify Region List Table Cell Content    13    4    Annotation 12
    Verify Region List Table Cell Content    13    5    Polygon - Ann
    Verify Region List Table Cell Content    13    6    17:56:21.5405403767
    Verify Region List Table Cell Content    13    6    -21:57:24.9951658948
    Verify Region List Table Cell Content    13    7    2.4000000000"
    Verify Region List Table Cell Content    13    7    6.0190498352"
    Verify Region List Table Cell Content    13    8    0.0

    Verify Region List Table Cell Content    14    4    Annotation 13
    Verify Region List Table Cell Content    14    5    Polyline - Ann
    Verify Region List Table Cell Content    14    6    17:56:21.1037842233
    Verify Region List Table Cell Content    14    6    -21:57:15.3570756371
    Verify Region List Table Cell Content    14    7    4.4190460205"
    Verify Region List Table Cell Content    14    7    2.6666656494"
    Verify Region List Table Cell Content    14    8    0.0

    Verify Region List Table Cell Content    15    4    Annotation 14
    Verify Region List Table Cell Content    15    5    Vector - Ann
    Verify Region List Table Cell Content    15    6    17:56:21.0298493532
    Verify Region List Table Cell Content    15    6    -21:57:19.3189741642
    Verify Region List Table Cell Content    15    7    5.8607238324"
    Verify Region List Table Cell Content    15    8    296.2

    Verify Region List Table Cell Content    16    4    Annotation 15
    Verify Region List Table Cell Content    16    5    Text - Ann
    Verify Region List Table Cell Content    16    6    17:56:21.1174730967
    Verify Region List Table Cell Content    16    6    -21:57:23.0142183987
    Verify Region List Table Cell Content    16    7    7.8476196289"
    Verify Region List Table Cell Content    16    7    0.9904749870"
    Verify Region List Table Cell Content    16    8    0.0

    Verify Region List Table Cell Content    17    4    Annotation 16
    Verify Region List Table Cell Content    17    5    Compass - Ann
    Verify Region List Table Cell Content    17    6    17:56:21.0654433078
    Verify Region List Table Cell Content    17    6    -21:57:28.1570746934
    Verify Region List Table Cell Content    17    7    2.5808450699"
    Verify Region List Table Cell Content    17    7    2.5808450699"
    Verify Region List Table Cell Content    17    8    0.0

    Verify Region List Table Cell Content    18    4    Annotation 17
    Verify Region List Table Cell Content    18    5    Ruler - Ann
    Verify Region List Table Cell Content    18    6    17:56:20.7231550878
    Verify Region List Table Cell Content    18    6    -21:57:26.1189296768
    Verify Region List Table Cell Content    18    7    4.9764956886"
    Verify Region List Table Cell Content    18    8    146.6

    # annotation 1, 2: filled square point and open square point
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    218,66,218,97
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    222,63,221,94

    # annotation 3, 4: filled circle point and open circle point
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    221,120,220,150
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    221,123,220,152

    # annotation 5, 6: filled diamond point and open diamond point
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    220,180,219,209
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    220,182,219,212   

    # annotation 7, 8: plus point and cross point 
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    220,244,219,275

    # annotation 9: line
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    196,378,263,316

    # annotation 10: rectangle
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    285,37,272,61
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    285,37,332,93
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    285,37,345,69

    # annotation 11: ellipse
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    329,125,296,143
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    329,125,287,175
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    329,125,319,160

    # annotation 12: polygon
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    304,211,286,326
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    304,211,332,313

    # annotation 13: polyline
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,54,394,105
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,54,438,60
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,54,470,103

    # annotation 14: vector
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    498,132,397,182
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    498,132,403,174
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    498,132,407,182

    # annotation 15: text
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,400,228
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,411,225
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,429,231
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,436,229
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,451,235
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,454,233
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,473,224

    # annotation 16: compass
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    438,329,438,280
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    438,329,388,330
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    438,329,442,257
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    438,329,380,335

    # annotation 17: ruler
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    558,250,505,330
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    558,250,558,330
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    558,250,507,298
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    558,250,555,299
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Import World Coordinate ds9 Annotation Made In CARTA
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_annotation_generated_with_carta.reg
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
    Verify Region List Table Cell Content    2    4    Annotation 1
    Verify Region List Table Cell Content    2    5    Point - Ann
    Verify Region List Table Cell Content    2    6    17:56:21.8622794349
    Verify Region List Table Cell Content    2    6    -21:57:14.5189226740
    Verify Region List Table Cell Content    2    7    ${EMPTY}
    Verify Region List Table Cell Content    2    8    0.0

    Verify Region List Table Cell Content    3    4    Annotation 2
    Verify Region List Table Cell Content    3    5    Point - Ann
    Verify Region List Table Cell Content    3    6    17:56:21.8622813589
    Verify Region List Table Cell Content    3    6    -21:57:16.0808291077
    Verify Region List Table Cell Content    3    7    ${EMPTY}
    Verify Region List Table Cell Content    3    8    0.0

    Verify Region List Table Cell Content    4    4    Annotation 3
    Verify Region List Table Cell Content    4    5    Point - Ann
    Verify Region List Table Cell Content    4    6    17:56:21.8622830457
    Verify Region List Table Cell Content    4    6    -21:57:17.5665423039
    Verify Region List Table Cell Content    4    7    ${EMPTY}
    Verify Region List Table Cell Content    4    8    0.0

    Verify Region List Table Cell Content    5    4    Annotation 4
    Verify Region List Table Cell Content    5    5    Point - Ann
    Verify Region List Table Cell Content    5    6    17:56:21.8650228745
    Verify Region List Table Cell Content    5    6    -21:57:19.0903499894
    Verify Region List Table Cell Content    5    7    ${EMPTY}
    Verify Region List Table Cell Content    5    8    0.0

    Verify Region List Table Cell Content    6    4    Annotation 5
    Verify Region List Table Cell Content    6    5    Point - Ann
    Verify Region List Table Cell Content    6    6    17:56:21.8677629663
    Verify Region List Table Cell Content    6    6    -21:57:20.6141614866
    Verify Region List Table Cell Content    6    7    ${EMPTY}
    Verify Region List Table Cell Content    6    8    0.0

    Verify Region List Table Cell Content    7    4    Annotation 6
    Verify Region List Table Cell Content    7    5    Point - Ann
    Verify Region List Table Cell Content    7    6    17:56:21.8705030334
    Verify Region List Table Cell Content    7    6    -21:57:22.1379699291
    Verify Region List Table Cell Content    7    7    ${EMPTY}
    Verify Region List Table Cell Content    7    8    0.0

    Verify Region List Table Cell Content    8    4    Annotation 7
    Verify Region List Table Cell Content    8    5    Point - Ann
    Verify Region List Table Cell Content    8    6    17:56:21.8677665629
    Verify Region List Table Cell Content    8    6    -21:57:23.7760633417
    Verify Region List Table Cell Content    8    7    ${EMPTY}
    Verify Region List Table Cell Content    8    8    0.0

    Verify Region List Table Cell Content    9    4    Annotation 8
    Verify Region List Table Cell Content    9    5    Point - Ann
    Verify Region List Table Cell Content    9    6    17:56:21.8705066388
    Verify Region List Table Cell Content    9    6    -21:57:25.3760650216
    Verify Region List Table Cell Content    9    7    ${EMPTY}
    Verify Region List Table Cell Content    9    8    0.0

    Verify Region List Table Cell Content    10    4    Annotation 9
    Verify Region List Table Cell Content    10    5    Line - Ann
    Verify Region List Table Cell Content    10    6    17:56:21.8321743968
    Verify Region List Table Cell Content    10    6    -21:57:29.0332146874
    Verify Region List Table Cell Content    10    7    4.7975781796"
    Verify Region List Table Cell Content    10    8    313.1

    Verify Region List Table Cell Content    11    4    Annotation 10
    Verify Region List Table Cell Content    11    5    Rectangle - Ann
    Verify Region List Table Cell Content    11    6    17:56:21.5419044118
    Verify Region List Table Cell Content    11    6    -21:57:14.6332619957
    Verify Region List Table Cell Content    11    7    3.5048000336"
    Verify Region List Table Cell Content    11    7    1.3713999748"
    Verify Region List Table Cell Content    11    8    331.9

    Verify Region List Table Cell Content    12    4    Annotation 11
    Verify Region List Table Cell Content    12    5    Ellipse - Ann
    Verify Region List Table Cell Content    12    6    17:56:21.5419065685
    Verify Region List Table Cell Content    12    6    -21:57:18.9761147805
    Verify Region List Table Cell Content    12    7    1.6761999130"
    Verify Region List Table Cell Content    12    7    0.7237999916"
    Verify Region List Table Cell Content    12    8    320.8

    Verify Region List Table Cell Content    13    4    Annotation 12
    Verify Region List Table Cell Content    13    5    Polygon - Ann
    Verify Region List Table Cell Content    13    6    17:56:21.5405405138
    Verify Region List Table Cell Content    13    6    -21:57:24.9951639874
    Verify Region List Table Cell Content    13    7    2.3999992371"
    Verify Region List Table Cell Content    13    7    6.0190460205"
    Verify Region List Table Cell Content    13    8    0.0

    Verify Region List Table Cell Content    14    4    Annotation 13
    Verify Region List Table Cell Content    14    5    Polyline - Ann
    Verify Region List Table Cell Content    14    6    17:56:21.1037841959
    Verify Region List Table Cell Content    14    6    -21:57:15.3570764000
    Verify Region List Table Cell Content    14    7    4.4190483093"
    Verify Region List Table Cell Content    14    7    2.6666641235"
    Verify Region List Table Cell Content    14    8    0.0

    Verify Region List Table Cell Content    15    4    Annotation 14
    Verify Region List Table Cell Content    15    5    Vector - Ann
    Verify Region List Table Cell Content    15    6    17:56:21.0298485581
    Verify Region List Table Cell Content    15    6    -21:57:19.3189684421
    Verify Region List Table Cell Content    15    7    5.8607003160"
    Verify Region List Table Cell Content    15    8    296.2

    Verify Region List Table Cell Content    16    4    Annotation 15
    Verify Region List Table Cell Content    16    5    Text - Ann
    Verify Region List Table Cell Content    16    6    17:56:21.1174729871
    Verify Region List Table Cell Content    16    6    -21:57:23.0142206875
    Verify Region List Table Cell Content    16    7    7.8475997925"
    Verify Region List Table Cell Content    16    7    0.9904999733"
    Verify Region List Table Cell Content    16    8    0.0

    Verify Region List Table Cell Content    17    4    Annotation 16
    Verify Region List Table Cell Content    17    5    Compass - Ann
    Verify Region List Table Cell Content    17    6    17:56:21.0654431981
    Verify Region List Table Cell Content    17    6    -21:57:28.1570724046
    Verify Region List Table Cell Content    17    7    2.5808000565"
    Verify Region List Table Cell Content    17    7    2.5808000565"
    Verify Region List Table Cell Content    17    8    0.0

    Verify Region List Table Cell Content    18    4    Annotation 17
    Verify Region List Table Cell Content    18    5    Ruler - Ann
    Verify Region List Table Cell Content    18    6    17:56:20.7231551427
    Verify Region List Table Cell Content    18    6    -21:57:26.1189289139
    Verify Region List Table Cell Content    18    7    4.9764994849"
    Verify Region List Table Cell Content    18    8    146.6

    # annotation 1, 2: filled square point and open square point
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    218,66,218,97
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    222,63,221,94

    # annotation 3, 4: filled circle point and open circle point
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    221,120,220,150
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    221,123,220,152

    # annotation 5, 6: filled diamond point and open diamond point
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    220,180,219,209
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    220,182,219,212   

    # annotation 7, 8: plus point and cross point 
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    220,244,219,275

    # annotation 9: line
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    196,378,263,316

    # annotation 10: rectangle
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    285,37,272,61
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    285,37,332,93
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    285,37,345,69

    # annotation 11: ellipse
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    329,125,296,143
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    329,125,287,175
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    329,125,319,160

    # annotation 12: polygon
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    304,211,286,326
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    304,211,332,313

    # annotation 13: polyline
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,54,394,105
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,54,438,60
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,54,470,103

    # annotation 14: vector
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    498,132,397,182
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    498,132,403,174
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    498,132,407,182

    # annotation 15: text
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,400,228
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,411,225
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,429,231
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,436,229
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,451,235
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,454,233
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,473,224

    # annotation 16: compass
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    438,329,438,280
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    438,329,388,330
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    438,329,442,257
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    438,329,380,335

    # annotation 17: ruler
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    558,250,505,330
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    558,250,558,330
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    558,250,513,296
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



Import Image Coordinate ds9 Annotation Made In CARTA
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_annotation_generated_with_carta_pix.reg
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    ${SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
    Verify Region List Table Cell Content    2    4    Annotation 1
    Verify Region List Table Cell Content    2    5    Point - Ann
    Verify Region List Table Cell Content    2    6    17:56:21.8622692350
    Verify Region List Table Cell Content    2    6    -21:57:14.5190905229
    Verify Region List Table Cell Content    2    7    ${EMPTY}
    Verify Region List Table Cell Content    2    8    0.0

    Verify Region List Table Cell Content    3    4    Annotation 2
    Verify Region List Table Cell Content    3    5    Point - Ann
    Verify Region List Table Cell Content    3    6    17:56:21.8622710077
    Verify Region List Table Cell Content    3    6    -21:57:16.0805895470
    Verify Region List Table Cell Content    3    7    ${EMPTY}
    Verify Region List Table Cell Content    3    8    0.0

    Verify Region List Table Cell Content    4    4    Annotation 3
    Verify Region List Table Cell Content    4    5    Point - Ann
    Verify Region List Table Cell Content    4    6    17:56:21.8622726948
    Verify Region List Table Cell Content    4    6    -21:57:17.5665896084
    Verify Region List Table Cell Content    4    7    ${EMPTY}
    Verify Region List Table Cell Content    4    8    0.0

    Verify Region List Table Cell Content    5    4    Annotation 4
    Verify Region List Table Cell Content    5    5    Point - Ann
    Verify Region List Table Cell Content    5    6    17:56:21.8650058607
    Verify Region List Table Cell Content    5    6    -21:57:19.0905895562
    Verify Region List Table Cell Content    5    7    ${EMPTY}
    Verify Region List Table Cell Content    5    8    0.0

    Verify Region List Table Cell Content    6    4    Annotation 5
    Verify Region List Table Cell Content    6    5    Point - Ann
    Verify Region List Table Cell Content    6    6    17:56:21.8677749625
    Verify Region List Table Cell Content    6    6    -21:57:20.6140890047
    Verify Region List Table Cell Content    6    7    ${EMPTY}
    Verify Region List Table Cell Content    6    8    0.0

    Verify Region List Table Cell Content    7    4    Annotation 6
    Verify Region List Table Cell Content    7    5    Point - Ann
    Verify Region List Table Cell Content    7    6    17:56:21.8705081611
    Verify Region List Table Cell Content    7    6    -21:57:22.1380881836
    Verify Region List Table Cell Content    7    7    ${EMPTY}
    Verify Region List Table Cell Content    7    8    0.0

    Verify Region List Table Cell Content    8    4    Annotation 7
    Verify Region List Table Cell Content    8    5    Point - Ann
    Verify Region List Table Cell Content    8    6    17:56:21.8677785867
    Verify Region List Table Cell Content    8    6    -21:57:23.7760885160
    Verify Region List Table Cell Content    8    7    ${EMPTY}
    Verify Region List Table Cell Content    8    8    0.0

    Verify Region List Table Cell Content    9    4    Annotation 8
    Verify Region List Table Cell Content    9    5    Point - Ann
    Verify Region List Table Cell Content    9    6    17:56:21.8705118898
    Verify Region List Table Cell Content    9    6    -21:57:25.3760879086
    Verify Region List Table Cell Content    9    7    ${EMPTY}
    Verify Region List Table Cell Content    9    8    0.0

    Verify Region List Table Cell Content    10    4    Annotation 9
    Verify Region List Table Cell Content    10    5    Line - Ann
    Verify Region List Table Cell Content    10    6    17:56:21.8321675415
    Verify Region List Table Cell Content    10    6    -21:57:29.0330963379
    Verify Region List Table Cell Content    10    7    4.7976244157"
    Verify Region List Table Cell Content    10    8    313.1

    Verify Region List Table Cell Content    11    4    Annotation 10
    Verify Region List Table Cell Content    11    5    Rectangle - Ann
    Verify Region List Table Cell Content    11    6    17:56:21.5419044118
    Verify Region List Table Cell Content    11    6    -21:57:14.6331414513
    Verify Region List Table Cell Content    11    7    3.5049999237"
    Verify Region List Table Cell Content    11    7    1.3715000153"
    Verify Region List Table Cell Content    11    8    331.9

    Verify Region List Table Cell Content    12    4    Annotation 11
    Verify Region List Table Cell Content    12    5    Ellipse - Ann
    Verify Region List Table Cell Content    12    6    17:56:21.5419066233
    Verify Region List Table Cell Content    12    6    -21:57:18.9761407204
    Verify Region List Table Cell Content    12    7    1.6760000229"
    Verify Region List Table Cell Content    12    7    0.7239999771"
    Verify Region List Table Cell Content    12    8    320.8

    Verify Region List Table Cell Content    13    4    Annotation 12
    Verify Region List Table Cell Content    13    5    Polygon - Ann
    Verify Region List Table Cell Content    13    6    17:56:21.5405439550
    Verify Region List Table Cell Content    13    6    -21:57:24.9951409081
    Verify Region List Table Cell Content    13    7    2.4000003815"
    Verify Region List Table Cell Content    13    7    6.0189998627"
    Verify Region List Table Cell Content    13    8    0.0

    Verify Region List Table Cell Content    14    4    Annotation 13
    Verify Region List Table Cell Content    14    5    Polyline - Ann
    Verify Region List Table Cell Content    14    6    17:56:21.1037833185
    Verify Region List Table Cell Content    14    6    -21:57:15.3571481162
    Verify Region List Table Cell Content    14    7    4.4194999695"
    Verify Region List Table Cell Content    14    7    2.6669998169"
    Verify Region List Table Cell Content    14    8    0.0

    Verify Region List Table Cell Content    15    4    Annotation 14
    Verify Region List Table Cell Content    15    5    Vector - Ann
    Verify Region List Table Cell Content    15    6    17:56:21.0298367128
    Verify Region List Table Cell Content    15    6    -21:57:19.3187410850
    Verify Region List Table Cell Content    15    7    5.8604994530"
    Verify Region List Table Cell Content    15    8    296.2

    Verify Region List Table Cell Content    16    4    Annotation 15
    Verify Region List Table Cell Content    16    5    Text - Ann
    Verify Region List Table Cell Content    16    6    17:56:21.1174558769
    Verify Region List Table Cell Content    16    6    -21:57:23.0141489702
    Verify Region List Table Cell Content    16    7    7.8474998474"
    Verify Region List Table Cell Content    16    7    0.9904999733"
    Verify Region List Table Cell Content    16    8    0.0

    Verify Region List Table Cell Content    17    4    Annotation 16
    Verify Region List Table Cell Content    17    5    Compass - Ann
    Verify Region List Table Cell Content    17    6    17:56:21.0654483531
    Verify Region List Table Cell Content    17    6    -21:57:28.1571448843
    Verify Region List Table Cell Content    17    7    2.5809999466"
    Verify Region List Table Cell Content    17    7    2.5809999466"
    Verify Region List Table Cell Content    17    8    0.0

    Verify Region List Table Cell Content    18    4    Annotation 17
    Verify Region List Table Cell Content    18    5    Ruler - Ann
    Verify Region List Table Cell Content    18    6    17:56:20.7231534976
    Verify Region List Table Cell Content    18    6    -21:57:26.1188447995
    Verify Region List Table Cell Content    18    7    4.9766758483"
    Verify Region List Table Cell Content    18    8    146.6

    # annotation 1, 2: filled square point and open square point
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    218,66,218,97
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    222,63,221,94

    # annotation 3, 4: filled circle point and open circle point
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    221,120,220,150
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    221,123,220,152

    # annotation 5, 6: filled diamond point and open diamond point
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    220,180,219,209
    PNG Two Pixels Should Not Have Matched RGBA    check_${key}.png    220,182,219,212   

    # annotation 7, 8: plus point and cross point 
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    220,244,219,275

    # annotation 9: line
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    196,378,263,316

    # annotation 10: rectangle
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    285,37,272,61
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    285,37,332,93
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    285,37,345,69

    # annotation 11: ellipse
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    329,125,296,143
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    329,125,287,175
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    329,125,319,160

    # annotation 12: polygon
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    304,211,286,326
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    304,211,332,313

    # annotation 13: polyline
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,54,394,105
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,54,438,60
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,54,470,103

    # annotation 14: vector
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    498,132,397,182
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    498,132,403,174
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    498,132,407,182

    # annotation 15: text
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,400,228
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,411,225
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,429,231
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,436,229
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,451,235
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,454,233
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    385,233,473,224

    # annotation 16: compass
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    438,329,438,280
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    438,329,388,330
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    438,329,442,257
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    438,329,380,335

    # annotation 17: ruler
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    558,250,505,330
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    558,250,558,330
    #PNG Two Pixels Should Have Matched RGBA    check_${key}.png    558,250,513,296
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Creating Annotations And Export As Region Files
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    # point
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[7]/span/a
    Click Element    xpath:/html/body/div[6]/div/div/div/div/ul/li[1]
    Click Element At Coordinates    ${VIEWER_DIV}    -150    -150
    # line
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[7]/span/a
    Click Element    xpath:/html/body/div[6]/div/div/div/div/ul/li[2]
    Drag And Drop By Offset    ${VIEWER_DIV}    50    -50
    # rectangle
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[7]/span/a
    Click Element    xpath:/html/body/div[6]/div/div/div/div/ul/li[3]
    Drag And Drop By Offset    ${VIEWER_DIV}    80    60
    # ellipse
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[7]/span/a
    Click Element    xpath:/html/body/div[6]/div/div/div/div/ul/li[4]
    Drag And Drop By Offset    ${VIEWER_DIV}    50    80
    # polygon
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[7]/span/a
    Click Element    xpath:/html/body/div[6]/div/div/div/div/ul/li[5]
    Click Element At Coordinates    ${VIEWER_DIV}    -110    -110
    Click Element At Coordinates    ${VIEWER_DIV}    120    -15
    Double Click Element    ${VIEWER_DIV}
    # polyline
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[7]/span/a
    Click Element    xpath:/html/body/div[6]/div/div/div/div/ul/li[6]
    Click Element At Coordinates    ${VIEWER_DIV}    110    110
    Click Element At Coordinates    ${VIEWER_DIV}    -60    75
    Double Click Element    ${VIEWER_DIV}
    # vector
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[7]/span/a
    Click Element    xpath:/html/body/div[6]/div/div/div/div/ul/li[7]
    Drag And Drop By Offset    ${VIEWER_DIV}    100    100
    # text
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[7]/span/a
    Click Element    xpath:/html/body/div[6]/div/div/div/div/ul/li[8]
    Drag And Drop By Offset    ${VIEWER_DIV}    -100    -100
    # compass
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[7]/span/a
    Click Element    xpath:/html/body/div[6]/div/div/div/div/ul/li[9]
    Click Element At Coordinates    ${VIEWER_DIV}    78    -90
    # ruler
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[7]/span/a
    Click Element    xpath:/html/body/div[6]/div/div/div/div/ul/li[10]
    Drag And Drop By Offset    ${VIEWER_DIV}    -90    45

    # delete region files from previous tests if any
    Remove Files    ${INITIAL_IMAGE_FOLDER}/e2e_check_annotation_world.crtf    ${INITIAL_IMAGE_FOLDER}/e2e_check_annotation_pixel.crtf    ${INITIAL_IMAGE_FOLDER}/e2e_check_annotation_pixel.reg    ${INITIAL_IMAGE_FOLDER}/e2e_check_annotation_world.reg

    # save as a crtf region file in world coordinate
    Click Element    //*[@id="root"]/div/div[1]/span[1]/ul/li
    Click Element    xpath://*[contains(text(), "Export Regions")]
    # not including vector and text due to CI
    Click Element    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[3]/div[1]/div[2]/div/div[2]/div/div[1]/div/div/label[7]
    Click Element    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[3]/div[1]/div[2]/div/div[2]/div/div[1]/div/div/label[8]
    Input Text    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[3]/div[2]/input    e2e_check_annotation_world.crtf
    Click Element    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[4]/div/span/a

    # save as a crtf region file in pixel coordinate
    Click Element    //*[@id="root"]/div/div[1]/span[1]/ul/li
    Click Element    xpath://*[contains(text(), "Export Regions")]
    # not including vector and text due to CI
    Click Element    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[3]/div[1]/div[2]/div/div[2]/div/div[1]/div/div/label[7]
    Click Element    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[3]/div[1]/div[2]/div/div[2]/div/div[1]/div/div/label[8]
    Click Element    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[3]/div[2]/span/div/span[2]/button
    Click Element    xpath://*[contains(text(), "Pixel coordinates")]
    Input Text    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[3]/div[2]/input    e2e_check_annotation_pixel.crtf
    Click Element    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[4]/div/span/a

    # save as a ds9 region file in pixel coordinate
    Click Element    //*[@id="root"]/div/div[1]/span[1]/ul/li
    Click Element    xpath://*[contains(text(), "Export Regions")]
    # not including vector and text due to CI
    Click Element    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[3]/div[1]/div[2]/div/div[2]/div/div[1]/div/div/label[7]
    Click Element    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[3]/div[1]/div[2]/div/div[2]/div/div[1]/div/div/label[8]
    Click Element    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[3]/div[2]/span/div/span[1]/button
    Click Element    xpath://*[contains(text(), "DS9 region file")]
    Input Text    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[3]/div[2]/input    e2e_check_annotation_pixel.reg
    Click Element    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[4]/div/span/a

    # save as a ds9 region file in world coordinate
    Click Element    //*[@id="root"]/div/div[1]/span[1]/ul/li
    Click Element    xpath://*[contains(text(), "Export Regions")]
    # not including vector and text due to CI
    Click Element    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[3]/div[1]/div[2]/div/div[2]/div/div[1]/div/div/label[7]
    Click Element    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[3]/div[1]/div[2]/div/div[2]/div/div[1]/div/div/label[8]
    Click Element    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[3]/div[2]/span/div/span[2]/button
    Click Element    xpath://*[contains(text(), "World coordinates")]
    Input Text    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[3]/div[2]/input    e2e_check_annotation_world.reg
    Click Element    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[4]/div/span/a

    # compare generated regions files with snapshot region files
    Set Selenium Speed    0
    ${test_world_crtf} =    Get File    ${INITIAL_IMAGE_FOLDER}/e2e_check_annotation_world.crtf
    ${snapshot_world_crtf} =    Get File    ${SNAPSHOT_FOLDER}/e2e_check_annotation_world.crtf
    Should Be Equal As Strings    ${test_world_crtf}    ${snapshot_world_crtf}

    ${test_pixel_crtf} =    Get File    ${INITIAL_IMAGE_FOLDER}/e2e_check_annotation_pixel.crtf
    ${snapshot_pixel_crtf} =    Get File    ${SNAPSHOT_FOLDER}/e2e_check_annotation_pixel.crtf
    Should Be Equal As Strings    ${test_pixel_crtf}    ${snapshot_pixel_crtf}

    ${test_pixel_ds9} =    Get File    ${INITIAL_IMAGE_FOLDER}/e2e_check_annotation_pixel.reg
    ${snapshot_pixel_ds9} =    Get File    ${SNAPSHOT_FOLDER}/e2e_check_annotation_pixel.reg
    Should Be Equal As Strings    ${test_pixel_ds9}    ${snapshot_pixel_ds9}

    ${test_world_ds9} =    Get File    ${INITIAL_IMAGE_FOLDER}/e2e_check_annotation_world.reg
    ${snapshot_world_ds9} =    Get File    ${SNAPSHOT_FOLDER}/e2e_check_annotation_world.reg
    Should Be Equal As Strings    ${test_world_ds9}    ${snapshot_world_ds9}

    Remove Files    ${INITIAL_IMAGE_FOLDER}/e2e_check_annotation_world.crtf    ${INITIAL_IMAGE_FOLDER}/e2e_check_annotation_pixel.crtf    ${INITIAL_IMAGE_FOLDER}/e2e_check_annotation_pixel.reg    ${INITIAL_IMAGE_FOLDER}/e2e_check_annotation_world.reg
    [Teardown]    Kill carta_backend And Close Browser
