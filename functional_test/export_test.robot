*** Settings ***
Documentation     Check the export functionality in CARTA
Resource          ../resource.robot

Library    DateTime


*** Test Cases ***
Export as TSV or TEXT
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
    # remove any tsv files in the download folder
    Remove Files    ${DOWNLOAD_FOLDER}/*-${year}-${month}-${day}-*.tsv

    # spectral profiler
    Click Element    id:SpectralProfilerButton
    Mouse Over    data:testid:spectral-profiler-0-plot
    Click Element    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[2]/div[1]/div/div[2]/span[2]/a
    Sleep    1
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



    # spatial profiler


    [Teardown]    Kill carta_backend And Close Browser



