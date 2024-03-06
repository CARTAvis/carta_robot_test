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
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
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
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[8]    146.6

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
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
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
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[8]    146.6

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
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
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
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[8]    146.6

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
    Click Element    ${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0

    Set Selenium Speed    0
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
    Element Should Contain    ${REGION_LIST_TABLE_ROOT_XPATH}/div[18]/div[8]    146.6

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
