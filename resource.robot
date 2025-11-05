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
${SNAPSHOT_FOLDER}    ./snapshot
${CARTA_PORT}    3003
${PYTHON3_EXECUTABLE}    /opt/miniconda3/bin/python
${N_OMP_THREADS}    8
${PACKAGE_TESTING}    False
###########################################################################
${CARTA_PROCESS}    ${CARTA_BACKEND_EXECUTABLE} ${INITIAL_IMAGE_FOLDER} --frontend_folder ${CARTA_FRONTEND_FOLDER} --port ${CARTA_PORT} --omp_threads ${N_OMP_THREADS} --debug_no_auth --no_browser --enable_scripting
${SERVER}         localhost:${CARTA_PORT}
${BROWSER}        headlesschrome
#${BROWSER}        chrome
${DELAY}          0.1
${LOGIN URL}      http://${SERVER}
${TITLE}          CARTA
${WINDOW_SIZE_X}    1280
${WINDOW_SIZE_Y}    939
${WINDOW_SIZE_dY}    0

${PROGRESS_CLOUD}    data:testid:progress-cloud

${FILE_LIST}    data:testid:file-list
${QA_FOLDER}    //*[contains(text(), "set_QA_e2e_v2")]
${FILE_INFO_TEXT}    css:[data-testid="file-info"] .header-list
${FILE_FILTER}    //input[@placeholder="Filter by filename with fuzzy search"]

${LOAD_BUTTON}    //*[contains(text(), "Load")]
${APPEND_BUTTON}    //*[contains(text(), "Append")]
${CLOSE_BUTTON}    //*[contains(text(), "Close")]
${LOAD_CATALOG_BUTTON}    //*[contains(text(), "Load catalog")]
${LOAD_REGION_BUTTON}    //*[contains(text(), "Load region")]


${VIEWER_TAB_TITLE}    css:[data-testid="image-view-header-title"] span
${VIEWER_CURSOR_INFO_BAR}    data:testid:viewer-cursor-info-bar
${VIEWER_DIV}    data:testid:viewer-div
${VIEWER_00_ZOOM_IN_BUTTON}    css:#image-panel-0-0 [data-testid="zoom-in-button"]
${VIEWER_10_ZOOM_IN_BUTTON}    css:#image-panel-1-0 [data-testid="zoom-in-button"]
${VIEWER_11_ZOOM_IN_BUTTON}    css:#image-panel-1-1 [data-testid="zoom-in-button"]
${VIEWER_10_MATCH_BUTTON}    css:#image-panel-1-0 [data-testid="match-button"]
${VIEWER_10_WCS_BUTTON}    css:#image-panel-1-0 [data-testid="overlay-coordinate-button"]
${VIEWER_10_GRID_BUTTON}    css:#image-panel-1-0 [data-testid="grid-button"]
${VIEWER_10_CANVAS}    css:#image-panel-1-0 .region-stage
${VIEWER_01_CANVAS}    css:#image-panel-0-1 .region-stage
${VIEWER_00_CANVAS}    css:#image-panel-0-0 .region-stage
${VIEWER_11_CANVAS}    css:#image-panel-1-1 .region-stage
${VIEWER_00_ZOOM_TO_FIT_BUTTON}    css:#image-panel-0-0 [data-testid="zoom-to-fit-button"]
${VIEWER_10_ZOOM_TO_FIT_BUTTON}    css:#image-panel-1-0 [data-testid="zoom-to-fit-button"]
${VIEWER_01_ZOOM_TO_FIT_BUTTON}    css:#image-panel-0-1 [data-testid="zoom-to-fit-button"]
${VIEWER_SETTINGS_DIALOG}    data:testid:image-view-header-settings-button
${VIEWER_SETTINGS_DIALOG_CLOSE_BUTTON}    data:testid:image-view-floating-settings-0-header-close-button

${CLIP_BUTTON_90}    data:testid:clip-button-90
${COLORMAP_DROPDOWN}    data:testid:colormap-dropdown

${MULTIPANEL_VIEW_SWITCH}    data:testid:image-view-multipanel-view-switch

${ANIMATOR_FIRST_BUTTON}    data:testid:animator-first-button
${ANIMATOR_PREVIOUS_BUTTON}    data:testid:animator-previous-button
${ANIMATOR_PLAY_STOP_BUTTON}    data:testid:animator-play-stop-button
${ANIMATOR_NEXT_BUTTON}    data:testid:animator-next-button
${ANIMATOR_LAST_BUTTON}    data:testid:animator-last-button

${ANIMATOR_SLIDER}    css:[data-testid="animator-slider"] [class*="-slider-track"]
${ANIMATOR_SLIDER_INFO}    data:testid:animator-slider-info
${ANIMATOR_SLIDER_HANDLE}    css:[data-testid="animator-slider"] div span
${ANIMATOR_SPINBOX_UP}    data:testid:animator-control-input-increment-button
${ANIMATOR_SPINBOX_DOWN}    data:testid:animator-control-input-decrement-button
${ANIMATOR_PLAYBACK_MODE_BUTTON}    data:testid:animator-playback-mode-button
${ANIMATOR_RANGE_SLIDER_HANDLE_LEFT}    css:[data-testid="animator-range-slider"] [class*="-slider-handle"][class*="-start"]
${ANIMATOR_RANGE_SLIDER_HANDLE_RIGHT}    css:[data-testid="animator-range-slider"] [class*="-slider-handle"][class*="-end"]
${ANIMATOR_IMAGE_RADIO_BUTTON}           //*[@data-testid="animator-0-content"]//*[contains(text(), "Image")]
${ANIMATOR_POLARIZATION_RADIO_BUTTON}    //*[@data-testid="animator-0-content"]//*[contains(text(), "Polarization")]


${X_SPATIAL_PROFILER_TAB}    data:testid:spatial-profiler-0-header-title
${X_SPATIAL_PROFILER_CLOSE_BUTTON}    data:testid:spatial-profiler-0-header-close-button
${Y_SPATIAL_PROFILER_CLOSE_BUTTON}    data:testid:spatial-profiler-1-header-close-button
${IMAGE_LIST_CLOSE_BUTTON}    data:testid:layer-list-0-header-close-button
${ANIMATOR_CLOSE_BUTTON}     data:testid:animator-0-header-close-button
${REGION_LIST_CLOSE_BUTTON}     data:testid:region-list-0-header-close-button
${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    //*[@id="root"]/div/div[16]/div/div/div[2]/div
${CATALOG_WIDGET_DOCK_BUTTON}    data:testid:catalog-overlay-component-0-header-dock-button
${CATALOG_WIDGET_TITLE}    css:[data-testid="catalog-overlay-component-0-header-title"] span
${CATALOG_WIDGET_SYSTEM_DROPDOWN_ACTIVE_CONTEXT}    data:testid:catalog-system-dropdown
${CATALOG_WIDGET_FILTER_BUTTON}    data:testid:catalog-filter-button
${CATALOG_WIDGET_RESET_BUTTON}    data:testid:catalog-reset-button
${CATALOG_WIDGET_CLOSE_BUTTON}    data:testid:catalog-close-button
${CATALOG_WIDGET_PLOT_BUTTON}    data:testid:catalog-plot-button
${CATALOG_WIDGET_TABLE_FILTERING_INFO}    data:testid:catalog-table-filtering-info
${CATALOG_WIDGET_RENDERING_TYPE_DROPDOWN}    data:testid:catalog-rendering-type-dropdown
${CATALOG_WIDGET_RENDERING_COLUMN_X_DROPDOWN}    data:testid:catalog-rendering-column-x-dropdown
${CATALOG_WIDGET_RENDERING_COLUMN_Y_DROPDOWN}    data:testid:catalog-rendering-column-y-dropdown
${CATALOG_WIDGET_FILE_DROPDOWN}    data:testid:catalog-file-dropdown


${RENDER_CONFIG_CLIP_MIN_CUBE}    data:testid:clip-min-input
${RENDER_CONFIG_CLIP_MAX_CUBE}    data:testid:clip-max-input
${RENDER_CONFIG_HISTOGRAM_MODE_DROPDOWN}    data:testid:histogram-mode-dropdown


${IMAGE_FITTING_DIALOG_BUTTON}    data:testid:fitting-dialog-button
${IMAGE_FITTING_DIALOG_CENTER_X}    //input[@placeholder="Center X"]
${IMAGE_FITTING_DIALOG_CENTER_Y}    //input[@placeholder="Center Y"]
${IMAGE_FITTING_DIALOG_AMPLITUDE}    //input[@placeholder="Amplitude"]
${IMAGE_FITTING_DIALOG_FWHM_MAJOR}    //input[@placeholder="Major axis"]
${IMAGE_FITTING_DIALOG_FWHM_MINOR}    //input[@placeholder="Minor axis"]
${IMAGE_FITTING_DIALOG_PA}    //input[@placeholder="Position angle"]
${IMAGE_FITTING_DIALOG_FIT_BUTTON}    data:testid:image-fitting-fit-button
${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    css:[data-testid="image-fitting-result-tab"] .fitting-result-text
${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    css:[data-testid="image-fitting-full-log-tab"] .log-text
${IMAGE_FITTING_DIALOG_FULL_LOG_TAB_TITLE}     data:testid:image-fitting-full-log-tab-title
${IMAGE_FITTING_DIALOG_COMPONENT_SPINBOX_UP}    data:testid:image-fitting-component-input-increment-button
${IMAGE_FITTING_DIALOG_CLOSE_BUTTON}    data:testid:fitting-dialog-header-close-button
${IMAGE_FITTING_DIALOG_MODEL_TOGGLE}    //*[contains(text(), "Model")]
${IMAGE_FITTING_DIALOG_RESIDUAL_TOGGLE}    //*[contains(text(), "Residual")]
${IMAGE_FITTING_DIALOG_CENTER_X_LOCK}    data:testid:image-fitting-center-x-lock-button
${IMAGE_FITTING_DIALOG_CENTER_Y_LOCK}    data:testid:image-fitting-center-y-lock-button
${IMAGE_FITTING_DIALOG_AMPLITUDE_LOCK}    data:testid:image-fitting-amplitude-lock-button
${IMAGE_FITTING_DIALOG_FWHM_X_LOCK}    data:testid:image-fitting-fwhm-x-lock-button
${IMAGE_FITTING_DIALOG_FWHM_Y_LOCK}    data:testid:image-fitting-fwhm-y-lock-button
${IMAGE_FITTING_DIALOG_PA_LOCK}    data:testid:image-fitting-pa-lock-button
${IMAGE_FITTING_AUTO_TOGGLE}    css:[data-testid="image-fitting-auto-initial-value-toggle"] + span

${STATISTICS_WIDGET_TABLE}    data:testid:statistics-table

${SPECTRAL_PROFILER_SETTINGS_BUTTON}     data:testid:spectral-profiler-0-header-settings-button
${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}     data:testid:spectral-profiler-0-floating-settings-0-header-close-button
${SPECTRAL_PROFILER_PLOT}    css:[data-testid="spectral-profiler-0-content"] [data-testid="profiler-plot"]
${SPECTRAL_PROFILER_CLOSE_BUTTON}    data:testid:spectral-profiler-0-header-close-button
${SPECTRAL_PROFILER_CURSOR_INFO}    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[2]/div[2]/div/div/div/div/div/div

${PROFILE_FITTING_RESULT_TAB}    css:[data-testid="profile-fitting-result"] .fitting-result-text
${PROFILE_FITTING_FIT_BUTTON}    data:testid:profile-fitting-fit-button
${PROFILE_FITTING_RESET_BUTTON}    data:testid:profile-fitting-reset-button
${PROFILE_FITTING_AUTO_DETECT_BUTTON}    data:testid:profile-fitting-auto-detect-button
${PROFILE_FITTING_BUTTON}    data:testid:profile-fitting-button


${SPECTRAL_LINE_QUERY_FROM_INPUT}    data:testid:spectral-line-query-from-input
${SPECTRAL_LINE_QUERY_TO_INPUT}    data:testid:spectral-line-query-to-input
${SPECTRAL_LINE_QUERY_CENTER_INPUT}    data:testid:spectral-line-query-center-input
${SPECTRAL_LINE_QUERY_WIDTH_INPUT}    data:testid:spectral-line-query-width-input
${SPECTRAL_LINE_QUERY_BUTTON}    //button[contains(., "Query")]
${SPECTRAL_LINE_QUERY_INFO}    data:testid:spectral-line-query-result-info
${SPECTRAL_LINE_QUERY_UNIT_DROPDOWN}    data:testid:spectral-line-query-unit-dropdown
${SPECTRAL_LINE_QUERY_MODE_DROPDOWN}    data:testid:spectral-line-query-mode-dropdown
${SPECTRAL_LINE_QUERY_FILTER_BUTTON}   //*[contains(text(), "Apply filter")]
${SPECTRAL_LINE_QUERY_FREQUENCY_SHIFT_REFERENCE}    data:testid:spectral-line-query-frequency-shift-reference
${SPECTRAL_LINE_QUERY_FREQUENCY_SHIFT_INPUT}    data:testid:spectral-line-query-frequency-shift-input
${SPECTRAL_LINE_QUERY_RESET_BUTTON}    //*[contains(text(), "Reset filter")]
${SPECTRAL_LINE_QUERY_PLOT_BUTTON}    //*[contains(text(), "Plot")]
${SPECTRAL_LINE_QUERY_CLEAR_BUTTON}    //*[contains(text(), "Clear plot")]
${SPECTRAL_LINE_QUERY_LOADING_ICON}    data:testid:spectral-line-query-loading-icon

${SPATIAL_PROFILER_CURSOR_INFO}    data:testid:x-profiler-info
${SPATIAL_PROFILER_CURSOR_INFO_Y}    data:testid:y-profiler-info
${SPATIAL_PROFILER_PLOT}    css:[data-testid="spatial-profiler-0-content"] [data-testid="profiler-plot"]
${SPATIAL_PROFILER_SETTINGS_DIALOG_BUTTON}    data:testid:spatial-profiler-0-header-settings-button
${SPATIAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}    data:testid:spatial-profiler-0-floating-settings-0-header-close-button


${MOMENT_GENERATOR_BUTTON}    data:testid:moment-generator-button
${MOMENT_GENERATOR_GENERATE_BUTTON}    data:testid:moment-generator-generate-button
${MOMENT_GENERATOR_AUTO_MATCHING_TOGGLE}    //*[contains(text(), "Auto spatial matching")]

${FILE_HEADER_DIALOG_BUTTON}    data:testid:file-info-dialog-button
${FILE_HEADER_DIALOG_CLOSE_BUTTON}    data:testid:file-info-dialog-header-close-button

${CONTOUR_CONFIG_DIALOG_BUTTON}    data:testid:contour-dialog-button
${CONTOUR_CONFIG_DIALOG_APPLY_BUTTON}    data:testid:contour-config-apply-button
${CONTOUR_CONFIG_DIALOG_CLOSE_BUTTON}    data:testid:contour-dialog-header-close-button

${PV_GENERATOR_GENERATE_BUTTON}    data:testid:pv-generator-generate-button
${PV_GENERATOR_CLOSE_BUTTON}    data:testid:pv-generator-0-header-close-button
${PV_GENERATOR_PV_CUT_REGION_DROPDOWN}    data:testid:pv-generator-pv-cut-region-dropdown

${POINT_REGION_SHORTCUT_BUTTON}    data:testid:point-region-shortcut-button
${LINE_REGION_SHORTCUT_BUTTON}    data:testid:line-region-shortcut-button
${RECTANGLE_REGION_SHORTCUT_BUTTON}    data:testid:rectangle-region-shortcut-button
${ELLIPSE_REGION_SHORTCUT_BUTTON}    data:testid:ellipse-region-shortcut-button
${POLYGON_REGION_SHORTCUT_BUTTON}    data:testid:polygon-region-shortcut-button
${POLYLINE_REGION_SHORTCUT_BUTTON}    data:testid:polyline-region-shortcut-button



${VECTOR_FIELD_RENDERING_DIALOG_BUTTON}    data:testid:vector-dialog-button
${VECTOR_FIELD_RENDERING_APPLY_BUTTON}    data:testid:vector-field-apply-button
${VECTOR_FIELD_RENDERING_AVERAGING_TOGGLE}    css:[data-testid="vector-field-averaging-toggle"] + span
${VECTOR_FIELD_RENDERING_AVERAGING_WIDTH_INPUT}    data:testid:vector-field-averaging-width-input
${VECTOR_FIELD_RENDERING_CONFIGURATION_TAB}    data:testid:vector-field-configuration-tab
${VECTOR_FIELD_RENDERING_STYLING_TAB}    data:testid:vector-field-styling-tab
${VECTOR_FIELD_RENDERING_LINE_THICKNESS_INPUT}    data:testid:vector-field-line-input
${VECTOR_FIELD_RENDERING_LINE_LENGTH_MAX_INPUT}     data:testid:vector-field-line-length-max-input
${VECTOR_FIELD_RENDERING_ROTATION_OFFSET_INPUT}    data:testid:vector-field-rotation-offset-input
${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}    data:testid:vector-dialog-header-close-button
${VECTOR_FIELD_RENDERING_THRESHOLD_TOGGLE}    css:[data-testid="vector-field-threshold-toggle"] + span
${VECTOR_FIELD_RENDERING_THRESHOLD_INPUT}    data:testid:vector-field-threshold-input
${VECTOR_FIELD_RENDERING_DEBIASING_TOGGLE}    css:[data-testid="vector-field-debiasing-toggle"] + span
${VECTOR_FIELD_RENDERING_STOKES_Q_ERROR_INPUT}    data:testid:vector-field-stokes-q-error-input
${VECTOR_FIELD_RENDERING_STOKES_U_ERROR_INPUT}    data:testid:vector-field-stokes-u-error-input
${VECTOR_FIELD_RENDERING_CLEAR_BUTTON}    data:testid:vector-field-clear-button
${VECTOR_FIELD_RENDERING_INTENSITY_SOURCE_DROPDOWN}    data:testid:vector-field-intensity-source-dropdown
${VECTOR_FIELD_RENDERING_INTENSITY_SOURCE_DROPDOWN_NONE}    data:testid:vector-field-intensity-source-dropdown-none
${VECTOR_FIELD_RENDERING_INTENSITY_SOURCE_DROPDOWN_COMPUTED_PI}    data:testid:vector-field-intensity-source-dropdown-computed-pi
${VECTOR_FIELD_RENDERING_ANGULAR_SOURCE_DROPDOWN}    data:testid:vector-field-angular-source-dropdown
${VECTOR_FIELD_RENDERING_ANGULAR_SOURCE_DROPDOWN_NONE}    data:testid:vector-field-angular-source-dropdown-none
${VECTOR_FIELD_RENDERING_COLOR_MODE_DROPDOWN}    data:testid:vector-field-color-mode-dropdown
${VECTOR_FIELD_RENDERING_COLOR_MODE_DROPDOWN_COLORMAPPED}    data:testid:vector-field-color-mode-dropdown-colormapped
${VECTOR_FIELD_RENDERING_THRESHOLD_OPTION_DROPDOWN}    data:testid:vector-field-threshold-option-dropdown

${CURSOR_INFO_WIDGET_BUTTON}    id:CursorInfoWidgetButton
${CURSOR_INFO_WIDGET_CLOSE_BUTTON}    data:testid:cursor-info-0-header-close-button



${IMAGE_LIST_FIRST_IMAGE_NAME}    data:testid:image-list-0-image-name
${IMAGE_LIST_SECOND_IMAGE_NAME}    data:testid:image-list-1-image-name
${IMAGE_LIST_THIRD_IMAGE_NAME}    data:testid:image-list-2-image-name
${IMAGE_LIST_SECOND_MATCHING_XY}    data:testid:image-list-1-matching-xy
${IMAGE_LIST_THIRD_MATCHING_XY}    data:testid:image-list-2-matching-xy
${IMAGE_LIST_FOURTH_MATCHING_XY}    data:testid:image-list-3-matching-xy


${HISTOGRAM_PLOT_CANVAS}    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[2]/div/div[1]/div/canvas
${HISTOGRAM_PLOT_CURSOR_INFO}    //*[@id="root"]/div/div[17]/div/div/div[2]/div/div/div[3]/div
${HISTOGRAM_AUTO_BOUND_TOGGLE}    //*[@id="bp5-tab-panel_histogramSettingTabs_1"]/div/div[1]/div
${HISTOGRAM_MANUAL_BOUND_MIN_INPUT}    //*[@id="numericInput-9"]
${HISTOGRAM_MANUAL_BOUND_MAX_INPUT}    //*[@id="numericInput-10"]
${HISTOGRAM_AUTO_BINS_TOGGLE}    //*[@id="bp5-tab-panel_histogramSettingTabs_1"]/div/div[4]/div
${HISTOGRAM_MANUAL_MAX_BINS_INPUT}    //*[@id="numericInput-11"]
${HISTOGRAM_MANUAL_BINS_SLIDER}    //*[@id="bp5-tab-panel_histogramSettingTabs_1"]/div/div[5]/div[1]/div
${HISTOGRAM_SETTINGS_DIALOG_CLOSE_BUTTON}    //*[@id="root"]/div/div[17]/div[2]/div/div[1]/div[3]


${ONLINE_DATA_QUERY_WCS_DROPDOWN}    //*[@id="bp5-tab-panel_onlineQueryDialogTabs_0"]/div/div[1]/div/div/div[4]/div/div/button



# image comparsion
${IMAGE_COMPARATOR_COMMAND}   /usr/local/bin/convert __REFERENCE__ __TEST__ -metric RMSE -compare -format  "%[distortion]" info:


# image rgba comparsion
${IMAGE_RGBA_COMPARATOR_COMMAND}   ${PYTHON3_EXECUTABLE} utilities/match_png.py __REFERENCE__ __TEST__


# image pixel rgba check
${IMAGE_PIXEL_RGBA_CHECK_COMMAND}   ${PYTHON3_EXECUTABLE} utilities/png_rgba_check.py __REFERENCE__ __TEST__

# image two pixels rgba check
${IMAGE_TWO_PIXELS_RGBA_CHECK_COMMAND}    ${PYTHON3_EXECUTABLE} utilities/match_png_rgba.py __REFERENCE__ __TEST__

# image ocr test
${IMAGE_OCR_TEST_COMMAND}    ${PYTHON3_EXECUTABLE} utilities/ocr.py __REFERENCE__ __TEST__    



*** Keywords ***
Setup carta_backend And Open Browser To CARTA
    IF    '${PACKAGE_TESTING}' == 'False'
    Run carta_backend
    ELSE
    Log To Console    Package testing mode. carta_backend should be started manually.
    END
    Set Selenium Speed    ${DELAY}
    IF    '${BROWSER}' == 'headlesschrome'
    Open Browser    browser=${BROWSER}    options=add_argument("--use-gl=angle");add_argument("--force-color-profile=srgb");add_argument("--disable-web-security");add_argument("--force-device-scale-factor=1")
    Set Window Size    ${WINDOW_SIZE_X}    ${WINDOW_SIZE_Y}
    END
    IF    '${BROWSER}' == 'chrome'
    Open Browser    browser=${BROWSER}    options=add_argument("--force-color-profile=srgb");add_argument("--disable-web-security")
    Set Window Size    ${WINDOW_SIZE_X}    ${${WINDOW_SIZE_Y}+${WINDOW_SIZE_dY}}
    END
    #Sleep    1
    Go To    ${LOGIN URL}
    Title Should Be    ${TITLE}
    Wait Until Page Contains    No file selected.
    # check if there is a telemetry prompt and remove it 
    ${PAGE_SOURCE} =    Get Source
    Run Keyword If    'CARTA Usage Data' in '''${PAGE_SOURCE}'''    Click Element    data:testid:telemetry-opt-out-button
    # reset viewer to multi-panel mode
    ${VIEWER_MODE}=    Get Element Attribute    ${MULTIPANEL_VIEW_SWITCH}    title
    IF    '${VIEWER_MODE}' != 'switch to single panel'
    Click Element    ${MULTIPANEL_VIEW_SWITCH}
    END
    

Kill carta_backend And Close Browser
    IF    '${PACKAGE_TESTING}' == 'False'
    Close Browser
    Terminate carta_backend
    ELSE
    Close Browser
    END

Go To E2E QA Folder
    Wait Until Page Contains    No file selected.
    Table Should Contain    ${FILE_LIST}    set_QA_e2e_v2
    Scroll Element Into View    ${QA_FOLDER}
    Click Element    ${QA_FOLDER}
    Wait Until Page Contains    No file selected.
    #Sleep    0.5

Load Initial Image 
    [Arguments]    ${IMAGE_TO_LOAD}
    ${IMAGE_TO_LOAD_XPATH}=    Replace String    //*[contains(text(), "__FILE_NAME__")]    __FILE_NAME__    ${IMAGE_TO_LOAD}
    Input Text    ${FILE_FILTER}    ${IMAGE_TO_LOAD}
    Wait Until Element Contains    ${FILE_LIST}   ${IMAGE_TO_LOAD}
    Wait Until Page Contains Element    ${IMAGE_TO_LOAD_XPATH}
    Sleep    0.2
    Click Element    ${IMAGE_TO_LOAD_XPATH}
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10


Load Image 
    [Arguments]    ${IMAGE_TO_LOAD}
    ${IMAGE_TO_LOAD_XPATH}=    Replace String    //*[contains(text(), "__FILE_NAME__")]    __FILE_NAME__    ${IMAGE_TO_LOAD}
    Click Element    //*[contains(text(), "File")]
    Click Element    //*[contains(text(), "Open Image")]
    Input Text    ${FILE_FILTER}    ${IMAGE_TO_LOAD}
    Wait Until Element Contains    ${FILE_LIST}   ${IMAGE_TO_LOAD}
    Wait Until Page Contains Element    ${IMAGE_TO_LOAD_XPATH}
    Sleep    0.2
    Click Element    ${IMAGE_TO_LOAD_XPATH}
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10


Append Image
    [Arguments]    ${IMAGE_TO_APPEND}
    ${IMAGE_TO_APPEND_XPATH}=    Replace String    //*[contains(text(), "__FILE_NAME__")]    __FILE_NAME__    ${IMAGE_TO_APPEND}
    Click Element    //*[contains(text(), "File")]
    Click Element    //*[contains(text(), "Append Image")]
    Input Text    ${FILE_FILTER}    ${IMAGE_TO_APPEND}
    Wait Until Element Contains    ${FILE_LIST}   ${IMAGE_TO_APPEND}
    Wait Until Page Contains Element    ${IMAGE_TO_APPEND_XPATH}
    Sleep    0.2
    Click Element    ${IMAGE_TO_APPEND_XPATH}
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${APPEND_BUTTON}    timeout=2
    Click Element    ${APPEND_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10


Close Image
    Click Element    //*[contains(text(), "File")]
    Click Element    //*[contains(text(), "Close Image")]


Load Region File
    [Arguments]    ${REGION_TO_LOAD}
    ${REGION_TO_LOAD_XPATH}=    Replace String    //*[contains(text(), "__FILE_NAME__")]    __FILE_NAME__    ${REGION_TO_LOAD}
    Click Element    //*[contains(text(), "File")]
    Click Element    //*[contains(text(), "Import Regions")]
    Input Text    ${FILE_FILTER}    ${REGION_TO_LOAD}
    #Sleep    0.3
    Wait Until Element Contains    ${FILE_LIST}   ${REGION_TO_LOAD}
    Wait Until Page Contains Element    ${REGION_TO_LOAD_XPATH}
    Sleep    0.2
    Click Element    ${REGION_TO_LOAD_XPATH}
    Click Element    ${LOAD_REGION_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=20

Load Catalog File
    [Arguments]    ${CATALOG_TO_LOAD}
    ${CATALOG_TO_LOAD_XPATH}=    Replace String    //*[contains(text(), "__FILE_NAME__")]    __FILE_NAME__    ${CATALOG_TO_LOAD}
    Click Element    //*[contains(text(), "File")]
    Click Element    //*[contains(text(), "Import Catalog")]
    Input Text    ${FILE_FILTER}    ${CATALOG_TO_LOAD}
    #Sleep    0.3
    Wait Until Element Contains    ${FILE_LIST}   ${CATALOG_TO_LOAD}
    Wait Until Page Contains Element    ${CATALOG_TO_LOAD_XPATH}
    Sleep    0.2
    Click Element    ${CATALOG_TO_LOAD_XPATH}
    Click Element    ${LOAD_CATALOG_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=20

Verify Region List Table Cell Content
    [Arguments]    ${row_index}    ${column_index}    ${expected_content}
    ${cell}    Get WebElement    css:[data-testid="region-list-table-row-${row_index}"] .cell:nth-child(${column_index})
    Element Should Contain    ${cell}    ${expected_content}



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


PNG Two Pixels Should Have Matched RGBA
   [Arguments]      ${Reference_Image_Path}    ${Test_P1P2RGBA}
   ${TEMP}=         Replace String     ${IMAGE_TWO_PIXELS_RGBA_CHECK_COMMAND}    __REFERENCE__     ${Reference_Image_Path}
   ${COMMAND}=      Replace String     ${TEMP}    __TEST__     ${Test_P1P2RGBA}
   Log              Executing: ${COMMAND}
   ${RC}            ${OUTPUT}=     Run And Return Rc And Output      ${COMMAND}
   Log              Return Code: ${RC}
   Log              Return Output: ${OUTPUT}       
   Should Contain   ${OUTPUT}    identical


PNG Two Pixels Should Not Have Matched RGBA
   [Arguments]      ${Reference_Image_Path}    ${Test_P1P2RGBA}
   ${TEMP}=         Replace String     ${IMAGE_TWO_PIXELS_RGBA_CHECK_COMMAND}    __REFERENCE__     ${Reference_Image_Path}
   ${COMMAND}=      Replace String     ${TEMP}    __TEST__     ${Test_P1P2RGBA}
   Log              Executing: ${COMMAND}
   ${RC}            ${OUTPUT}=     Run And Return Rc And Output      ${COMMAND}
   Log              Return Code: ${RC}
   Log              Return Output: ${OUTPUT}       
   Should Contain   ${OUTPUT}    different

OCR Test
   [Arguments]      ${Reference_Image_Path}    ${Test_Input}
   ${TEMP}=         Replace String     ${IMAGE_OCR_TEST_COMMAND}    __REFERENCE__     ${Reference_Image_Path}
   ${COMMAND}=      Replace String     ${TEMP}    __TEST__     ${Test_Input}
   Log              Executing: ${COMMAND}
   ${RC}            ${OUTPUT}=     Run And Return Rc And Output      ${COMMAND}
   Log              Return Code: ${RC}
   Log              Return Output: ${OUTPUT}       
   Should Contain   ${OUTPUT}    Identical