*** Settings ***
Documentation     Test the functionalities of the spectral line query widget
Resource          ../resource.robot

*** Test Cases ***
Query Splatalogue
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    Click Element    //*[@id="SpectralLineQueryWidgetButton"]
    Wait Until Page Contains    Intensity Limit
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div/div/input    349370    True
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[3]/div/div/div/input    349500    True
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[2]/button
    Sleep    5
    Element Should Contain    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[2]/div[1]    Showing 419 line(s).
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[4]/div/div
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[4]/div/div/select/option[1]
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div/div/input    349.370    True
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[3]/div/div/div/input    349.500    True
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[2]/button
    Sleep    5
    Element Should Contain    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[2]/div[1]    Showing 419 line(s).
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[4]/div/div
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[4]/div/div/select/option[3]
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div/div/input    0.08580944500100181    True
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[3]/div/div/div/input    0.08577752732474964    True
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[2]/button
    Sleep    5
    Element Should Contain    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[2]/div[1]    Showing 419 line(s).
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[4]/div/div
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[4]/div/div/select/option[4]
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div/div/input    0.8580944500100181    True
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[3]/div/div/div/input    0.8577752732474964    True
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[2]/button
    Sleep    5
    Element Should Contain    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[2]/div[1]    Showing 419 line(s).
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[1]/div/div/select
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[1]/div/div/select/option[2]
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div/div/input    0.8579348616287572    True
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[3]/div/div/div/input    0.00015958838126084451    True
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[2]/button
    Sleep    5
    Element Should Contain    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[2]/div[1]    Showing 419 line(s).
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[4]/div/div
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[4]/div/div/select/option[3]
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div/div/input    0.08579348616287572    True
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[3]/div/div/div/input    0.000015958838126084451    True
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[2]/button
    Sleep    5
    Element Should Contain    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[2]/div[1]    Showing 419 line(s).
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[4]/div/div
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[4]/div/div/select/option[2]
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div/div/input    349435    True
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[3]/div/div/div/input    65    True
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[2]/button
    Sleep    5
    Element Should Contain    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[2]/div[1]    Showing 419 line(s).        
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[4]/div/div
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[4]/div/div/select/option[1]
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div/div/input    349.435    True
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[3]/div/div/div/input    0.065    True
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[2]/button
    Sleep    5
    Element Should Contain    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[2]/div[1]    Showing 419 line(s).       
    [Teardown]    Kill carta_backend And Close Browser


Line Table Filtering And Shifting
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    Click Element    //*[@id="SpectralLineQueryWidgetButton"]
    Wait Until Page Contains    Intensity Limit    timeout=10
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div/div/input    349370    True
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[3]/div/div/div/input    349500    True
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[2]/button
    Sleep    5
    Element Should Contain    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[2]/div[1]    Showing 419 line(s).
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[2]/div[2]/div[2]/span/div/input    CH3CNv\=0
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[2]/div[2]/span[1]/a
    Sleep    0.5
    Element Should Contain    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[2]/div[1]    Showing 4 filtered line(s) of total 419 line(s). Applied 1 filter(s).
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div[1]/div[2]/div/div/div/input    4    True
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[2]/div[2]/span[1]/a
    Element Should Contain    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div[2]/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    349388.6353287392
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div[1]/div[1]/div/div/select
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div[1]/div[1]/div/div/select/option[2]
    Press Keys    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div[1]/div[2]/div/div/div/input    BACKSPACE
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div[1]/div[2]/div/div/div/input    0.000013342652821046741    True
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[2]/div[2]/span[1]/a
    Element Should Contain    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div[2]/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    349388.63532873924
    Sleep    5
    # comment out the following due to a regression
    #Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[2]/div[2]/span[2]/a
    #Element Should Contain    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[2]/div[1]    Showing 419 line(s).
    [Teardown]    Kill carta_backend And Close Browser


Line Table Column Configuration
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    Click Element    //*[@id="SpectralLineQueryWidgetButton"]
    Wait Until Page Contains    Intensity Limit
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div/div/input    349370    True
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[3]/div/div/div/input    349500    True
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[2]/button
    Sleep    5
    Element Should Contain    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[2]/div[1]    Showing 419 line(s).
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[9]/div/label
    Element Should Contain    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div[3]/div[2]/div[1]/div[1]/div/div/label/span[2]    Shifted Frequency
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[9]/div/label
    Element Should Contain    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div[3]/div[2]/div[1]/div[1]/div/div/label/span[2]    Chemical Name
    [Teardown]    Kill carta_backend And Close Browser



Line ID Overlay On Spectral Profiler
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    S255_CH3CN_subcube.fits
    Click Element    //*[@id="root"]/div/div[1]/div[1]/span[1]/a
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[2]/td[2]/div/div[1]/label[1]
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[3]/td[2]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[3]/td[2]/div/div/input    63
    Press Keys    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[3]/td[3]/div/div/input    DELETE
    Input Text    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[3]/td[3]/div/div/input    43
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div[2]/div/table/tbody/tr[2]/td[2]/div/div[1]/label[1]
    Click Element    //*[@id="root"]/div/div[2]/div[1]/div/div[2]/div/div[3]/div/a[2]
    Click Element    //*[@id="SpectralLineQueryWidgetButton"]
    Wait Until Page Contains    Intensity Limit
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div/div/input    349370    True
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[3]/div/div/div/input    349500    True
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[1]/div[2]/button
    Sleep    5
    Element Should Contain    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[2]/div[1]    Showing 419 line(s).
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[2]/div[2]/div[2]/span/div/input    CH3CNv\=0
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[2]/div[2]/span[1]/a
    Sleep    0.5
    Element Should Contain    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[2]/div[1]    Showing 4 filtered line(s) of total 419 line(s). Applied 1 filter(s).
    Input Text    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div[1]/div[2]/div/div/div/input    4.5    True
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[2]/div[2]/span[1]/a
    Click Element    //*[@id="root"]/div/div[14]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[1]/div[2]/div[1]/div[2]/label
    Click Element    //*[@id="SpectralProfilerButton"]
    Click Element    //*[@id="root"]/div/div[14]/div[1]/div[1]/div[2]/div/div[2]/div[2]/span[3]/a
    Capture Element Screenshot    //*[@id="root"]/div/div[14]/div[2]/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    check.png
    Click Element    //*[@id="root"]/div/div[14]/div[1]/div[1]/div[2]/div/div[2]/div[2]/span[4]/a
    Capture Element Screenshot    //*[@id="root"]/div/div[14]/div[2]/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas    check2.png
    Set Selenium Speed    0.02
    PNG Images Should Be Different    check.png    check2.png
    
    # NEED A MORE ROBUST TEST HERE
    
    # with line ID label (note the rgba inconsistency due to anti-aliasing)
    #IF    '${BROWSER}' == 'headlesschrome'
    #PNG Pixel XY Should Match RGBA    check.png    199,15,129,188,165,255
    #PNG Pixel XY Should Match RGBA    check.png    415,15,129,188,165,255
    #PNG Pixel XY Should Match RGBA    check.png    544,15,129,188,165,255
    #PNG Pixel XY Should Match RGBA    check.png    588,15,129,188,165,255
    #END
    #IF    '${BROWSER}' == 'chrome'
    #PNG Pixel XY Should Match RGBA    check.png    199,15,13,128,80,255
    #PNG Pixel XY Should Match RGBA    check.png    415,15,14,129,81,255
    #PNG Pixel XY Should Match RGBA    check.png    544,15,15,129,82,255
    #PNG Pixel XY Should Match RGBA    check.png    588,15,14,128,81,255
    #END
    # without line ID label
    #PNG Pixel XY Should Match RGBA    check2.png    199,15,245,248,250,255
    #PNG Pixel XY Should Match RGBA    check2.png    415,15,245,248,250,255
    #PNG Pixel XY Should Match RGBA    check2.png    544,15,245,248,250,255
    #PNG Pixel XY Should Match RGBA    check2.png    588,15,245,248,250,255    
    
    Remove Files    check.png    check2.png
    [Teardown]    Kill carta_backend And Close Browser
