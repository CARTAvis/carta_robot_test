*** Settings ***
Documentation     Loading a catalog in votable format and using psrecord to 
...               monitor ram and cpu usages.
Resource          ../resource.robot

*** Test Cases ***
Load Catalog Votable With Psrecord
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Sleep     1
    Go To E2E QA Folder
    Load Initial Image    ${FITS_cosmos_spitzer3.6micro}
    Click Element    xpath://*[contains(text(), "File")]
    Click Element    xpath://*[contains(text(), "Import catalog")]
    Wait Until Page Contains Element    ${VOTABLE_COSMOSOPTCAT}
    Click Element    ${VOTABLE_COSMOSOPTCAT}
    Wait Until Page Contains    Name
    Wait Until Element Is Enabled    ${LOAD_CATALOG_BUTTON}    timeout=2
    Run psrecord    psrecord_load_catalog_votable.png
    Sleep    0.5
    Click Element    ${LOAD_CATALOG_BUTTON}
    Wait Until Page Contains    Catalog : COSMOSOPTCAT.vot    timeout=10  
    Sleep    0.5
    Terminate psrecord
    Sleep    1
    [Teardown]    Kill carta_backend And Close Browser



Load Catalog FITS With Psrecord
    [Setup]    Setup carta_backend And Open Browser To CARTA
    Sleep     1
    Go To E2E QA Folder
    Load Initial Image    ${FITS_cosmos_spitzer3.6micro}
    Click Element    xpath://*[contains(text(), "File")]
    Click Element    xpath://*[contains(text(), "Import catalog")]
    Wait Until Page Contains Element    ${FITS_COSMOSOPTCAT}
    Click Element    ${FITS_COSMOSOPTCAT}
    Wait Until Page Contains    Name
    Wait Until Element Is Enabled    ${LOAD_CATALOG_BUTTON}    timeout=2
    Run psrecord    psrecord_load_catalog_fits.png
    Sleep    0.5
    Click Element    ${LOAD_CATALOG_BUTTON}
    Wait Until Page Contains    Catalog : COSMOSOPTCAT.fits    timeout=10  
    Sleep    0.5
    Terminate psrecord
    Sleep    1
    [Teardown]    Kill carta_backend And Close Browser
