*** Settings ***
Documentation     Check availability of ilifu-carta 
Resource          ./resource.robot

*** Test Cases ***
Login ILIFU CARTA With Wrong Credentials
    [Setup]    Open Browser To CARTA
    Wait Until Page Contains    Welcome to the IDIA CARTA server.
    Location should be    ${LOGIN URL}dashboard?redirectParams=
    Sleep    1
    Input Text    //*[@id="username"]    SpongeBob    Clear=True
    Input Password    //*[@id="password"]    PatrickStar    Clear=True
    Sleep    1
    Click Element    //*[@id="login"]
    Wait Until Page Contains    Invalid username/password combination
    Sleep    1
    [Teardown]    Close Browser


Login ILIFU CARTA And Logout
    [Setup]    Open Browser To CARTA
    Wait Until Page Contains    Welcome to the IDIA CARTA server.
    Location should be    ${LOGIN URL}dashboard?redirectParams=
    Sleep    1
    Input Text    //*[@id="username"]    ${USERNAME}    Clear=True
    Input Password    //*[@id="password"]    ${PASSWORD}    Clear=True
    Sleep    1
    Click Element    //*[@id="login"]
    Wait Until Page Contains    Empty folder    timeout=30
    Location should be    ${LOGIN URL}
    Sleep    1
    Click Element    xpath://*[contains(text(), "File")]
    Sleep    0.5
    Click Element    xpath://*[contains(text(), "Server")]
    Sleep    0.5
    Click Element    xpath://*[contains(text(), "Logout")]
    Sleep    0.5
    Wait Until Page Contains    Welcome to the IDIA CARTA server.
    Location should be    ${LOGIN URL}dashboard
    Sleep    1
    [Teardown]    Close Browser


Load An Image
    [Setup]    Open Browser To CARTA
    Wait Until Page Contains    Welcome to the IDIA CARTA server.
    Location should be    ${LOGIN URL}dashboard?redirectParams=
    Sleep    1
    Input Text    //*[@id="username"]    ${USERNAME}    Clear=True
    Input Password    //*[@id="password"]    ${PASSWORD}    Clear=True
    Sleep    1
    Click Element    //*[@id="login"]
    Wait Until Page Contains    Empty folder    timeout=30
    Location should be    ${LOGIN URL}
    Sleep    1
    Click Element    xpath://*[contains(text(), "carta_share")]
    Wait Until Page Contains    public
    Click Element    xpath://*[contains(text(), "public")]
    Wait Until Page Contains    angus
    Click Element    xpath://*[contains(text(), "angus")]
    Wait Until Page Contains    supermosaic.10.fits
    Click Element    xpath://*[contains(text(), "supermosaic.10.fits")]
    Wait Until Page Contains    Name
    Click Element    xpath://*[contains(text(), "Load")]
    Wait Until Page Contains    27.3903
    Sleep    5
    Click Element    xpath://*[contains(text(), "File")]
    Sleep    0.5
    Click Element    xpath://*[contains(text(), "Server")]
    Sleep    0.5
    Click Element    xpath://*[contains(text(), "Logout")]
    Sleep    0.5
    Wait Until Page Contains    Welcome to the IDIA CARTA server.
    Location should be    ${LOGIN URL}dashboard
    Sleep    1
    [Teardown]    Close Browser