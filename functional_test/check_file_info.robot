*** Settings ***
Documentation     Request image file info and check the content
Resource          ../resource.robot

*** Test Cases ***
File Info Of A Regular FITS Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    M17_SWex.fits
    Sleep    0.2
    Wait Until Page Contains Element    xpath://*[contains(text(), "M17_SWex.fits")]    timeout=2
    Click Element    xpath://*[contains(text(), "M17_SWex.fits")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Set Selenium Speed    0.02
    Element Should Contain    ${FILE_INFO_TEXT}    Name \= M17_SWex.fits
    Element Should Contain    ${FILE_INFO_TEXT}    HDU \= 0
    Element Should Contain    ${FILE_INFO_TEXT}    Data type \= float
    Element Should Contain    ${FILE_INFO_TEXT}    Shape \= [640, 800, 25, 1] (RA, DEC, FREQ, STOKES)
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
    Element Should Contain    ${FILE_INFO_TEXT}    RA range \= [18:20:12.139, 18:20:29.888]
    Element Should Contain    ${FILE_INFO_TEXT}    DEC range \= [-16.14.49.989, -16.09.30.388]
    Element Should Contain    ${FILE_INFO_TEXT}    Frequency range \= [86.7514, 86.7455] (GHz)
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity range \= [10.0000, 30.2560] (km/s)
    Element Should Contain    ${FILE_INFO_TEXT}    Stokes coverage \= [I]
    [Teardown]    Kill carta_backend And Close Browser

File Info Of A Regular CASA Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    M17_SWex.image
    Sleep    0.2
    Wait Until Page Contains Element    xpath://*[contains(text(), "M17_SWex.image")]    timeout=2
    Click Element    xpath://*[contains(text(), "M17_SWex.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Set Selenium Speed    0.02
    Element Should Contain    ${FILE_INFO_TEXT}    Name \= M17_SWex.image
    Element Should Contain    ${FILE_INFO_TEXT}    Data type \= float
    Element Should Contain    ${FILE_INFO_TEXT}    Shape \= [640, 800, 25, 1] (RA, DEC, FREQ, STOKES)
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
    Element Should Contain    ${FILE_INFO_TEXT}    RA range \= [18:20:12.139, 18:20:29.888]
    Element Should Contain    ${FILE_INFO_TEXT}    DEC range \= [-16.14.49.989, -16.09.30.388]
    Element Should Contain    ${FILE_INFO_TEXT}    Frequency range \= [86.7514, 86.7455] (GHz)
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity range \= [10.0000, 30.2560] (km/s)
    Element Should Contain    ${FILE_INFO_TEXT}    Stokes coverage \= [I]
    [Teardown]    Kill carta_backend And Close Browser

File Info Of A Regular HDF5 Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    M17_SWex.hdf5
    Sleep    0.2
    Wait Until Page Contains Element    xpath://*[contains(text(), "M17_SWex.hdf5")]    timeout=2
    Click Element    xpath://*[contains(text(), "M17_SWex.hdf5")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Set Selenium Speed    0.02
    Element Should Contain    ${FILE_INFO_TEXT}    Name \= M17_SWex.hdf5
    Element Should Contain    ${FILE_INFO_TEXT}    HDU \= 0
    Element Should Contain    ${FILE_INFO_TEXT}    Data type \= float
    Element Should Contain    ${FILE_INFO_TEXT}    Shape \= [640, 800, 25, 1] (RA, DEC, FREQ, STOKES)
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
    Element Should Contain    ${FILE_INFO_TEXT}    RA range \= [18:20:12.139, 18:20:29.888]
    Element Should Contain    ${FILE_INFO_TEXT}    DEC range \= [-16.14.49.989, -16.09.30.388]
    Element Should Contain    ${FILE_INFO_TEXT}    Frequency range \= [86.7514, 86.7455] (GHz)
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity range \= [10.0000, 30.2560] (km/s)
    Element Should Contain    ${FILE_INFO_TEXT}    Stokes coverage \= [I]
    Scroll Element Into View    //*[@id="root"]/div/div[7]/div[1]/div/div[2]/div/div[3]/div[1]/div[2]/div/div[2]/div/div/div[22]
    Element Should Contain    ${FILE_INFO_TEXT}    Has mipmaps \= T
    [Teardown]    Kill carta_backend And Close Browser

File Info Of A Regular MIRIAD Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    M17_SWex.miriad
    Sleep    0.2
    Wait Until Page Contains Element    xpath://*[contains(text(), "M17_SWex.miriad")]    timeout=2
    Click Element    xpath://*[contains(text(), "M17_SWex.miriad")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Set Selenium Speed    0.02
    Element Should Contain    ${FILE_INFO_TEXT}    Name \= M17_SWex.miriad
    Element Should Contain    ${FILE_INFO_TEXT}    Data type \= float
    Element Should Contain    ${FILE_INFO_TEXT}    Shape \= [640, 800, 25, 1] (RA, DEC, FREQ, STOKES)
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
    Element Should Contain    ${FILE_INFO_TEXT}    RA range \= [18:20:12.139, 18:20:29.888]
    Element Should Contain    ${FILE_INFO_TEXT}    DEC range \= [-16.14.49.989, -16.09.30.388]
    Element Should Contain    ${FILE_INFO_TEXT}    Frequency range \= [86.7514, 86.7455] (GHz)
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity range \= [10.0000, 30.2560] (km/s)
    Element Should Contain    ${FILE_INFO_TEXT}    Stokes coverage \= [I]
    [Teardown]    Kill carta_backend And Close Browser


File Info Of A CASA Complex Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    complex.image
    Sleep    0.2
    Wait Until Page Contains Element    xpath://*[contains(text(), "complex.image")]    timeout=2
    Click Element    xpath://*[contains(text(), "complex.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Set Selenium Speed    0.02
    Element Should Contain    ${FILE_INFO_TEXT}    Name \= complex.image
    Element Should Contain    ${FILE_INFO_TEXT}    Data type \= Complex
    Element Should Contain    ${FILE_INFO_TEXT}    Shape \= [100, 100, 1, 10] (RA, DEC, STOKES, FREQ)
    Element Should Contain    ${FILE_INFO_TEXT}    Number of channels \= 10
    Element Should Contain    ${FILE_INFO_TEXT}    Number of polarizations \= 1
    Element Should Contain    ${FILE_INFO_TEXT}    Coordinate type \= Right Ascension, Declination
    Element Should Contain    ${FILE_INFO_TEXT}    Projection \= SIN
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference pixels \= [51, 51]
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference coords \= [01:20:00.0000, +020.00.00.0000]
    Element Should Contain    ${FILE_INFO_TEXT}    Image ref coords (deg) \= [20 deg, 20 deg]
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel increment \= -10", 10"
    Element Should Contain    ${FILE_INFO_TEXT}    Celestial frame \= FK5, J2000
    Element Should Contain    ${FILE_INFO_TEXT}    Spectral frame \= LSRK
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity definition \= RADIO
    Element Should Contain    ${FILE_INFO_TEXT}    RA range \= [01:19:25.207, 01:20:35.503]
    Element Should Contain    ${FILE_INFO_TEXT}    DEC range \= [+19.51.39.779, +20.08.09.788]
    Element Should Contain    ${FILE_INFO_TEXT}    Frequency range \= [1.0000, 1.9000] (GHz)
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity range \= [88671.0087, -101338.2957] (km/s)
    Element Should Contain    ${FILE_INFO_TEXT}    Stokes coverage \= [I]
    [Teardown]    Kill carta_backend And Close Browser


File Info Of A CASA PV Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    casa_pv.image
    Sleep    0.2
    Wait Until Page Contains Element    xpath://*[contains(text(), "casa_pv.image")]    timeout=2
    Click Element    xpath://*[contains(text(), "casa_pv.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Set Selenium Speed    0.02
    Element Should Contain    ${FILE_INFO_TEXT}    Name \= casa_pv.image
    Element Should Contain    ${FILE_INFO_TEXT}    Data type \= float
    Element Should Contain    ${FILE_INFO_TEXT}    Shape \= [201, 250, 1] (OFFSET, FREQ, STOKES)
    Element Should Contain    ${FILE_INFO_TEXT}    Number of channels \= 250
    Element Should Contain    ${FILE_INFO_TEXT}    Number of polarizations \= 1
    Element Should Contain    ${FILE_INFO_TEXT}    Coordinate type \= Offset, Frequency
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference pixels \= [101, 1]
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference coords \= [0 arcsec, 2.30512e+11 Hz]
    Element Should Contain    ${FILE_INFO_TEXT}    Image ref coords (deg) \= [0 deg, 2.30512e+11 Hz]
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel increment \= 0.05", 244126 Hz
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel unit \= Jy/beam
    Element Should Contain    ${FILE_INFO_TEXT}    Spectral frame \= LSRK
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity definition \= RADIO
    Element Should Contain    ${FILE_INFO_TEXT}    Restoring beam \= 0.678423" X 0.551015", 72.5103 deg
    Element Should Contain    ${FILE_INFO_TEXT}    Frequency range \= [230.5121, 230.5729] (GHz)
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity range \= [33.7063, -45.3419] (km/s)
    Element Should Contain    ${FILE_INFO_TEXT}    Stokes coverage \= [I]
    [Teardown]    Kill carta_backend And Close Browser


File Info Of A FITS PV Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    carta_pv.fits
    Sleep    0.2
    Wait Until Page Contains Element    xpath://*[contains(text(), "carta_pv.fits")]    timeout=2
    Click Element    xpath://*[contains(text(), "carta_pv.fits")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Set Selenium Speed    0.02
    Element Should Contain    ${FILE_INFO_TEXT}    Name \= carta_pv.fits
    Element Should Contain    ${FILE_INFO_TEXT}    HDU \= 0
    Element Should Contain    ${FILE_INFO_TEXT}    Data type \= float
    Element Should Contain    ${FILE_INFO_TEXT}    Shape \= [199, 250, 1] (OFFSET, FREQ, STOKES)
    Element Should Contain    ${FILE_INFO_TEXT}    Number of channels \= 250
    Element Should Contain    ${FILE_INFO_TEXT}    Number of polarizations \= 1
    Element Should Contain    ${FILE_INFO_TEXT}    Coordinate type \= OFFSET, FREQ
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference pixels \= [100, 1]
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference coords \= [0 arcsec, 2.30512e+11 Hz]
    Element Should Contain    ${FILE_INFO_TEXT}    Image ref coords (deg) \= [0 deg, 2.30512e+11 Hz]
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel increment \= 0.0497487", 244126 Hz
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel unit \= Jy/beam
    Element Should Contain    ${FILE_INFO_TEXT}    Spectral frame \= LSRK
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity definition \= RADIO
    Element Should Contain    ${FILE_INFO_TEXT}    Restoring beam \= 0.678423" X 0.551015", 72.5103 deg
    Element Should Contain    ${FILE_INFO_TEXT}    Frequency range \= [230.5121, 230.5729] (GHz)
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity range \= [33.7063, -45.3419] (km/s)
    Element Should Contain    ${FILE_INFO_TEXT}    Stokes coverage \= [I]
    [Teardown]    Kill carta_backend And Close Browser


File Info Of A fz FITS Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    tu2310418.fits.fz
    Sleep    0.2
    Wait Until Page Contains Element    xpath://*[contains(text(), "tu2310418.fits.fz")]    timeout=2
    Click Element    xpath://*[contains(text(), "tu2310418.fits.fz")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Set Selenium Speed    0.02
    Element Should Contain    ${FILE_INFO_TEXT}    Name \= tu2310418.fits.fz
    Element Should Contain    ${FILE_INFO_TEXT}    HDU \= 1
    Element Should Contain    ${FILE_INFO_TEXT}    Data type \= float
    Element Should Contain    ${FILE_INFO_TEXT}    Shape \= [4536, 4934] (RA, DEC)
    Element Should Contain    ${FILE_INFO_TEXT}    Coordinate type \= Right Ascension, Declination
    Element Should Contain    ${FILE_INFO_TEXT}    Projection \= TAN
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference pixels \= [4820, 1107]
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference coords \= [13:27:47.9880, +047.00.00.0000]
    Element Should Contain    ${FILE_INFO_TEXT}    Image ref coords (deg) \= [201.95 deg, 47 deg]
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel increment \= -0.5", 0.5"
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel unit \= counts/s
    Element Should Contain    ${FILE_INFO_TEXT}    Celestial frame \= FK5, J2000
    Element Should Contain    ${FILE_INFO_TEXT}    RA range \= [13:28:01.829, 13:31:45.864]
    Element Should Contain    ${FILE_INFO_TEXT}    DEC range \= [+46.50.31.993, +47.31.53.392]
    [Teardown]    Kill carta_backend And Close Browser


File Info Of A gz FITS Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    tu2310418.fits.gz
    Sleep    0.2
    Wait Until Page Contains Element    xpath://*[contains(text(), "tu2310418.fits.gz")]    timeout=2
    Click Element    xpath://*[contains(text(), "tu2310418.fits.gz")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Set Selenium Speed    0.02
    Element Should Contain    ${FILE_INFO_TEXT}    Name \= tu2310418.fits.gz
    Element Should Contain    ${FILE_INFO_TEXT}    HDU \= 0
    Element Should Contain    ${FILE_INFO_TEXT}    Data type \= float
    Element Should Contain    ${FILE_INFO_TEXT}    Shape \= [4536, 4934] (RA, DEC)
    Element Should Contain    ${FILE_INFO_TEXT}    Coordinate type \= Right Ascension, Declination
    Element Should Contain    ${FILE_INFO_TEXT}    Projection \= TAN
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference pixels \= [4820, 1107]
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference coords \= [13:27:47.9880, +047.00.00.0000]
    Element Should Contain    ${FILE_INFO_TEXT}    Image ref coords (deg) \= [201.95 deg, 47 deg]
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel increment \= -0.5", 0.5"
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel unit \= counts/s
    Element Should Contain    ${FILE_INFO_TEXT}    Celestial frame \= FK5, J2000
    Element Should Contain    ${FILE_INFO_TEXT}    RA range \= [13:28:01.829, 13:31:45.864]
    Element Should Contain    ${FILE_INFO_TEXT}    DEC range \= [+46.50.31.993, +47.31.53.392]
    [Teardown]    Kill carta_backend And Close Browser


File Info Of A CASA UV Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    UVamp.image
    Sleep    0.2
    Wait Until Page Contains Element    xpath://*[contains(text(), "UVamp.image")]    timeout=2
    Click Element    xpath://*[contains(text(), "UVamp.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Set Selenium Speed    0.02
    Element Should Contain    ${FILE_INFO_TEXT}    Name \= UVamp.image
    Element Should Contain    ${FILE_INFO_TEXT}    Data type \= float
    Element Should Contain    ${FILE_INFO_TEXT}    Shape \= [300, 300, 5] (UU, VV, FREQ)
    Element Should Contain    ${FILE_INFO_TEXT}    Number of channels \= 5
    Element Should Contain    ${FILE_INFO_TEXT}    Coordinate type \= UU, VV
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference pixels \= [151, 151]
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference coords \= [0 lambda, 0 lambda]
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel increment \= -1718.87 lambda, 1718.87 lambda
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel unit \= Jy/beam
    Element Should Contain    ${FILE_INFO_TEXT}    Spectral frame = LSRK
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity definition \= RADIO
    Element Should Contain    ${FILE_INFO_TEXT}    Median area beam \= 2.92354" X 1.76939", -17.8188 deg
    Element Should Contain    ${FILE_INFO_TEXT}    Frequency range \= [36.3937, 36.3942] (GHz)
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity range \= [-11.6115, -15.7309] (km/s)
    [Teardown]    Kill carta_backend And Close Browser


File Info Of A Stokes Image
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Input Text    ${FILE_FILTER}    IRCp10216_sci.spw0.cube.IQUV.manual.pbcor.fits
    Sleep    0.2
    Wait Until Page Contains Element    xpath://*[contains(text(), "IRCp10216_sci.spw0.cube.IQUV.manual.pbcor.fits")]    timeout=2
    Click Element    xpath://*[contains(text(), "IRCp10216_sci.spw0.cube.IQUV.manual.pbcor.fits")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Set Selenium Speed    0.02
    Element Should Contain    ${FILE_INFO_TEXT}    Name \= IRCp10216_sci.spw0.cube.IQUV.manual.pbcor.fits
    Element Should Contain    ${FILE_INFO_TEXT}    HDU \= 0
    Element Should Contain    ${FILE_INFO_TEXT}    Data type \= float
    Element Should Contain    ${FILE_INFO_TEXT}    Shape \= [256, 256, 480, 4] (RA, DEC, FREQ, STOKES)
    Element Should Contain    ${FILE_INFO_TEXT}    Number of channels \= 480
    Element Should Contain    ${FILE_INFO_TEXT}    Number of polarizations \= 4
    Element Should Contain    ${FILE_INFO_TEXT}    Coordinate type \= Right Ascension, Declination
    Element Should Contain    ${FILE_INFO_TEXT}    Projection \= SIN
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference pixels \= [129, 129]
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference coords \= [09:47:57.4891, +013.16.44.0806]
    Element Should Contain    ${FILE_INFO_TEXT}    Image ref coords (deg) \= [146.99 deg, 13.2789 deg]
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel increment \= -0.18", 0.18"
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel unit \= Jy/beam
    Element Should Contain    ${FILE_INFO_TEXT}    Celestial frame \= ICRS
    Element Should Contain    ${FILE_INFO_TEXT}    Spectral frame \= LSRK
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity definition \= RADIO
    Element Should Contain    ${FILE_INFO_TEXT}    Median area beam \= 0.929399" X 0.841518", 42.6921 deg
    Element Should Contain    ${FILE_INFO_TEXT}    RA range \= [09:47:55.923, 09:47:59.067]
    Element Should Contain    ${FILE_INFO_TEXT}    DEC range \= [+13.16.21.040, +13.17.06.940]
    Element Should Contain    ${FILE_INFO_TEXT}    Frequency range \= [344.0913, 345.9626] (GHz)
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity range \= [789.6327, -836.4766] (km/s)
    Element Should Contain    ${FILE_INFO_TEXT}    Stokes coverage \= [I, Q, U, V]
    [Teardown]    Kill carta_backend And Close Browser


File Info Of Swapped-Axes Cubes
    [Setup]    Setup carta_backend And Open Browser To CARTA
    # case 1: STOKES-GLON-FREQ-GLAT
    Input Text    ${FILE_FILTER}    gaussian_array_large_GALACTIC_2031.image
    Sleep    0.2
    Wait Until Page Contains Element    xpath://*[contains(text(), "gaussian_array_large_GALACTIC_2031.image")]    timeout=2    
    Click Element    xpath://*[contains(text(), "gaussian_array_large_GALACTIC_2031.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Set Selenium Speed    0.02
    Element Should Contain    ${FILE_INFO_TEXT}    Name \= gaussian_array_large_GALACTIC_2031.image
    Element Should Contain    ${FILE_INFO_TEXT}    Data type \= float
    Element Should Contain    ${FILE_INFO_TEXT}    Shape \= [4, 746, 10, 746] (STOKES, GLON, FREQ, GLAT)
    Element Should Contain    ${FILE_INFO_TEXT}    Number of channels \= 10
    Element Should Contain    ${FILE_INFO_TEXT}    Number of polarizations \= 4
    Element Should Contain    ${FILE_INFO_TEXT}    Coordinate type \= Longitude, Frequency
    Element Should Contain    ${FILE_INFO_TEXT}    Projection \= SIN
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference pixels \= [374, 6]
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference coords \= [-132.27.25.3488, 1.4204e+09 Hz]
    Element Should Contain    ${FILE_INFO_TEXT}    Image ref coords (deg) \= [-132.457 deg, 1.4204e+09 Hz]
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel increment \= -360", 100000 Hz
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel unit \= Jy/pixel
    Element Should Contain    ${FILE_INFO_TEXT}    Celestial frame \= GALACTIC
    Element Should Contain    ${FILE_INFO_TEXT}    Spectral frame \= LSRK
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity definition \= RADIO
    Element Should Contain    ${FILE_INFO_TEXT}    LON range \= [120.617836, 334.586718]
    Element Should Contain    ${FILE_INFO_TEXT}    LAT range \= [-9.535745, 47.261148]
    Element Should Contain    ${FILE_INFO_TEXT}    Frequency range \= [1.4199, 1.4208] (GHz)
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity range \= [106.7445, -83.2105] (km/s)
    Element Should Contain    ${FILE_INFO_TEXT}    Stokes coverage \= [I, Q, U, V]
    Set Selenium Speed    0.2
    # case 2: DEC-STOKES-FREQ-RA
    Input Text    ${FILE_FILTER}    gaussian_array_large_1230.image
    Sleep    0.2
    Wait Until Page Contains Element    xpath://*[contains(text(), "gaussian_array_large_1230.image")]    timeout=2    
    Click Element    xpath://*[contains(text(), "gaussian_array_large_1230.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Set Selenium Speed    0.02
    Element Should Contain    ${FILE_INFO_TEXT}    Name \= gaussian_array_large_1230.image
    Element Should Contain    ${FILE_INFO_TEXT}    Data type \= float
    Element Should Contain    ${FILE_INFO_TEXT}    Shape \= [550, 4, 10, 550] (DEC, STOKES, FREQ, RA)
    Element Should Contain    ${FILE_INFO_TEXT}    Number of channels \= 10
    Element Should Contain    ${FILE_INFO_TEXT}    Number of polarizations \= 4
    Element Should Contain    ${FILE_INFO_TEXT}    Coordinate type \= Declination, Frequency
    Element Should Contain    ${FILE_INFO_TEXT}    Projection \= SIN
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference pixels \= [276, 6]
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference coords \= [+010.00.00.0000, 1.4204e+09 Hz]
    Element Should Contain    ${FILE_INFO_TEXT}    Image ref coords (deg) \= [10 deg, 1.4204e+09 Hz]
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel increment \= 360", 100000 Hz
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel unit \= Jy/pixel
    Element Should Contain    ${FILE_INFO_TEXT}    Celestial frame \= FK5, J2000
    Element Should Contain    ${FILE_INFO_TEXT}    Spectral frame \= LSRK
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity definition \= RADIO
    Element Should Contain    ${FILE_INFO_TEXT}    RA range \= [07:33:20.277, 12:27:15.226]
    Element Should Contain    ${FILE_INFO_TEXT}    DEC range \= [-20.11.28.681, +36.47.19.899]
    Element Should Contain    ${FILE_INFO_TEXT}    Frequency range \= [1.4199, 1.4208] (GHz)
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity range \= [106.7445, -83.2105] (km/s)
    Element Should Contain    ${FILE_INFO_TEXT}    Stokes coverage \= [I, Q, U, V]
    Set Selenium Speed    0.2    
    # case 3: FREQ-RA-STOKES-DEC
    Input Text    ${FILE_FILTER}    gaussian_array_large_3021.image
    Sleep    0.2
    Wait Until Page Contains Element    xpath://*[contains(text(), "gaussian_array_large_3021.image")]    timeout=2    
    Click Element    xpath://*[contains(text(), "gaussian_array_large_3021.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Set Selenium Speed    0.02
    Element Should Contain    ${FILE_INFO_TEXT}    Name \= gaussian_array_large_3021.image
    Element Should Contain    ${FILE_INFO_TEXT}    Data type \= float
    Element Should Contain    ${FILE_INFO_TEXT}    Shape \= [10, 550, 4, 550] (FREQ, RA, STOKES, DEC)
    Element Should Contain    ${FILE_INFO_TEXT}    Number of channels \= 10
    Element Should Contain    ${FILE_INFO_TEXT}    Number of polarizations \= 4
    Element Should Contain    ${FILE_INFO_TEXT}    Coordinate type \= Frequency, Right Ascension
    Element Should Contain    ${FILE_INFO_TEXT}    Projection \= SIN
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference pixels \= [6, 276]
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference coords \= [1.4204e+09 Hz, 10:00:00.0000]
    Element Should Contain    ${FILE_INFO_TEXT}    Image ref coords (deg) \= [1.4204e+09 Hz, 150 deg]
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel increment \= 100000 Hz, -360"
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel unit \= Jy/pixel
    Element Should Contain    ${FILE_INFO_TEXT}    Celestial frame \= FK5, J2000
    Element Should Contain    ${FILE_INFO_TEXT}    Spectral frame \= LSRK
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity definition \= RADIO
    Element Should Contain    ${FILE_INFO_TEXT}    RA range \= [07:33:20.277, 12:27:15.226]
    Element Should Contain    ${FILE_INFO_TEXT}    DEC range \= [-20.11.28.681, +36.47.19.899]
    Element Should Contain    ${FILE_INFO_TEXT}    Frequency range \= [1.4199, 1.4208] (GHz)
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity range \= [106.7445, -83.2105] (km/s)
    Element Should Contain    ${FILE_INFO_TEXT}    Stokes coverage \= [I, Q, U, V]
    Set Selenium Speed    0.2        
    # case 4: FREQ-GLAT-GLON-STOKES
    Input Text    ${FILE_FILTER}    gaussian_array_large_GALACTIC_3102.image
    Sleep    0.2
    Wait Until Page Contains Element    xpath://*[contains(text(), "gaussian_array_large_GALACTIC_3102.image")]    timeout=2    
    Click Element    xpath://*[contains(text(), "gaussian_array_large_GALACTIC_3102.image")]
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Set Selenium Speed    0.02
    Element Should Contain    ${FILE_INFO_TEXT}    Name \= gaussian_array_large_GALACTIC_3102.image
    Element Should Contain    ${FILE_INFO_TEXT}    Data type \= float
    Element Should Contain    ${FILE_INFO_TEXT}    Shape \= [10, 746, 746, 4] (FREQ, GLAT, GLON, STOKES)
    Element Should Contain    ${FILE_INFO_TEXT}    Number of channels \= 10
    Element Should Contain    ${FILE_INFO_TEXT}    Number of polarizations \= 4
    Element Should Contain    ${FILE_INFO_TEXT}    Coordinate type \= Frequency, Latitude
    Element Should Contain    ${FILE_INFO_TEXT}    Projection \= SIN
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference pixels \= [6, 373]
    Element Should Contain    ${FILE_INFO_TEXT}    Image reference coords \= [1.4204e+09 Hz, +046.11.28.2950]
    Element Should Contain    ${FILE_INFO_TEXT}    Image ref coords (deg) \= [1.4204e+09 Hz, 46.1912 deg]
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel increment \= 100000 Hz, 360"
    Element Should Contain    ${FILE_INFO_TEXT}    Pixel unit \= Jy/pixel
    Element Should Contain    ${FILE_INFO_TEXT}    Celestial frame \= GALACTIC
    Element Should Contain    ${FILE_INFO_TEXT}    Spectral frame \= LSRK
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity definition \= RADIO
    Element Should Contain    ${FILE_INFO_TEXT}    LON range \= [120.617836, 334.586718]
    Element Should Contain    ${FILE_INFO_TEXT}    LAT range \= [-9.535745, 47.261148]
    Element Should Contain    ${FILE_INFO_TEXT}    Frequency range \= [1.4199, 1.4208] (GHz)
    Element Should Contain    ${FILE_INFO_TEXT}    Velocity range \= [106.7445, -83.2105] (km/s)
    Element Should Contain    ${FILE_INFO_TEXT}    Stokes coverage \= [I, Q, U, V]
    Set Selenium Speed    0.2
    [Teardown]    Kill carta_backend And Close Browser
