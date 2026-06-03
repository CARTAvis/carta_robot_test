*** Settings ***
Documentation     Check the features in the popout image viewer
Resource          ../resource.robot



*** Test Cases ***
Popout And Restore Image Viewer
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image   S255_CH3CN_subcube.fits
    Click Element    ${COLORMAP_DROPDOWN}
    Click Element    //*[contains(text(), "tab10")]
    # popout image viewer
    Click Element    //*[@id="root"]/div/div[16]/div/div[4]/div/div[1]/div[1]/div/div[1]/div[2]/button[7]
    Switch Window    NEW
    Set Window Size    800    800
    Sleep    2
    ${key}=    Generate Random String    8
    Capture Page Screenshot    popout_image_viewer_${key}.png
    Switch Window    MAIN
    Capture Page Screenshot    main_browser_${key}.png

    Switch Window    NEW
    # need to use JS to close the popout window so that the viewer can be restored to the main window
    Execute JavaScript	window.close()
    Switch Window    MAIN
    Sleep    2
    Capture Page Screenshot    main_browser_restored_${key}.png
    # verify screenshots
    PNG Pixel XY Should Match RGBA    popout_image_viewer_${key}.png    460,360,23,190,207,255
    PNG Pixel XY Should Match RGBA    main_browser_${key}.png    720,340,19,124,189,255
    PNG Pixel XY Should Match RGBA    main_browser_restored_${key}.png    446,315,23,190,207,255
    PNG Images Should Be Different    main_browser_${key}.png    main_browser_restored_${key}.png
    
    Remove Files    popout_image_viewer_${key}.png    main_browser_${key}.png    main_browser_restored_${key}.png
    [Teardown]    Kill carta_backend And Close Browser



