*** Settings ***
Documentation     Fit single or multiple 2D Gaussian functions to an image
Resource          ../resource.robot


*** Test Cases ***
Single Gaussian Fitting 512x512
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cluster_00512.fits
    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[5]/a
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[3]/div/div[1]/div/input    250
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[3]/div/div[2]/div/input    250
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[4]/div/div/div/input    20
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[5]/div/div[1]/div/input    100
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[5]/div/div[2]/div/input    100
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[6]/div/div/div/input    0
    Click Element    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[3]/div/span[2]/a
    Wait Until Page Does Not Contain    Image fitting processing    timeout=5
    Set Selenium Speed    0.02
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    Component #1:
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    Center X${SPACE*8}\= 0:00:00.0007240400 +/- 0.019728 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    Center Y${SPACE*8}\= 29:59:59.9847831594 +/- 0.019801 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    Amplitude${SPACE*7}\= 12.143825 +/- 0.003355 (JY/PIXEL)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    FWHM Major Axis \= 116.393294 +/- 0.044069 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    FWHM Minor Axis \= 116.402335 +/- 0.044107 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    P.A.${SPACE*12}\= -0.172330 +/- 0.000000 (deg)
    Click Element    //*[@id="bp3-tab-title_fittingResultTabs_1"]
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    Gaussian fitting with 1 component(s)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    summary from method 'trust-region/levenberg-marquardt':
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    number of iterations \= 56
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    function evaluations \= 413
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    Jacobian evaluations \= 0
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    reason for stopping  \= small step size
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    initial |f(x)|${SPACE*7}\= 2.687056945008e+03
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    final |f(x)|${SPACE*9}\= 8.304252776099e+02
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    initial cost${SPACE*9}\= 7.220275025714e+06
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    final cost${SPACE*11}\= 6.896061416934e+05
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    residual variance${SPACE*4}\= 2.630698874995e+00
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    final cond(J)${SPACE*8}\= inf
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    Component #1:
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    Center X${SPACE*8}\= 0:00:00.0007240400 +/- 1.972849694180e-2 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    ${SPACE*16}\= 2.559706076396e+2 +/- 6.165155294314e-2 (px)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    Center Y${SPACE*8}\= 29:59:59.9847831594 +/- 1.980091498920e-2 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    ${SPACE*16}\= 2.559524473748e+2 +/- 6.187785934126e-2 (px)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    Amplitude${SPACE*7}\= 1.214382462059e+1 +/- 3.355056201539e-3 (JY/PIXEL)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    FWHM Major Axis \= 1.163932941712e+2 +/- 4.406895486539e-2 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    ${SPACE*16}\= 3.637290442849e+2 +/- 1.377154839543e-1 (px)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    FWHM Minor Axis \= 1.164023353892e+2 +/- 4.410691344983e-2 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    ${SPACE*16}\= 3.637572980914e+2 +/- 1.378341045307e-1 (px)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    P.A.${SPACE*12}\= -1.723297201095e-1 +/- 0.000000000000e+0 (deg)
    [Teardown]    Kill carta_backend And Close Browser

Single Gaussian Fitting Smart Angular Unit
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    small_gaussian.fits
    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[5]/a
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[3]/div/div[1]/div/input    11.42
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[3]/div/div[2]/div/input    12.46
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[4]/div/div/div/input    0.5
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[5]/div/div[1]/div/input    4
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[5]/div/div[2]/div/input    5
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[6]/div/div/div/input    0
    Click Element    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[3]/div/span[2]/a
    Wait Until Page Does Not Contain    Image fitting processing    timeout=5
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    FWHM Major Axis \= 9.999994 +/- 0.000000 (arcmin)
    [Teardown]    Kill carta_backend And Close Browser


Triple Gaussian Fitting
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    Gaussian_triple.fits
    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[5]/a
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[3]/div/div[1]/div/input    128
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[3]/div/div[2]/div/input    129
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[4]/div/div/div/input    0.01
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[5]/div/div[1]/div/input    10
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[5]/div/div[2]/div/input    6
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[6]/div/div/div/input    36
    Click Element    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[2]/div/div/div[2]/button[1]
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[3]/div/div[1]/div/input    135
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[3]/div/div[2]/div/input    135
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[4]/div/div/div/input    0.01
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[5]/div/div[1]/div/input    4
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[5]/div/div[2]/div/input    9
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[6]/div/div/div/input    40
    Click Element    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[2]/div/div/div[2]/button[1]
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[3]/div/div[1]/div/input    139
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[3]/div/div[2]/div/input    120
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[4]/div/div/div/input    0.01
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[5]/div/div[1]/div/input    9
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[5]/div/div[2]/div/input    9
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[6]/div/div/div/input    0    
    Click Element    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[3]/div/span[2]/a
    Wait Until Page Does Not Contain    Image fitting processing    timeout=10
    Set Selenium Speed    0.02
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    Component #1:
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    Center X${SPACE*8}\= 10:00:00.0422417276 +/- 0.013259 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    Center Y${SPACE*8}\= 0:00:00.3725472501 +/- 0.017936 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    Amplitude${SPACE*7}\= 0.009267 +/- 0.000012 (Jy/pixel)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    FWHM Major Axis \= 9.431037 +/- 0.017812 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    FWHM Minor Axis \= 6.410023 +/- 0.011112 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    P.A.${SPACE*12}\= 12.198392 +/- 0.095674 (deg)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    Component #2:
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    Center X${SPACE*8}\= 9:59:59.7150562797 +/- 0.016799 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    Center Y${SPACE*8}\= 0:00:03.7838692613 +/- 0.014199 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    Amplitude${SPACE*7}\= 0.009161 +/- 0.000034 (Jy/pixel)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    FWHM Major Axis \= 3.261677 +/- 0.013109 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    FWHM Minor Axis \= 5.540083 +/- 0.022674 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    P.A.${SPACE*12}\= 35.110880 +/- 0.239142 (deg)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    Component #3:
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    Center X${SPACE*8}\= 9:59:59.6428400999 +/- 0.018173 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    Center Y${SPACE*8}\= -0:00:03.8037922663 +/- 0.015875 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    Amplitude${SPACE*7}\= 0.008150 +/- 0.000022 (Jy/pixel)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    FWHM Major Axis \= 5.620326 +/- 0.017341 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    FWHM Minor Axis \= 5.905529 +/- 0.020820 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div    P.A.${SPACE*12}\= 0.000007 +/- 0.000000 (deg)
    Click Element    //*[@id="bp3-tab-title_fittingResultTabs_1"]
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    Gaussian fitting with 3 component(s)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    summary from method 'trust-region/levenberg-marquardt':
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    number of iterations \= 84
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    function evaluations \= 1632
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    Jacobian evaluations \= 0
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    reason for stopping  \= small step size
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    initial |f(x)|${SPACE*7}\= 1.206974636655e-01
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    final |f(x)|${SPACE*9}\= 8.150186854667e-02
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    initial cost${SPACE*9}\= 1.456787773528e-02
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    final cost${SPACE*11}\= 6.642554576599e-03
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    residual variance${SPACE*4}\= 1.013851853933e-07
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    final cond(J)${SPACE*8}\= inf
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    Component #1:
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    Center X${SPACE*8}\= 10:00:00.0422417276 +/- 1.325941463697e-2 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    ${SPACE*16}\= 1.267327481724e+2 +/- 2.651882927394e-2 (px)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    Center Y${SPACE*8}\= 0:00:00.3725472501 +/- 1.793574708574e-2 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    ${SPACE*16}\= 1.287450945003e+2 +/- 3.587149417147e-2 (px)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    Amplitude${SPACE*7}\= 9.266824141717e-3 +/- 1.234335606817e-5 (Jy/pixel)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    FWHM Major Axis \= 9.431037235337e+0 +/- 1.781215060996e-2 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    ${SPACE*16}\= 1.886207447067e+1 +/- 3.562430121991e-2 (px)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    FWHM Minor Axis \= 6.410023126954e+0 +/- 1.111166667314e-2 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    ${SPACE*16}\= 1.282004625391e+1 +/- 2.222333334627e-2 (px)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    P.A.${SPACE*12}\= 1.219839181423e+1 +/- 9.567368095894e-2 (deg)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    Component #2:
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    Center X${SPACE*8}\= 9:59:59.7150562797 +/- 1.679919133698e-2 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    ${SPACE*16}\= 1.365483116080e+2 +/- 3.359838267396e-2 (px)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    Center Y${SPACE*8}\= 0:00:03.7838692613 +/- 1.419875473801e-2 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    ${SPACE*16}\= 1.355677385221e+2 +/- 2.839750947601e-2 (px)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    Amplitude${SPACE*7}\= 9.161402546771e-3 +/- 3.381572740697e-5 (Jy/pixel)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    FWHM Major Axis \= 3.261677242273e+0 +/- 1.310929209333e-2 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    ${SPACE*16}\= 6.523354484547e+0 +/- 2.621858418665e-2 (px)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    FWHM Minor Axis \= 5.540082503545e+0 +/- 2.267408644303e-2 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    ${SPACE*16}\= 1.108016500709e+1 +/- 4.534817288607e-2 (px)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    P.A.${SPACE*12}\= 3.511087991605e+1 +/- 2.391421892522e-1 (deg)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    Component #3:
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    Center X${SPACE*8}\= 9:59:59.6428400999 +/- 1.817258511957e-2 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    ${SPACE*16}\= 1.387147970013e+2 +/- 3.634517023915e-2 (px)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    Center Y${SPACE*8}\= -0:00:03.8037922663 +/- 1.587507734839e-2 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    ${SPACE*16}\= 1.203924154677e+2 +/- 3.175015469677e-2 (px)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    Amplitude${SPACE*7}\= 8.149917126930e-3 +/- 2.209396057760e-5 (Jy/pixel)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    FWHM Major Axis \= 5.620326429237e+0 +/- 1.734128786904e-2 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    ${SPACE*16}\= 1.124065285847e+1 +/- 3.468257573808e-2 (px)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    FWHM Minor Axis \= 5.905529259142e+0 +/- 2.081959537077e-2 (arcsec)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    ${SPACE*16}\= 1.181105851828e+1 +/- 4.163919074153e-2 (px)
    Element Should Contain    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div    P.A.${SPACE*12}\= 7.451251867009e-6 +/- 0.000000000000e+0 (deg)    
    [Teardown]    Kill carta_backend And Close Browser