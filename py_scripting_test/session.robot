*** Settings ***
Documentation     Test session with the python scripting interface
Resource          ../resource.robot
Library          test_session.py

*** Test Cases ***
Create A Session From Existing CARTA backend
    [Setup]    Run carta_backend
    ${result}=    test_session.create_session
    Should Be Equal    ${result}    Done
    PNG Two Pixels Should Have Matched RGBA    create_session.png    683,808,751,881
    PNG Two Pixels Should Have Matched RGBA    create_session.png    657,773,773,884
    PNG Two Pixels Should Not Have Matched RGBA    create_session.png    683,808,657,773
    Remove File    create_session.png
    [Teardown]    Terminate carta_backend