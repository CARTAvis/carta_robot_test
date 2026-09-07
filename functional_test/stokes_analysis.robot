*** Settings ***
Documentation     Check the features in the Stokes analysis widget
Resource          ../resource.robot


*** Test Cases ***
QU Linked Visualization
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   image_IQU.fits
    Mouse Over    ${VIEWER_DIV}
    # enable Stokes analysis widget
    Click Element    id:StokesAnalysisWidgetButton
    # make the line plot with thicker line
    Click Element    data:testid:stokes-0-header-settings-button
    Click Element    //*[contains(text(), "Line Plot Styling")]
    Repeat Keyword    4    Click Element    data:testid:profiler-settings-line-width-input-increment-button
    Click Element    data:testid:stokes-0-floating-settings-0-header-close-button


    # box-zoom the QU plot
    Drag And Drop By Offset    data:testid:profiler-plot    100    50

    # take a screenshot
    ${key}=    Generate Random String    8
    Capture Element Screenshot    data:testid:stokes-0-content    check_zoomQUprofile_${key}.png

    # reset profile plot range
    Double Click Element    data:testid:profiler-plot
    # box zoom the scatter plot
    Drag And Drop By Offset    //*[@id="root"]/div/div[17]/div[1]/div/div[2]/div/div/div[3]    120    -120
    Capture Element Screenshot    data:testid:stokes-0-content    check_zoomQUscatter_${key}.png

    # reset scatter plot
    Double Click Element    //*[@id="root"]/div/div[17]/div[1]/div/div[2]/div/div/div[3]
    Capture Element Screenshot    data:testid:stokes-0-content    check_default_${key}.png

    # check screenshots
    Set Selenium Speed    0
    # Q profile
    PNG Pixel XY Should Match RGBA    check_zoomQUprofile_${key}.png    372,136,33,93,176,255
    # U profile
    PNG Pixel XY Should Match RGBA    check_zoomQUprofile_${key}.png    372,115,147,86,16,255
    # PI profile
    PNG Pixel XY Should Match RGBA    check_zoomQUprofile_${key}.png    372,243,33,93,176,255
    # PA profile
    PNG Pixel XY Should Match RGBA    check_zoomQUprofile_${key}.png    447,275,33,93,176,255
    # scatter blue
    PNG Pixel XY Should Match RGBA    check_zoomQUprofile_${key}.png    206,496,0,28,255,255
    # scatter red
    PNG Pixel XY Should Match RGBA    check_zoomQUprofile_${key}.png    276,572,255,81,0,255

    # Q profile grey out
    PNG Pixel XY Should Match RGBA    check_zoomQUscatter_${key}.png    340,154,187,187,188,255
    # U profile grey out
    PNG Pixel XY Should Match RGBA    check_zoomQUscatter_${key}.png    195,142,187,187,188,255
    # PI profile grey out
    PNG Pixel XY Should Match RGBA    check_zoomQUscatter_${key}.png    204,190,187,187,188,255
    # PA profile grey out
    PNG Pixel XY Should Match RGBA    check_zoomQUscatter_${key}.png    341,280,187,187,188,255
    # scatter blue
    PNG Pixel XY Should Match RGBA    check_zoomQUscatter_${key}.png    89,402,0,76,255,255
    # scatter red
    PNG Pixel XY Should Match RGBA    check_zoomQUscatter_${key}.png    463,575,255,63,0,255

    # Q profile
    PNG Pixel XY Should Match RGBA    check_default_${key}.png    340,157,33,93,176,255
    # U profile
    PNG Pixel XY Should Match RGBA    check_default_${key}.png    322,130,147,86,16,255
    # PI profile
    PNG Pixel XY Should Match RGBA    check_default_${key}.png    204,185,33,93,176,255
    # PA profile
    PNG Pixel XY Should Match RGBA    check_default_${key}.png    341,280,33,93,176,255
    # scatter blue
    PNG Pixel XY Should Match RGBA    check_default_${key}.png    257,397,0,76,255,255
    # scatter red
    PNG Pixel XY Should Match RGBA    check_default_${key}.png    391,476,232,0,0,255

    Remove Files    check_zoomQUprofile_${key}.png    check_zoomQUscatter_${key}.png    check_zoomQUscatter_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



