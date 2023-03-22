*** Settings ***
Documentation     Test session management with the python scripting interface
Resource          ../resource.robot
Library          test_session_management.py

*** Test Cases ***
Create A Session From Existing CARTA backend
    [Setup]    Run carta_backend
    ${result}=    test_session_management.create_session
    Should Be Equal    ${result}    Done
    PNG Two Pixels Should Have Matched RGBA    create_session.png    683,808,751,881
    PNG Two Pixels Should Have Matched RGBA    create_session.png    657,773,773,884
    PNG Two Pixels Should Not Have Matched RGBA    create_session.png    683,808,657,773
    Remove File    create_session.png
    [Teardown]    Terminate carta_backend

Start And Create A Session Directly With CARTA-PYTHON
    ${result}=    test_session_management.start_and_create_session
    Should Be Equal    ${result}    Done
    PNG Two Pixels Should Have Matched RGBA    start_and_create_session.png    683,808,751,881
    PNG Two Pixels Should Have Matched RGBA    start_and_create_session.png    657,773,773,884
    PNG Two Pixels Should Not Have Matched RGBA    start_and_create_session.png    683,808,657,773
    Remove File    start_and_create_session.png

Interact With An Existing Session
    [Setup]    Setup carta_backend And Open Browser To CARTA
    ${session_id}=    Get Element Attribute   //*[@id="info-session-id"]    innerHTML
    ${result}=    test_session_management.interact_session    ${session_id} 
    @{image_dimension_list}=    Create List    ${1}    ${250}    ${273}    ${324}
    Should Be Equal   ${result}    ${image_dimension_list}
    [Teardown]    Kill carta_backend And Close Browser

Start And Interact With A New Session
    Log To Console    NOTE
    Log To Console    A CARTA session will be launched in a REAL browser
    Log To Console    Need to close the browser manaully after the test finishes
    ${result}=    test_session_management.start_and_interact_session
    @{image_dimension_list}=    Create List    ${1}    ${250}    ${273}    ${324}
    Should Be Equal   ${result}    ${image_dimension_list}