*** Settings ***
Documentation     Check features in the file browser dialog
Resource          ../resource.robot


*** Test Cases ***
File Path Diplay and Edit
    [Setup]    Setup carta_backend And Open Browser To CARTA
    # check current file path display
    Click Element    ${FILE_BROWSER_EDIT_PATH_BUTTON}
    ${file_path}    Get Element Attribute    ${FILE_BROWSER_EDIT_PATH_INPUT}    value
    Should End With    ${file_path}    set_QA_e2e_v2
    # edit file path to subfolder
    Click Element    ${FILE_BROWSER_EDIT_PATH_INPUT}
    Input Text    ${FILE_BROWSER_EDIT_PATH_INPUT}    /subfolder    clear=False
    Press Keys    ${FILE_BROWSER_EDIT_PATH_INPUT}    RETURN
    # verify we are in subfolder
    Element Should Contain    ${FILE_LIST}    subsubfolder
    Element Should Contain    ${FILE_LIST}    HD163296_CO_2_1.fits
    # check current file path display
    Click Element    ${FILE_BROWSER_EDIT_PATH_BUTTON}
    ${file_path}    Get Element Attribute    ${FILE_BROWSER_EDIT_PATH_INPUT}    value
    Should End With    ${file_path}    /subfolder
    # invalid path
    Input Text    ${FILE_BROWSER_EDIT_PATH_INPUT}    /subfolder    clear=False
    Press Keys    ${FILE_BROWSER_EDIT_PATH_INPUT}    RETURN        
    # error toast display for invalid path
    Page Should Contain    Error loading file list for directory
    # go to root directory
    Click Element    ${FILE_BROWSER_GO_TO_ROOT_BUTTON}
    # verify we are at root
    Click Element    ${FILE_BROWSER_EDIT_PATH_BUTTON}
    ${file_path}    Get Element Attribute    ${FILE_BROWSER_EDIT_PATH_INPUT}    value
    Should Be Equal    ${file_path}    /

    # missing test for the refresh button
    [Teardown]    Kill carta_backend And Close Browser