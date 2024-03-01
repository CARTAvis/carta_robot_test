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
${PYTHON3_EXECUTABLE}    /Users/kswang/anaconda3/bin/python
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
${WINDOW_SIZE_Y}    800
${WINDOW_SIZE_dY}    124

${SERVER_STATUS_ICON}    xpath://*[@id="root"]/div/div[1]/span[6]/span/span
${PROGRESS_CLOUD}    xpath://*[@id="root"]/div/div[1]/span[5]/span/span

${FILE_LIST}    //*[@id="root"]/div/div[7]/div/div[1]/div[2]/div/div[3]/div[1]/div[1]
${QA_FOLDER}    xpath://*[contains(text(), "set_QA_e2e_v2")]
${FILE_INFO_TEXT}    xpath://*[@id="root"]/div/div[7]/div[1]/div/div[2]/div/div[3]/div[1]/div[2]/div/div[2]/div/div
${FILE_FILTER}    //*[@id="root"]/div/div[7]/div[1]/div/div[2]/div/div[3]/div[2]/input

${LOAD_BUTTON}    xpath://*[contains(text(), "Load")]
${APPEND_BUTTON}    xpath://*[contains(text(), "Append")]
${CLOSE_BUTTON}    xpath://*[contains(text(), "Close")]
${LOAD_CATALOG_BUTTON}    xpath://*[contains(text(), "Load catalog")]
${LOAD_REGION_BUTTON}    xpath://*[contains(text(), "Load region")]


${VIEWER_TAB_TITLE}    //*[@id="root"]/div/div[17]/div[2]/div/div[1]/div[1]/div[1]/ul[1]/li/span
${VIEWER_CURSOR_INFO_BAR}    //*[@id="image-panel-0-0"]/div[4]
${VIEWER_DIV}    //*[@id="root"]/div/div[17]/div[2]/div/div[1]/div[1]/div[2]/div/div/div
${VIEWER_00_ZOOM_IN_BUTTON}    //*[@id="image-panel-0-0"]/div[9]/span[5]/a     
${VIEWER_10_ZOOM_IN_BUTTON}    //*[@id="image-panel-1-0"]/div[9]/span[5]/a
${VIEWER_10_MATCH_BUTTON}    //*[@id="image-panel-1-0"]/div[8]/span[9]/span/a
${VIEWER_10_CANVAS}    //*[@id="image-panel-1-0"]/div[8]/div/div/canvas
${VIEWER_10_ZOOM_TO_FIT_BUTTON}    //*[@id="image-panel-1-0"]/div[9]/span[8]/a
${VIEWER_SETTINGS_DIALOG}    //*[@id="root"]/div/div[17]/div[2]/div/div[1]/div[1]/div[1]/ul[2]/li[4]
${VIEWER_SETTINGS_DIALOG_CLOSE_BUTTON}    //*[@id="root"]/div/div[18]/div/div[1]/div[1]/div[3]

${CLIP_BUTTON_90}    //*[@id="root"]/div/div[17]/div[2]/div/div[1]/div[3]/div[2]/div/div/div/div[1]/div[1]/div/button[1]

${COLORMAP_DROPDOWN}    //*[@id="root"]/div/div[17]/div[2]/div/div[1]/div[3]/div[2]/div/div/div/div[2]/div[4]/div/span/span/div/button
${COLORMAP_DROPDOWN_CUBE}    //*[@id="root"]/div/div[17]/div[2]/div/div[1]/div[3]/div[2]/div/div/div/div[2]/div[5]/div/span/span/div/button     

${MULTIPANEL_VIEW_SWITCH}    //*[@id="root"]/div/div[17]/div[2]/div/div[1]/div[1]/div[1]/ul[2]/li[2]

${ANIMATOR_FIRST_BUTTON}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[1]/div[1]/button[1]
${ANIMATOR_PREVIOUS_BUTTON}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[1]/div[1]/button[2]
${ANIMATOR_PLAY_STOP_BUTTON}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[1]/div[1]/button[3]
${ANIMATOR_NEXT_BUTTON}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[1]/div[1]/button[4]
${ANIMATOR_LAST_BUTTON}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[1]/div[1]/button[5]

${ANIMATOR_SLIDER}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[1]/div[1]/div[1]
${ANIMATOR_SLIDER_INFO}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[1]/div[2]
${ANIMATOR_SLIDER_HANDLE}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[1]/div[1]/span
${ANIMATOR_SPINBOX_UP}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[1]/div[2]/div[2]/div[2]/button[1]
${ANIMATOR_SPINBOX_DOWN}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[1]/div[2]/div[2]/div[2]/button[2]
${ANIMATOR_PLAYBACK_MODE_BUTTON}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[1]/span
${ANIMATOR_RANGE_SLIDER_HANDLE_LEFT}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[2]/div[2]/span[1]
${ANIMATOR_RANGE_SLIDER_HANDLE_RIGHT}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[2]/div[2]/span[2]
${ANIMATOR_IMAGE_RADIO_BUTTON}           //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[1]/label
${ANIMATOR_POLARIZATION_RADIO_BUTTON}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[2]/div/div/div[2]/div[3]/label   


${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_PANEL_HEAD}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[1]/div[1]
${DEFAULT_LAYOUT_Y_SPATIAL_PROFILER_CLOSE_BUTTON}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li/div
${DEFAULT_LAYOUT_X_SPATIAL_PROFILER_CLOSE_BUTTON}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[1]/div[1]/ul[1]/li/div
${DEFAULT_LAYOUT_WIDGET_CLOSE_BUTTON_DYNAMIC}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[3]/div[1]/ul[1]/li[1]/div    
${DEFAULT_LAYOUT_MIDDLE_VERTICAL_LAYOUT_RESIZER}    //*[@id="root"]/div/div[17]/div[2]/div/div[2]

${CATALOG_WIDGET_DOCK_BUTTON}    //*[@id="root"]/div/div[18]/div/div[1]/div[1]/div[4]
${CATALOG_WIDGET_TITLE}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[1]/ul[1]/li[2]/span
${CATALOG_WIDGET_SYSTEM_DROPDOWN_ACTIVE_CONTEXT}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[1]/div[2]/div/span/span/div/button/span[1]
${CATALOG_WIDGET_FILTER_BUTTON}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[3]/div/a[1]
${CATALOG_WIDGET_RESET_BUTTON}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[3]/div/a[2]
${CATALOG_WIDGET_CLOSE_BUTTON}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[3]/div/a[3]
${CATALOG_WIDGET_PLOT_BUTTON}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[3]/div/a[4]
${CATALOG_WIDGET_TABLE_FILTERING_INFO}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[1]/table/tbody
${CATALOG_WIDGET_RENDERING_TYPE_DROPDOWN}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[2]/div/span/span/div/button
${CATALOG_WIDGET_RENDERING_COLUMN_X_DROPDOWN}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[2]/div/div[1]/div/span/span/div/button
${CATALOG_WIDGET_RENDERING_COLUMN_Y_DROPDOWN}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[3]/div[2]/div/div[2]/div/span/span/div/button  
${CATALOG_WIDGET_FILE_DROPDOWN}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[2]/div/div/div[1]/div[1]/div/span/span/div/button


${RENDER_CONFIG_CLIP_MIN_CUBE}    //*[@id="root"]/div/div[17]/div[2]/div/div[1]/div[3]/div[2]/div/div/div/div[2]/div[2]/div/div/div/input
${RENDER_CONFIG_CLIP_MAX_CUBE}    //*[@id="root"]/div/div[17]/div[2]/div/div[1]/div[3]/div[2]/div/div/div/div[2]/div[3]/div/div/div/input
${RENDER_CONFIG_HISTOGRAM_MODE_DROPDOWN}    //*[@id="root"]/div/div[17]/div[2]/div/div[1]/div[3]/div[2]/div/div/div/div[2]/div[1]/div/span/span/div/button


${IMAGE_FITTING_DIALOG_BUTTON}    //*[@id="root"]/div/div[1]/div[3]/span[5]/a
${IMAGE_FITTING_DIALOG_CENTER_X}    //*[@id="root"]/div/div[15]/div[1]/div/div[2]/div/div[3]/div[1]/div/div[1]/div[4]/div/div[1]/div/input
${IMAGE_FITTING_DIALOG_CENTER_Y}    //*[@id="root"]/div/div[15]/div[1]/div/div[2]/div/div[3]/div[1]/div/div[1]/div[4]/div/div[2]/div/input
${IMAGE_FITTING_DIALOG_AMPLITUDE}    //*[@id="root"]/div/div[15]/div[1]/div/div[2]/div/div[3]/div[1]/div/div[1]/div[5]/div/div/div/input
${IMAGE_FITTING_DIALOG_FWHM_MAJOR}    //*[@id="root"]/div/div[15]/div[1]/div/div[2]/div/div[3]/div[1]/div/div[1]/div[6]/div/div[1]/div/input
${IMAGE_FITTING_DIALOG_FWHM_MINOR}    //*[@id="root"]/div/div[15]/div[1]/div/div[2]/div/div[3]/div[1]/div/div[1]/div[6]/div/div[2]/div/input
${IMAGE_FITTING_DIALOG_PA}    //*[@id="root"]/div/div[15]/div[1]/div/div[2]/div/div[3]/div[1]/div/div[1]/div[7]/div/div/div/input
${IMAGE_FITTING_DIALOG_FIT_BUTTON}    //*[@id="root"]/div/div[15]/div[1]/div/div[2]/div/div[3]/div[1]/div/div[2]/div/span[2]/a
${IMAGE_FITTING_DIALOG_FITTING_RESULT_TAB}    //*[@id="bp3-tab-panel_fittingResultTabs_0"]/pre/div
${IMAGE_FITTING_DIALOG_FULL_LOG_TAB}    //*[@id="bp3-tab-panel_fittingResultTabs_1"]/pre/div
${IMAGE_FITTING_DIALOG_FULL_LOG_TAB_TITLE}     //*[@id="bp3-tab-title_fittingResultTabs_1"]
${IMAGE_FITTING_DIALOG_COMPONENT_SPINBOX_UP}    //*[@id="root"]/div/div[15]/div[1]/div/div[2]/div/div[3]/div[1]/div/div[1]/div[2]/div/div/div[2]/button[1]
${IMAGE_FITTING_DIALOG_CLOSE_BUTTON}    //*[@id="root"]/div/div[15]/div[1]/div/div[2]/div/div[1]/button
${IMAGE_FITTING_DIALOG_MODEL_TOGGLE}    //*[@id="root"]/div/div[15]/div[1]/div/div[2]/div/div[3]/div[1]/div/div[2]/div/label[1]
${IMAGE_FITTING_DIALOG_RESIDUAL_TOGGLE}    //*[@id="root"]/div/div[15]/div[1]/div/div[2]/div/div[3]/div[1]/div/div[2]/div/label[2]
${IMAGE_FITTING_DIALOG_CENTER_X_LOCK}    //*[@id="root"]/div/div[15]/div[1]/div/div[2]/div/div[3]/div[1]/div/div[1]/div[4]/div/a[1]
${IMAGE_FITTING_DIALOG_CENTER_Y_LOCK}    //*[@id="root"]/div/div[15]/div[1]/div/div[2]/div/div[3]/div[1]/div/div[1]/div[4]/div/a[2]
${IMAGE_FITTING_DIALOG_AMPLITUDE_LOCK}    //*[@id="root"]/div/div[15]/div[1]/div/div[2]/div/div[3]/div[1]/div/div[1]/div[5]/div/a
${IMAGE_FITTING_DIALOG_FWHM_X_LOCK}    //*[@id="root"]/div/div[15]/div[1]/div/div[2]/div/div[3]/div[1]/div/div[1]/div[6]/div/a[1]
${IMAGE_FITTING_DIALOG_FWHM_Y_LOCK}    //*[@id="root"]/div/div[15]/div[1]/div/div[2]/div/div[3]/div[1]/div/div[1]/div[6]/div/a[2]
${IMAGE_FITTING_DIALOG_PA_LOCK}    //*[@id="root"]/div/div[15]/div[1]/div/div[2]/div/div[3]/div[1]/div/div[1]/div[7]/div/a



${STATISTICS_WIDGET_TABLE}    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[2]/table
${STATISTICS_WIDGET_TABLE_DOCKED}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div/div/div[2]/table

${SPECTRAL_PROFILER_SETTINGS_BUTTON}    //*[@id="root"]/div/div[18]/div/div[1]/div[1]/div[2]
${SPECTRAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}    //*[@id="root"]/div/div[18]/div[2]/div[1]/div[1]/div[3]
${SPECTRAL_PROFILER_PLOT}    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[1]/div[2]/div[1]/div/div/div[2]/div/canvas
${SPECTRAL_PROFILER_CLOSE_BUTTON}    //*[@id="root"]/div/div[18]/div/div[1]/div[1]/div[5]

${PROFILE_FITTING_RESULT_TAB}    //*[@id\="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[10]/div/div/div[1]/pre/div
${PROFILE_FITTING_FIT_BUTTON}    //*[@id="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[2]/a[2]
${PROFILE_FITTING_RESET_BUTTON}    //*[@id="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[2]/a[1]
${PROFILE_FITTING_AUTO_DETECT_BUTTON}    //*[@id="bp3-tab-panel_spectralSettingTabs_4"]/div/span/div/div/div[1]/div[3]/div/div/span/a
${PROFILE_FITTING_BUTTON}    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[3]/a


${SPECTRAL_LINE_QUERY_FROM_INPUT}    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[2]/div/div/div/input
${SPECTRAL_LINE_QUERY_TO_INPUT}    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[3]/div/div/div/input
${SPECTRAL_LINE_QUERY_BUTTON}    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[1]/div[1]/div[2]/button
${SPECTRAL_LINE_QUERY_INFO}    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[2]/div[1]
${SPECTRAL_LINE_QUERY_UNIT_DROPDOWN}    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[4]/div/div/select
${SPECTRAL_LINE_QUERY_MODE_DROPDOWN}    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[1]/div[1]/div[1]/div[1]/div/div/select
${SPECTRAL_LINE_QUERY_FILTER_BUTTON}   //*[@id="root"]/div/div[18]/div/div/div[2]/div/div[2]/div[2]/a[1]
${SPECTRAL_LINE_QUERY_FREQUENCY_SHIFT_REFERENCE}    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div[1]/div[1]/div/div/select
${SPECTRAL_LINE_QUERY_FREQUENCY_SHIFT_INPUT}    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[1]/div[2]/div[2]/div/div[1]/div[2]/div/div/div/input
${SPECTRAL_LINE_QUERY_RESET_BUTTON}    //*[@id="root"]/div/div[18]/div/div/div[2]/div/div[2]/div[2]/a[2]
${SPECTRAL_LINE_QUERY_PLOT_BUTTON}    //*[@id="root"]/div/div[18]/div/div/div[2]/div/div[2]/div[2]/span/a
${SPECTRAL_LINE_QUERY_CLEAR_BUTTON}    //*[@id="root"]/div/div[18]/div/div/div[2]/div/div[2]/div[2]/a[3]
${SPECTRAL_LINE_QUERY_LOADING_ICON}    //*[@id="root"]/div/div[18]/div/div/div[2]/div/div[3]/div[2]

${SPATIAL_PROFILER_CURSOR_INFO}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[3]/div
${SPATIAL_PROFILER_CURSOR_INFO_Y}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[3]/div[2]/div/div/div/div[1]/div[3]/div
${SPATIAL_PROFILER_PLOT}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[1]/div[2]/div/div/div/div[1]/div[2]/div/div[2]/div/canvas
${SPATIAL_PROFILER_SETTINGS_DIALOG_BUTTON}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[1]/div[1]/ul[2]/li[4]
${SPATIAL_PROFILER_SETTINGS_DIALOG_CLOSE_BUTTON}    //*[@id="root"]/div/div[17]/div/div[1]/div[1]/div[3]


${REGION_LIST_TABLE_ROOT_XPATH}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[2]/div[3]/div/div/div[1]/div[2]/div

${MOMENT_GENERATOR_BUTTON}    //*[@id="root"]/div/div[18]/div/div[1]/div[2]/div/div[1]/div[1]/div/div[2]/span[2]/a
${MOMENT_GENERATOR_GENERATE_BUTTON}    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[14]/span/a
${MOMENT_GENERATOR_CLOSE_BUTTON}    //*[@id="root"]/div/div[17]/div[2]/div[1]/div[1]/div[3]
${MOMENT_GENERATOR_AUTO_MATCHING_TOGGLE}    //*[@id="bp3-tab-panel_spectralSettingTabs_3"]/div/div/div[13]/div/label[2]

${FILE_HEADER_DIALOG_BUTTON}    //*[@id="root"]/div/div[1]/div[3]/span[1]/a
${FILE_HEADER_DIALOG_CLOSE_BUTTON}    //*[@id="root"]/div/div[6]/div[1]/div/div[2]/div/div[1]/button


${CONTOUR_CONFIG_DIALOG_BUTTON}    //*[@id="root"]/div/div[1]/div[3]/span[3]
${CONTOUR_CONFIG_DIALOG_APPLY_BUTTON}    //*[@id="root"]/div/div[4]/div[1]/div/div[2]/div/div[3]/div/a[2]
${CONTOUR_CONFIG_DIALOG_CLOSE_BUTTON}    //*[@id="root"]/div/div[4]/div[1]/div/div[2]/div/div[1]/button

${PV_GENERATOR_GENERATE_BUTTON}    //*[@id="root"]/div/div[18]/div/div/div[2]/div/div[1]/div/div[12]/div[2]/span/a
${PV_GENERATOR_CLOSE_BUTTON}    //*[@id="root"]/div/div[18]/div/div/div[1]/div[4]
${PV_GENERATOR_PV_CUT_REGION_DROPDOWN}    //*[@id="root"]/div/div[18]/div/div/div[2]/div/div[1]/div/div[2]/div

${POINT_REGION_SHORTCUT_BUTTON}    //*[@id="root"]/div/div[1]/div[1]/span[1]/a
${LINE_REGION_SHORTCUT_BUTTON}    //*[@id="root"]/div/div[1]/div[1]/span[2]/a
${RECTANGLE_REGION_SHORTCUT_BUTTON}    //*[@id="root"]/div/div[1]/div[1]/span[3]/a
${ELLIPSE_REGION_SHORTCUT_BUTTON}    //*[@id="root"]/div/div[1]/div[1]/span[4]/a
${POLYGON_REGION_SHORTCUT_BUTTON}    //*[@id="root"]/div/div[1]/div[1]/span[5]/a
${POLYLINE_REGION_SHORTCUT_BUTTON}    //*[@id="root"]/div/div[1]/div[1]/span[6]/a



${VECTOR_FIELD_RENDERING_DIALOG_BUTTON}    //*[@id="root"]/div/div[1]/div[3]/span[4]/a
${VECTOR_FIELD_RENDERING_APPLY_BUTTON}    //*[@id="root"]/div/div[5]/div[1]/div/div[2]/div/div[3]/div/a[2]
${VECTOR_FIELD_RENDERING_AVERAGING_TOGGLE}    //*[@id="bp3-tab-panel_undefined_0"]/div/div[3]/div/label
${VECTOR_FIELD_RENDERING_AVERAGING_WIDTH_INPUT}    //*[@id="bp3-tab-panel_undefined_0"]/div/div[4]/div/div/div[1]/input
${VECTOR_FIELD_RENDERING_CONFIGURATION_TAB}    //*[@id="bp3-tab-title_undefined_0"]
${VECTOR_FIELD_RENDERING_STYLING_TAB}    //*[@id="bp3-tab-title_undefined_1"]
${VECTOR_FIELD_RENDERING_LINE_THICKNESS_INPUT}    //*[@id="bp3-tab-panel_undefined_1"]/div/div[1]/div/div/div[1]/input
${VECTOR_FIELD_RENDERING_LINE_LENGTH_MAX_INPUT}     //*[@id="bp3-tab-panel_undefined_1"]/div/div[3]/div/div/div/div[2]/div/div/div[1]/input
${VECTOR_FIELD_RENDERING_ROTATION_OFFSET_INPUT}    //*[@id="bp3-tab-panel_undefined_1"]/div/div[4]/div/div/div/input
${VECTOR_FIELD_RENDERING_CLOSE_BUTTON}    //*[@id="root"]/div/div[5]/div/div[1]/div[2]/div/div[1]/button
${VECTOR_FIELD_RENDERING_THRESHOLD_TOGGLE}    //*[@id="bp3-tab-panel_undefined_0"]/div/div[6]/div/label
${VECTOR_FIELD_RENDERING_THRESHOLD_INPUT}    //*[@id="bp3-tab-panel_undefined_0"]/div/div[7]/div/div/div/input
${VECTOR_FIELD_RENDERING_DEBIASING_TOGGLE}    //*[@id="bp3-tab-panel_undefined_0"]/div/div[8]/div/label
${VECTOR_FIELD_RENDERING_STOKES_Q_ERROR_INPUT}    //*[@id="bp3-tab-panel_undefined_0"]/div/div[9]/div/div/div/input
${VECTOR_FIELD_RENDERING_STOKES_U_ERROR_INPUT}    //*[@id="bp3-tab-panel_undefined_0"]/div/div[10]/div/div/div/input
${VECTOR_FIELD_RENDERING_CLEAR_BUTTON}    //*[@id="root"]/div/div[5]/div[1]/div/div[2]/div/div[3]/div/a[1]
${VECTOR_FIELD_RENDERING_INTENSITY_SOURCE_DROPDOWN}    //*[@id="bp3-tab-panel_undefined_0"]/div/div[2]/div/div/select
${VECTOR_FIELD_RENDERING_INTENSITY_SOURCE_DROPDOWN_NONE}    //*[@id="bp3-tab-panel_undefined_0"]/div/div[2]/div/div/select/option[1]
${VECTOR_FIELD_RENDERING_INTENSITY_SOURCE_DROPDOWN_COMPUTED_PI}    //*[@id="bp3-tab-panel_undefined_0"]/div/div[2]/div/div/select/option[3]
${VECTOR_FIELD_RENDERING_ANGULAR_SOURCE_DROPDOWN}    //*[@id="bp3-tab-panel_undefined_0"]/div/div[1]/div/div/select
${VECTOR_FIELD_RENDERING_ANGULAR_SOURCE_DROPDOWN_NONE}    //*[@id="bp3-tab-panel_undefined_0"]/div/div[1]/div/div/select/option[1]
${VECTOR_FIELD_RENDERING_COLOR_MODE_DROPDOWN}    //*[@id="bp3-tab-panel_undefined_1"]/div/div[5]/div/div/select
${VECTOR_FIELD_RENDERING_COLOR_MODE_DROPDOWN_COLORMAPPED}    //*[@id="bp3-tab-panel_undefined_1"]/div/div[5]/div/div/select/option[2]


${CURSOR_INFO_WIDGET_BUTTON}    //*[@id="CursorInfoWidgetButton"]
${CURSOR_INFO_WIDGET_CLOSE_BUTTON}    //*[@id="root"]/div/div[18]/div/div[1]/div[1]/div[4]



${IMAGE_LIST_FIRST_IMAGE_NAME}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[1]
${IMAGE_LIST_SECOND_IMAGE_NAME}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[6]
${IMAGE_LIST_THIRD_IMAGE_NAME}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[11]
${IMAGE_LIST_SECOND_MATCHING_XY}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[8]/div/span[1]/a
${IMAGE_LIST_THIRD_MATCHING_XY}    //*[@id="root"]/div/div[17]/div[2]/div/div[3]/div[5]/div[2]/div[1]/div/div/div[1]/div[1]/div[1]/div/div[2]/div[2]/div/div/div/div[13]/div/span[1]/a











# image comparsion
${IMAGE_COMPARATOR_COMMAND}   /usr/local/bin/convert __REFERENCE__ __TEST__ -metric RMSE -compare -format  "%[distortion]" info:


# image rgba comparsion
${IMAGE_RGBA_COMPARATOR_COMMAND}   ${PYTHON3_EXECUTABLE} utilities/match_png.py __REFERENCE__ __TEST__


# image pixel rgba check
${IMAGE_PIXEL_RGBA_CHECK_COMMAND}   ${PYTHON3_EXECUTABLE} utilities/png_rgba_check.py __REFERENCE__ __TEST__

# image two pixels rgba check
${IMAGE_TWO_PIXELS_RGBA_CHECK_COMMAND}    ${PYTHON3_EXECUTABLE} utilities/match_png_rgba.py __REFERENCE__ __TEST__





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
    Run Keyword If    'CARTA Usage Data' in '${PAGE_SOURCE}'    Click Element    xpath:/html/body/div[4]/div/div[2]/div/div[2]/div/div[2]/button[2]/span
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
    ${IMAGE_TO_LOAD_XPATH}=    Replace String    xpath://*[contains(text(), "__FILE_NAME__")]    __FILE_NAME__    ${IMAGE_TO_LOAD}
    Input Text    ${FILE_FILTER}    ${IMAGE_TO_LOAD}
    Wait Until Element Contains    ${FILE_LIST}   ${IMAGE_TO_LOAD}
    Click Element    ${IMAGE_TO_LOAD_XPATH}
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10


Load Image 
    [Arguments]    ${IMAGE_TO_LOAD}
    ${IMAGE_TO_LOAD_XPATH}=    Replace String    xpath://*[contains(text(), "__FILE_NAME__")]    __FILE_NAME__    ${IMAGE_TO_LOAD}
    Click Element    xpath://*[contains(text(), "File")]
    Click Element    xpath://*[contains(text(), "Open Image")]
    Input Text    ${FILE_FILTER}    ${IMAGE_TO_LOAD}
    Wait Until Element Contains    ${FILE_LIST}   ${IMAGE_TO_LOAD}
    Click Element    ${IMAGE_TO_LOAD_XPATH}
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${LOAD_BUTTON}    timeout=2
    Click Element    ${LOAD_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10


Append Image
    [Arguments]    ${IMAGE_TO_APPEND}
    ${IMAGE_TO_APPEND_XPATH}=    Replace String    xpath://*[contains(text(), "__FILE_NAME__")]    __FILE_NAME__    ${IMAGE_TO_APPEND}
    Click Element    xpath://*[contains(text(), "File")]
    Click Element    xpath://*[contains(text(), "Append Image")]
    Input Text    ${FILE_FILTER}    ${IMAGE_TO_APPEND}
    Wait Until Element Contains    ${FILE_LIST}   ${IMAGE_TO_APPEND}
    Click Element    ${IMAGE_TO_APPEND_XPATH}
    Wait Until Element Contains    ${FILE_INFO_TEXT}    Name
    Wait Until Element Is Enabled    ${APPEND_BUTTON}    timeout=2
    Click Element    ${APPEND_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=20
    Wait Until Element Is Not Visible    ${PROGRESS_CLOUD}    timeout=10


Close Image
    Click Element    xpath://*[contains(text(), "File")]
    Click Element    xpath://*[contains(text(), "Close Image")]


Load Region File
    [Arguments]    ${REGION_TO_LOAD}
    ${REGION_TO_LOAD_XPATH}=    Replace String    xpath://*[contains(text(), "__FILE_NAME__")]    __FILE_NAME__    ${REGION_TO_LOAD}
    Click Element    xpath://*[contains(text(), "File")]
    Click Element    xpath://*[contains(text(), "Import Regions")]
    Input Text    ${FILE_FILTER}    ${REGION_TO_LOAD}
    #Sleep    0.3
    Wait Until Element Contains    ${FILE_LIST}   ${REGION_TO_LOAD}
    Click Element    ${REGION_TO_LOAD_XPATH}
    Click Element    ${LOAD_REGION_BUTTON}
    Wait Until Page Does Not Contain    File Browser    timeout=20

Load Catalog File
    [Arguments]    ${CATALOG_TO_LOAD}
    ${CATALOG_TO_LOAD_XPATH}=    Replace String    xpath://*[contains(text(), "__FILE_NAME__")]    __FILE_NAME__    ${CATALOG_TO_LOAD}
    Click Element    xpath://*[contains(text(), "File")]
    Click Element    xpath://*[contains(text(), "Import Catalog")]
    Input Text    ${FILE_FILTER}    ${CATALOG_TO_LOAD}
    #Sleep    0.3
    Wait Until Element Contains    ${FILE_LIST}   ${CATALOG_TO_LOAD}
    Click Element    ${CATALOG_TO_LOAD_XPATH}
    Click Element    ${LOAD_CATALOG_BUTTON}
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