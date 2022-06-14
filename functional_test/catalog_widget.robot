*** Settings ***
Documentation     Catalog file loading, sorting, filtering, and rendering tests
Resource          ../resource.robot

*** Test Cases ***
Load Catalog File In VOTable Format
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cosmos_spitzer3.6micron.fits
    Load Catalog File    cosmos_mega_simbad.xml
    # dock the catalog widget and close widgets to create more space
    Drag And Drop    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[4]    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[1]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li[1]/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li[1]/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li[1]/div
    Drag And Drop By Offset    //*[@id="root"]/div/div[15]/div[2]/div/div[2]    -200    0
    Set Selenium Speed    0.02
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/ul[1]/li[2]/span    Catalog : cosmos_mega_simbad.xml
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[1]/div[2]/div/span/span/div/button/span[1]    ICRS

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[3]/div/div[2]/div[2]/div/div/div/div[1]/div    TYPED_ID
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    string
    Checkbox Should Be Selected    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div/label/input
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    Raw identifier as typed in the query
   
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[3]/div/div[2]/div[2]/div/div/div/div[2]/div    ANG_DIST
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[5]/div    arcsec
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[6]/div    float
    Checkbox Should Be Selected    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[7]/div/label/input
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div    Angular distance from the center

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[3]/div/div[2]/div[2]/div/div/div/div[5]/div    RA_d
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[17]/div    deg
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[18]/div    double
    Checkbox Should Be Selected    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[19]/div/label/input
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[20]/div    Right ascension

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[1]/div[2]/div[1]/div[1]/div/div/label/span[2]/span    TYPED_ID
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[2]/div[1]/div[1]/div/div/label/span[2]/span    ANG_DIST
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[3]/div[2]/div[1]/div[1]/div/div/label/span[2]/span    MAIN_ID
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[4]/div[2]/div[1]/div[1]/div/div/label/span[2]/span    OTYPE_S
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    1.2400000095367432
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    ZFOURGE COSMOS 5366
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    Galaxy
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[1]/table/tbody    Showing 1 to 50 of total 100000 entries
    [Teardown]    Kill carta_backend And Close Browser



Load Catalog File In FITS Format
    Pass Execution    Skip until the crash issue is fixed...
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cosmos_spitzer3.6micron.fits
    Load Catalog File    cosmos_mega_simbad.fits
    # dock the catalog widget and close widgets to create more space
    Drag And Drop    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[4]    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[1]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li[1]/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li[1]/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li[1]/div
    Drag And Drop By Offset    //*[@id="root"]/div/div[15]/div[2]/div/div[2]    -200    0
    Set Selenium Speed    0.02
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/ul[1]/li[2]/span    Catalog : cosmos_mega_simbad.fits
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[1]/div[2]/div/span/span/div/button/span[1]    ICRS

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[3]/div/div[2]/div[2]/div/div/div/div[1]/div    TYPED_ID
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    string
    Checkbox Should Be Selected    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div/label/input
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    Raw identifier as typed in the query
   
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[3]/div/div[2]/div[2]/div/div/div/div[2]/div    ANG_DIST
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[5]/div    arcsec
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[6]/div    float
    Checkbox Should Be Selected    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[7]/div/label/input
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div    Angular distance from the center

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[3]/div/div[2]/div[2]/div/div/div/div[5]/div    RA_d
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[17]/div    deg
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[18]/div    double
    Checkbox Should Be Selected    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[19]/div/label/input
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[20]/div    Right ascension

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[1]/div[2]/div[1]/div[1]/div/div/label/span[2]/span    TYPED_ID
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[2]/div[1]/div[1]/div/div/label/span[2]/span    ANG_DIST
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[3]/div[2]/div[1]/div[1]/div/div/label/span[2]/span    MAIN_ID
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[4]/div[2]/div[1]/div[1]/div/div/label/span[2]/span    OTYPE_S
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    1.2400000095367432
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    ZFOURGE COSMOS 5366
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    Galaxy
    
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[1]/table/tbody    Showing 1 to 50 of total 100000 entries
    [Teardown]    Kill carta_backend And Close Browser


Catalog Filtering And Sorting
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cosmos_spitzer3.6micron.fits
    Load Catalog File    cosmos_mega_simbad.xml
    # dock the catalog widget and close widgets to create more space
    Drag And Drop    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[4]    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[1]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li[1]/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li[1]/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li[1]/div
    Drag And Drop By Offset    //*[@id="root"]/div/div[15]/div[2]/div/div[2]    -200    0

    Input Text    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[2]/div[2]/div[2]/span/div/input    50..100
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[3]/div/a[1]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[1]/table/tbody/tr/td    Showing 1 to 50 of 1732 filtered entries. Total 100000 entries
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    50.060001373291016
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    COSMOS 1611507
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    Galaxy
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[2]/div[1]/div[1]/div/div/label
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[1]/table/tbody/tr/td    Showing 1 to 50 of 1732 filtered entries. Total 100000 entries
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    50.060001373291016
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    COSMOS 1611507
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    Galaxy
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[2]/div[1]/div[1]/div/div/label
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[1]/table/tbody/tr/td    Showing 1 to 50 of 1732 filtered entries. Total 100000 entries
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    99.9800033569336
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    COSMOS 1612741
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    Galaxy
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[3]/div[2]/div[1]/div[1]/div/div/label
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[1]/table/tbody/tr/td    Showing 1 to 50 of 1732 filtered entries. Total 100000 entries
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    54.189998626708984
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    2MASS J09583283+0144413
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    Star

    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[3]/div/a[2]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[1]/table/tbody/tr/td    Showing 1 to 50 of total 100000 entries

    Input Text    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[4]/div[2]/div[2]/div[2]/span/div/input    SN
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[3]/div/a[1]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[1]/table/tbody/tr/td    Showing 1 to 50 of 60 filtered entries. Total 100000 entries
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    29.3799991607666
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    SNLS 07D2kh
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    SN

    Input Text    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[2]/div[2]/div[2]/span/div/input    50..100
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[3]/div/a[1]
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[1]/table/tbody/tr/td    Showing 1 to 2 of 2 filtered entries. Total 100000 entries
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    58.400001525878906
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    [RRS2014] COS12Rea
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    SN    

    [Teardown]    Kill carta_backend And Close Browser


Catalog Column Show And Hide
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cosmos_spitzer3.6micron.fits
    Load Catalog File    cosmos_mega_simbad.xml
    # dock the catalog widget and close widgets to create more space
    Drag And Drop    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[4]    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[1]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li[1]/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li[1]/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li[1]/div
    Drag And Drop By Offset    //*[@id="root"]/div/div[15]/div[2]/div/div[2]    -200    0

    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div/label
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[7]/div/label
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[11]/div/label

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div    Galaxy
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    150.116684
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    2.235136
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    NaN

    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[7]/div/label

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div    1.2400000095367432
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    Galaxy
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    150.116684
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    2.235136

    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div/label

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    1.2400000095367432
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    Galaxy
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    150.116684

    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[1]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[11]/div/label

    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]/div    ${EMPTY}
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[2]/div    1.2400000095367432
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[3]/div    ZFOURGE COSMOS  5366
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[4]/div    Galaxy    
    [Teardown]    Kill carta_backend And Close Browser


Catalog Rendering As Image Overlay With Column Mapping
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Load Initial Image    cosmos_spitzer3.6micron.fits
    Load Catalog File    cosmos_0_simbad.xml
    # dock the catalog widget and close widgets to create more space
    Drag And Drop    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[4]    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[1]/div[1]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li[1]/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li[1]/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li[1]/div
    Drag And Drop By Offset    //*[@id="root"]/div/div[15]/div[2]/div/div[2]    -200    0

    # set up ra and dec column for rendering image overlay
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[2]/div/div[1]/div/span/span/div/button
    Click Element    xpath:/html/body/div[8]/div/div/div/div/div/ul/li[3]/a/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[2]/div/div[2]/div/span/span/div/button
    Click Element    xpath:/html/body/div[9]/div/div/div/div/div/ul/li[4]/a/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[3]/div/a[4]

    # set up size mapping
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[1]/div[3]/a[1]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[2]/div/span/span/div/button
    Click Element    xpath:/html/body/div[10]/div/div/div/div/div/ul/li[12]
    Click Element    //*[@id="bp3-tab-panel_catalogSettings_5"]/div/div[1]/div/span/span/div/button
    Click Element At Coordinates    //*[@id="bp3-tab-panel_catalogSettings_5"]/div/div[1]/div/span/span/div/button    0    -220
    Repeat Keyword    4    Click Element    //*[@id="bp3-tab-panel_catalogSettings_3"]/div/div[2]/div/span/div/div[2]/button[1]

    # set up color mapping
    Click Element    //*[@id="bp3-tab-title_catalogSettings_2"]
    Click Element    //*[@id="bp3-tab-panel_catalogSettings_2"]/div/div[3]/div/span/span/div/button
    Click Element At Coordinates    //*[@id="bp3-tab-panel_catalogSettings_2"]/div/div[3]/div/span/span/div/button    0    -180
    Click Element    //*[@id="bp3-tab-panel_catalogSettings_2"]/div/div[5]/div/span/span/div/button
    Click Element    xpath://*[contains(text(), "tab10")]  

    # set up orientation mapping
    Click Element    //*[@id="bp3-tab-title_catalogSettings_4"]
    Click Element    //*[@id="bp3-tab-panel_catalogSettings_4"]/div/div[1]/div/span/span/div/button
    Click Element At Coordinates    //*[@id="bp3-tab-panel_catalogSettings_4"]/div/div[1]/div/span/span/div/button    0    100

    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[3]
    Mouse Over    ${VIEWER_DIV}
    #Click Element    //*[@id="image-panel-0-0"]/div[8]/span[7]/a
    Repeat Keyword    4    Click Element   //*[@id="image-panel-0-0"]/div[8]/span[5]/a
    Mouse Out    ${VIEWER_DIV}
    Sleep    1
    Capture Element Screenshot    ${VIEWER_DIV}    check.png

    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check.png    233,216,331,225
    PNG Two Pixels Should Have Matched RGBA    check.png    215,142,383,218
    PNG Two Pixels Should Have Matched RGBA    check.png    236,352,299,68
    PNG Two Pixels Should Have Matched RGBA    check.png    454,114,112,338
    PNG Two Pixels Should Have Matched RGBA    check.png    64,69,459,382

    PNG Two Pixels Should Not Have Matched RGBA    check.png    233,216,215,142
    PNG Two Pixels Should Not Have Matched RGBA    check.png    233,216,236,352
    PNG Two Pixels Should Not Have Matched RGBA    check.png    233,216,454,114
    PNG Two Pixels Should Not Have Matched RGBA    check.png    233,216,64,69
    PNG Two Pixels Should Not Have Matched RGBA    check.png    215,142,236,352
    PNG Two Pixels Should Not Have Matched RGBA    check.png    215,142,454,114
    PNG Two Pixels Should Not Have Matched RGBA    check.png    215,142,64,69
    PNG Two Pixels Should Not Have Matched RGBA    check.png    236,352,454,114
    PNG Two Pixels Should Not Have Matched RGBA    check.png    236,352,64,69
    PNG Two Pixels Should Not Have Matched RGBA    check.png    454,114,64,69

    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[3]/div/a[2]
    Capture Element Screenshot    ${VIEWER_DIV}    check2.png
    PNG Images Should Be Different    check.png    check2.png

    Remove Files    check.png    check2.png
    [Teardown]    Kill carta_backend And Close Browser

# TODO: load two catalog files and close them one by one