*** Settings ***
Documentation     Fit single or multiple 2D Gaussian functions to an image
Resource          ../resource.robot


*** Test Cases ***
Single Gaussian Fitting Smart Angular Unit
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 9.999994 ± 0.000000 (arcmin)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 10:00:00.0422417276 ± 0.013259 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 0:00:00.3725472501 ± 0.017936 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 0.009267 ± 0.000012 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 9.431037 ± 0.017812 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 6.410023 ± 0.011112 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 12.198392 ± 0.095674 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #2:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 9:59:59.7150562797 ± 0.016799 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 0:00:03.7838692613 ± 0.014199 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 0.009161 ± 0.000034 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 3.261677 ± 0.013109 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 5.540083 ± 0.022674 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 35.110880 ± 0.239142 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #3:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 9:59:59.6428400999 ± 0.018173 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= -0:00:03.8037922663 ± 0.015875 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 0.008150 ± 0.000022 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 5.620326 ± 0.017341 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 5.905529 ± 0.020820 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 0.000007 ± 0.000000 (deg)
    Click Element    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB_TITLE}
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Image: Gaussian_triple.fits
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Region: entire image
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Gaussian fitting with 3 component(s)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    summary from method 'trust-region/levenberg-marquardt':
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    number of iterations \= 84
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    function evaluations \= 1632
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Jacobian evaluations \= 0
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    reason for stopping  \= small step size
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    initial |f(x)|${SPACE*7}\= 1.206974636655e-01
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    final |f(x)|${SPACE*9}\= 8.150186854667e-02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    initial cost${SPACE*9}\= 1.456787773528e-02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    final cost${SPACE*11}\= 6.642554576599e-03
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    residual variance${SPACE*4}\= 1.013851853933e-07
    #Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    final cond(J)${SPACE*8}\= inf
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Center X${SPACE*8}\= 10:00:00.0422417276 ± 1.325941463697e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.267327481724e+2 ± 2.651882927394e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Center Y${SPACE*8}\= 0:00:00.3725472501 ± 1.793574708574e-2 (arcsec)
    # workaround due to numerical errors on different CI servers
    # Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.287450945003e+2 ± 3.587149417148e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.287450945003e+2 ± 3.58714941714
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    e-2 (px)

    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Amplitude${SPACE*7}\= 9.266824141717e-3 ± 1.234335606817e-5 (Jy/pixel)
    # workaround due to numerical errors on different CI servers
    #Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    FWHM Major Axis \= 9.431037235337e+0 ± 1.781215060996e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    FWHM Major Axis \= 9.43103723533
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    e+0 ± 1.781215060996e-2 (arcsec)

    # workaround due to numerical errors on different CI servers
    #Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.886207447067e+1 ± 3.562430121991e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.88620744706
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    e+1 ± 3.562430121991e-2 (px)

    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    FWHM Minor Axis \= 6.410023126954e+0 ± 1.111166667314e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.282004625391e+1 ± 2.222333334627e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    P.A.${SPACE*12}\= 1.219839181423e+1 ± 9.567368095894e-2 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Component #2:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Center X${SPACE*8}\= 9:59:59.7150562797 ± 1.679919133698e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.365483116080e+2 ± 3.359838267396e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Center Y${SPACE*8}\= 0:00:03.7838692613 ± 1.419875473801e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.355677385221e+2 ± 2.839750947601e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Amplitude${SPACE*7}\= 9.161402546771e-3 ± 3.381572740697e-5 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    FWHM Major Axis \= 3.261677242273e+0 ± 1.310929209333e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 6.523354484547e+0 ± 2.621858418665e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    FWHM Minor Axis \= 5.540082503545e+0 ± 2.267408644303e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.108016500709e+1 ± 4.534817288607e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    P.A.${SPACE*12}\= 3.511087991605e+1 ± 2.391421892522e-1 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Component #3:
    # workaround due to numerical errors on different CI servers
    #Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Center X${SPACE*8}\= 9:59:59.6428400999 ± 1.817258511957e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Center X${SPACE*8}\= 9:59:59.6428400999 ± 1.81725851195
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    e-2 (arcsec)

    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.387147970013e+2 ± 3.634517023915e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Center Y${SPACE*8}\= -0:00:03.8037922663 ± 1.587507734839e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.203924154677e+2 ± 3.175015469677e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    Amplitude${SPACE*7}\= 8.149917126930e-3 ± 2.209396057760e-5 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    FWHM Major Axis \= 5.620326429237e+0 ± 1.734128786904e-2 (arcsec)
    # workaround due to numerical errors on different CI servers
    #Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.124065285847e+1 ± 3.468257573808e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.124065285847e+1 ± 3.46825757380
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    e-2 (px)
    
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    FWHM Minor Axis \= 5.905529259142e+0 ± 2.081959537077e-2 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    ${SPACE*16}\= 1.181105851828e+1 ± 4.163919074153e-2 (px)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    P.A.${SPACE*12}\= 7.451251867009e-6 ± 0.000000000000e+0 (deg)    
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
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 0:00:00.7674541034 ± 0.020886 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 30:00:02.9902688779 ± 0.024512 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 6.862851 ± 0.026402 (Jy/pixel)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 6.042711 ± 0.028096 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 5.084747 ± 0.021816 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= -0.034082 ± 0.000000 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #2:
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 0:00:00.3843194346 ± 0.016821 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 30:00:06.0294111758 ± 0.021364 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 9.895733 ± 0.035980 (Jy/pixel)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 7.041275 ± 0.034280 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 2.962661 ± 0.013796 (arcsec)
    Run Keyword And Warn On Failure    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 34.365148 ± 0.165045 (deg)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 109.8614639969 (deg) ± 0.021299 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= -31.5622660294 (deg) ± 0.024076 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 6.904454 ± 0.020506 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 5.977581 ± 0.025409 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 5.166714 ± 0.016476 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= -0.029152 ± 0.000000 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #2:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 109.8601160759 (deg) ± 0.019739 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= -31.5611281038 (deg) ± 0.018820 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 9.698995 ± 0.054426 (Jy/pixel)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 7.057775 ± 0.040988 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 2.969172 ± 0.012477 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 47.074927 ± 0.131470 (deg)
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
    Element Should Contain    //*[@id="root"]/div/div[17]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    1.95008e+1
    Run Keyword And Warn On Failure   Element Should Contain    //*[@id="root"]/div/div[17]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[10]/div    1.20803e+1
    Run Keyword And Warn On Failure   Element Should Contain    //*[@id="root"]/div/div[17]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[18]/div    7.27992
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
    Load Initial Image    cluster_00512.fits
    Click Element    ${IMAGE_FITTING_DIALOG_BUTTON}
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_X}    256
    Input Text    ${IMAGE_FITTING_DIALOG_CENTER_Y}    256
    Input Text    ${IMAGE_FITTING_DIALOG_AMPLITUDE}    1
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MAJOR}    100
    Input Text    ${IMAGE_FITTING_DIALOG_FWHM_MINOR}    100
    Input Text    ${IMAGE_FITTING_DIALOG_PA}    0
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Contains    Image fitting processing
    Sleep    0.05
    Click Element    xpath://*[contains(text(), "Cancel")]
    Element Should Be Enabled    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    # try to fit again and cancel again
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Contains    Image fitting processing
    Sleep    0.05
    Click Element    xpath://*[contains(text(), "Cancel")]
    Click Element    ${IMAGE_FITTING_DIALOG_CLOSE_BUTTON}
    # check entries in the image list widget
    Element Should Contain    ${IMAGE_LIST_FIRST_IMAGE_NAME}    cluster_00512.fits
    Page Should Not Contain Element    ${IMAGE_LIST_SECOND_IMAGE_NAME}
    # try to fit again and let it finish
    Click Element    ${IMAGE_FITTING_DIALOG_BUTTON}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Click Element    ${IMAGE_FITTING_DIALOG_CLOSE_BUTTON}
    # check the filenames of appended model and residule images
    Element Should Contain    ${IMAGE_LIST_FIRST_IMAGE_NAME}    cluster_00512.fits
    Element Should Contain    ${IMAGE_LIST_SECOND_IMAGE_NAME}    cluster_00512_model.fits
    Element Should Contain    ${IMAGE_LIST_THIRD_IMAGE_NAME}    cluster_00512_residual.fits
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 2.396862 ± 0.014742 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.732255 ± 0.005113 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.358689 ± 0.002603 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 43.048489 ± 0.316942 (deg)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3670885221 ± 0.005992 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.0102221811 ± 0.005899 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.000000 (Jy/beam) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.579325 ± 0.006861 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.620808 ± 0.009385 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 48.174964 ± 3.699548 (deg)
    Set Selenium Speed    0.2
    # with center free, amplitude free, FWHM locked, and PA free
    Click Element    ${IMAGE_FITTING_DIALOG_AMPLITUDE_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_X_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_Y_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Set Selenium Speed    0.02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3673569199 ± 0.001502 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.0059604765 ± 0.001253 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 3.094468 ± 0.007325 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.450000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.600000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 23.636303 ± 0.130002 (deg)
    Set Selenium Speed    0.2
    # with center free, amplitude free, FWHM free, and PA locked
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_X_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_Y_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_PA_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Set Selenium Speed    0.02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3672277270 ± 0.000457 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.0069885889 ± 0.000455 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 4.934469 ± 0.005678 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.355402 ± 0.000609 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.354823 ± 0.000602 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 45.000000 (deg) (fixed)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.916390 ± 0.011358 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.529050 ± 0.005983 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 38.897183 ± 0.641272 (deg)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.852282 ± 0.009645 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.450000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.600000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 32.597959 ± 0.947205 (deg)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 2.461352 ± 0.013435 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.740900 ± 0.004405 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.365451 ± 0.002360 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 45.000000 (deg) (fixed)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3670611641 ± 0.005546 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.0046977546 ± 0.005162 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.000000 (Jy/beam) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.450000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.600000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 42.885192 ± 1.042101 (deg)
    Set Selenium Speed    0.2
    # with center free, amplitude locked, FWHM free, and PA locked
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_X_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_Y_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_PA_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Set Selenium Speed    0.02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3672949860 ± 0.005665 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.0118272426 ± 0.005743 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.000000 (Jy/beam) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.633531 ± 0.007985 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.609080 ± 0.005982 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 45.000000 (deg) (fixed)
    Set Selenium Speed    0.2
    # with center free, amplitude free, FWHM locked, and PA locked
    Click Element    ${IMAGE_FITTING_DIALOG_AMPLITUDE_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_X_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FWHM_Y_LOCK}
    Click Element    ${IMAGE_FITTING_DIALOG_FIT_BUTTON}
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Set Selenium Speed    0.02
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #1:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3671816474 ± 0.001390 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.0087374674 ± 0.001373 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 3.039493 ± 0.006581 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.450000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.600000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 45.000000 (deg) (fixed)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 50.028899 ± 1.190555 (deg)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.802339 ± 0.011542 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.450000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.600000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 45.000000 (deg) (fixed)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.820491 ± 0.011958 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.495590 ± 0.008130 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 45.000000 (deg) (fixed)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3669180189 ± 0.006089 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.0048522493 ± 0.005551 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.000000 (Jy/beam) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.450000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.600000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 45.000000 (deg) (fixed)
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
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 1.280409 ± 0.020351 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.401706 ± 0.008626 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.921462 ± 0.018903 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 0.047935 ± 0.000000 (deg)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Component #2:
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center X${SPACE*8}\= 6:12:54.3135244883 ± 0.009761 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Center Y${SPACE*8}\= 17:59:14.7556688840 ± 0.007830 (arcsec)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    Amplitude${SPACE*7}\= 2.007585 ± 0.019870 (Jy/beam)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Major Axis \= 0.600000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    FWHM Minor Axis \= 0.750000 (arcsec) (fixed)
    Element Should Contain    ${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    P.A.${SPACE*12}\= 5.451816 ± 0.421898 (deg)
    [Teardown]    Kill carta_backend And Close Browser

