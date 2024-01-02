*** Settings ***
Documentation     Test image rendering with the python scripting interface
Resource          ../resource.robot
Library          test_image_rendering.py

*** Test Cases ***
Raster Rendering
    [Setup]    Run carta_backend
    ${result}=    test_image_rendering.raster_rendering
    Should Be Equal    ${result}    Done
    PNG Two Pixels Should Have Matched RGBA    raster_rendering.png    92,88,529,138
    Remove Files    raster_rendering.png
    [Teardown]    Terminate carta_backend


Contour Rendering
    [Setup]    Run carta_backend
    ${result}=    test_image_rendering.contour_rendering
    Should Be Equal    ${result}    Done
    # white contour
    PNG Two Pixels Should Have Matched RGBA    contour_rendering.png    167,110,567,110
    PNG Two Pixels Should Have Matched RGBA    contour_rendering.png    224,139,624,139
    # colormap contour
    PNG Two Pixels Should Have Matched RGBA    contour_rendering.png    139,90,539,90
    PNG Two Pixels Should Have Matched RGBA    contour_rendering.png    219,199,619,199
    Remove Files    contour_rendering.png
    [Teardown]    Terminate carta_backend