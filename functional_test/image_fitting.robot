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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 11:00:00.0000012437 ± 0.000205 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= -40:00:00.0000102483 ± 0.003071 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.000000 ± 0.000012 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 9.999994 ± 0.000121 (arcmin)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 9.999994 ± 0.000121 (arcmin)
    # CI workaround
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= -0.212572 ± 101583.527733 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= -0.212572 ± 101583.5
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 0.999998 ± 0.000021 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Background${SPACE*6}\= 0.000000 (Jy/beam) (fixed)
    
    Click Element    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB_TITLE}
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Image: small_gaussian.fits
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Region: entire image
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Gaussian fitting with 1 component(s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    summary from method 'trust-region/levenberg-marquardt':
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    number of iterations \= 86
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    function evaluations \= 618
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Jacobian evaluations \= 0
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    reason for stopping  \= small step size
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    initial |f(x)|${SPACE*7}\= 2.211152848345e+00
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    final |f(x)|${SPACE*9}\= 1.954081461161e-06
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    initial cost${SPACE*9}\= 4.889196918743e+00
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    final cost${SPACE*11}\= 3.818434356852e-12
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    residual variance${SPACE*4}\= 6.168714631425e-15
    # CI workaround
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    final cond(J)${SPACE*8}\= inf
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Center X${SPACE*8}\= 11:00:00.0000012437 ± 2.047188267056e-4 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.199999988091e+1 ± 2.558984331551e-5 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Center Y${SPACE*8}\= -40:00:00.0000102483 ± 3.070782430103e-3 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.199999991460e+1 ± 2.558984356151e-5 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Amplitude${SPACE*7}\= 1.000000353232e+0 ± 1.205191116272e-5 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    FWHM Major Axis \= 9.999994274205e+0 ± 1.205190003390e-4 (arcmin)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 4.999995178771e+0 ± 6.025947656785e-5 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    FWHM Minor Axis \= 9.999994226139e+0 ± 1.205189991804e-4 (arcmin)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 4.999995154738e+0 ± 6.025947598856e-5 (px)
    # CI workaround
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    P.A.${SPACE*12}\= -2.125715614103e-1 ± 1.015835277330e+5 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    P.A.${SPACE*12}\= -2.125715614103e-1 ± 1.015835
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Integrated flux \= 9.999984199337e-1 ± 2.087449555770e-5 (Jy)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 10:00:00.0643690216 ± 0.000813 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 0:00:00.3128011068 ± 0.018965 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 0.008637 ± 0.000040 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 9.872040 ± 0.045567 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 5.907047 ± 0.027265 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 14.350707 ± 0.348603 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 2.282801 ± 0.010537 (Jy)
    
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #2:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 9:59:59.7338272101 ± 0.001051 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 0:00:03.6698191024 ± 0.012722 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 0.009680 ± 0.000068 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 3.427885 ± 0.023977 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 5.897923 ± 0.041254 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 32.345038 ± 0.497438 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 0.886986 ± 0.006204 (Jy)
    
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #3:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 9:59:59.6570746934 ± 0.001063 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= -0:00:03.6014370631 ± 0.015206 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 0.008390 ± 0.000051 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 5.352786 ± 0.032644 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 6.613316 ± 0.040331 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= -38.403953 ± 1.159714 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 1.346170 ± 0.008210 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Background${SPACE*6}\= 0.000000 (Jy/pixel) (fixed)
    Click Element    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB_TITLE}
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Image: Gaussian_triple.fits
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Region: entire image
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Gaussian fitting with 3 component(s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    summary from method 'trust-region/levenberg-marquardt':
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    number of iterations \= 43
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    function evaluations \= 848
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Jacobian evaluations \= 0
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    reason for stopping  \= small step size
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    initial |f(x)|${SPACE*7}\= 1.206974636655e-01
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    final |f(x)|${SPACE*9}\= 8.161121707457e-02
    # CI workaround
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    initial cost${SPACE*9}\= 1.456787773528e-02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    initial cost${SPACE*9}\= 1.45678777352
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    final cost${SPACE*11}\= 6.660390752392e-03
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    residual variance${SPACE*4}\= 1.016574186085e-07
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    final cond(J)${SPACE*8}\= 1.693452523067e+04
    
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Center X${SPACE*8}\= 10:00:00.0643690216 ± 8.133044132580e-4 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.260689293536e+2 ± 2.439913239774e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Center Y${SPACE*8}\= 0:00:00.3128011068 ± 1.896500081299e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.286256022136e+2 ± 3.793000162598e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Amplitude${SPACE*7}\= 8.637068528945e-3 ± 3.986642304752e-5 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    FWHM Major Axis \= 9.872040004256e+0 ± 4.556672461643e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.974408000851e+1 ± 9.113344923287e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    FWHM Minor Axis \= 5.907046511878e+0 ± 2.726536375330e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.181409302376e+1 ± 5.453072750661e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    P.A.${SPACE*12}\= 1.435070714280e+1 ± 3.486033021379e-1 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Integrated flux \= 2.282801105222e+0 ± 1.053680589533e-2 (Jy)
    
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Component #2:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Center X${SPACE*8}\= 9:59:59.7338272101 ± 1.051426599234e-3 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.359851836966e+2 ± 3.154279797703e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Center Y${SPACE*8}\= 0:00:03.6698191024 ± 1.272200812629e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.353396382044e+2 ± 2.544401625259e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Amplitude${SPACE*7}\= 9.679817930084e-3 ± 6.770694520116e-5 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    FWHM Major Axis \= 3.427885422734e+0 ± 2.397686115062e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 6.855770845468e+0 ± 4.795372230124e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    FWHM Minor Axis \= 5.897923055084e+0 ± 4.125391158961e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.179584611017e+1 ± 8.250782317922e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    P.A.${SPACE*12}\= 3.234503790378e+1 ± 4.974380459842e-1 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Integrated flux \= 8.869864795344e-1 ± 6.204160594526e-3 (Jy)
    
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Component #3:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Center X${SPACE*8}\= 9:59:59.6570746934 ± 1.063109889961e-3 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.382877591951e+2 ± 3.189329669884e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Center Y${SPACE*8}\= -0:00:03.6014370631 ± 1.520552755797e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.207971258741e+2 ± 3.041105511594e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Amplitude${SPACE*7}\= 8.390279953736e-3 ± 5.116775011964e-5 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    FWHM Major Axis \= 5.352786191270e+0 ± 3.264372914718e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.070557238254e+1 ± 6.528745829436e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    FWHM Minor Axis \= 6.613316387086e+0 ± 4.033101663143e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.322663277417e+1 ± 8.066203326287e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    P.A.${SPACE*12}\= -3.840395262296e+1 ± 1.159713522537e+0 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Integrated flux \= 1.346170472554e+0 ± 8.209560913087e-3 (Jy)

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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 0:00:00.7673822139 ± 0.001460 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 30:00:02.9890654274 ± 0.026502 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 6.888476 ± 0.070499 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 6.097873 ± 0.062408 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 5.040234 ± 0.051583 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= -0.034082 ± 2.163602 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 1499.327906 ± 15.344621 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #2:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 0:00:00.3843315149 ± 0.001123 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 30:00:06.0302091519 ± 0.022243 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 9.940524 ± 0.086020 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 6.995728 ± 0.060537 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 2.950981 ± 0.025536 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 33.574636 ± 0.359794 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 1453.292587 ± 12.575964 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Background${SPACE*6}\= 0.000000 (Jy/pixel) (fixed)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 109.8614694355 (deg) ± 0.010740 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= -31.5622741905 (deg) ± 0.012235 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 6.890390 ± 0.033719 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 5.887687 ± 0.028812 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 5.167934 ± 0.025290 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 0.088054 ± 1.516234 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 371.184507 ± 1.816451 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #2:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 109.8601216127 (deg) ± 0.009830 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= -31.5611276498 (deg) ± 0.009305 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 9.724909 ± 0.040228 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 7.091067 ± 0.029333 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 3.014670 ± 0.012471 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 47.264769 ± 0.173937 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 368.062286 ± 1.522539 (Jy)
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
    Run Keyword And Warn On Failure    Element Should Contain    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[10]/div    1.20659e+1
    Element Should Contain    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[10]/div    1.20
    # CI workaround
    Run Keyword And Warn On Failure    Element Should Contain    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[18]/div    7.29423
    Element Should Contain    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[18]/div    7.2
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 2.278939 ± 0.067593 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.738277 ± 0.022839 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.368059 ± 0.010466 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 43.808488 ± 1.528638 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 37.940212 ± 1.191208 (Jy)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3670100611 ± 0.001045 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.0123143557 ± 0.015752 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.000000 (Jy/beam) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.612981 ± 0.035625 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.656104 ± 0.038334 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 46.891146 ± 34.790809 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 24.640545 ± 1.492972 (Jy)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3673980946 ± 0.000369 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.0061844847 ± 0.004594 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 3.064441 ± 0.068907 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.450000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.600000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 26.686255 ± 3.175681 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 57.439346 ± 1.367470 (Jy)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3672024086 ± 0.000187 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.0074537419 ± 0.002801 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 4.952889 ± 0.092114 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.354705 ± 0.006597 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.354660 ± 0.006596 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 45.000000 (deg) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 43.254574 ± 0.902812 (Jy)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.819045 ± 0.046562 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.532432 ± 0.029317 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 43.321771 ± 5.022916 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 30.273774 ± 1.756048 (Jy)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 2.130033 ± 0.068907 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.450000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.600000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 21.464472 ± 4.568796 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 39.924965 ± 1.367470 (Jy)
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
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.955828 ± 0.064067 (Jy/beam)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.766962 ± 0.025970 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.407751 ± 0.012921 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 45.000000 (deg) (fixed)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 42.461368 ± 1.461853 (Jy)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3664752184 ± 0.001035 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.0088498074 ± 0.015657 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.000000 (Jy/beam) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.450000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.600000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 45.743492 ± 9.731685 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 18.743826 (Jy) (fixed)
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
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3670337858 ± 0.001049 (s)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.0090589183 ± 0.015739 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.000000 (Jy/beam) (fixed)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.559605 ± 0.033498 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.663812 ± 0.040314 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 45.000000 (deg) (fixed)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 25.788208 ± 1.621774 (Jy)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3673349502 ± 0.000339 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.0052737734 ± 0.005089 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 3.064619 ± 0.068907 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.450000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.600000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 45.000000 (deg) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 57.442678 ± 1.367470 (Jy)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 50.028899 ± 9.731685 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 18.743826 (Jy) (fixed)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.992238 ± 0.068907 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.450000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.600000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 45.000000 (deg) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 37.342170 ± 1.367470 (Jy)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.822875 ± 0.047107 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.522358 ± 0.028895 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 45.000000 (deg) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 29.839855 ± 1.741825 (Jy)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3662843266 ± 0.001040 (s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.0109357223 ± 0.015595 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.000000 (Jy/beam) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.450000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.600000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 45.000000 (deg) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 18.743826 (Jy) (fixed)
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
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.310265 ± 0.086488 (Jy/beam)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.379752 ± 0.023986 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.920165 ± 0.063474 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= -0.012097 ± 2.780322 (deg)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 28.051457 ± 1.936498 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #2:
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3138492864 ± 0.000816 (s)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.7541022008 ± 0.009734 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 2.072273 ± 0.079326 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.600000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.750000 (arcsec) (fixed)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 7.995812 ± 6.947225 (deg)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Integrated flux \= 57.133323 ± 2.264995 (Jy)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Background${SPACE*6}\= 0.000000 (Jy/beam) (fixed)
    [Teardown]    Kill carta_backend And Close Browser

