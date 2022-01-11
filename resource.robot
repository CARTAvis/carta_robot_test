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
Library           Collections

*** Variables ***
############ edit the following only to fit your env ######################
${CARTA_BACKEND_EXECUTABLE}    /Users/kswang/carta_build/carta-backend/build/carta_backend
${CARTA_FRONTEND_FOLDER}    /Users/kswang/carta_build/carta-frontend/build
${INITIAL_IMAGE_FOLDER}    /Users/kswang/set_QA_e2e_v2
${CARTA_PORT}    3003
${PYTHON3_EXECUTABLE}    /opt/anaconda3/bin/python
${N_OMP_THREADS}    8
###########################################################################
${CARTA_PROCESS}    ${CARTA_BACKEND_EXECUTABLE} ${INITIAL_IMAGE_FOLDER} --frontend_folder ${CARTA_FRONTEND_FOLDER} --port ${CARTA_PORT} --omp_threads ${N_OMP_THREADS} --debug_no_auth --no_browser
${SERVER}         localhost:${CARTA_PORT}
${BROWSER}        headlesschrome
#${BROWSER}        chrome
${DELAY}          0.2
${LOGIN URL}      http://${SERVER}/
${TITLE}          CARTA
${WINDOW_SIZE_X}    1280
${WINDOW_SIZE_Y}    800
${WINDOW_SIZE_dY}    124

${SERVER_STATUS_ICON}    xpath://*[@id="root"]/div/div[1]/span[6]/span/span
${PROGRESS_CLOUD}    xpath://*[@id="root"]/div/div[1]/span[5]/span/span

${FILE_LIST}    //*[@id="root"]/div/div[5]/div[1]/div/div[2]/div/div[3]/div[1]/div[1]
${QA_FOLDER}    xpath://*[contains(text(), "set_QA_e2e_v2")]
${FILE_INFO_TEXT}    xpath://*[@id="root"]/div/div[6]/div[1]/div/div[2]/div/div[3]/div[1]/div[2]/div/div[2]/div/div

${LOAD_BUTTON}    xpath://*[contains(text(), "Load")]
${APPEND_BUTTON}    xpath://*[contains(text(), "Append")]
${CLOSE_BUTTON}    xpath://*[contains(text(), "Close")]
${LOAD_CATALOG_BUTTON}    xpath://*[contains(text(), "Load Catalog")]
${LOAD_REGION_BUTTON}    xpath://*[contains(text(), "Load Region")]

${VIEWER_CURSOR_INFO_BAR}    //*[@id="image-panel-0-0"]/div[3]
${VIEWER_DIV}    //*[@id="root"]/div/div[13]/div[2]/div/div[1]/div[1]/div[2]/div/div/div
${CLIP_BUTTON_90}    //*[@id="root"]/div/div[13]/div[2]/div/div[1]/div[3]/div[2]/div/div/div/div[1]/div[1]/div/button[1]

${COLORMAP_DROPDOWN}    //*[@id="root"]/div/div[13]/div[2]/div/div[1]/div[3]/div[2]/div/div/div/div[2]/div[4]/div/span/span/div/button


${MULTIPANEL_VIEW_SWITCH}    //*[@id="root"]/div/div[13]/div[2]/div/div[1]/div[1]/div[1]/ul[2]/li[2]


${ANIMATOR_FIRST_BUTTON}    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[1]/div[1]/button[1]
${ANIMATOR_PREVIOUS_BUTTON}    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[1]/div[1]/button[2]
${ANIMATOR_PLAY_STOP_BUTTON}    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[1]/div[1]/button[3]
${ANIMATOR_NEXT_BUTTON}    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[1]/div[1]/button[4]
${ANIMATOR_LAST_BUTTON}    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[1]/div[1]/button[5]

${ANIMATOR_SLIDER}    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[1]/div[1]/div[1]
${ANIMATOR_SLIDER_INFO}    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[1]/div[2]
${ANIMATOR_SLIDER_HANDLE}    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[1]/div[1]/span
${ANIMATOR_SPINBOX_UP}    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[1]/div[2]/div[2]/div[2]/button[1]
${ANIMATOR_SPINBOX_DOWN}    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[1]/div[2]/div[2]/div[2]/button[2]
${ANIMATOR_PLAYBACK_MODE_BUTTON}    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[1]/span
${ANIMATOR_RANGE_SLIDER_HANDLE_LEFT}    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[2]/div[2]/span[1]
${ANIMATOR_RANGE_SLIDER_HANDLE_RIGHT}    //*[@id="root"]/div/div[13]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[2]/div[2]/span[2]


# image comparsion
${IMAGE_COMPARATOR_COMMAND}   /usr/local/bin/convert __REFERENCE__ __TEST__ -metric RMSE -compare -format  "%[distortion]" info:


# image rgba comparsion
${IMAGE_RGBA_COMPARATOR_COMMAND}   ${PYTHON3_EXECUTABLE} utilities/match_png.py __REFERENCE__ __TEST__


# image pixel rgba check
${IMAGE_PIXEL_RGBA_CHECK_COMMAND}   ${PYTHON3_EXECUTABLE} utilities/png_rgba_check.py __REFERENCE__ __TEST__




# test images
${FITS_hugeGaussian40k}    xpath://*[contains(text(), "hugeGaussian40k.fits")]
${FITS_hugeGaussian20k}    xpath://*[contains(text(), "hugeGaussian20k.fits")]
${FITS_hugeGaussian10k}    xpath://*[contains(text(), "hugeGaussian10k.fits")]
${FITS_h_m51_b}    xpath://*[contains(text(), "h_m51_b_s05_drz_sci.fits")]
${FITS_supermosaic}    xpath://*[contains(text(), "supermosaic.10.fits")]
${FITS_HD163296_CO_2_1}    xpath://*[contains(text(), "HD163296_CO_2_1.fits")]
${FITS_cosmos_spitzer3.6micro}    xpath://*[contains(text(), "cosmos_spitzer3.6micron.fits")]
${VOTABLE_COSMOSOPTCAT}    xpath://*[contains(text(), "COSMOSOPTCAT.vot")]
${FITS_COSMOSOPTCAT}    xpath://*[contains(text(), "COSMOSOPTCAT.fits")]
${FITS_S255_IR}    xpath://*[contains(text(), "S255_IR_sci.spw29.cube.I.pbcor.fits")]

${FITS_M17_SWex}    xpath://*[contains(text(), "M17_SWex.fits")]
${CASA_M17_SWex}    xpath://*[contains(text(), "M17_SWex.image")]
${HDF5_M17_SWex}    xpath://*[contains(text(), "M17_SWex.hdf5")]
${MIRIAD_M17_SWex}    xpath://*[contains(text(), "M17_SWex.miriad")]




*** Keywords ***
Setup carta_backend And Open Browser To CARTA
    Run carta_backend
    Set Selenium Speed    ${DELAY}
    IF    '${BROWSER}' == 'headlesschrome'
    Open Browser    browser=${BROWSER}    options=add_argument("--use-gl=egl");add_argument("--force-color-profile=srgb")
    Set Window Size    ${WINDOW_SIZE_X}    ${WINDOW_SIZE_Y}
    END
    IF    '${BROWSER}' == 'chrome'
    Open Browser    browser=${BROWSER}    options=add_argument("--force-color-profile=srgb")
    Set Window Size    ${WINDOW_SIZE_X}    ${${WINDOW_SIZE_Y}+${WINDOW_SIZE_dY}}
    END
    Sleep    1
    Go To    ${LOGIN URL}
    Title Should Be    ${TITLE}
    Wait Until Page Contains    No file selected.
    ${VIEWER_MODE}=    Get Element Attribute    //*[@id="root"]/div/div[13]/div[2]/div/div[1]/div[1]/div[1]/ul[2]/li[2]    title
    IF    '${VIEWER_MODE}' != 'switch to single panel'
    Click Element    //*[@id="root"]/div/div[13]/div[2]/div/div[1]/div[1]/div[1]/ul[2]/li[2]
    END

Kill carta_backend And Close Browser
    Close Browser
    Terminate carta_backend


Go To E2E QA Folder
    Wait Until Page Contains    No file selected.
    Table Should Contain    ${FILE_LIST}    set_QA_e2e_v2
    Scroll Element Into View    ${QA_FOLDER}
    Click Element    ${QA_FOLDER}
    Wait Until Page Contains    No file selected.
    Sleep    0.5

Load Initial Image 
    [Arguments]    ${IMAGE_TO_LOAD}
    Wait Until Page Contains Element    ${IMAGE_TO_LOAD}
    Click Element    ${IMAGE_TO_LOAD}
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10



Append Image
    [Arguments]    ${IMAGE_TO_APPEND}
    Click Element    xpath://*[contains(text(), "File")]
    Click Element    xpath://*[contains(text(), "Append image")]
    Wait Until Page Contains Element    ${IMAGE_TO_APPEND}
    Click Element    ${IMAGE_TO_APPEND}
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${APPEND_BUTTON}    timeout=2
    Click Element    ${APPEND_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10


Close Image
    Click Element    xpath://*[contains(text(), "File")]
    Click Element    xpath://*[contains(text(), "Close image")]


Load Region File
    [Arguments]    ${REGION_TO_LOAD}
    Click Element    xpath://*[contains(text(), "File")]
    Click Element    xpath://*[contains(text(), "Import regions")]
    Click Element    ${REGION_TO_LOAD}
    Click Element    ${LOAD_REGION_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=20


Run carta_backend
    Start Process    ${CARTA_PROCESS}    shell=yes    alias=carta
    Wait For Process    handle=carta    timeout=3
    Process Should Be Running    handle=carta

Terminate carta_backend
    Terminate Process    handle=carta


Run psrecord
    [Arguments]    ${PSRECORD_OUTPUT_PNG_FILENAME}
    Start Process    psrecord $(pgrep carta_backend) --interval 0.02 --plot ${PSRECORD_OUTPUT_PNG_FILENAME}    shell=yes    alias=psrecord
    Process Should Be Running    handle=psrecord
        
    
Terminate psrecord
    Send Signal To Process    SIGINT    handle=psrecord


Compare Images To Be Identical
   [Arguments]      ${Reference_Image_Path}    ${Test_Image_Path}    ${Allowed_Threshold}
   ${TEMP}=         Replace String     ${IMAGE_COMPARATOR_COMMAND}    __REFERENCE__     ${Reference_Image_Path}
   ${COMMAND}=      Replace String     ${TEMP}    __TEST__     ${Test_Image_Path}
   Log              Executing: ${COMMAND}
   ${RC}            ${OUTPUT}=     Run And Return Rc And Output     ${COMMAND}
   Log              Return Code: ${RC}
   Log              Return Output: ${OUTPUT}
   ${RESULT}        Evaluate    ${OUTPUT} < ${Allowed_Threshold}
   Should be True   ${RESULT}

Compare Images To Be Different
   [Arguments]      ${Reference_Image_Path}    ${Test_Image_Path}    ${Allowed_Threshold}
   ${TEMP}=         Replace String     ${IMAGE_COMPARATOR_COMMAND}    __REFERENCE__     ${Reference_Image_Path}
   ${COMMAND}=      Replace String     ${TEMP}    __TEST__     ${Test_Image_Path}
   Log              Executing: ${COMMAND}
   ${RC}            ${OUTPUT}=     Run And Return Rc And Output     ${COMMAND}
   Log              Return Code: ${RC}
   Log              Return Output: ${OUTPUT}
   ${RESULT}        Evaluate    ${OUTPUT} > ${Allowed_Threshold}
   Should be True   ${RESULT}

PNG Images Should Be Different
   [Arguments]      ${Reference_Image_Path}    ${Test_Image_Path}
   ${TEMP}=         Replace String     ${IMAGE_RGBA_COMPARATOR_COMMAND}    __REFERENCE__     ${Reference_Image_Path}
   ${COMMAND}=      Replace String     ${TEMP}    __TEST__     ${Test_Image_Path}
   Log              Executing: ${COMMAND}
   ${RC}            ${OUTPUT}=     Run And Return Rc And Output      ${COMMAND}
   Log              Return Code: ${RC}
   Log              Return Output: ${OUTPUT}       
   Should Contain   ${OUTPUT}    different

PNG Images Should Be Identical
   [Arguments]      ${Reference_Image_Path}    ${Test_Image_Path}
   ${TEMP}=         Replace String     ${IMAGE_RGBA_COMPARATOR_COMMAND}    __REFERENCE__     ${Reference_Image_Path}
   ${COMMAND}=      Replace String     ${TEMP}    __TEST__     ${Test_Image_Path}
   Log              Executing: ${COMMAND}
   ${RC}            ${OUTPUT}=     Run And Return Rc And Output      ${COMMAND}
   Log              Return Code: ${RC}
   Log              Return Output: ${OUTPUT}       
   Should Contain   ${OUTPUT}    identical

PNG Pixel XY Should Match RGBA
   [Arguments]      ${Reference_Image_Path}    ${Test_XYRGBA}
   ${TEMP}=         Replace String     ${IMAGE_PIXEL_RGBA_CHECK_COMMAND}    __REFERENCE__     ${Reference_Image_Path}
   ${COMMAND}=      Replace String     ${TEMP}    __TEST__     ${Test_XYRGBA}
   Log              Executing: ${COMMAND}
   ${RC}            ${OUTPUT}=     Run And Return Rc And Output      ${COMMAND}
   Log              Return Code: ${RC}
   Log              Return Output: ${OUTPUT}       
   Should Contain   ${OUTPUT}    identical