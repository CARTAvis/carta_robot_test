*** Settings ***
Documentation     Test session management with the python scripting interface
Resource          ../resource.robot
Library          test_region_management.py

*** Test Cases ***
Create Region And Annotation In Image Coordinate
    [Setup]    Run carta_backend
    ${result}=    test_region_management.create_region_annotation_pixel
    Log To Console    ${result}
    #Should Be Equal    ${result}    Done
    
    #Remove File    create_region_annotation.png
    [Teardown]    Terminate carta_backend

Create Point Region In Image Coordinate 
    [Setup]    Run carta_backend
    ${result}=    test_region_management.create_point_region_pixel
    Log To Console    ${result}
    #Should Be Equal    ${result}    Done
    
    #Remove File    create_region_annotation.png
    [Teardown]    Terminate carta_backend

