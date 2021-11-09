*** Settings ***
Documentation     Request image file info and check the content
Resource          ../resource.robot

*** Test Cases ***
File Info Of A Regular FITS Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Wait Until Page Contains Element    ${FITS_M17_SWex}    timeout=2
    Click Element    ${FITS_M17_SWex}
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Sleep    1
    Element Should Contain    ${FILE_INFO_TEXT}    Name \= M17_SWex.fits
    Element Should Contain    ${FILE_INFO_TEXT}    HDU \= 0
    Element Should Contain    ${FILE_INFO_TEXT}    Shape \= [640, 800, 25, 1]
    Element Should Contain    ${FILE_INFO_TEXT}    Number of channels \= 25
    Element Should Contain    ${FILE_INFO_TEXT}    Number of polarizations \= 1
    Element Should Contain    ${FILE_INFO_TEXT}    Coordinate type \= Right Ascension, Declination
    Element Should Contain    ${FILE_INFO_TEXT}    Projection \= SIN
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference pixels \= [321, 401]
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference coords \= [18:20:21.0000, -016.12.10.0000]
    Element Should Contain    ${FILE_INFO_TEXT}    Image ref coords (deg) \= [275.088 deg, -16.2028 deg]
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel increment \= -0.4", 0.4"
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel unit \= Jy/beam
    Element Should Contain    ${FILE_INFO_TEXT}    Celestial frame \= ICRS
    Element Should Contain    ${FILE_INFO_TEXT}    Spectral frame \= LSRK
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity definition \= RADIO
    Element Should Contain    ${FILE_INFO_TEXT}    Restoring beam \= 2.06105" X 1.49126", -74.6267 deg
    Sleep    1
    [Teardown]    Kill carta_backend And Close Browser

File Info Of A Regular CASA Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Wait Until Page Contains Element    ${CASA_M17_SWex}    timeout=2
    Click Element    ${CASA_M17_SWex}
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Sleep    1
    Element Should Contain    ${FILE_INFO_TEXT}    Name \= M17_SWex.image
    Element Should Contain    ${FILE_INFO_TEXT}    Shape \= [640, 800, 25, 1]
    Element Should Contain    ${FILE_INFO_TEXT}    Number of channels \= 25
    Element Should Contain    ${FILE_INFO_TEXT}    Number of polarizations \= 1
    Element Should Contain    ${FILE_INFO_TEXT}    Coordinate type \= Right Ascension, Declination
    Element Should Contain    ${FILE_INFO_TEXT}    Projection \= SIN
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference pixels \= [321, 401]
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference coords \= [18:20:21.0000, -016.12.10.0000]
    Element Should Contain    ${FILE_INFO_TEXT}    Image ref coords (deg) \= [275.088 deg, -16.2028 deg]
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel increment \= -0.4", 0.4"
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel unit \= Jy/beam
    Element Should Contain    ${FILE_INFO_TEXT}    Celestial frame \= ICRS
    Element Should Contain    ${FILE_INFO_TEXT}    Spectral frame \= LSRK
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity definition \= RADIO
    Element Should Contain    ${FILE_INFO_TEXT}    Restoring beam \= 2.06105" X 1.49126", -74.6267 deg
    Sleep    1
    [Teardown]    Kill carta_backend And Close Browser

File Info Of A Regular HDF5 Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Wait Until Page Contains Element    ${HDF5_M17_SWex}    timeout=2
    Click Element    ${HDF5_M17_SWex}
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Sleep    1
    Element Should Contain    ${FILE_INFO_TEXT}    Name \= M17_SWex.hdf5
    Element Should Contain    ${FILE_INFO_TEXT}    Shape \= [640, 800, 25, 1]
    Element Should Contain    ${FILE_INFO_TEXT}    Number of channels \= 25
    Element Should Contain    ${FILE_INFO_TEXT}    Number of polarizations \= 1
    Element Should Contain    ${FILE_INFO_TEXT}    Coordinate type \= Right Ascension, Declination
    Element Should Contain    ${FILE_INFO_TEXT}    Projection \= SIN
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference pixels \= [321, 401]
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference coords \= [18:20:21.0000, -016.12.10.0000]
    Element Should Contain    ${FILE_INFO_TEXT}    Image ref coords (deg) \= [275.088 deg, -16.2028 deg]
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel increment \= -0.4", 0.4"
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel unit \= Jy/beam
    Element Should Contain    ${FILE_INFO_TEXT}    Celestial frame \= ICRS
    Element Should Contain    ${FILE_INFO_TEXT}    Spectral frame \= LSRK
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity definition \= RADIO
    Element Should Contain    ${FILE_INFO_TEXT}    Restoring beam \= 2.06105" X 1.49126", -74.6267 deg
    Element Should Contain    ${FILE_INFO_TEXT}    Has mipmaps \= T
    Sleep    1
    [Teardown]    Kill carta_backend And Close Browser

File Info Of A Regular MIRIAD Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Wait Until Page Contains Element    ${MIRIAD_M17_SWex}    timeout=2
    Click Element    ${MIRIAD_M17_SWex}
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Sleep    1
    Element Should Contain    ${FILE_INFO_TEXT}    Name \= M17_SWex.miriad
    Element Should Contain    ${FILE_INFO_TEXT}    Shape \= [640, 800, 25, 1]
    Element Should Contain    ${FILE_INFO_TEXT}    Number of channels \= 25
    Element Should Contain    ${FILE_INFO_TEXT}    Number of polarizations \= 1
    Element Should Contain    ${FILE_INFO_TEXT}    Coordinate type \= Right Ascension, Declination
    Element Should Contain    ${FILE_INFO_TEXT}    Projection \= SIN
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference pixels \= [321, 401]
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference coords \= [18:20:21.0000, -016.12.10.0000]
    Element Should Contain    ${FILE_INFO_TEXT}    Image ref coords (deg) \= [275.088 deg, -16.2028 deg]
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel increment \= -0.4", 0.4"
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel unit \= Jy/beam
    Element Should Contain    ${FILE_INFO_TEXT}    Celestial frame \= FK5, J2000
    Element Should Contain    ${FILE_INFO_TEXT}    Spectral frame \= BARY
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity definition \= RADIO
    Element Should Contain    ${FILE_INFO_TEXT}    Restoring beam \= 2.06105" X 1.49126", -74.6267 deg
    Sleep    1
    [Teardown]    Kill carta_backend And Close Browser

# TODO: add tests for PV and UV images and other CASA varients