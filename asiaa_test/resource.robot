*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary, Process, OperatingSystem,
...               and String.
Library           SeleniumLibrary
Library           Process
Library           OperatingSystem
Library           String

*** Variables ***
${PYTHON3_EXECUTABLE}    /opt/anaconda3/bin/python
${SERVER}         carta.asiaa.sinica.edu.tw/mixnmatch
${BROWSER}        headlesschrome
${DELAY}          0.05
${LOGIN URL}      https://${SERVER}/
${TITLE}          CARTA mix 'n match
${WINDOW_SIZE_X}    1280
${WINDOW_SIZE_Y}    800


*** Keywords ***
Open Browser To CARTA
    Set Selenium Speed    ${DELAY}
    Open Browser    browser=${BROWSER}
    Set Window Size    ${WINDOW_SIZE_X}    ${WINDOW_SIZE_Y}
    Go To    ${LOGIN URL}
    Title Should Be    ${TITLE}
    

