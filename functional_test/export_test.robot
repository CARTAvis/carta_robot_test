*** Settings ***
Documentation     Check the export functionality in CARTA
Resource          ../resource.robot

Library    DateTime


*** Test Cases ***
Export as TSV or TXT
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   M17_SWex.fits
    # create an ellipse region
    Click Element    data:testid:ellipse-region-shortcut-button
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    # switch to image Cooridnate and set a new center position and size for the region
    Click Element    //*[contains(text(), "Image")]
    Press Keys    //input[@placeholder="X Coordinate"]    DELETE
    Input Text    //input[@placeholder="X Coordinate"]    320
    Press Keys    //input[@placeholder="Y Coordinate"]    DELETE
    Input Text    //input[@placeholder="Y Coordinate"]    400
    Press Keys    //input[@placeholder="Semi-major"]    DELETE
    Input Text    //input[@placeholder="Semi-major"]    100
    Press Keys    //input[@placeholder="Semi-minor"]    DELETE
    Input Text    //input[@placeholder="Semi-minor"]    50
    Press Keys    //input[@placeholder="P.A."]    DELETE
    Input Text    //input[@placeholder="P.A."]    30
    # click the image Cooridnate radio button again to apply changes
    Click Element    //*[contains(text(), "Image")]
    # close the region config dialog
    Click Element    data:testid:region-dialog-header-close-button

    # get today's year, month, and day
    ${year}=     Get Current Date    result_format=%Y
    ${month}=    Get Current Date    result_format=%m
    ${day}=      Get Current Date    result_format=%d
    # remove matched tsv/txt files in the download folder
    Remove Files    ${DOWNLOAD_FOLDER}/*-${year}-${month}-${day}-*.tsv
    Remove Files    ${DOWNLOAD_FOLDER}/*-${year}-${month}-${day}-*.txt

    # spectral profiler
    Click Element    id:SpectralProfilerButton
    Click Element    data:testid:spectral-profiler-0-plot
    Mouse Over    data:testid:spectral-profiler-0-plot
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[2]/div[1]/div/div[2]/span[2]/a
    Sleep    1
    Click Element    data:testid:spectral-profiler-0-header-close-button
    # verify the exported file exists in the download folder named as M17_SWex.fits-Z-profile-Region_1-Statistic_Mean-Coordinate_Current-2026-09-23-XX-XX-XX.tsv
    Set Selenium Speed    0
    ${wildcard_filename}=    Set Variable    M17_SWex.fits-Z-profile-Region_1-Statistic_Mean-Coordinate_Current-${year}-${month}-${day}-*-*-*.tsv
    ${pattern}=    Set Variable    ${DOWNLOAD_FOLDER}/${wildcard_filename}
    File Should Exist    ${pattern}
    @{files}=    List Files In Directory    ${DOWNLOAD_FOLDER}    pattern=${wildcard_filename}
    ${filepath}=    Join Path    ${DOWNLOAD_FOLDER}    ${files}[0]
    ${content}=     Get File    ${filepath}
    @{lines}=       Split To Lines    ${content}
    Should Be Equal    ${lines}[0]    \# Z-profile-Region_1-Statistic_Mean-Coordinate_Current M17_SWex.fits
    Should Be Equal    ${lines}[1]    \# xLabel: [LSRK] Frequency (GHz)
    Should Be Equal    ${lines}[2]    \# yLabel: Value (Jy/beam)
    Should Be Equal    ${lines}[3]    \# ellipse[[320.000000pix, 400.000000pix], [100.000000pix, 50.000000pix], 30.000000deg]\t
    Should Be Equal    ${lines}[4]    \# ellipse(wcs:ICRS)[[18:20:21.0000000240, -16:12:10.0000000440], [40.0000000000", 20.0000000000"], 30.000000deg]\t
    Should Be Equal    ${lines}[5]    \# x\ty
    Should Be Equal    ${lines}[6]    86.7513961884\t5.0612240229e-5
    Should Be Equal    ${lines}[-1]    86.74553448357261\t3.0659304364e-5
    Remove Files    ${filepath}
    Set Selenium Speed    ${DELAY}


    # profile smoothing
    Click Element    id:SpectralProfilerButton
    Click Element    data:testid:smoothing-button
    Click Element    data:testid:smoothing-settings-method-dropdown
    Click Element    //*[contains(text(), "Binning")]
    Click Element    data:testid:spectral-profiler-0-floating-settings-0-header-close-button
    Mouse Over    data:testid:spectral-profiler-0-plot
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[2]/div[1]/div/div[2]/span[2]/a
    Sleep    1
    ## disable smoothing to reset the profile
    Click Element    data:testid:smoothing-button
    Click Element    data:testid:smoothing-settings-method-dropdown
    Click Element    //*[contains(text(), "None")]
    Click Element    data:testid:spectral-profiler-0-floating-settings-0-header-close-button    
    Click Element    data:testid:spectral-profiler-0-header-close-button
    # verify the exported file exists in the download folder named as M17_SWex.fits-Z-profile-Region_1-Statistic_Mean-Coordinate_Current-smoothed-2026-09-23-15-46-33.tsv
    Set Selenium Speed    0
    ${wildcard_filename}=    Set Variable    M17_SWex.fits-Z-profile-Region_1-Statistic_Mean-Coordinate_Current*-${year}-${month}-${day}-*-*-*.tsv
    ${pattern}=    Set Variable    ${DOWNLOAD_FOLDER}/${wildcard_filename}
    File Should Exist    ${pattern}
    @{files}=    List Files In Directory    ${DOWNLOAD_FOLDER}    pattern=${wildcard_filename}
    ${filepath_0}=    Join Path    ${DOWNLOAD_FOLDER}    ${files}[0]
    ${filepath_1}=    Join Path    ${DOWNLOAD_FOLDER}    ${files}[1]
    ${content}=     Get File    ${filepath_1}
    @{lines}=       Split To Lines    ${content}
    Should Be Equal    ${lines}[0]    \# Z-profile-Region_1-Statistic_Mean-Coordinate_Current-smoothed M17_SWex.fits
    Should Be Equal    ${lines}[1]    \# xLabel: [LSRK] Frequency (GHz)
    Should Be Equal    ${lines}[2]    \# yLabel: Value (Jy/beam)
    Should Be Equal    ${lines}[3]    \# ellipse[[320.000000pix, 400.000000pix], [100.000000pix, 50.000000pix], 30.000000deg]\t
    Should Be Equal    ${lines}[4]    \# ellipse(wcs:ICRS)[[18:20:21.0000000240, -16:12:10.0000000440], [40.0000000000", 20.0000000000"], 30.000000deg]\t
    Should Be Equal    ${lines}[5]    \# smooth: Binning\t
    Should Be Equal    ${lines}[6]    \# bin width: 2\t
    Should Be Equal    ${lines}[7]    \# x\ty
    Should Be Equal    ${lines}[8]    86.75127406954942\t4.1163871207e-6
    Should Be Equal    ${lines}[-1]    86.74553448357261\t3.0659304364e-5
    Remove Files    ${filepath_0}
    Remove Files    ${filepath_1}
    Set Selenium Speed    ${DELAY}


    # profile fitting using raw profile without smoothing
    Click Element    id:SpectralProfilerButton
    Click Element    data:testid:profile-fitting-button
    Click Element    data:testid:profile-fitting-auto-detect-button
    Drag And Drop By Offset    data:testid:spectral-profiler-0-floating-settings-0-header-title    0    -100
    Click Element    data:testid:profile-fitting-fit-button
    Mouse Over    data:testid:profile-fitting-result
    Click Element    css:.bp6-button.fitting-result-hover-button
    Sleep    1
    # verify the exported file exists in the download folder named as Profile_Fitting_Result_Log-2026-09-23-20-59-08.txt
    Set Selenium Speed    0
    ${wildcard_filename}=    Set Variable    Profile_Fitting_Result_Log-${year}-${month}-${day}-*-*-*.txt
    ${pattern}=    Set Variable    ${DOWNLOAD_FOLDER}/${wildcard_filename}
    File Should Exist    ${pattern}
    @{files}=    List Files In Directory    ${DOWNLOAD_FOLDER}    pattern=${wildcard_filename}
    ${filepath}=    Join Path    ${DOWNLOAD_FOLDER}    ${files}[0]
    ${content}=     Get File    ${filepath}
    @{lines}=       Split To Lines    ${content}
    Should Be Equal    ${lines}[0]    \# image: M17_SWex.fits
    # bug below
    #Should Be Equal    ${lines}[1]    \# statistic: mean
    Should Be Equal    ${lines}[2]    \# ellipse[[320.000000pix, 400.000000pix], [100.000000pix, 50.000000pix], 30.000000deg]
    Should Be Equal    ${lines}[3]    \# ellipse(wcs:ICRS)[[18:20:21.0000000240, -16:12:10.0000000440], [40.0000000000", 20.0000000000"], 30.000000deg]
    Should Be Equal    ${lines}[5]    ${SPACE * 1}Gaussian function fitting with 1 component(s)
    Should Be Equal    ${lines}[-1]    ${SPACE * 1}integral of function ~= 2.805274949399e-06 (Jy/beam * GHz) ± 4.319527945379e-07 (15.4%)
    Remove Files    ${filepath}
    Set Selenium Speed    ${DELAY}
    Click Element    data:testid:spectral-profiler-0-floating-settings-0-header-close-button
    # export spectral profile as tsv including fitting profile
    Mouse Over    data:testid:spectral-profiler-0-plot
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[2]/div[1]/div/div[2]/span[2]/a
    Sleep    1
    Click Element    data:testid:spectral-profiler-0-header-close-button
    # verify the exported file exists in the download folder named as M17_SWex.fits-Z-profile-Region_1-Statistic_Mean-Coordinate_Current-2026-09-23-21-16-51
    Set Selenium Speed    0
    ${wildcard_filename}=    Set Variable    M17_SWex.fits-Z-profile-Region_1-Statistic_Mean-Coordinate_Current-${year}-${month}-${day}-*-*-*.tsv
    ${pattern}=    Set Variable    ${DOWNLOAD_FOLDER}/${wildcard_filename}
    File Should Exist    ${pattern}
    @{files}=    List Files In Directory    ${DOWNLOAD_FOLDER}    pattern=${wildcard_filename}
    ${filepath}=    Join Path    ${DOWNLOAD_FOLDER}    ${files}[0]
    ${content}=     Get File    ${filepath}
    @{lines}=       Split To Lines    ${content}
    Should Be Equal    ${lines}[0]    \# Z-profile-Region_1-Statistic_Mean-Coordinate_Current M17_SWex.fits
    Should Be Equal    ${lines}[1]    \# xLabel: [LSRK] Frequency (GHz)
    Should Be Equal    ${lines}[2]    \# yLabel: Value (Jy/beam)
    Should Be Equal    ${lines}[3]    \# ellipse[[320.000000pix, 400.000000pix], [100.000000pix, 50.000000pix], 30.000000deg]\t
    Should Be Equal    ${lines}[4]    \# ellipse(wcs:ICRS)[[18:20:21.0000000240, -16:12:10.0000000440], [40.0000000000", 20.0000000000"], 30.000000deg]\t
    Should Be Equal    ${lines}[5]    \# x\ty\tfittingModel\tfittingResidual
    Should Be Equal    ${lines}[6]    86.7513961884\t5.0612240229e-5\t1.512110e-22\t5.061224e-5
    Should Be Equal    ${lines}[-1]    86.74553448357261\t3.0659304364e-5\t8.030038e-54\t3.065930e-5
    Remove Files    ${filepath}
    Set Selenium Speed    ${DELAY}   


    # statistics widget
    Click Element    id:StatisticsWidgetButton
    Wait Until Page Contains Element    data:testid:statistics-table
    Mouse Over    data:testid:statistics-table
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div[2]/div/div/span/a
    Sleep    1
    Click Element    data:testid:stats-0-header-close-button
    # verify the exported file exists in the download folder named as M17_SWex.fits-statistics-2026-09-23-XX-XX-XX.tsv
    Set Selenium Speed    0
    ${wildcard_filename}=    Set Variable    M17_SWex.fits-statistics-${year}-${month}-${day}-*-*-*.tsv
    ${pattern}=    Set Variable    ${DOWNLOAD_FOLDER}/${wildcard_filename}
    File Should Exist    ${pattern}
    @{files}=    List Files In Directory    ${DOWNLOAD_FOLDER}    pattern=${wildcard_filename}
    ${filepath}=    Join Path    ${DOWNLOAD_FOLDER}    ${files}[0]
    ${content}=     Get File    ${filepath}
    @{lines}=       Split To Lines    ${content}
    Should Be Equal    ${lines}[0]    \# M17_SWex.fits statistics
    Should Be Equal    ${lines}[1]    \# channel: 13
    Should Be Equal    ${lines}[2]    \# ellipse[[320.000000pix, 400.000000pix], [100.000000pix, 50.000000pix], 30.000000deg]
    Should Be Equal    ${lines}[3]    \# ellipse(wcs:ICRS)[[18:20:21.0000000240, -16:12:10.0000000440], [40.0000000000", 20.0000000000"], 30.000000deg]
    Should Be Equal    ${lines}[4]    \# Statistic\tValue\tUnit
    Should Be Equal    ${lines}[5]    NumPixels${SPACE * 3}\t1.571700000000e+4\tpixel(s)
    Should Be Equal    ${lines}[-1]    SumSq${SPACE * 7}\t8.832408713057e+0\t(Jy/beam)^2
    Remove Files    ${filepath}
    Set Selenium Speed    ${DELAY}


    # histogram widget
    Click Element    id:HistogramWidgetButton
    Wait Until Page Contains Element    data:testid:histogram-0-plot
    Mouse Over    data:testid:histogram-0-plot
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[2]/div/div[2]/span[2]/a
    Sleep    1
    Click Element    data:testid:histogram-0-header-close-button
    # verify the exported file exists in the download folder named as M17_SWex.fits-channel-13-histogram-2026-09-23-XX-XX-XX.tsv
    Set Selenium Speed    0
    ${wildcard_filename}=    Set Variable    M17_SWex.fits-channel-13-histogram-${year}-${month}-${day}-*-*-*.tsv
    ${pattern}=    Set Variable    ${DOWNLOAD_FOLDER}/${wildcard_filename}
    File Should Exist    ${pattern}
    @{files}=    List Files In Directory    ${DOWNLOAD_FOLDER}    pattern=${wildcard_filename}
    ${filepath}=    Join Path    ${DOWNLOAD_FOLDER}    ${files}[0]
    ${content}=     Get File    ${filepath}
    @{lines}=       Split To Lines    ${content}
    Should Be Equal    ${lines}[0]    \# M17_SWex.fits channel 13 histogram
    Should Be Equal    ${lines}[1]    \# xLabel: Value (Jy/beam)
    Should Be Equal    ${lines}[2]    \# yLabel: Count
    Should Be Equal    ${lines}[3]    \# ellipse[[320.000000pix, 400.000000pix], [100.000000pix, 50.000000pix], 30.000000deg]
    # missing wcs region info due to a bug
    Should Be Equal    ${lines}[4]    \# x\ty
    Should Be Equal    ${lines}[5]    -0.053129252046346664\t3.0000000000e+0
    Should Be Equal    ${lines}[-1]    0.18891862127929926\t1.0000000000e+0
    Remove Files    ${filepath}
    Set Selenium Speed    ${DELAY}


    # spatial profiler
    Click Element    data:testid:point-region-shortcut-button
    Click Element    ${VIEWER_DIV}
    Mouse Over    data:testid:spatial-profiler-0-plot
    Click Element    //*[@id="root"]/div/div[16]/div/div[7]/div/div/div/div[2]/div/div[2]/span[2]/a
    Sleep    1
    # verify the exported file exists in the download folder named as M17_SWex.fits-X-profile-2026-09-23-21-22-38.tsv
    Set Selenium Speed    0
    ${wildcard_filename}=    Set Variable    M17_SWex.fits-X-profile-${year}-${month}-${day}-*-*-*.tsv
    ${pattern}=    Set Variable    ${DOWNLOAD_FOLDER}/${wildcard_filename}
    File Should Exist    ${pattern}
    @{files}=    List Files In Directory    ${DOWNLOAD_FOLDER}    pattern=${wildcard_filename}
    ${filepath}=    Join Path    ${DOWNLOAD_FOLDER}    ${files}[0]
    ${content}=     Get File    ${filepath}
    @{lines}=       Split To Lines    ${content}
    Should Be Equal    ${lines}[0]    \# M17_SWex.fits X profile
    Should Be Equal    ${lines}[1]    \# xLabel: X coordinate
    Should Be Equal    ${lines}[2]    \# yLabel: Value (Jy/beam)
    Should Be Equal    ${lines}[3]    \# Point (pixel) [316.663121pix, 366.403073pix]
    Should Be Equal    ${lines}[4]    \# Point (wcs:ICRS) [18:20:21.0926658316, -16:12:23.4387694842]
    Should Be Equal    ${lines}[5]    \# x\ty
    Should Be Equal    ${lines}[6]    0\tNaN
    Should Be Equal    ${lines}[300]    294\t-1.3911651447e-2
    Remove Files    ${filepath}
    Set Selenium Speed    ${DELAY}    


    # image fitting
    Load Image    dice_one.fits
    Click Element    data:testid:fitting-dialog-button
    Click Element    data:testid:image-fitting-fit-button
    Wait Until Element Contains    data:testid:image-fitting-result-tab    Component
    Mouse Over    data:testid:image-fitting-result-tab
    Click Element    //*[@id="bp6-tab-panel_fittingResultTabs_0"]/pre/div[2]/span[2]/a
    Sleep    1
    # verify the exported file exists in the download folder named as dice_one.fits-2026-09-23-21-35-34-2D_Fitting_Result.txt
    Set Selenium Speed    0
    ${wildcard_filename}=    Set Variable    dice_one.fits-${year}-${month}-${day}-*-*-*-2D_Fitting_Result.txt
    ${pattern}=    Set Variable    ${DOWNLOAD_FOLDER}/${wildcard_filename}
    File Should Exist    ${pattern}
    @{files}=    List Files In Directory    ${DOWNLOAD_FOLDER}    pattern=${wildcard_filename}
    ${filepath}=    Join Path    ${DOWNLOAD_FOLDER}    ${files}[0]
    ${content}=     Get File    ${filepath}
    @{lines}=       Split To Lines    ${content}
    Should Be Equal    ${lines}[0]    Component #1:
    Should Be Equal    ${lines}[1]    Center X${SPACE * 8}= 6:12:54.3672095855 ± 0.000183 (s)
    Should Be Equal    ${lines}[-1]    Background${SPACE * 6}= 0.000000 (Jy/beam) (fixed)
    Remove Files    ${filepath}
    Set Selenium Speed    ${DELAY}        
    # check full log txt export
    Click Element    data:testid:image-fitting-full-log-tab-title
    Mouse Over    css:.log-text
    Click Element    //*[@id="bp6-tab-panel_fittingResultTabs_1"]/pre/div[2]/span[2]/a
    Sleep    1
    # verify the exported file exists in the download folder named as dice_one.fits-2026-09-23-21-41-18-2D_Fitting_Full_Log.txt
    Set Selenium Speed    0
    ${wildcard_filename}=    Set Variable    dice_one.fits-${year}-${month}-${day}-*-*-*-2D_Fitting_Full_Log.txt
    ${pattern}=    Set Variable    ${DOWNLOAD_FOLDER}/${wildcard_filename}
    File Should Exist    ${pattern}
    @{files}=    List Files In Directory    ${DOWNLOAD_FOLDER}    pattern=${wildcard_filename}
    ${filepath}=    Join Path    ${DOWNLOAD_FOLDER}    ${files}[0]
    ${content}=     Get File    ${filepath}
    @{lines}=       Split To Lines    ${content}
    Should Be Equal    ${lines}[0]    Image: dice_one.fits
    Should Be Equal    ${lines}[1]    Region: entire image
    Should Be Equal    ${lines}[3]    Generated initial values of 1 component(s)
    Should Be Equal    ${lines}[4]    Component #1:
    Should Be Equal    ${lines}[5]    Center X${SPACE * 8}= 50.018572 (px)
    Should Be Equal    ${lines}[-3]    Integrated flux = 3.807690751210e+1 ± 7.799928056717e-1 (Jy)
    Remove Files    ${filepath}
    Click Element    data:testid:fitting-dialog-header-close-button
    Set Selenium Speed    ${DELAY}            


    # stokes analysis widget
    Load Image    image_IQU.fits
    Click Element    data:testid:point-region-shortcut-button
    Click Element    ${VIEWER_DIV}
    Double Click Element    ${VIEWER_DIV}
    # switch to image Cooridnate and set a new center position and size for the region
    Click Element    //*[contains(text(), "Image")]
    Press Keys    //input[@placeholder="X Coordinate"]    DELETE
    Input Text    //input[@placeholder="X Coordinate"]    5
    Press Keys    //input[@placeholder="Y Coordinate"]    DELETE
    Input Text    //input[@placeholder="Y Coordinate"]    5
    # click the image Cooridnate radio button again to apply changes
    Click Element    //*[contains(text(), "Image")]
    # close the region config dialog
    Click Element    data:testid:region-dialog-header-close-button    
    Click Element    id:StokesAnalysisWidgetButton
    Drag And Drop By Offset    data:testid:stokes-0-header-title    0    -100
    # qu profile plot
    Mouse Over    css:.profile-plot-qu
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[2]/div[1]/div/div[2]/span[2]/a
    Sleep    2
    # verify the exported file exists in the download folder named as image_IQU.fits-q-2026-09-23-21-55-13.tsv and image_IQU.fits-u-2026-09-23-21-55-13.tsv
    Set Selenium Speed    0
    ${wildcard_filename}=    Set Variable    image_IQU.fits-*-${year}-${month}-${day}-*-*-*.tsv
    ${pattern}=    Set Variable    ${DOWNLOAD_FOLDER}/${wildcard_filename}
    File Should Exist    ${pattern}
    @{files}=    List Files In Directory    ${DOWNLOAD_FOLDER}    pattern=${wildcard_filename}
    ${filepath_0}=    Join Path    ${DOWNLOAD_FOLDER}    ${files}[0]
    ${filepath_1}=    Join Path    ${DOWNLOAD_FOLDER}    ${files}[1]
    ${content}=     Get File    ${filepath_0}
    @{lines}=       Split To Lines    ${content}
    Should Be Equal    ${lines}[0]    \# q image_IQU.fits
    Should Be Equal    ${lines}[1]    \# xLabel: [LSRK] Frequency (GHz)
    Should Be Equal    ${lines}[2]    \# yLabel: Value (Jy/pixel)
    Should Be Equal    ${lines}[3]    \# Point (pixel) [5.000000pix, 5.000000pix]
    Should Be Equal    ${lines}[4]    \# Point (wcs:FK5) [0:00:00.0000000000, 30:00:00.0000000000]
    Should Be Equal    ${lines}[5]    \# Qz\t
    Should Be Equal    ${lines}[6]    \# x\ty
    Should Be Equal    ${lines}[7]    115.27120000000001\t7.5465911627e-1
    Should Be Equal    ${lines}[-1]    115.13316330262583\t6.4677184820e-1
    ${content}=     Get File    ${filepath_1}
    @{lines}=       Split To Lines    ${content}
    Should Be Equal    ${lines}[0]    \# u image_IQU.fits
    Should Be Equal    ${lines}[1]    \# xLabel: [LSRK] Frequency (GHz)
    Should Be Equal    ${lines}[2]    \# yLabel: Value (Jy/pixel)
    Should Be Equal    ${lines}[3]    \# Point (pixel) [5.000000pix, 5.000000pix]
    Should Be Equal    ${lines}[4]    \# Point (wcs:FK5) [0:00:00.0000000000, 30:00:00.0000000000]
    Should Be Equal    ${lines}[5]    \# Uz\t
    Should Be Equal    ${lines}[6]    \# x\ty
    Should Be Equal    ${lines}[7]    115.27120000000001\t6.1499863863e-1
    Should Be Equal    ${lines}[-1]    115.13316330262583\t7.8242826462e-1
    Remove Files    ${filepath_0}
    Remove Files    ${filepath_1}
    Set Selenium Speed    ${DELAY}    
    # pi profile plot
    Mouse Over    css:.profile-plot-pi
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[2]/div[2]/div/div[2]/span[2]/a
    Sleep    1
    # verify the exported file exists in the download folder named as image_IQU.fits-piLine-2026-09-23-22-07-51.tsv
    Set Selenium Speed    0
    ${wildcard_filename}=    Set Variable    image_IQU.fits-piLine-${year}-${month}-${day}-*-*-*.tsv
    ${pattern}=    Set Variable    ${DOWNLOAD_FOLDER}/${wildcard_filename}
    File Should Exist    ${pattern}
    @{files}=    List Files In Directory    ${DOWNLOAD_FOLDER}    pattern=${wildcard_filename}
    ${filepath}=    Join Path    ${DOWNLOAD_FOLDER}    ${files}[0]
    ${content}=     Get File    ${filepath}
    @{lines}=       Split To Lines    ${content}
    Should Be Equal    ${lines}[0]    \# image_IQU.fits piLine
    Should Be Equal    ${lines}[1]    \# xLabel: [LSRK] Frequency (GHz)
    Should Be Equal    ${lines}[2]    \# yLabel: PI (Jy/pixel)
    Should Be Equal    ${lines}[3]    \# Point (pixel) [5.000000pix, 5.000000pix]
    Should Be Equal    ${lines}[4]    \# Point (wcs:FK5) [0:00:00.0000000000, 30:00:00.0000000000]
    Should Be Equal    ${lines}[5]    \# x\ty
    Should Be Equal    ${lines}[6]    115.27120000000001\t9.7351615666e-1
    Should Be Equal    ${lines}[-1]    115.13316330262583\t1.0151393071e+0
    Remove Files    ${filepath}
    Set Selenium Speed    ${DELAY}
    # pa profile plot
    Mouse Over    css:.profile-plot-pa
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[2]/div[3]/div/div[2]/span[2]/a
    Sleep    1
    # verify the exported file exists in the download folder named as image_IQU.fits-paLine-2026-09-23-22-11-25.tsv
    Set Selenium Speed    0
    ${wildcard_filename}=    Set Variable    image_IQU.fits-paLine-${year}-${month}-${day}-*-*-*.tsv
    ${pattern}=    Set Variable    ${DOWNLOAD_FOLDER}/${wildcard_filename}
    File Should Exist    ${pattern}
    @{files}=    List Files In Directory    ${DOWNLOAD_FOLDER}    pattern=${wildcard_filename}
    ${filepath}=    Join Path    ${DOWNLOAD_FOLDER}    ${files}[0]
    ${content}=     Get File    ${filepath}
    @{lines}=       Split To Lines    ${content}
    Should Be Equal    ${lines}[0]    \# image_IQU.fits paLine
    Should Be Equal    ${lines}[1]    \# xLabel: [LSRK] Frequency (GHz)
    Should Be Equal    ${lines}[2]    \# yLabel: PA (Degrees)
    Should Be Equal    ${lines}[3]    \# Point (pixel) [5.000000pix, 5.000000pix]
    Should Be Equal    ${lines}[4]    \# Point (wcs:FK5) [0:00:00.0000000000, 30:00:00.0000000000]
    Should Be Equal    ${lines}[5]    \# x\ty
    Should Be Equal    ${lines}[6]    115.27120000000001\t1.9588909774e+1
    Should Be Equal    ${lines}[-1]    115.13316330262583\t2.5211070171e+1
    Remove Files    ${filepath}
    Set Selenium Speed    ${DELAY}    
    # qu scatter plot
    Mouse Over    css:.profile-plot-qvsu
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[3]/div/div[2]/span[2]/a
    Sleep    1
    # verify the exported file exists in the download folder named as image_IQU.fits-quScatter-2026-09-23-22-16-26.tsv
    Set Selenium Speed    0
    ${wildcard_filename}=    Set Variable    image_IQU.fits-quScatter-${year}-${month}-${day}-*-*-*.tsv
    ${pattern}=    Set Variable    ${DOWNLOAD_FOLDER}/${wildcard_filename}
    File Should Exist    ${pattern}
    @{files}=    List Files In Directory    ${DOWNLOAD_FOLDER}    pattern=${wildcard_filename}
    ${filepath}=    Join Path    ${DOWNLOAD_FOLDER}    ${files}[0]
    ${content}=     Get File    ${filepath}
    @{lines}=       Split To Lines    ${content}
    Should Be Equal    ${lines}[0]    \# image_IQU.fits quScatter
    Should Be Equal    ${lines}[1]    \# xLabel: Stokes Q (Jy/pixel)
    Should Be Equal    ${lines}[2]    \# yLabel: Stokes U (Jy/pixel)
    Should Be Equal    ${lines}[3]    \# Point (pixel) [5.000000pix, 5.000000pix]
    Should Be Equal    ${lines}[4]    \# Point (wcs:FK5) [0:00:00.0000000000, 30:00:00.0000000000]
    Should Be Equal    ${lines}[5]    \# x\ty
    Should Be Equal    ${lines}[6]    7.5465911627e-1\t6.1499863863e-1
    Should Be Equal    ${lines}[-1]    6.4677184820e-1\t7.8242826462e-1
    Remove Files    ${filepath}
    Set Selenium Speed    ${DELAY}        


    [Teardown]    Kill carta_backend And Close Browser

# TODO: add test for image viewer PNG export
# TODO: add test for other widget that supports PNG export

