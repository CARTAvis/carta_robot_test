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
    Wait Until Page Does Not Contain    Image fitting processing    timeout=300
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

Single Gaussian Fitting 1024x1024
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cluster_01024.fits
    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[5]/a
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[3]/div/div[1]/div/input    500
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[3]/div/div[2]/div/input    500
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[4]/div/div/div/input    20
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[5]/div/div[1]/div/input    200
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[5]/div/div[2]/div/input    200
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[6]/div/div/div/input    0
    Click Element    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[3]/div/span[2]/a
    Wait Until Page Does Not Contain    Image fitting processing    timeout=300
    [Teardown]    Kill carta_backend And Close Browser


Single Gaussian Fitting 2048x2048
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cluster_02048.fits
    Click Element    //*[@id="root"]/div/div[1]/div[3]/span[5]/a
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[3]/div/div[1]/div/input    1000
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[3]/div/div[2]/div/input    1000
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[4]/div/div/div/input    20
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[5]/div/div[1]/div/input    400
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[5]/div/div[2]/div/input    400
    Input Text    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[2]/div[6]/div/div/div/input    0
    Click Element    //*[@id="root"]/div/div[14]/div[1]/div/div[2]/div/div[3]/div/span[2]/a
    Wait Until Page Does Not Contain    Image fitting processing    timeout=300
    [Teardown]    Kill carta_backend And Close Browser
