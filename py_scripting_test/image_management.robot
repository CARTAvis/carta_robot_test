*** Settings ***
Documentation     Test image management with the python scripting interface
Resource          ../resource.robot
Library          test_image_management.py

*** Test Cases ***
Load FITS Image
    [Setup]    Run carta_backend
    ${result}=    test_image_management.load_fits_image
    Should Be Equal    ${result}    Done
    PNG Images Should Be Different    load_fits_image_0.png    load_fits_image_1.png
    Remove Files    load_fits_image_0.png    load_fits_image_1.png
    [Teardown]    Terminate carta_backend

Load FITS Image With HDUs
    [Setup]    Run carta_backend
    ${result}=    test_image_management.load_fits_image_with_HDUs
    Should Be Equal    ${result}    error
    [Teardown]    Terminate carta_backend

Load Compressed FITS Image
    [Setup]    Run carta_backend
    ${result}=    test_image_management.load_compressed_fits_image
    Should Be Equal    ${result}    Done
    PNG Images Should Be Identical    load_fz_fits.png    load_gz_fits.png
    Remove Files    load_fz_fits.png    load_gz_fits.png
    [Teardown]    Terminate carta_backend

Load Complex Image
    [Setup]    Run carta_backend
    Pass Execution    Not yet fully supported in the python scripting interface
    ${result}=    test_image_management.load_complex_image
    Should Be Equal    ${result}    Done
    [Teardown]    Terminate carta_backend

Load Stokes Hypercube
    [Setup]    Run carta_backend
    Pass Execution    Not yet supported in the python scripting interface
    ${result}=    test_image_management.load_Stokes_hypercube
    Should Be Equal    ${result}    Done
    [Teardown]    Terminate carta_backend

Load LEL Image
    [Setup]    Run carta_backend
    Pass Execution    Not yet supported in the python scripting interface
    ${result}=    test_image_management.load_image_with_LEL
    Should Be Equal    ${result}    Done
    [Teardown]    Terminate carta_backend