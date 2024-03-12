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


WCS Rendering
    [Setup]    Run carta_backend
    ${result}=    test_image_rendering.wcs_rendering
    Should Be Equal    ${result}    Done
    Set Selenium Speed    0
    # global
    # BUG?: labels/tick value rgba is rendered as (194,48,48,255). It is not pure red
    #  labels
    PNG Pixel XY Should Match RGBA    wcs_rendering_global.png    12,239,194,48,48,255
    PNG Two Pixels Should Have Matched RGBA    wcs_rendering_global.png    12,239,548,387
    #  tick value
    PNG Pixel XY Should Match RGBA    wcs_rendering_global.png    126,208,194,48,48,255
    PNG Two Pixels Should Have Matched RGBA    wcs_rendering_global.png    126,208,526,208

    # interior axes
    PNG Pixel XY Should Match RGBA    wcs_rendering_global_interior_axes.png    228,158,255,255,255,255
    PNG Two Pixels Should Have Matched RGBA    wcs_rendering_global_interior_axes.png   228,158,628,158

    # beam # TODO: refine the tests when the beam setting per image issue is fixed
    #  BUG?: beam rgba is rendered as (194,48,48,255). It is not pure red
    PNG Pixel XY Should Match RGBA    wcs_rendering_beam.png    739,21,194,48,48,255
    PNG Two Pixels Should Have Matched RGBA    wcs_rendering_beam.png   739,21,743,18
    PNG Two Pixels Should Not Have Matched RGBA    wcs_rendering_beam.png   739,21,741,19

    # border
    # BUG?: border rgba is rendered as (16,22,26,255). It is not pure black
    PNG Pixel XY Should Match RGBA    wcs_rendering_border.png    441,357,16,22,26,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_border.png    758,4,16,22,26,255

    # colorbar
    #  border
    PNG Pixel XY Should Match RGBA    wcs_rendering_colorbar.png    41,41,194,48,48,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_colorbar.png    441,41,194,48,48,255
    #  tick
    PNG Pixel XY Should Match RGBA    wcs_rendering_colorbar.png    106,53,255,255,255,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_colorbar.png    464,53,255,255,255,255
    #  tick value
    PNG Pixel XY Should Match RGBA    wcs_rendering_colorbar.png    95,33,191,115,38,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_colorbar.png    453,33,191,115,38,255
    #  label
    PNG Pixel XY Should Match RGBA    wcs_rendering_colorbar.png    261,6,13,128,80,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_colorbar.png    625,6,13,128,80,255

    # grid
    #  grid gap
    PNG Pixel XY Should Match RGBA    wcs_rendering_grid_gap.png    204,184,194,48,48,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_grid_gap.png    637,184,194,48,48,255
    #  usual grid
    PNG Pixel XY Should Match RGBA    wcs_rendering_grid.png    122,201,194,48,48,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_grid.png    522,201,194,48,48,255

    # labels
    PNG Pixel XY Should Match RGBA    wcs_rendering_labels.png    22,229,194,48,48,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_labels.png    609,375,194,48,48,255

    # numbers
    PNG Pixel XY Should Match RGBA    wcs_rendering_numbers.png    51,107,16,22,26,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_numbers.png    626,358,16,22,26,255

    # ticks
    PNG Pixel XY Should Match RGBA    wcs_rendering_ticks.png    72,179,255,255,255,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_ticks.png    776,332,255,255,255,255

    # title
    PNG Pixel XY Should Match RGBA    wcs_rendering_title.png    325,18,16,22,26,255
    PNG Pixel XY Should Match RGBA    wcs_rendering_title.png    725,18,16,22,26,255


    Remove Files    wcs_rendering_beam.png    wcs_rendering_border.png    wcs_rendering_colorbar.png    wcs_rendering_global.png
    Remove Files    wcs_rendering_global_interior_axes.png    wcs_rendering_grid.png    wcs_rendering_grid_gap.png
    Remove Files    wcs_rendering_labels.png    wcs_rendering_numbers.png    wcs_rendering_ticks.png    wcs_rendering_title.png
    [Teardown]    Terminate carta_backend