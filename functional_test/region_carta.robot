*** Settings ***
Documentation     Test region of interest support in CARTA 
Resource          ../resource.robot


*** Test Cases ***
Region selecting, centering, locking, and deleting
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Load Region File    all_region_generated_with_carta.crtf
    
    Click Element    //*[contains(text(), "Region List")]
    Click Element    ${X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0
    Click Element At Coordinates    ${VIEWER_DIV}    50    -150
    Mouse Out    ${VIEWER_DIV}
    #Sleep    1
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_selected_from_viewer_${key}.png
    Click Element    data:testid:region-list-table-row-7
    Capture Element Screenshot    ${VIEWER_DIV}    check_polyline_selected_from_list_${key}.png
    Click Element    data:testid:region-list-table-row-6-center-cell
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov_${key}.png
    Click Element    data:testid:region-list-table-row-6
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov_selected_${key}.png
    Click Element    data:testid:region-list-table-row-6-lock-cell
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov_selected_locked_${key}.png
    Press Keys    None    DELETE
    Verify Region List Table Cell Content    6    5    Region 5
    Verify Region List Table Cell Content    6    6    Polygon
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov_selected_locked_tried_delete_${key}.png
    Click Element    data:testid:region-list-table-row-6-lock-cell
    Mouse Out    data:testid:region-list-table-row-6-lock-cell
    Capture Element Screenshot    ${VIEWER_DIV}    check_polygon_center_fov_selected_locked_tried_delete_unlocked_${key}.png
    Press Keys    None    DELETE
    Verify Region List Table Cell Content    6    5    Region 6
    Verify Region List Table Cell Content    6    6    Polyline
    
    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_polygon_selected_from_viewer_${key}.png    290,67,259,130
    PNG Two Pixels Should Have Matched RGBA    check_polygon_selected_from_viewer_${key}.png    290,67,323,144
    PNG Two Pixels Should Have Matched RGBA    check_polygon_selected_from_viewer_${key}.png    290,67,377,129
    PNG Two Pixels Should Have Matched RGBA    check_polygon_selected_from_viewer_${key}.png    290,67,341,67
    PNG Two Pixels Should Not Have Matched RGBA    check_polygon_selected_from_viewer_${key}.png    290,67,316,67

    PNG Two Pixels Should Have Matched RGBA    check_polyline_selected_from_list_${key}.png    256,220,310,168
    PNG Two Pixels Should Have Matched RGBA    check_polyline_selected_from_list_${key}.png    256,220,364,224
    PNG Two Pixels Should Have Matched RGBA    check_polyline_selected_from_list_${key}.png    256,220,413,179
    PNG Two Pixels Should Not Have Matched RGBA    check_polyline_selected_from_list_${key}.png    256,220,283,195

    PNG Images Should Be Different    check_polyline_selected_from_list_${key}.png    check_polygon_center_fov_${key}.png    
    PNG Images Should Be Identical    check_polygon_center_fov_selected_locked_${key}.png    check_polygon_center_fov_selected_locked_tried_delete_${key}.png
    PNG Images Should Be Identical    check_polygon_center_fov_selected_${key}.png    check_polygon_center_fov_selected_locked_tried_delete_unlocked_${key}.png

    Remove Files    check_polygon_selected_from_viewer_${key}.png    check_polyline_selected_from_list_${key}.png    check_polygon_center_fov_${key}.png
    Remove Files    check_polygon_center_fov_selected_${key}.png    check_polygon_center_fov_selected_locked_${key}.png
    Remove Files    check_polygon_center_fov_selected_locked_tried_delete_${key}.png    check_polygon_center_fov_selected_locked_tried_delete_unlocked_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Creating Regions And Export As Region Files
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    # point
    Click Element    ${POINT_REGION_SHORTCUT_BUTTON}
    Click Element At Coordinates    ${VIEWER_DIV}    -100    -100
    # line
    Click Element    ${LINE_REGION_SHORTCUT_BUTTON}
    Drag And Drop By Offset    ${VIEWER_DIV}    -65    50
    # rectangle
    Click Element    ${RECTANGLE_REGION_SHORTCUT_BUTTON}
    Drag And Drop By Offset    ${VIEWER_DIV}    -60    80
    # ellipse
    Click Element    ${ELLIPSE_REGION_SHORTCUT_BUTTON}
    Drag And Drop By Offset    ${VIEWER_DIV}    -100    50
    # polygon
    Click Element    ${POLYGON_REGION_SHORTCUT_BUTTON}
    Click Element At Coordinates    ${VIEWER_DIV}    75    -75
    Click Element At Coordinates    ${VIEWER_DIV}    50    120
    Double Click Element    ${VIEWER_DIV}
    # polyline
    Click Element    ${POLYLINE_REGION_SHORTCUT_BUTTON}
    Click Element At Coordinates    ${VIEWER_DIV}    0    100
    Click Element At Coordinates    ${VIEWER_DIV}    -80    80
    Click Element At Coordinates    ${VIEWER_DIV}    80    60
    Double Click Element    ${VIEWER_DIV} 
    
    Click Element    //*[contains(text(), "Region List")]
    Click Element    ${X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0
    Click Element At Coordinates    ${VIEWER_DIV}    50    -150

    Set Selenium Speed    0
    Verify Region List Table Cell Content    2    5    Region 1
    Verify Region List Table Cell Content    2    6    Point
    Verify Region List Table Cell Content    2    7    17:56:21.6556900185
    Verify Region List Table Cell Content    2    7    -21:57:18.1728612209
    Verify Region List Table Cell Content    2    8    ${EMPTY}
    Verify Region List Table Cell Content    2    9    0.0
    
    Verify Region List Table Cell Content    3    5    Region 2
    Verify Region List Table Cell Content    3    6    Line
    Verify Region List Table Cell Content    3    7    17:56:21.2886455617
    Verify Region List Table Cell Content    3    7    -21:57:23.2792706952
    Verify Region List Table Cell Content    3    8    8.3750907916"
    Verify Region List Table Cell Content    3    9    307.6
    
    Verify Region List Table Cell Content    4    5    Region 3
    Verify Region List Table Cell Content    4    6    Rectangle
    Verify Region List Table Cell Content    4    7    17:56:21.2886455617
    Verify Region List Table Cell Content    4    7    -21:57:23.2792706952
    Verify Region List Table Cell Content    4    8    6.1276595745"
    Verify Region List Table Cell Content    4    8    8.1702127660"
    Verify Region List Table Cell Content    4    9    0.0

    Verify Region List Table Cell Content    5    5    Region 4
    Verify Region List Table Cell Content    5    6    Ellipse
    Verify Region List Table Cell Content    5    7    17:56:21.2886455617
    Verify Region List Table Cell Content    5    7    -21:57:23.2792706952
    Verify Region List Table Cell Content    5    8    2.5531914894"
    Verify Region List Table Cell Content    5    8    5.1063829787"
    Verify Region List Table Cell Content    5    9    0.0

    Verify Region List Table Cell Content    6    5    Region 5
    Verify Region List Table Cell Content    6    6    Polygon
    Verify Region List Table Cell Content    6    7    17:56:21.1510021967
    Verify Region List Table Cell Content    6    7    -21:57:24.4282036623
    Verify Region List Table Cell Content    6    8    3.8297872340"
    Verify Region List Table Cell Content    6    8    9.9574468085"
    Verify Region List Table Cell Content    6    9    0.0

    Verify Region List Table Cell Content    7    5    Region 6
    Verify Region List Table Cell Content    7    6    Polyline
    Verify Region List Table Cell Content    7    7    17:56:21.2886455981
    Verify Region List Table Cell Content    7    7    -21:57:25.8324621846
    Verify Region List Table Cell Content    7    8    8.1702127660"
    Verify Region List Table Cell Content    7    8    5.1063829787"
    Verify Region List Table Cell Content    7    9    0.0

    # export as region files
    Set Selenium Speed    ${DELAY}
    ${system}=    Evaluate    platform.system()    platform
    
    # delete region files from previous tests if any
    Remove Files    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_world.crtf    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_pixel.crtf    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_pixel.reg    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_world.reg

    # save as a crtf region file in world coordinate
    Click Element    //*[contains(text(), "File")]
    Click Element    //*[contains(text(), "Export Regions")]
    Input Text    //input[@placeholder="Enter file name"]    e2e_check_region_world.crtf
    Click Element    //*[contains(text(), "Export regions")]

    # save as a crtf region file in pixel coordinate
    Click Element    //*[contains(text(), "File")]
    Click Element    //*[contains(text(), "Export Regions")]
    Click Element    //*[contains(text(), "World")]
    Click Element    //*[contains(text(), "Pixel coordinates")]
    Input Text    //input[@placeholder="Enter file name"]    e2e_check_region_pixel.crtf
    Click Element    //*[contains(text(), "Export regions")]

    # save as a ds9 region file in pixel coordinate
    Click Element    //*[contains(text(), "File")]
    Click Element    //*[contains(text(), "Export Regions")]
    Click Element    data:testid:export-region-file-type-dropdown
    Click Element    //*[contains(text(), "DS9 region file")]
    Input Text    //input[@placeholder="Enter file name"]    e2e_check_region_pixel.reg
    Click Element    //*[contains(text(), "Export regions")]

    # save as a ds9 region file in world coordinate
    Click Element    //*[contains(text(), "File")]
    Click Element    //*[contains(text(), "Export Regions")]
    Click Element    //*[contains(text(), "Pixel")]
    Click Element    //*[contains(text(), "World coordinates")]
    Input Text    //input[@placeholder="Enter file name"]    e2e_check_region_world.reg
    Click Element    //*[contains(text(), "Export regions")]

    # compare generated regions files with snapshot region files
    Set Selenium Speed    0
    ${test_world_crtf} =    Get File    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_world.crtf
    ${snapshot_world_crtf} =    Get File    ${SNAPSHOT_FOLDER}/e2e_check_region_world.crtf
    Should Be Equal As Strings    ${test_world_crtf}    ${snapshot_world_crtf}

    ${test_pixel_crtf} =    Get File    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_pixel.crtf
    ${snapshot_pixel_crtf} =    Get File    ${SNAPSHOT_FOLDER}/e2e_check_region_pixel.crtf
    Should Be Equal As Strings    ${test_pixel_crtf}    ${snapshot_pixel_crtf}

    ${test_pixel_ds9} =    Get File    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_pixel.reg
    ${snapshot_pixel_ds9} =    Get File    ${SNAPSHOT_FOLDER}/e2e_check_region_pixel.reg
    Should Be Equal As Strings    ${test_pixel_ds9}    ${snapshot_pixel_ds9}

    ${test_world_ds9} =    Get File    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_world.reg
    ${snapshot_world_ds9} =    Get File    ${SNAPSHOT_FOLDER}/e2e_check_region_world.reg
    Should Be Equal As Strings    ${test_world_ds9}    ${snapshot_world_ds9}

    Remove Files    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_world.crtf    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_pixel.crtf    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_pixel.reg    ${INITIAL_IMAGE_FOLDER}/e2e_check_region_world.reg
    [Teardown]    Kill carta_backend And Close Browser


Shared Region And Region Inheritance
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Click Element    //*[contains(text(), "Region List")]
    Click Element    ${X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0
    Click Element At Coordinates    ${VIEWER_DIV}    50    -150

    # create a point region
    Click Element    ${POINT_REGION_SHORTCUT_BUTTON}
    Click Element At Coordinates    ${VIEWER_DIV}    -50    -50

    Append Image    HD163296_CO_2_1.mom1.fits
    Page Should Not Contain Element    data:testid:region-list-table-row-2
    # match image with the XY button
    Click Element    //*[contains(text(), "Image List")]
    Click Element    ${IMAGE_LIST_SECOND_MATCHING_XY}
    Click Element    //*[contains(text(), "Region List")]
    Verify Region List Table Cell Content    2    5    Region 1

    # unmatch image with the XY button
    Click Element    //*[contains(text(), "Image List")]
    Click Element    ${IMAGE_LIST_SECOND_MATCHING_XY}
    Click Element    //*[contains(text(), "Region List")]
    Verify Region List Table Cell Content    2    5    Region 2
    # set a new active image
    Click Element    //*[contains(text(), "Image List")]
    Click Element    ${IMAGE_LIST_FIRST_IMAGE_NAME}
    Click Element    //*[contains(text(), "Region List")]
    Verify Region List Table Cell Content    2    5    Region 1

    # set the 2nd image as active by clicking it in the image list
    Click Element    //*[contains(text(), "Image List")]
    Click Element    ${IMAGE_LIST_SECOND_IMAGE_NAME}
    # create a new region on the unmatched 2nd image
    Click Element    ${POINT_REGION_SHORTCUT_BUTTON}
    Click Element At Coordinates    ${VIEWER_10_CANVAS}    20    -50
    Click Element    //*[contains(text(), "Region List")]
    Verify Region List Table Cell Content    3    5    Region 3

    # match the 2nd image
    Click Element    //*[contains(text(), "Image List")]
    Click Element    ${IMAGE_LIST_SECOND_MATCHING_XY}
    Click Element    //*[contains(text(), "Region List")]
    Verify Region List Table Cell Content    2    5    Region 1
    Verify Region List Table Cell Content    3    5    Region 4
    # set a new active image
    Click Element    //*[contains(text(), "Image List")]
    Click Element    ${IMAGE_LIST_FIRST_IMAGE_NAME}
    Click Element    //*[contains(text(), "Region List")]
    Verify Region List Table Cell Content    2    5    Region 1
    Verify Region List Table Cell Content    3    5    Region 4

    # unmatch again
    Click Element    //*[contains(text(), "Image List")]
    Click Element    ${IMAGE_LIST_SECOND_MATCHING_XY}
    Click Element    //*[contains(text(), "Region List")]
    Verify Region List Table Cell Content    2    5    Region 1
    Verify Region List Table Cell Content    3    5    Region 4
    # set a new active image
    Click Element    //*[contains(text(), "Image List")]
    Click Element    ${IMAGE_LIST_SECOND_IMAGE_NAME}
    Click Element    //*[contains(text(), "Region List")]
    Verify Region List Table Cell Content    2    5    Region 5
    Verify Region List Table Cell Content    3    5    Region 6

    [Teardown]    Kill carta_backend And Close Browser



Loading 4000 Regions From A File
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Click Element    //*[contains(text(), "Region List")]
    Click Element    ${X_SPATIAL_PROFILER_CLOSE_BUTTON}
    Click Element    ${Y_SPATIAL_PROFILER_CLOSE_BUTTON}
    Drag And Drop By Offset    ${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    -200    0
    Click Element At Coordinates    ${VIEWER_DIV}    50    -150

    Load Region File    box_region_n_4000.crtf
    Wait Until Page Does Not Contain    Importing regions    timeout=10
    #Sleep    1

    # scroll the region list to the very bottom
    Assign Id To Element    css:[data-testid="region-list-table"] > div:nth-child(2)    tmp_REGIONLIST
    Execute Javascript    window.document.getElementById("tmp_REGIONLIST").scrollTo(0, 200000)

    Page Should Contain    Region 4000
    [Teardown]    Kill carta_backend And Close Browser


Loading Regions on Active Matched Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    m51cm3i_8_small.fits
    Append Image    m51_151_MHz.fits
    # match m51_151_MHz.fits to m51cm3i_8_small.fits by clicking the XY button in the image list
    Click Element    ${IMAGE_LIST_SECOND_MATCHING_XY}
    Load Region File    region_004.crtf
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png

    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    118,72,497,72
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    139,149,518,149
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    163,120,542,120
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser


Loading Regions on Active Reference Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    m51cm3i_8_small.fits
    Append Image    m51_151_MHz.fits
    # match m51_151_MHz.fits to m51cm3i_8_small.fits by clicking the XY button in the image list
    Click Element    ${IMAGE_LIST_SECOND_MATCHING_XY}
    # set m51cm3i_8_small.fits as active by clicking it in the image list
    Click Element    ${IMAGE_LIST_FIRST_IMAGE_NAME}
    Load Region File    region_004.crtf
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_${key}.png

    Set Selenium Speed    0
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    118,72,497,72
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    139,149,518,149
    PNG Two Pixels Should Have Matched RGBA    check_${key}.png    163,120,542,120
    Remove Files    check_${key}.png
    [Teardown]    Kill carta_backend And Close Browser




Manipulating Multiple Regions
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Append Image    HD163296_CO_2_1.mom1.fits
    Click Element    ${IMAGE_LIST_SECOND_MATCHING_XY}
    # create two regions on the 2nd image
    Click Element    ${RECTANGLE_REGION_SHORTCUT_BUTTON}
    Drag And Drop By Offset    ${VIEWER_10_CANVAS}    -50    -50
    Click Element    ${LINE_REGION_SHORTCUT_BUTTON}
    Drag And Drop By Offset    ${VIEWER_10_CANVAS}    -80    120
    # multi-select the two regions
    Click Element    //*[contains(text(), "Region List")]
    Click Element    //*[contains(text(), "Region 1")]    SHIFT
    # take a screenshot of the multi-selected regions
    ${key}=    Generate Random String    8
    Capture Element Screenshot    ${VIEWER_DIV}    check_multi-selected_regions_${key}.png
    # enable region config dialog
    Double Click Element    ${VIEWER_10_CANVAS}
    # Check the content in the region config dialog
    Element Should Contain    data:testid:region-dialog    Editing 2 Regions (HD163296_CO_2_1.mom1.fits)
    Element Should Contain    data:testid:region-dialog    Color
    Element Should Contain    data:testid:region-dialog    Line width (px)
    Element Should Contain    data:testid:region-dialog    Dash length (px)
    # set different color, line width, and dash length for the two regions
    Click Element    //*[@id="root"]/div/div[2]/div/div[1]/div[3]/div/div[2]/div/div/div/div[1]/div/span/button
    #Sleep    120
    Clear Element Text    //*[starts-with(@id, 'w-color-editable-input-')]
    Input Text    //*[starts-with(@id, 'w-color-editable-input-')]    00FF16    Clear=True
    Click Element    //*[@id="root"]/div/div[2]/div/div[1]/div[3]/div/div[2]/div/div/div/div[1]/div/span/button     
    Input Text    data:testid:region-dialog-line-width-input    4    
    Input Text    //input[@placeholder="Dash length"]    4
    Click Element    data:testid:region-dialog-header-close-button
    # take a screenshot after changing the config
    Capture Element Screenshot    ${VIEWER_DIV}    check_multi-selected_regions_config_changed_${key}.png
    # enable region config dialog again
    Double Click Element    ${VIEWER_10_CANVAS}
    # lock region
    Click Element    data:testid:region-dialog-lock-button
    Click Element    data:testid:region-dialog-header-close-button
    Capture Element Screenshot    ${VIEWER_DIV}    check_multi-selected_regions_locked_${key}.png
    # unlock region
    Click Element    //*[contains(text(), "Region 2")]
    Click Element    //*[contains(text(), "Region 1")]    SHIFT
    Double Click Element    //*[contains(text(), "Region 1")]
    Click Element    data:testid:region-dialog-lock-button
    # semi-hide region
    Click Element    data:testid:region-dialog-visibility-button
    Click Element    data:testid:region-dialog-header-close-button
    Capture Element Screenshot    ${VIEWER_DIV}    check_multi-selected_regions_semi_hidden_${key}.png
    # unhide region
    Double Click Element    ${VIEWER_10_CANVAS}
    Repeat Keyword    2    Click Element    data:testid:region-dialog-visibility-button
    # export region 
    Click Element    data:testid:region-dialog-export-button
    Element Should Contain    data:testid:file-browser-dialog    Selected 2 / 2 elements.
    Click Element    data:testid:file-browser-dialog-header-close-button
    Click Element    data:testid:region-dialog-header-close-button
    # copy and paste region
    Click Element    ${VIEWER_10_CANVAS}
    ${platform}=    Evaluate    sys.platform    sys
    IF    '${platform}' == 'darwin'
    Press Keys    None    COMMAND+c
    Press Keys    None    COMMAND+v
    ELSE
    Press Keys    None    CONTROL+c
    Press Keys    None    CONTROL+v
    END
    # take a screenshot after copying and pasting the regions
    Capture Element Screenshot    ${VIEWER_DIV}    check_multi-selected_regions_copied_pasted_${key}.png

    # verify props of the copied and moved regions
    Verify Region List Table Cell Content    4    5    Region 3
    Verify Region List Table Cell Content    4    6    Rectangle
    Verify Region List Table Cell Content    4    7    17:56:21.2134006686
    Verify Region List Table Cell Content    4    7    -21:57:23.3813974917
    Verify Region List Table Cell Content    4    8    0.0
    
    Verify Region List Table Cell Content    5    5    Region 4
    Verify Region List Table Cell Content    5    6    Line
    Verify Region List Table Cell Content    5    7    17:56:21.3602197126
    Verify Region List Table Cell Content    5    7    -21:57:21.6792695287
    Verify Region List Table Cell Content    5    8    326.3

    # move region by keyboard
    Click Element    ${VIEWER_10_CANVAS}    
    Repeat Keyword    5    Press Keys    None    ARROW_RIGHT
    Mouse Out    ${VIEWER_DIV}
    # take a screenshot after moving the regions
    Capture Element Screenshot    ${VIEWER_DIV}    check_multi-selected_region_moved_${key}.png
    # verify props of the moved region
    Verify Region List Table Cell Content    3    5    Region 2
    Verify Region List Table Cell Content    3    6    Line
    Verify Region List Table Cell Content    3    7    17:56:21.1032865442
    Verify Region List Table Cell Content    3    7    -21:57:22.3601157729
    Verify Region List Table Cell Content    3    8    326.3
        
    # delete region
    Press Keys    None    DELETE
    # take a screenshot after delete a region
    Capture Element Screenshot    ${VIEWER_DIV}    check_delete_a_region_${key}.png
    # verify the regions are deleted
    Page Should Contain    Region 1
    Page Should Not Contain    Region 2
    Page Should Contain    Region 3
    Page Should Contain    Region 4

    # verify screenshots
    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    check_multi-selected_regions_${key}.png    138,267,255,255,255,255
    PNG Pixel XY Should Match RGBA    check_multi-selected_regions_${key}.png    109,337,181,181,181,255
    PNG Two Pixels Should Have Matched RGBA    check_multi-selected_regions_${key}.png    138,267,517,266
    PNG Two Pixels Should Have Matched RGBA    check_multi-selected_regions_${key}.png    109,337,488,337

    PNG Images Should Be Different    check_multi-selected_regions_${key}.png    check_multi-selected_regions_config_changed_${key}.png
    PNG Images Should Be Different    check_multi-selected_regions_config_changed_${key}.png    check_multi-selected_regions_locked_${key}.png
    PNG Images Should Be Different    check_multi-selected_regions_config_changed_${key}.png    check_multi-selected_regions_semi_hidden_${key}.png
    
    PNG Pixel XY Should Match RGBA    check_multi-selected_regions_copied_pasted_${key}.png    537,286,181,181,181,255
    PNG Pixel XY Should Match RGBA    check_multi-selected_regions_copied_pasted_${key}.png    467,323,255,255,255,255

    PNG Pixel XY Should Match RGBA    check_multi-selected_region_moved_${key}.png    537,336,255,255,255,255

    PNG Pixel XY Should Match RGBA    check_delete_a_region_${key}.png    537,336,19,124,189,255
    PNG Pixel XY Should Match RGBA    check_delete_a_region_${key}.png    537,286,255,255,255,255

    Remove Files    check_multi-selected_regions_${key}.png    check_multi-selected_regions_config_changed_${key}.png    check_multi-selected_regions_locked_${key}.png    check_multi-selected_regions_semi_hidden_${key}.png    check_multi-selected_regions_copied_pasted_${key}.png    check_multi-selected_region_moved_${key}.png_moved_${key}.png    check_delete_a_region_${key}.png
    [Teardown]    Kill carta_backend And Close Browser

Dynamic Region Dialog For Multiple Regions
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    # create annotations
    Click Element    data:testid:annotation-shortcut-dropdown
    Click Element    data:testid:annotation-shortcut-dropdown-vector
    Click Element    ${VIEWER_DIV}
    Click Element    data:testid:annotation-shortcut-dropdown
    Click Element    data:testid:annotation-shortcut-dropdown-vector
    Click Element    ${VIEWER_DIV}
    Click Element    data:testid:annotation-shortcut-dropdown
    Click Element    data:testid:annotation-shortcut-dropdown-text
    Click Element    ${VIEWER_DIV}
    Click Element    data:testid:annotation-shortcut-dropdown
    Click Element    data:testid:annotation-shortcut-dropdown-text
    Click Element    ${VIEWER_DIV}
    Click Element    data:testid:annotation-shortcut-dropdown        
    Click Element    data:testid:annotation-shortcut-dropdown-compass
    Click Element    ${VIEWER_DIV}
    Click Element    data:testid:annotation-shortcut-dropdown
    Click Element    data:testid:annotation-shortcut-dropdown-compass
    Click Element    ${VIEWER_DIV}
    Click Element    data:testid:annotation-shortcut-dropdown        
    Click Element    data:testid:annotation-shortcut-dropdown-ruler
    Click Element    ${VIEWER_DIV}
    Click Element    data:testid:annotation-shortcut-dropdown
    Click Element    data:testid:annotation-shortcut-dropdown-ruler
    Click Element    ${VIEWER_DIV}        

    # activate region list widget
    Click Element    //*[contains(text(), "Region List")]

    # Check vector common parameters
    Click Element    //*[contains(text(), "Annotation 1")]
    Click Element    //*[contains(text(), "Annotation 2")]    modifier=SHIFT
    Double Click Element    //*[contains(text(), "Annotation 2")]
    # relocate the region dialog
    Drag And Drop By Offset    id:title-bp-dialog-12    -300    0

    Element Should Contain    data:testid:region-dialog    Color
    Element Should Contain    data:testid:region-dialog    Line width (px)
    Element Should Contain    data:testid:region-dialog    Dash length (px)
    Element Should Contain    data:testid:region-dialog    Arrowhead length (px)
    Element Should Contain    data:testid:region-dialog    Arrowhead width (px)

    # Check text common parameters
    Click Element    //*[contains(text(), "Annotation 3")]
    Click Element    //*[contains(text(), "Annotation 4")]    modifier=SHIFT
    Element Should Contain    data:testid:region-dialog    Color
    Element Should Contain    data:testid:region-dialog    Font size (px)
    Element Should Contain    data:testid:region-dialog    Font
    Element Should Contain    data:testid:region-dialog    Font style
    Element Should Contain    data:testid:region-dialog    Text alignment

    # Check compass common parameters
    Click Element    //*[contains(text(), "Annotation 5")]
    Click Element    //*[contains(text(), "Annotation 6")]    modifier=SHIFT
    Element Should Contain    data:testid:region-dialog    North label offset
    Element Should Contain    data:testid:region-dialog    East label offset
    Element Should Contain    data:testid:region-dialog    Show arrowhead

    # Check ruler common parameters
    Click Element    //*[contains(text(), "Annotation 7")]
    Click Element    //*[contains(text(), "Annotation 8")]    modifier=SHIFT
    Element Should Contain    data:testid:region-dialog    Number of decimals
    Element Should Contain    data:testid:region-dialog    Show auxiliary lines
    Element Should Contain    data:testid:region-dialog    Show auxiliary labels

    # check vector and text common parameters
    Click Element    //*[contains(text(), "Annotation 2")]
    Click Element    //*[contains(text(), "Annotation 3")]    modifier=SHIFT
    Element Should Contain    data:testid:region-dialog    Color
    Element Should Not Contain    data:testid:region-dialog    Arrowhead length (px)

    # check text and compass common parameters
    Click Element    //*[contains(text(), "Annotation 4")]
    Click Element    //*[contains(text(), "Annotation 5")]    modifier=SHIFT
    Element Should Contain    data:testid:region-dialog    Color
    Element Should Contain    data:testid:region-dialog    Font size (px)
    Element Should Not Contain    data:testid:region-dialog    North label offset

    # check compass and ruler common parameters
    Click Element    //*[contains(text(), "Annotation 6")]
    Click Element    //*[contains(text(), "Annotation 7")]    modifier=SHIFT
    Element Should Contain    data:testid:region-dialog    Font style
    Element Should Not Contain    data:testid:region-dialog    Number of decimals

    [Teardown]    Kill carta_backend And Close Browser

Region Control Point Keyboard Interaction
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    HD163296_CO_2_1.mom0.fits
    Click Element    ${RECTANGLE_REGION_SHORTCUT_BUTTON}
    Click Element    ${VIEWER_DIV}
    # Select bottom-left control point
    Click Element At Coordinates    ${VIEWER_DIV}    -17    14
    # resize
    Repeat Keyword    5    Press Keys    None    ARROW_LEFT
    Repeat Keyword    5    Press Keys    None    ARROW_DOWN
    # select rotation control point
    Click Element At Coordinates    ${VIEWER_DIV}    -27    -30
    # rotate
    Repeat Keyword    10    Press Keys    None    ARROW_LEFT
    Capture Element Screenshot    ${VIEWER_DIV}    check.png

    # verify screenshot
    PNG Pixel XY Should Match RGBA    check.png    343,205,0,124,187,255
    PNG Pixel XY Should Match RGBA    check.png    320,306,255,255,255,255
    
    Remove Files    check.png
    [Teardown]    Kill carta_backend And Close Browser