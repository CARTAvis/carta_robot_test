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
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[1]/ul[1]/li/div
    Drag And Drop By Offset    //*[@id="root"]/div/div[15]/div[2]/div/div[2]/div    -200    0

    Set Selenium Speed    0.02
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]    Region 1
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[5]    Ellipse
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[6]    17:56:21.6479279877
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[6]    -21:57:15.8104802550
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[7]    1.0000000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[7]    1.0000000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[8]    0.0
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[4]    Region 2
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[5]    Ellipse
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[6]    17:56:21.7054319929
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[6]    -21:57:19.7107203749
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[7]    0.9000000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[7]    2.4500000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[8]    270.0
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[4]    Region 3
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[5]    Rectangle
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[6]    17:56:21.5293200005
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[6]    -21:57:26.2105199833
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[7]    4.9000000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[7]    2.7000000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[8]    360.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[4]    Region 4
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[5]    Polygon
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[6]    17:56:21.6659046396
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[6]    -21:57:29.9356134124
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[7]    1.9999904633"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[7]    3.3498060226"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[4]    Region 5
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[5]    Line
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[6]    17:56:20.9093646471
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[6]    -21:57:17.1356442971
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[7]    5.9435115276"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[8]    43.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[4]    Region 6
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[5]    Point
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[6]    17:56:21.0189840214
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[6]    -21:57:29.4605998495
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[7]    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[4]    Region 7
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[5]    Point
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[6]    17:56:20.8141199666
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[6]    -21:57:28.2106799170
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[7]    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[4]    Region 8
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[5]    Point
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[6]    17:56:21.0189840159
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[6]    -21:57:30.5405999647
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[7]    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[10]/div[4]    Region 9
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[10]/div[5]    Point
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[10]/div[6]    17:56:20.8141199674
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[10]/div[6]    -21:57:29.2906798413
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[10]/div[7]    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[10]/div[8]    0.0

    PNG Two Pixels Should Have Matched RGBA    check.png    280,70,260,88
    PNG Two Pixels Should Have Matched RGBA    check.png    280,70,280,108
    PNG Two Pixels Should Have Matched RGBA    check.png    280,70,299,88

    PNG Two Pixels Should Have Matched RGBA    check.png    265,118,247,165
    PNG Two Pixels Should Have Matched RGBA    check.png    265,118,265,213
    PNG Two Pixels Should Have Matched RGBA    check.png    265,118,282,165

    PNG Two Pixels Should Have Matched RGBA    check.png    264,266,264,318
    PNG Two Pixels Should Have Matched RGBA    check.png    264,266,360,318
    PNG Two Pixels Should Have Matched RGBA    check.png    264,266,360,266

    PNG Two Pixels Should Have Matched RGBA    check.png    256,334,256,372
    PNG Two Pixels Should Have Matched RGBA    check.png    256,334,282,397
    PNG Two Pixels Should Have Matched RGBA    check.png    256,334,294,372
    PNG Two Pixels Should Have Matched RGBA    check.png    256,334,294,333
    PNG Two Pixels Should Have Matched RGBA    check.png    256,334,276,361
    
    PNG Two Pixels Should Have Matched RGBA    check.png    443,73,519,155

    PNG Two Pixels Should Have Matched RGBA    check.png    451,356,451,377
    PNG Two Pixels Should Have Matched RGBA    check.png    451,356,507,331
    PNG Two Pixels Should Have Matched RGBA    check.png    451,356,507,353
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser


Import World Coordinate ds9 Region Made In ds9 Without Header
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_with_ds9_no_header.reg
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[1]/ul[1]/li/div
    Drag And Drop By Offset    //*[@id="root"]/div/div[15]/div[2]/div/div[2]/div    -200    0

    Set Selenium Speed    0.02
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]    Region 1
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[5]    Ellipse
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[6]    17:56:21.6479279877
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[6]    -21:57:15.8104802550
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[7]    1.0000000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[7]    1.0000000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[8]    0.0
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[4]    Region 2
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[5]    Ellipse
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[6]    17:56:21.7054319929
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[6]    -21:57:19.7107203749
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[7]    0.9000000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[7]    2.4500000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[8]    270.0
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[4]    Region 3
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[5]    Rectangle
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[6]    17:56:21.5293200005
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[6]    -21:57:26.2105199833
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[7]    4.9000000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[7]    2.7000000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[8]    360.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[4]    Region 4
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[5]    Polygon
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[6]    17:56:21.6659046396
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[6]    -21:57:29.9356134124
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[7]    1.9999904633"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[7]    3.3498060226"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[4]    Region 5
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[5]    Line
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[6]    17:56:20.9093646471
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[6]    -21:57:17.1356442971
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[7]    5.9435115276"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[8]    43.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[4]    Region 6
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[5]    Point
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[6]    17:56:21.0189840214
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[6]    -21:57:29.4605998495
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[7]    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[4]    Region 7
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[5]    Point
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[6]    17:56:20.8141199666
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[6]    -21:57:28.2106799170
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[7]    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[4]    Region 8
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[5]    Point
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[6]    17:56:21.0189840159
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[6]    -21:57:30.5405999647
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[7]    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[10]/div[4]    Region 9
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[10]/div[5]    Point
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[10]/div[6]    17:56:20.8141199674
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[10]/div[6]    -21:57:29.2906798413
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[10]/div[7]    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[10]/div[8]    0.0

    PNG Two Pixels Should Have Matched RGBA    check.png    280,70,260,88
    PNG Two Pixels Should Have Matched RGBA    check.png    280,70,280,108
    PNG Two Pixels Should Have Matched RGBA    check.png    280,70,299,88

    PNG Two Pixels Should Have Matched RGBA    check.png    265,118,247,165
    PNG Two Pixels Should Have Matched RGBA    check.png    265,118,265,213
    PNG Two Pixels Should Have Matched RGBA    check.png    265,118,282,165

    PNG Two Pixels Should Have Matched RGBA    check.png    264,266,264,318
    PNG Two Pixels Should Have Matched RGBA    check.png    264,266,360,318
    PNG Two Pixels Should Have Matched RGBA    check.png    264,266,360,266

    PNG Two Pixels Should Have Matched RGBA    check.png    256,334,256,372
    PNG Two Pixels Should Have Matched RGBA    check.png    256,334,282,397
    PNG Two Pixels Should Have Matched RGBA    check.png    256,334,294,372
    PNG Two Pixels Should Have Matched RGBA    check.png    256,334,294,333
    PNG Two Pixels Should Have Matched RGBA    check.png    256,334,276,361
    
    PNG Two Pixels Should Have Matched RGBA    check.png    443,73,519,155

    PNG Two Pixels Should Have Matched RGBA    check.png    451,356,451,377
    PNG Two Pixels Should Have Matched RGBA    check.png    451,356,507,331
    PNG Two Pixels Should Have Matched RGBA    check.png    451,356,507,353
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser



Import Image Coordinate ds9 Region Made In ds9
    Pass Execution    Skip until the off by 1 pixel bug is fixed...
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_with_ds9.reg
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[1]/ul[1]/li/div
    Drag And Drop By Offset    //*[@id="root"]/div/div[15]/div[2]/div/div[2]/div    -200    0

    Set Selenium Speed    0.02
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]    Region 1
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[5]    Ellipse
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[6]    17:56:21.6479279877
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[6]    -21:57:15.8104802550
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[7]    1.0000000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[7]    1.0000000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[8]    0.0
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[4]    Region 2
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[5]    Ellipse
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[6]    17:56:21.7054319929
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[6]    -21:57:19.7107203749
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[7]    0.9000000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[7]    2.4500000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[8]    270.0
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[4]    Region 3
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[5]    Rectangle
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[6]    17:56:21.5293200005
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[6]    -21:57:26.2105199833
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[7]    4.9000000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[7]    2.7000000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[8]    360.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[4]    Region 4
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[5]    Polygon
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[6]    17:56:21.6659046396
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[6]    -21:57:29.9356134124
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[7]    1.9999904633"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[7]    3.3498060226"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[4]    Region 5
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[5]    Line
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[6]    17:56:20.9093646471
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[6]    -21:57:17.1356442971
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[7]    5.9435115276"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[8]    43.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[4]    Region 6
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[5]    Point
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[6]    17:56:21.0189840214
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[6]    -21:57:29.4605998495
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[7]    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[4]    Region 7
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[5]    Point
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[6]    17:56:20.8141199666
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[6]    -21:57:28.2106799170
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[7]    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[4]    Region 8
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[5]    Point
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[6]    17:56:21.0189840159
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[6]    -21:57:30.5405999647
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[7]    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[10]/div[4]    Region 9
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[10]/div[5]    Point
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[10]/div[6]    17:56:20.8141199674
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[10]/div[6]    -21:57:29.2906798413
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[10]/div[7]    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[10]/div[8]    0.0

    PNG Two Pixels Should Have Matched RGBA    check.png    280,70,260,88
    PNG Two Pixels Should Have Matched RGBA    check.png    280,70,280,108
    PNG Two Pixels Should Have Matched RGBA    check.png    280,70,299,88

    PNG Two Pixels Should Have Matched RGBA    check.png    265,118,247,165
    PNG Two Pixels Should Have Matched RGBA    check.png    265,118,265,213
    PNG Two Pixels Should Have Matched RGBA    check.png    265,118,282,165

    PNG Two Pixels Should Have Matched RGBA    check.png    264,266,264,318
    PNG Two Pixels Should Have Matched RGBA    check.png    264,266,360,318
    PNG Two Pixels Should Have Matched RGBA    check.png    264,266,360,266

    PNG Two Pixels Should Have Matched RGBA    check.png    256,334,256,372
    PNG Two Pixels Should Have Matched RGBA    check.png    256,334,282,397
    PNG Two Pixels Should Have Matched RGBA    check.png    256,334,294,372
    PNG Two Pixels Should Have Matched RGBA    check.png    256,334,294,333
    PNG Two Pixels Should Have Matched RGBA    check.png    256,334,276,361
    
    PNG Two Pixels Should Have Matched RGBA    check.png    443,73,519,155

    PNG Two Pixels Should Have Matched RGBA    check.png    451,356,451,377
    PNG Two Pixels Should Have Matched RGBA    check.png    451,356,507,331
    PNG Two Pixels Should Have Matched RGBA    check.png    451,356,507,353
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser



Import World Coordinate CASA Region Made In CASAViewer
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    # this region file has been patched to show polyline (poly->polyline) and line (box->line) properly in CARTA
    Load Region File    all_region_generated_with_casaviewer.crtf
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[1]/ul[1]/li/div
    Drag And Drop By Offset    //*[@id="root"]/div/div[15]/div[2]/div/div[2]/div    -200    0

    Set Selenium Speed    0.02
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]    Region 1
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[5]    Point
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[6]    17:56:21.8283000066
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[6]    -21:57:14.8361006384
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[7]    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[8]    0.0
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[4]    Region 2
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[5]    Rectangle
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[6]    17:56:21.6574699985
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[6]    -21:57:18.2263999360
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[7]    4.9743000031"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[7]    1.3979999542"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[8]    0.0
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[4]    Region 3
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[5]    Ellipse
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[6]    17:56:21.7881199926
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[6]    -21:57:24.0808001163
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[7]    1.9746999741"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[7]    0.6640999794"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[4]    Region 4
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[5]    Polygon
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[6]    17:56:21.5280941962
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[6]    -21:57:30.0050709477
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[7]    4.8581291199"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[7]    4.1243021965"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[4]    Region 5
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[5]    Polyline
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[6]    17:56:21.0670757526
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[6]    -21:57:28.2924571925
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[7]    5.4524627686"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[7]    4.0543317795"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[4]    Region 6
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[5]    Line
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[6]    17:56:20.9201110298
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[6]    -21:57:22.7177037411
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[7]    8.3041952513"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[8]    208.4

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
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[1]/ul[1]/li/div
    Drag And Drop By Offset    //*[@id="root"]/div/div[15]/div[2]/div/div[2]/div    -200    0

    Set Selenium Speed    0.02
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]    Region 1
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[5]    Rectangle
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[6]    17:56:21.8114504359
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[6]    -21:57:14.2106005304
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[7]    2.3500000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[7]    1.1000000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[8]    0.0
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[4]    Region 2
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[5]    Rectangle
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[6]    17:56:21.7629351528
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[6]    -21:57:17.4406101211
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[7]    3.8750000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[7]    1.6600000381"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[8]    0.0
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[4]    Region 3
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[5]    Rectangle
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[6]    17:56:21.8021146141
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[6]    -21:57:22.5056020838
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[7]    1.4250000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[7]    4.5900001526"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[8]    22.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[4]    Region 4
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[5]    Polygon
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[6]    17:56:21.8348270718
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[6]    -21:57:28.9725958282
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[7]    2.2550001144"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[7]    4.7079998016"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[4]    Region 5
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[5]    Ellipse
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[6]    17:56:21.3388460803
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[6]    -21:57:14.6606530567
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[7]    1.1850000381"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[7]    1.1850000381"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[4]    Region 6
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[5]    Ellipse
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[6]    17:56:21.3496294007
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[6]    -21:57:25.6106528022
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[7]    2.3000000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[7]    0.7000000000"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[8]    339.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[4]    Region 7
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[5]    Line
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[6]    17:56:20.8182258550
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[6]    -21:57:14.8693632683
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[7]    5.8488571441"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[8]/div[8]    293.1

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[4]    Region 8
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[5]    Point
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[6]    17:56:20.7841056745
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[6]    -21:57:28.7946069373
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[7]    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[9]/div[8]    0.0

    PNG Two Pixels Should Have Matched RGBA    check.png    212,46,212,68
    PNG Two Pixels Should Have Matched RGBA    check.png    212,46,258,68
    PNG Two Pixels Should Have Matched RGBA    check.png    212,46,258,46
    
    PNG Two Pixels Should Have Matched RGBA    check.png    210,104,210,136
    PNG Two Pixels Should Have Matched RGBA    check.png    210,104,286,136
    PNG Two Pixels Should Have Matched RGBA    check.png    210,104,286,104
    
    PNG Two Pixels Should Have Matched RGBA    check.png    209,184,242,266
    PNG Two Pixels Should Have Matched RGBA    check.png    209,184,267,256
    PNG Two Pixels Should Have Matched RGBA    check.png    209,184,234,173
    
    PNG Two Pixels Should Have Matched RGBA    check.png    240,303,208,391
    PNG Two Pixels Should Have Matched RGBA    check.png    240,303,250,375
    
    PNG Two Pixels Should Have Matched RGBA    check.png    364,43,341,66
    PNG Two Pixels Should Have Matched RGBA    check.png    364,43,364,90
    PNG Two Pixels Should Have Matched RGBA    check.png    364,43,387,66
    
    PNG Two Pixels Should Have Matched RGBA    check.png    376,238,349,274
    PNG Two Pixels Should Have Matched RGBA    check.png    376,238,344,323
    PNG Two Pixels Should Have Matched RGBA    check.png    376,238,374,285
    
    PNG Two Pixels Should Have Matched RGBA    check.png    455,92,556,48
    
    PNG Two Pixels Should Have Matched RGBA    check.png    455,92,515,343
    
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser



Import World Coordinate CASA Region Made In CARTA
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_with_carta.crtf
    Capture Element Screenshot    ${VIEWER_DIV}    check.png
    
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[1]/ul[1]/li/div
    Drag And Drop By Offset    //*[@id="root"]/div/div[15]/div[2]/div/div[2]/div    -200    0

    Set Selenium Speed    0.02
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]    Region 1
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[5]    Point
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[6]    17:56:21.7651299952
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[6]    -21:57:15.4624999782
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[7]    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[8]    0.0
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[4]    Region 2
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[5]    Line
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[6]    17:56:21.7537553016
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[6]    -21:57:18.9042538983
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[7]    4.4958942179"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[8]    61.6
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[4]    Region 3
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[5]    Rectangle
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[6]    17:56:21.7367000130
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[6]    -21:57:22.9789997811
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[7]    4.2724998474"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[7]    1.8197999954"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[8]    25.9

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[4]    Region 4
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[5]    Ellipse
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[6]    17:56:21.7224799881
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[6]    -21:57:29.4669000671
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[7]    2.1363000870"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[7]    0.9098999977"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[8]    42.7

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[4]    Region 5
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[5]    Polygon
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[6]    17:56:21.1395403244
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[6]    -21:57:16.6889534079
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[7]    6.0131179810"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[7]    3.9560943604"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[4]    Region 6
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[5]    Polyline
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[6]    17:56:21.0798244963
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[6]    -21:57:21.3175029214
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[7]    7.9912445068"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[7]    2.8484153748"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[8]    0.0

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
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[1]/ul[1]/li/div
    Drag And Drop By Offset    //*[@id="root"]/div/div[15]/div[2]/div/div[2]/div    -200    0

    Set Selenium Speed    0.02
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]    Region 1
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[5]    Point
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[6]    17:56:21.7651252516
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[6]    -21:57:15.4625350742
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[7]    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[8]    0.0
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[4]    Region 2
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[5]    Line
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[6]    17:56:21.7537540814
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[6]    -21:57:18.9042935714
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[7]    4.4959897458"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[8]    61.6
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[4]    Region 3
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[5]    Rectangle
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[6]    17:56:21.7366961742
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[6]    -21:57:22.9790196181
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[7]    4.2725250244"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[7]    1.8197799683"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[8]    25.9

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[4]    Region 4
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[5]    Ellipse
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[6]    17:56:21.7224838544
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[6]    -21:57:29.4669370689
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[7]    2.1362649918"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[7]    0.9098899841"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[8]    42.7

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[4]    Region 5
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[5]    Polygon
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[6]    17:56:21.1395390906
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[6]    -21:57:16.6889473043
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[7]    6.0131843567"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[7]    3.9560455322"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[4]    Region 6
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[5]    Polyline
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[6]    17:56:21.0798222479
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[6]    -21:57:21.3175136024
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[7]    7.9912094116"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[7]    2.8483543396"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[8]    0.0

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
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[1]/ul[1]/li/div
    Drag And Drop By Offset    //*[@id="root"]/div/div[15]/div[2]/div/div[2]/div    -200    0

    Set Selenium Speed    0.02
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]    Region 1
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[5]    Point
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[6]    17:56:21.7651252790
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[6]    -21:57:15.4625335483
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[7]    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[8]    0.0
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[4]    Region 2
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[5]    Line
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[6]    17:56:21.7537540129
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[6]    -21:57:18.9042935714
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[7]    4.4959880675"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[8]    61.6
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[4]    Region 3
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[5]    Rectangle
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[6]    17:56:21.7366960920
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[6]    -21:57:22.9790196182
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[7]    4.2724998474"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[7]    1.8197999954"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[8]    25.9

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[4]    Region 4
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[5]    Ellipse
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[6]    17:56:21.7224837722
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[6]    -21:57:29.4669359245
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[7]    2.1363000870"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[7]    0.9098999977"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[8]    42.7

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[4]    Region 5
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[5]    Polygon
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[6]    17:56:21.1395390631
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[6]    -21:57:16.6889465414
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[7]    6.0131866455"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[7]    3.9560470581"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[4]    Region 6
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[5]    Polyline
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[6]    17:56:21.0798220560
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[6]    -21:57:21.3175143654
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[7]    7.9912071228"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[7]    2.8483497620"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[8]    0.0

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
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[1]/ul[1]/li/div
    Drag And Drop By Offset    //*[@id="root"]/div/div[15]/div[2]/div/div[2]/div    -200    0

    Set Selenium Speed    0.02
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]    Region 1
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[5]    Point
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[6]    17:56:21.7651256081
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[6]    -21:57:15.4626098422
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[7]    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[8]    0.0
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[4]    Region 2
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[5]    Line
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[6]    17:56:21.7537538964
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[6]    -21:57:18.9043614731
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[7]    4.4965009452"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[8]    61.6
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[4]    Region 3
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[5]    Rectangle
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[6]    17:56:21.7367040713
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[6]    -21:57:22.9791142213
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[7]    4.2724998474"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[7]    1.8200000763"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[8]    25.9

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[4]    Region 4
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[5]    Ellipse
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[6]    17:56:21.7224773834
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[6]    -21:57:29.4671167423
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[7]    2.1364999771"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[7]    0.9100000381"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[8]    42.7

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[4]    Region 5
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[5]    Polygon
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[6]    17:56:21.1395428470
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[6]    -21:57:16.6891502464
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[7]    6.0134994507"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[7]    3.9559997559"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[4]    Region 6
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[5]    Polyline
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[6]    17:56:21.0798272384
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[6]    -21:57:21.3173957286
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[7]    7.9910003662"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[7]    2.8485000610"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[8]    0.0

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
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[1]/ul[1]/li/div
    Drag And Drop By Offset    //*[@id="root"]/div/div[15]/div[2]/div/div[2]/div    -200    0
    Click Element At Coordinates    ${VIEWER_DIV}    50    -150
    Mouse Out    ${VIEWER_DIV}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_selected_from_viewer.png
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[4]
    Capture Element Screenshot    ${VIEWER_DIV}    check_polyline_selected_from_list.png
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[2]
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov.png
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[4]
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov_selected.png
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[1]
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov_selected_locked.png
    Press Keys    None    DELETE
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[4]    Region 5
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[5]    Polygon
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov_selected_locked_tried_delete.png
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[1]
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov_selected_locked_tried_delete_unlocked.png
    Press Keys    None    DELETE
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[4]    Region 6
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[5]    Polyline
    
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
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[1]/ul[1]/li/div
    Drag And Drop By Offset    //*[@id="root"]/div/div[15]/div[2]/div/div[2]/div    -200    0
    Click Element At Coordinates    ${VIEWER_DIV}    50    -150

    Set Selenium Speed    0.02
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]    Region 1
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[5]    Point
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[6]    17:56:21.6556900185
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[6]    -21:57:18.1728612209
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[7]    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[8]    0.0
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[4]    Region 2
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[5]    Line
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[6]    17:56:21.2886455617
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[6]    -21:57:23.2792706952
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[7]    8.3750907916"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[8]    307.6
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[4]    Region 3
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[5]    Rectangle
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[6]    17:56:21.2886455617
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[6]    -21:57:23.2792706952
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[7]    6.1276595745"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[7]    8.1702127660"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[4]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[4]    Region 4
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[5]    Ellipse
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[6]    17:56:21.2886455617
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[6]    -21:57:23.2792706952
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[7]    2.5531914894"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[7]    5.1063829787"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[5]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[4]    Region 5
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[5]    Polygon
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[6]    17:56:21.1510021967
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[6]    -21:57:24.4282036623
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[7]    3.8297872340"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[7]    9.9574468085"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[6]/div[8]    0.0

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[4]    Region 6
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[5]    Polyline
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[6]    17:56:21.2886455981
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[6]    -21:57:25.8324621846
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[7]    8.1702127660"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[7]    5.1063829787"
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[7]/div[8]    0.0
    [Teardown]    Kill carta_backend And Close Browser


Shared Region And Region Inheritance
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[1]/ul[1]/li/div
    Drag And Drop By Offset    //*[@id="root"]/div/div[15]/div[2]/div/div[2]/div    -200    0
    Click Element At Coordinates    ${VIEWER_DIV}    50    -150

    # point
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[1]/a
    Click Element At Coordinates    ${VIEWER_DIV}    -50    -50

    Append Image    HD163296_CO_2_1.mom1.fits
    Page Should Not Contain Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]
    # match image
    Click Element    xpath://*[contains(text(), "Image List")]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div/span[1]/a
    Click Element    xpath://*[contains(text(), "Region List")]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]    Region 1

    # unmatch image
    Click Element    xpath://*[contains(text(), "Image List")]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div/span[1]/a
    Click Element    xpath://*[contains(text(), "Region List")]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]    Region 2
    Click Element    xpath://*[contains(text(), "Image List")]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div
    Click Element    xpath://*[contains(text(), "Region List")]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]    Region 1

    # create a new region on the unmatched 2nd image
    Click Element    xpath://*[contains(text(), "Image List")]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[6]/div/div
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[1]/a
    Click Element At Coordinates    //*[@id="image-panel-1-0"]/div[8]/div/div/canvas    20    -50
    Click Element    xpath://*[contains(text(), "Region List")]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[4]    Region 3

    # match the 2nd image
    Click Element    xpath://*[contains(text(), "Image List")]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div/span[1]/a
    Click Element    xpath://*[contains(text(), "Region List")]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]    Region 1
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[4]    Region 4
    Click Element    xpath://*[contains(text(), "Image List")]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div/div
    Click Element    xpath://*[contains(text(), "Region List")]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]    Region 1
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[4]    Region 4

    # unmatch again
    Click Element    xpath://*[contains(text(), "Image List")]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div/span[1]/a
    Click Element    xpath://*[contains(text(), "Region List")]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]    Region 1
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[4]    Region 4
    Click Element    xpath://*[contains(text(), "Image List")]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[6]/div/div
    Click Element    xpath://*[contains(text(), "Region List")]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[2]/div[4]    Region 5
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div/div[3]/div[4]    Region 6

    [Teardown]    Kill carta_backend And Close Browser



Loading 4000 Regions From A File
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Click Element    xpath://*[contains(text(), "Region List")]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[1]/ul[1]/li/div
    Drag And Drop By Offset    //*[@id="root"]/div/div[15]/div[2]/div/div[2]/div    -200    0
    Click Element At Coordinates    ${VIEWER_DIV}    50    -150

    Load Region File    box_region_n_4000.crtf
    Wait Until Page Does Not Contain    Importing regions    timeout=10
    Sleep    1

    # scroll the region list to the very bottom
    Assign Id To Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]    tmp_REGIONLIST
    Execute Javascript    window.document.getElementById("tmp_REGIONLIST").scrollTo(0, 200000)

    Page Should Contain    Region 4000
    [Teardown]    Kill carta_backend And Close Browser


Loading Regions on Active Matched Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    m51cm3i_8_small.fits
    Append Image    m51_151_MHz.fits
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div/span[1]/a
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
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div/span[1]/a
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[5]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]
    Load Region File    region_004.crtf
    Capture Element Screenshot    ${VIEWER_DIV}    check.png

    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check.png    118,72,497,72
    PNG Two Pixels Should Have Matched RGBA    check.png    139,149,518,149
    PNG Two Pixels Should Have Matched RGBA    check.png    163,120,542,120
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser




# add a test to have two image matched and load a region file when the 2nd image is active 