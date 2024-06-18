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


Vector Field Rendering
    [Setup]    Run carta_backend
    ${result}=    test_image_rendering.vector_field_rendering
    Should Be Equal    ${result}    Done
    
    PNG Images Should Be Identical    vector_field_rendering_atomic.png    vector_field_rendering_molecular.png
    PNG Images Should Be Different    vector_field_rendering_atomic.png    vector_field_rendering_reset.png
    # intensity markers
    PNG Two Pixels Should Have Matched RGBA    vector_field_rendering_atomic.png    181,253,581,253
    # polarization segments
    PNG Two Pixels Should Have Matched RGBA    vector_field_rendering_molecular.png    275,109,675,109
    Remove Files    vector_field_rendering_atomic.png    vector_field_rendering_molecular.png    vector_field_rendering_reset.png
    [Teardown]    Terminate carta_backend



WCS Rendering - Global
    [Setup]    Run carta_backend
    ${result}=    test_image_rendering.wcs_rendering_global
    Should Be Equal    ${result}    Done
    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    wcs_rendering_global.png    12,239,172,47,51,255
    PNG Two Pixels Should Have Matched RGBA    wcs_rendering_global.png    12,239,548,387
    Remove Files    wcs_rendering_global.png
    [Teardown]    Terminate carta_backend

WCS Rendering - Axes
    [Setup]    Run carta_backend
    ${result}=    test_image_rendering.wcs_rendering_axes
    Should Be Equal    ${result}    Done
    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    wcs_rendering_global_interior_axes.png    144,351,255,255,255,255
    PNG Two Pixels Should Have Matched RGBA    wcs_rendering_global_interior_axes.png   144,351,544,351
    Remove Files    wcs_rendering_global_interior_axes.png
    [Teardown]    Terminate carta_backend


WCS Rendering - Beam
    [Setup]    Run carta_backend
    ${result}=    test_image_rendering.wcs_rendering_beam
    Should Be Equal    ${result}    Done
    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    wcs_rendering_beam.png    63,338,172,47,51,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_beam.png    743,18,115,128,145,255
    Remove Files    wcs_rendering_beam.png
    [Teardown]    Terminate carta_backend

WCS Rendering - Border
    [Setup]    Run carta_backend
    ${result}=    test_image_rendering.wcs_rendering_border
    Should Be Equal    ${result}    Done
    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    wcs_rendering_border.png    441,357,17,20,24,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_border.png    358,4,17,20,24,255
    Remove Files    wcs_rendering_border.png
    [Teardown]    Terminate carta_backend

WCS Rendering - Colorbar
    [Setup]    Run carta_backend
    ${result}=    test_image_rendering.wcs_rendering_colorbar
    Should Be Equal    ${result}    Done
    Set Selenium Speed    0
    #  border
    PNG Pixel XY Should Match RGBA    wcs_rendering_colorbar.png    41,40,172,47,51,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_colorbar.png    441,40,172,47,51,255
    #  tick
    PNG Pixel XY Should Match RGBA    wcs_rendering_colorbar.png    106,52,255,255,255,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_colorbar.png    464,52,255,255,255,255
    #  tick value
    PNG Pixel XY Should Match RGBA    wcs_rendering_colorbar.png    97,33,147,86,16,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_colorbar.png    512,33,147,86,16,255
    #  label
    PNG Pixel XY Should Match RGBA    wcs_rendering_colorbar.png    232,16,28,110,66,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_colorbar.png    619,10,28,110,66,255
    Remove Files    wcs_rendering_colorbar.png
    [Teardown]    Terminate carta_backend

WCS Rendering - Grid
    [Setup]    Run carta_backend
    ${result}=    test_image_rendering.wcs_rendering_grid
    Should Be Equal    ${result}    Done
    Set Selenium Speed    0
    # grid gap
    PNG Pixel XY Should Match RGBA    wcs_rendering_grid_gap.png    204,184,172,47,51,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_grid_gap.png    630,184,172,47,51,255
    # usual grid
    PNG Pixel XY Should Match RGBA    wcs_rendering_grid.png    233,169,172,47,51,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_grid.png    633,169,172,47,51,255
    # pixel grid
    PNG Pixel XY Should Match RGBA    wcs_rendering_grid_pixel_grid.png    199,150,160,181,170,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_grid_pixel_grid.png    168,245,160,181,170,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_grid_pixel_grid.png    568,182,21,121,158,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_grid_pixel_grid.png    599,245,21,121,158,255
    Remove Files    wcs_rendering_grid.png    wcs_rendering_grid_gap.png    wcs_rendering_grid_pixel_grid.png
    [Teardown]    Terminate carta_backend

WCS Rendering - Labels
    [Setup]    Run carta_backend
    ${result}=    test_image_rendering.wcs_rendering_labels
    Should Be Equal    ${result}    Done
    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    wcs_rendering_labels.png    21,197,172,47,51,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_labels.png    591,375,172,47,51,255
    Remove Files    wcs_rendering_labels.png
    [Teardown]    Terminate carta_backend

WCS Rendering - Numbers
    [Setup]    Run carta_backend
    ${result}=    test_image_rendering.wcs_rendering_numbers
    Should Be Equal    ${result}    Done
    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    wcs_rendering_numbers.png    41,122,17,20,24,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_numbers.png    649,367,17,20,24,255
    Remove Files    wcs_rendering_numbers.png
    [Teardown]    Terminate carta_backend

WCS Rendering - Ticks
    [Setup]    Run carta_backend
    ${result}=    test_image_rendering.wcs_rendering_ticks
    Should Be Equal    ${result}    Done
    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    wcs_rendering_ticks.png    113,346,255,255,255,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_ticks.png    721,352,255,255,255,255    
    Remove Files    wcs_rendering_ticks.png
    [Teardown]    Terminate carta_backend

WCS Rendering - Title
    [Setup]    Run carta_backend
    ${result}=    test_image_rendering.wcs_rendering_title
    Should Be Equal    ${result}    Done
    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    wcs_rendering_title.png    296,18,17,20,24,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_title.png    621,18,17,20,24,255
    Remove Files    wcs_rendering_title.png
    [Teardown]    Terminate carta_backend

WCS Rendering - Spatial-Spectral Conversion
    [Setup]    Run carta_backend
    ${result}=    test_image_rendering.wcs_rendering_spatial_spectral_conversion
    Should Be Equal    ${result}    Done
    Set Selenium Speed    0
    PNG Pixel XY Should Match RGBA    wcs_rendering_spatial_spectral_conversion.png    416,210,33,93,176,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_spatial_spectral_conversion.png    433,196,33,93,176,255
    Remove Files    wcs_rendering_spatial_spectral_conversion.png
    [Teardown]    Terminate carta_backend