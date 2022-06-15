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


Catalog Rendering As Scatter Plot
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

    # enable scatter plot
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[2]/div/span/span/div/button
    Click Element    xpath:/html/body/div[8]/div/div/div/div/div/ul/li[3]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[2]/div/div[1]/div/span/span/div/button
    Click Element    xpath:/html/body/div[9]/div/div/div/div/div/ul/li[2]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[2]/div/div[2]/div/span/span/div/button
    Click Element    xpath:/html/body/div[10]/div/div/div/div/div/ul/li[3]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[3]/div/a[4]
    
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[2]    check.png
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[3]/div[2]/a[2]
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[2]    check2.png
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div/span/span/div/button
    Click Element At Coordinates    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div/span/span/div/button    0    150
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[2]    check3.png

    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[4]/div/span/span/div/button
    Click Element    xpath:/html/body/div[12]/div/div/div/div/div/ul/li[2]
    Mouse Over    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[2]
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[3]/div[1]/div/pre    DEC_d: 2.21891547, RA_d: 150.0963135
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[3]/div[1]/div/pre    ANG_DIST - count: 20000, valid count: 20000, mean: 2.9599e+2, rms: 3.1643e+2, stddev: 1.1191e+2, min: 1.2400e+0, max: 4.6845e+2

    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[3]/div[2]/a[1]
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[2]    check4.png

    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check.png    229,101,576,127
    PNG Two Pixels Should Not Have Matched RGBA    check.png    229,101,320,140
    PNG Images Should Be Different    check.png    check2.png
    PNG Images Should Be Different    check.png    check3.png
    PNG Images Should Be Different    check.png    check4.png
    PNG Images Should Be Different    check2.png    check3.png
    PNG Images Should Be Different    check2.png    check4.png
    PNG Images Should Be Different    check3.png    check4.png

    Remove Files    check.png    check2.png    check3.png    check4.png
    [Teardown]    Kill carta_backend And Close Browser



Catalog Rendering As Histogram Plot
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

    # enable histogram plot
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[2]/div/span/span/div/button
    Click Element    xpath:/html/body/div[8]/div/div/div/div/div/ul/li[2]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[2]/div/div[1]/div/span/span/div/button
    Click Element    xpath:/html/body/div[9]/div/div/div/div/div/ul/li[2]
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[3]/div/a[4]

    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[2]    check.png
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[3]/div[2]/a
    Input Text    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[3]/div/div/div/input    0
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[2]    check2.png
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div/span/span/div/button
    Click Element At Coordinates    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[2]/div/span/span/div/button    0    150
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[2]    check3.png
    
    Mouse Over    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[2]
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[1]/div[5]/div/span/span/div/button
    Click Element    xpath:/html/body/div[11]/div/div/div/div/div/ul/li[4]
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[3]/div[1]/div/pre    DEC_d: 2.2173962542500005, Count: 408
    Element Should Contain    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[3]/div[1]/div/pre    DEC_d - count: 20000, valid count: 20000, mean: 2.2492e+0, rms: 2.2500e+0, stddev: 6.0720e-2, min: 2.1053e+0, max: 2.3650e+0

    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check.png    228,185,377,74
    PNG Two Pixels Should Not Have Matched RGBA    check.png    228,185,340,140
    PNG Two Pixels Should Have Matched RGBA    check2.png    154,133,303,54
    PNG Two Pixels Should Not Have Matched RGBA    check2.png    154,133,150,70
    PNG Two Pixels Should Have Matched RGBA    check3.png    102,165,518,26
    PNG Two Pixels Should Not Have Matched RGBA    check3.png    102,165,190,80
    
    PNG Images Should Be Different    check.png    check2.png
    PNG Images Should Be Different    check.png    check2.png
    PNG Images Should Be Different    check.png    check3.png
    PNG Images Should Be Different    check2.png    check3.png

    Remove Files    check.png    check2.png    check3.png
    [Teardown]    Kill carta_backend And Close Browser


Linked Catalog Visualization
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

    # set up image overlay, scatter plot and histogram plot
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[2]/div/div[1]/div/span/span/div/button
    Click Element    xpath:/html/body/div[8]/div/div/div/div/div/ul/li[3]/a/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[2]/div/div[2]/div/span/span/div/button
    Click Element    xpath:/html/body/div[9]/div/div/div/div/div/ul/li[4]/a/div
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[3]/div/a[4]

    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[2]/div/span/span/div/button
    Click Element At Coordinates    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[2]/div/span/span/div/button    0    -30
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[3]/div/a[4]
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[2]    check_scatter.png

    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[2]/div/span/span/div/button
    Click Element At Coordinates    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[2]/div/span/span/div/button    0    -60
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[3]/div/a[4]

    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[2]/div/div[2]    check_histogram.png
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[2]/div/div[2]
    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[2]/div/div[2]    check_histogram_selected.png
    Click Element    //*[@id="root"]/div/div[16]/div[2]/div[1]/div[1]/div[4]

    Capture Element Screenshot    //*[@id="root"]/div/div[16]/div/div[1]/div[2]/div/div[2]    check_scatter_selected.png
    Click Element    //*[@id="root"]/div/div[16]/div/div[1]/div[1]/div[4]

    Capture Element Screenshot    ${VIEWER_DIV}    check_image_overlay_selected.png
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[17]/div    61.119998931884766
    Capture Element Screenshot    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div    check_table_selected.png
    
    Click Element    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[3]/div/a[2]

    Capture Element Screenshot    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div    check_table_reset.png
    Element Should Contain    //*[@id="root"]/div/div[15]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[12]/div    9.220000267028809
    Capture Element Screenshot    ${VIEWER_DIV}    check_image_overlay_reset.png

    Set Selenium Speed    0.02
    PNG Two Pixels Should Have Matched RGBA    check_histogram_selected.png    335,25,335,247
    PNG Two Pixels Should Not Have Matched RGBA    check_histogram_selected.png    335,25,320,40
    PNG Images Should Be Different    check_histogram_selected.png    check_histogram.png
    PNG Two Pixels Should Have Matched RGBA    check_scatter_selected.png    337,24,337,216
    PNG Two Pixels Should Not Have Matched RGBA    check_scatter_selected.png    337,24,237,64
    PNG Images Should Be Different    check_scatter_selected.png    check_scatter.png
    PNG Images Should Be Different    check_image_overlay_selected.png    check_image_overlay_reset.png
    PNG Two Pixels Should Have Matched RGBA    check_table_selected.png    120,70,580,70
    PNG Two Pixels Should Not Have Matched RGBA    check_table_selected.png    120,70,120,90
    PNG Images Should Be Different    check_table_selected.png    check_table_reset.png

    Remove Files    check_scatter.png    check_scatter_selected.png    check_histogram.png    check_histogram_selected.png    check_image_overlay_selected.png    check_image_overlay_reset.png    check_table_selected.png    check_table_reset.png
    [Teardown]    Kill carta_backend And Close Browser


# TODO: load two catalog files and close them one by one

