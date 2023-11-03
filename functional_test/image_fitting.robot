*** Settings ***
Documentation     Fit single or multiple 2D Gaussian functions to an image
Resource          ../resource.robot


*** Test Cases ***
Single Gaussian Fitting With Smart Angular Unit
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    small_gaussian.fits
    Click Element    ${IMAGE_FITTING_DIALOG_BUTTON}
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_X}    11.42
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_Y}    12.46
    Input Text    ${IMAGE_FITTING_DIALOG_AMPLITUDE}    0.5
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MAJOR}    4
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MINOR}    5
    Input Text    ${IMAGE_FITTING_DIALOG_PA}    0
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=5

    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 10:59:59.9999998479 ± 0.000384 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= -40:00:00.0000178350 ± 0.005763 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.000000 ± 0.000023 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 9.999994 ± 0.000226 (arcmin)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 9.999995 ± 0.000226 (arcmin)
    # CI workaround
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= -0.196734 ± 35726.395210 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= -0.196734 ± 35726.3
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 0.999998 ± 0.000039 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Background${SPACE*6}\= 0.000000 (Jy/beam) (fixed)
    
    Click Element    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB_TITLE}
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Image: small_gaussian.fits
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Region: entire image
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Gaussian fitting with 1 component(s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    summary from method 'trust-region/levenberg-marquardt':
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    number of iterations \= 89
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    function evaluations \= 640
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Jacobian evaluations \= 0
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    reason for stopping  \= small step size
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    initial |f(x)|${SPACE*7}\= 2.211152848345e+00
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    final |f(x)|${SPACE*9}\= 2.032512800170e-06
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    initial cost${SPACE*9}\= 4.889196918743e+00
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    final cost${SPACE*11}\= 4.131108282857e-12
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    residual variance${SPACE*4}\= 6.673842137087e-15
    # CI workaround
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    final cond(J)${SPACE*8}\= inf
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Center X${SPACE*8}\= 10:59:59.9999998479 ± 3.842306488765e-4 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.200000001456e+1 ± 4.802881229828e-5 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Center Y${SPACE*8}\= -40:00:00.0000178350 ± 5.763459437474e-3 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.199999985138e+1 ± 4.802880983434e-5 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Amplitude${SPACE*7}\= 1.000000284162e+0 ± 2.261986942176e-5 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    FWHM Major Axis \= 9.999994245264e+0 ± 2.261984968680e-4 (arcmin)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 4.999995164301e+0 ± 1.130992041368e-4 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    FWHM Minor Axis \= 9.999994501776e+0 ± 2.261985084725e-4 (arcmin)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 4.999995292557e+0 ± 1.130992099391e-4 (px)
    # CI workaround
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    P.A.${SPACE*12}\= -1.967343050949e-1 ± 3.572639520974e+4 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    P.A.${SPACE*12}\= -1.967343050949e-1 ± 3.572639
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Integrated flux \= 9.999983755341e-1 ± 3.917871324727e-5 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Background${SPACE*6}\= 0.000000000000e+0 (Jy/beam) (fixed)

    [Teardown]    Kill carta_backend And Close Browser

Triple Gaussian Fitting
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    Gaussian_triple.fits
    Click Element    ${IMAGE_FITTING_DIALOG_BUTTON}
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_X}    128
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_Y}    129
    Input Text    ${IMAGE_FITTING_DIALOG_AMPLITUDE}    0.01
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MAJOR}    10
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MINOR}    6
    Input Text    ${IMAGE_FITTING_DIALOG_PA}    36
    Click Element    ${IMAGE_FITTING_DIALOG_COMPONENT_SPINBOX_UP}
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_X}    135
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_Y}    135
    Input Text    ${IMAGE_FITTING_DIALOG_AMPLITUDE}    0.01
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MAJOR}    4
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MINOR}    9
    Input Text    ${IMAGE_FITTING_DIALOG_PA}    40
    Click Element    ${IMAGE_FITTING_DIALOG_COMPONENT_SPINBOX_UP}
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_X}    139
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_Y}    120
    Input Text    ${IMAGE_FITTING_DIALOG_AMPLITUDE}    0.01
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MAJOR}    9
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MINOR}    9
    Input Text    ${IMAGE_FITTING_DIALOG_PA}    0    
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Set Selenium Speed    0.02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 10:00:00.0600012160 ± 0.000808 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 0:00:00.4504712147 ± 0.018075 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 0.008818 ± 0.000040 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 9.540590 ± 0.043091 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 6.137742 ± 0.027722 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 11.769422 ± 0.401689 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 2.340368 ± 0.010570 (Jy)
    
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #2:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 9:59:59.7253126120 ± 0.001066 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 0:00:03.7242811119 ± 0.012984 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 0.009530 ± 0.000070 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 3.313623 ± 0.024410 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 5.688434 ± 0.041904 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 32.725431 ± 0.526287 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 0.814125 ± 0.005997 (Jy)
    
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #3:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 9:59:59.6591051169 ± 0.001080 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= -0:00:03.6487542379 ± 0.015017 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 0.008340 ± 0.000050 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 5.573810 ± 0.033720 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 6.545903 ± 0.039600 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= -210.876776 ± 1.518063 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 1.379221 ± 0.008344 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Background${SPACE*6}\= 0.000000 (Jy/pixel) (fixed)
    Click Element    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB_TITLE}
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Image: Gaussian_triple.fits
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Region: entire image
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Gaussian fitting with 3 component(s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    summary from method 'trust-region/levenberg-marquardt':
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    number of iterations \= 64
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    function evaluations \= 1247
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Jacobian evaluations \= 0
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    reason for stopping  \= small step size
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    initial |f(x)|${SPACE*7}\= 1.206974636655e-01
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    final |f(x)|${SPACE*9}\= 8.155327203982e-02
    # CI workaround
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    initial cost${SPACE*9}\= 1.456787773528e-02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    initial cost${SPACE*9}\= 1.45678777352
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    final cost${SPACE*11}\= 6.650936180401e-03
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    residual variance${SPACE*4}\= 1.015131136543e-07
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    final cond(J)${SPACE*8}\= 7.164273678734e+04
    
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Center X${SPACE*8}\= 10:00:00.0600012160 ± 8.076116811208e-4 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.261999635218e+2 ± 2.422835043362e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Center Y${SPACE*8}\= 0:00:00.4504712147 ± 1.807455505493e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.289009424294e+2 ± 3.614911010986e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Amplitude${SPACE*7}\= 8.818116552649e-3 ± 3.982785622424e-5 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    FWHM Major Axis \= 9.540589791690e+0 ± 4.309097484130e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.908117958338e+1 ± 8.618194968261e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    FWHM Minor Axis \= 6.137741785547e+0 ± 2.772169044452e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.227548357109e+1 ± 5.544338088905e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    P.A.${SPACE*12}\= 1.176942205301e+1 ± 4.016892109806e-1 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Integrated flux \= 2.340367634047e+0 ± 1.057049145179e-2 (Jy)
    
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Component #2:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Center X${SPACE*8}\= 9:59:59.7253126120 ± 1.065653854063e-3 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.362406216397e+2 ± 3.196961562188e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Center Y${SPACE*8}\= 0:00:03.7242811119 ± 1.298438847903e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.354485622235e+2 ± 2.596877695806e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Amplitude${SPACE*7}\= 9.529521672126e-3 ± 7.019901028531e-5 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    FWHM Major Axis \= 3.313622524469e+0 ± 2.440972691811e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 6.627245048937e+0 ± 4.881945383622e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    FWHM Minor Axis \= 5.688433512292e+0 ± 4.190371944950e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.137686702458e+1 ± 8.380743889901e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    P.A.${SPACE*12}\= 3.272543116625e+1 ± 5.262867978382e-1 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Integrated flux \= 8.141252672164e-1 ± 5.997235745213e-3 (Jy)
    
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Component #3:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Center X${SPACE*8}\= 9:59:59.6591051169 ± 1.079761581744e-3 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.382268464898e+2 ± 3.239284745231e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Center Y${SPACE*8}\= -0:00:03.6487542379 ± 1.501745715611e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.207024915244e+2 ± 3.003491431223e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Amplitude${SPACE*7}\= 8.340416700056e-3 ± 5.045660088587e-5 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    FWHM Major Axis \= 5.573810327304e+0 ± 3.371960097586e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.114762065461e+1 ± 6.743920195172e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    FWHM Minor Axis \= 6.545902502509e+0 ± 3.960041828661e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.309180500502e+1 ± 7.920083657323e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    P.A.${SPACE*12}\= -2.108767756592e+2 ± 1.518063060307e+0 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Integrated flux \= 1.379221057521e+0 ± 8.343804504666e-3 (Jy)

    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Background${SPACE*6}\= 0.000000000000e+0 (Jy/pixel) (fixed)
    [Teardown]    Kill carta_backend And Close Browser



FOV Image Fitting
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    double.miriad
    # zoom in the image with the zoom in button
    Mouse Over    ${VIEWER_DIV}
    Repeat Keyword    3    Click Element    //*[@id="image-panel-0-0"]/div[8]/span[5]/a
    Click Element    ${IMAGE_FITTING_DIALOG_BUTTON}
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_X}    487
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_Y}    520
    Input Text    ${IMAGE_FITTING_DIALOG_AMPLITUDE}    6
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MAJOR}    20
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MINOR}    14
    Input Text    ${IMAGE_FITTING_DIALOG_PA}    0
    Click Element    ${IMAGE_FITTING_DIALOG_COMPONENT_SPINBOX_UP}
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_X}    499
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_Y}    527
    Input Text    ${IMAGE_FITTING_DIALOG_AMPLITUDE}    10
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MAJOR}    20
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MINOR}    8
    Input Text    ${IMAGE_FITTING_DIALOG_PA}    38
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=2
    Set Selenium Speed    0.02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #1:
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 0:00:00.7677241853 ± 0.001515 (s)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 30:00:02.9895992722 ± 0.026720 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 6.891616 ± 0.072396 (Jy/pixel)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 5.989647 ± 0.062921 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 5.094565 ± 0.053518 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= -0.034082 ± 2.617999 (deg)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 1489.271418 ± 15.644633 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #2:
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 0:00:00.3846146426 ± 0.001168 (s)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 30:00:06.0332033809 ± 0.022890 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 9.865010 ± 0.087321 (Jy/pixel)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 7.071185 ± 0.062591 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 2.966246 ± 0.026256 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 34.054985 ± 0.365113 (deg)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 1465.350023 ± 12.970626 (Jy)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Background${SPACE*6}\= 0.000000 (Jy/pixel) (fixed)
    Click Element    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB_TITLE}
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Image: double.miriad
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Region: field of view
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    rotbox[[511.500000pix, 511.500000pix], [203.650118pix, 128.000000pix], 0.000000deg]
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    rotbox(wcs:FK5)[[0:00:00.0153959990, 29:59:59.7999999385], [81.4600472813", 51.2000000000"], 0.000000deg]
    [Teardown]    Kill carta_backend And Close Browser


FOV Matched Image Fitting
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    double.miriad
    Append Image    double_bin2_gal.miriad
    # match double_bin2_gal.miriad to double.miriad with the XY button in the image list widget
    Click Element    ${IMAGE_LIST_SECOND_MATCHING_XY}
    # zoom in the image with the zoom in button
    Mouse Over    //*[@id="image-panel-1-0"]/div[7]/div/div/canvas
    Click Element    //*[@id="image-panel-1-0"]/div[8]/span[8]/a
    Repeat Keyword    3    Click Element    //*[@id="image-panel-1-0"]/div[8]/span[5]/a
    Click Element    ${IMAGE_FITTING_DIALOG_BUTTON}
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_X}    243
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_Y}    257
    Input Text    ${IMAGE_FITTING_DIALOG_AMPLITUDE}    7
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MAJOR}    7
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MINOR}    5
    Input Text    ${IMAGE_FITTING_DIALOG_PA}    0
    Click Element    ${IMAGE_FITTING_DIALOG_COMPONENT_SPINBOX_UP}
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_X}    248
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_Y}    261
    Input Text    ${IMAGE_FITTING_DIALOG_AMPLITUDE}    10
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MAJOR}    10
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MINOR}    4
    Input Text    ${IMAGE_FITTING_DIALOG_PA}    44
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=2
    Set Selenium Speed    0.02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 109.8614700160 (deg) ± 0.021480 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= -31.5622759241 (deg) ± 0.024337 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 6.949444 ± 0.068954 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 5.775858 ± 0.057309 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 5.097791 ± 0.050581 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 0.095633 ± 3.210666 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 362.270524 ± 3.594514 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #2:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 109.8601265709 (deg) ± 0.019853 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= -31.5611268161 (deg) ± 0.018661 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 9.699740 ± 0.081091 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 7.056882 ± 0.058996 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 3.016857 ± 0.025221 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 47.568251 ± 0.354359 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 365.605036 ± 3.056502 (Jy)
    Click Element    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB_TITLE}
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Image: double_bin2_gal.miriad
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Region: field of view
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    rotbox[[255.500000pix, 255.500000pix], [77.124482pix, 110.964816pix], 13.442261deg]
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    rotbox(wcs:GALACTIC)[[109.8581469935, -31.5624932445], [61.6995858783", 88.7718531514"], 13.442261deg]
    [Teardown]    Kill carta_backend And Close Browser


Generation Of Model And Residual Images After Fitting
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cluster_00512.fits
    Click Element    ${IMAGE_FITTING_DIALOG_BUTTON}
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_X}    256
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_Y}    256
    Input Text    ${IMAGE_FITTING_DIALOG_AMPLITUDE}    1
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MAJOR}    100
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MINOR}    100
    Input Text    ${IMAGE_FITTING_DIALOG_PA}    0
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Click Element    ${IMAGE_FITTING_DIALOG_CLOSE_BUTTON}
    # check the filenames of appended model and residule images
    Element Should Contain    ${IMAGE_LIST_FIRST_IMAGE_NAME}    cluster_00512.fits
    Element Should Contain    ${IMAGE_LIST_SECOND_IMAGE_NAME}    cluster_00512_model.fits
    Element Should Contain    ${IMAGE_LIST_THIRD_IMAGE_NAME}    cluster_00512_residual.fits
    # match model and residual images to the reference image
    Click Element    ${IMAGE_LIST_SECOND_MATCHING_XY}
    Mouse Over    ${IMAGE_LIST_THIRD_IMAGE_NAME}
    Click Element    ${IMAGE_LIST_THIRD_MATCHING_XY}
    # mouse over the top-left panel
    Mouse Over    //*[@id="image-panel-0-0"]/div[7]/div/div/canvas
    Click Element    ${CURSOR_INFO_WIDGET_BUTTON}
    # check pixel values of the three images in the cursor info widget
    Element Should Contain    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    1.95008e+1
    # CI workaround
    Run Keyword And Warn On Failure    Element Should Contain    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[10]/div    1.21062e+1
    Element Should Contain    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[10]/div    1.2
    # CI workaround
    Run Keyword And Warn On Failure    Element Should Contain    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[18]/div    7.25401
    Run Keyword And Warn On Failure    Element Should Contain    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[18]/div    7.2
    Run Keyword And Warn On Failure    Element Should Contain    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[18]/div    7.25401
    Click Element    ${CURSOR_INFO_WIDGET_CLOSE_BUTTON}
    # with a model image only
    Click Element    ${IMAGE_FITTING_DIALOG_BUTTON}
    Click Element    ${IMAGE_FITTING_DIALOG_RESIDUAL_TOGGLE}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Click Element    ${IMAGE_FITTING_DIALOG_CLOSE_BUTTON}
    # check the filename of the appended model image
    Element Should Contain    ${IMAGE_LIST_SECOND_IMAGE_NAME}    cluster_00512_model.fits
    Page Should Not Contain Element    ${IMAGE_LIST_THIRD_IMAGE_NAME}
    # with a residual image only
    Click Element    ${IMAGE_FITTING_DIALOG_BUTTON}
    Click Element    ${IMAGE_FITTING_DIALOG_RESIDUAL_TOGGLE}
    Click Element    ${IMAGE_FITTING_DIALOG_MODEL_TOGGLE}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Click Element    ${IMAGE_FITTING_DIALOG_CLOSE_BUTTON}
    # check the filename of the appended residual image
    Element Should Contain    ${IMAGE_LIST_SECOND_IMAGE_NAME}    cluster_00512_residual.fits
    Page Should Not Contain Element    ${IMAGE_LIST_THIRD_IMAGE_NAME}
    # without generated model and residual images
    Click Element    ${IMAGE_FITTING_DIALOG_BUTTON}
    Click Element    ${IMAGE_FITTING_DIALOG_RESIDUAL_TOGGLE}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Click Element    ${IMAGE_FITTING_DIALOG_CLOSE_BUTTON}
    # check the filename of loaded images
    Element Should Contain    ${IMAGE_LIST_FIRST_IMAGE_NAME}    cluster_00512.fits
    Page Should Not Contain Element    ${IMAGE_LIST_SECOND_IMAGE_NAME}
    Page Should Not Contain Element    ${IMAGE_LIST_THIRD_IMAGE_NAME}
    [Teardown]    Kill carta_backend And Close Browser


Fitting With Cancellation
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    spire500_ext.fits
    Click Element    ${IMAGE_FITTING_DIALOG_BUTTON}
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_X}    361
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_Y}    454
    Input Text    ${IMAGE_FITTING_DIALOG_AMPLITUDE}    100
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MAJOR}    100
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MINOR}    100
    Input Text    ${IMAGE_FITTING_DIALOG_PA}    0
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Contains    Image fitting processing
    Sleep    0.02
    Click Element    xpath://*[contains(text(), "Cancel")]
    Element Should Be Enabled    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    # try to fit again and cancel again
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Contains    Image fitting processing
    Sleep    0.02
    Click Element    xpath://*[contains(text(), "Cancel")]
    Click Element    ${IMAGE_FITTING_DIALOG_CLOSE_BUTTON}
    # check entries in the image list widget
    Element Should Contain    ${IMAGE_LIST_FIRST_IMAGE_NAME}    spire500_ext.fits.HDU_1_image
    Page Should Not Contain Element    ${IMAGE_LIST_SECOND_IMAGE_NAME}
    # try to fit again and let it finish
    Click Element    ${IMAGE_FITTING_DIALOG_BUTTON}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=20
    Click Element    ${IMAGE_FITTING_DIALOG_CLOSE_BUTTON}
    # check the filenames of appended model and residule images
    Element Should Contain    ${IMAGE_LIST_FIRST_IMAGE_NAME}    spire500_ext.fits.HDU_1_image
    Element Should Contain    ${IMAGE_LIST_SECOND_IMAGE_NAME}    spire500_ext_model.fits
    Element Should Contain    ${IMAGE_LIST_THIRD_IMAGE_NAME}    spire500_ext_residual.fits
    [Teardown]    Kill carta_backend And Close Browser

Fitting With One Gaussian Having Fixed Parameters
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    dice_one.fits
    Click Element    ${IMAGE_FITTING_DIALOG_BUTTON}
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_X}    45
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_Y}    55
    Input Text    ${IMAGE_FITTING_DIALOG_AMPLITUDE}    1
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MAJOR}    15
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MINOR}    20
    Input Text    ${IMAGE_FITTING_DIALOG_PA}    45
    # with center locked, amplitude free, FWHM free, and PA free
    Click Element    ${IMAGE_FITTING_DIALOG_CENTER_X_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_CENTER_Y_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Set Selenium Speed    0.02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3777367749 (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.1574465497 (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 2.382568 ± 0.067013 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.734567 ± 0.021589 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.361542 ± 0.009732 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 43.783716 ± 1.416673 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 38.767326 ± 1.155697 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Background${SPACE*6}\= 0.000000 (Jy/beam) (fixed)
    # zoom the reference image to fix the new FOV in the multi-panel view
    Set Selenium Speed    0.2
    Mouse Over    //*[@id="image-panel-0-0"]/div[8]/div/div/canvas
    Click Element    //*[@id="image-panel-0-0"]/div[9]/span[8]/a
    # with center free, amplitude locked, FWHM free, and PA free
    Click Element    ${IMAGE_FITTING_DIALOG_CENTER_X_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_CENTER_Y_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_AMPLITUDE_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Set Selenium Speed    0.02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #1:
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3674122687 ± 0.001029 (s)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.0124248555 ± 0.015488 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.000000 (Jy/beam) (fixed)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.613421 ± 0.034892 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.661957 ± 0.037875 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 46.079536 ± 30.412366 (deg)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 24.878172 ± 1.475226 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Background${SPACE*6}\= 0.000000 (Jy/beam) (fixed)
    Set Selenium Speed    0.2
    # with center free, amplitude free, FWHM locked, and PA free
    Click Element    ${IMAGE_FITTING_DIALOG_AMPLITUDE_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_X_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_Y_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Set Selenium Speed    0.02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3672367946 ± 0.000370 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.0081254667 ± 0.004542 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 3.022558 ± 0.067750 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.450000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.600000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 25.142565 ± 3.165650 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 49.999830 ± 1.186596 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Background${SPACE*6}\= 0.000000 (Jy/beam) (fixed)
    Set Selenium Speed    0.2
    # with center free, amplitude free, FWHM free, and PA locked
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_X_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_Y_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_PA_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Set Selenium Speed    0.02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3672142086 ± 0.000183 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.0072626361 ± 0.002749 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 4.957899 ± 0.090701 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.354025 ± 0.006477 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.353760 ± 0.006471 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 45.000000 (deg) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 38.042577 ± 0.781411 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Background${SPACE*6}\= 0.000000 (Jy/beam) (fixed)
    Set Selenium Speed    0.2
    # with center locked, amplitude locked, FWHM free, and PA free
    Click Element    ${IMAGE_FITTING_DIALOG_PA_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_CENTER_X_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_CENTER_Y_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_AMPLITUDE_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Set Selenium Speed    0.02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3777367749 (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.1574465497 (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.000000 (Jy/beam) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.827322 ± 0.045390 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.548621 ± 0.029232 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 38.159081 ± 5.110127 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 27.808448 ± 1.556683 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Background${SPACE*6}\= 0.000000 (Jy/beam) (fixed)
    Set Selenium Speed    0.2
    # with center locked, amplitude free, FWHM locked, and PA free
    Click Element    ${IMAGE_FITTING_DIALOG_AMPLITUDE_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_X_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_Y_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Set Selenium Speed    0.02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3777367749 (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.1574465497 (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.941201 ± 0.067750 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.450000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.600000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 37.839369 ± 4.929092 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 32.111784 ± 1.186596 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Background${SPACE*6}\= 0.000000 (Jy/beam) (fixed)
    Set Selenium Speed    0.2
    # with center locked, amplitude free, FWHM free, and PA locked
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_X_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_Y_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_PA_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Set Selenium Speed    0.02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3777367749 (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.1574465497 (fixed)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 2.291762 ± 0.067100 (Jy/beam)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.717603 ± 0.021873 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.371680 ± 0.010453 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 45.000000 (deg) (fixed)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 37.450058 ± 1.161857 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Background${SPACE*6}\= 0.000000 (Jy/beam) (fixed)
    Set Selenium Speed    0.2
    # with center free, amplitude locked, FWHM locked, and PA free
    Click Element    ${IMAGE_FITTING_DIALOG_CENTER_X_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_CENTER_Y_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_PA_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_AMPLITUDE_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_X_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_Y_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Set Selenium Speed    0.02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3672408472 ± 0.001022 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.0066810390 ± 0.015338 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.000000 (Jy/beam) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.450000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.600000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 45.066065 ± 9.568361 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 16.542221 (Jy) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Background${SPACE*6}\= 0.000000 (Jy/beam) (fixed)
    Set Selenium Speed    0.2
    # with center free, amplitude locked, FWHM free, and PA locked
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_X_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_Y_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_PA_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Set Selenium Speed    0.02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #1:
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3674273224 ± 0.001027 (s)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.0038317164 ± 0.015398 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.000000 (Jy/beam) (fixed)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.568339 ± 0.033812 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.641322 ± 0.038552 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 45.000000 (deg) (fixed)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 22.331266 ± 1.393965 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Background${SPACE*6}\= 0.000000 (Jy/beam) (fixed)
    Set Selenium Speed    0.2
    # with center free, amplitude free, FWHM locked, and PA locked
    Click Element    ${IMAGE_FITTING_DIALOG_AMPLITUDE_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_X_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_Y_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Set Selenium Speed    0.02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3671906758 ± 0.000331 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.0079087495 ± 0.004966 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 3.087497 ± 0.067750 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.450000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.600000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 45.000000 (deg) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 51.074063 ± 1.186596 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Background${SPACE*6}\= 0.000000 (Jy/beam) (fixed)
    Set Selenium Speed    0.2
    # with center locked, amplitude locked, FWHM locked, and PA free
    Click Element    ${IMAGE_FITTING_DIALOG_PA_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_CENTER_X_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_CENTER_Y_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_AMPLITUDE_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Set Selenium Speed    0.02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3777367749 (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.1574465497 (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.000000 (Jy/beam) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.450000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.600000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 50.028899 ± 9.568361 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 16.542221 (Jy) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Background${SPACE*6}\= 0.000000 (Jy/beam) (fixed)
    Set Selenium Speed    0.2
    # with center locked, amplitude free, FWHM locked, and PA locked
    Click Element    ${IMAGE_FITTING_DIALOG_AMPLITUDE_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_PA_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Set Selenium Speed    0.02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3777367749 (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.1574465497 (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.654430 ± 0.067750 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.450000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.600000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 45.000000 (deg) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 27.367953 ± 1.186596 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Background${SPACE*6}\= 0.000000 (Jy/beam) (fixed)
    Set Selenium Speed    0.2
    # with center locked, amplitude locked, FWHM free, and PA locked
    Click Element    ${IMAGE_FITTING_DIALOG_AMPLITUDE_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_X_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_Y_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Set Selenium Speed    0.02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3777367749 (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.1574465497 (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.000000 (Jy/beam) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.931270 ± 0.049738 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.519101 ± 0.026633 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 45.000000 (deg) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 29.618108 ± 1.601962 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Background${SPACE*6}\= 0.000000 (Jy/beam) (fixed)
    Set Selenium Speed    0.2
    # with center free, amplitude locked, FWHM locked, and PA locked
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_X_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_Y_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_CENTER_X_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_CENTER_Y_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Set Selenium Speed    0.02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3677548778 ± 0.001022 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.0050935737 ± 0.015333 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.000000 (Jy/beam) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.450000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.600000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 45.000000 (deg) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 16.542221 (Jy) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Background${SPACE*6}\= 0.000000 (Jy/beam) (fixed)
    Set Selenium Speed    0.2
    # with center locked, amplitude locked, FWHM locked, and PA locked
    Click Element    ${IMAGE_FITTING_DIALOG_CENTER_X_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_CENTER_Y_LOCK}
    Mouse Over   ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Sleep    1
    Page Should Not Contain    Clear existing fitting results and fit the current channel of the image
    [Teardown]    Kill carta_backend And Close Browser


Fitting With Multiple Gaussians Having Fixed Parameters
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    dice_four.fits
    Click Element    ${IMAGE_FITTING_DIALOG_BUTTON}
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_X}    35
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_Y}    75
    Input Text    ${IMAGE_FITTING_DIALOG_AMPLITUDE}    1
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MAJOR}    10
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MINOR}    15
    Input Text    ${IMAGE_FITTING_DIALOG_PA}    0
    Click Element    ${IMAGE_FITTING_DIALOG_CENTER_X_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_CENTER_Y_LOCK}    
    Click Element    ${IMAGE_FITTING_DIALOG_COMPONENT_SPINBOX_UP}
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_X}    75
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_Y}    75
    Input Text    ${IMAGE_FITTING_DIALOG_AMPLITUDE}    1
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MAJOR}    20
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MINOR}    25
    Input Text    ${IMAGE_FITTING_DIALOG_PA}    10
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_X_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_Y_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=2
    Set Selenium Speed    0.02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3987650670 (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.7574425865 (fixed)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.428114 ± 0.079495 (Jy/beam)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.402444 ± 0.021579 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.872463 ± 0.050416 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 0.017295 ± 2.743556 (deg)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 30.721695 ± 1.788036 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #2:
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3136120678 ± 0.000750 (s)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.7551247569 ± 0.008897 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 2.068573 ± 0.072591 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.600000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.750000 (arcsec) (fixed)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 5.556748 ± 6.368759 (deg)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 57.031307 ± 2.072691 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Background${SPACE*6}\= 0.000000 (Jy/beam) (fixed)
    [Teardown]    Kill carta_backend And Close Browser

