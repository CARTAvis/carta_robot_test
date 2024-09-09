*** Settings ***
Documentation     Test image management with the python scripting interface
Resource          ../resource.robot
Library          test_image_management.py

*** Test Cases ***
Load And Append Images
    [Setup]    Run carta_backend
    ${result}=    test_image_management.load_and_append_images
    Should Be Equal    ${result}    Done
    PNG Two Pixels Should Have Matched RGBA    load_and_append_images.png    209,182,609,182
    PNG Two Pixels Should Have Matched RGBA    load_and_append_images.png    209,182,209,582
    PNG Two Pixels Should Have Matched RGBA    load_and_append_images.png    209,182,609,582
    PNG Two Pixels Should Have Matched RGBA    load_and_append_images.png    609,182,209,582
    PNG Two Pixels Should Have Matched RGBA    load_and_append_images.png    609,182,609,582
    PNG Two Pixels Should Have Matched RGBA    load_and_append_images.png    209,582,609,582
    Remove Files    load_and_append_images.png
    [Teardown]    Terminate carta_backend


Load Images
    [Setup]    Run carta_backend
    ${result}=    test_image_management.load_images
    Should Be Equal    ${result}    Done
    PNG Two Pixels Should Have Matched RGBA    load_images.png    209,182,609,182
    PNG Two Pixels Should Have Matched RGBA    load_images.png    209,182,209,582
    PNG Two Pixels Should Have Matched RGBA    load_images.png    209,182,609,582
    PNG Two Pixels Should Have Matched RGBA    load_images.png    609,182,209,582
    PNG Two Pixels Should Have Matched RGBA    load_images.png    609,182,609,582
    PNG Two Pixels Should Have Matched RGBA    load_images.png    209,582,609,582
    Remove Files    load_images.png
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
    ${result}=    test_image_management.load_complex_image
    Should Be Equal    ${result}    Done
    PNG Images Should Be Different    load_complex_image_amplitude.png    load_complex_image_phase.png
    PNG Images Should Be Different    load_complex_image_amplitude.png    load_complex_image_real.png
    PNG Images Should Be Different    load_complex_image_amplitude.png    load_complex_image_imaginary.png
    PNG Images Should Be Different    load_complex_image_phase.png    load_complex_image_real.png
    PNG Images Should Be Different    load_complex_image_phase.png    load_complex_image_imaginary.png
    PNG Images Should Be Different    load_complex_image_real.png    load_complex_image_imaginary.png
    Remove Files    load_complex_image_amplitude.png    load_complex_image_phase.png    load_complex_image_real.png    load_complex_image_imaginary.png
    [Teardown]    Terminate carta_backend

Load Stokes Hypercube
    [Setup]    Run carta_backend
    ${result}=    test_image_management.load_Stokes_hypercube
    Should Be Equal    ${result}    Done
    PNG Images Should Be Identical    plinear_0.png    plinear_1.png
    Remove Files    plinear_0.png    plinear_1.png
    [Teardown]    Terminate carta_backend

Load LEL Image
    [Setup]    Run carta_backend
    ${result}=    test_image_management.load_image_with_LEL
    Should Be Equal    ${result}    Done
    PNG Two Pixels Should Have Matched RGBA    load_LEL.png    150,132,751,132
    PNG Two Pixels Should Have Matched RGBA    load_LEL.png    396,78,696,78
    Remove Files    load_LEL.png
    [Teardown]    Terminate carta_backend


Check Image Meta Data
    [Setup]    Run carta_backend
    @{result}=    test_image_management.check_image_meta_data
    Should Be Equal    ${result}[0]    ${25}
    Should Be Equal As Strings   ${result}[1][-13:]    set_QA_e2e_v2
    Should Be Equal As Strings   ${result}[2]    IRCp10216_sci.spw0.cube.IQUV.manual.pbcor.fits
    Should Be Equal As Strings   ${result}[3]    sishii
    Should Be Equal    ${result}[4]    ${870}
    Should Be Equal    ${result}[5]    ${2}
    Should Be Equal    ${result}[6]    ${4}
    Should Be Equal    ${result}[7]    ${4}
    Should Be Equal    ${result}[8]    ${9}
    @{shape_list}=    Create List    ${1}    ${25}    ${800}   ${640}
    Should Be Equal    ${result}[9]    ${shape_list}
    Should Be Equal    ${result}[10]    ${True}
    Should Be Equal    ${result}[11]    ${640}
    [Teardown]    Terminate carta_backend

Check Matching
    [Setup]    Run carta_backend
    ${result}=    test_image_management.check_matching
    Should Be Equal    ${result}    Done
    PNG Two Pixels Should Have Matched RGBA    matching.png    209,172,656,248
    Remove Files    matching.png
    [Teardown]    Terminate carta_backend