*** Settings ***
Documentation     Check availability of asiaa carta mix n match
Resource          ./resource.robot

*** Test Cases ***

Access ASIAA CARTA MixNMatch And Load An Image With Dev+Dev
    [Setup]    Open Browser To CARTA
    Wait Until Page Contains    Welcome to CARTA mix 'n match
    Click Element    xpath:/html/body/div[1]/div/a
    Switch Window    NEW
    Location Should Be    https://carta.asiaa.sinica.edu.tw/frontend/dev/?socketUrl=wss://carta.asiaa.sinica.edu.tw/socketdev&skipTelemetry=1
    Wait Until Page Contains    File Browser    timeout=10
    Input Text    //*[@id="root"]/div/div[7]/div[1]/div/div[2]/div/div[3]/div[2]/input    HD163296_CO_2_1.fits
    Sleep    1
    Click Element    //*[@id="root"]/div/div[7]/div[1]/div/div[2]/div/div[3]/div[1]/div[1]/div/div/div[1]/div[1]/div/div[2]/div/div/div/div/div[1]/div/div
    Wait Until Element Contains    //*[@id="root"]/div/div[7]/div[1]/div/div[2]/div/div[3]/div[1]/div[2]/div/div[2]/div    HD163296_CO_2_1.fits
    Click Element    //*[@id="root"]/div/div[7]/div[1]/div/div[2]/div/div[4]/div/div/span/a
    Wait Until Page Does Not Contain    File Browser
    Element Should Contain    //*[@id="root"]/div/div[16]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span    HD163296_CO_2_1.fits
    Element Attribute Value Should Be    //*[@id="root"]/div/div[16]/div[2]/div/div[1]/div[3]/div[2]/div/div/div/div[2]/div[2]/div/div/div/input    Value    -0.020490288427972802
    [Teardown]    Close Browser
