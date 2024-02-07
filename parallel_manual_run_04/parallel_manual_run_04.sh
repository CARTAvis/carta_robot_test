if [[ $OSTYPE == 'darwin'* ]]; then
    rm -rf utilities 
    cp -r ../utilities .
    time robot --variable CARTA_PORT:3014 \
        --variable SNAPSHOT_FOLDER:../snapshot \
        --report report_parallel_manual_run_04.html \
        --log log_parallel_manual_run_04.html \
        --output output_parallel_manual_run_04.xml \
        ../functional_test/matching.robot \
        ../functional_test/moment_generator.robot \
        ../functional_test/check_file_info.robot \
        ../functional_test/statistics_widget.robot \
        ../functional_test/cursor_info.robot
    rm -rf utilities
fi

if [[ $USERNAME == 'acdc1301' ]]; then
    rm -rf utilities 
    cp -r ../utilities .
    time robot --variable CARTA_PORT:3014 \
        --variable PYTHON3_EXECUTABLE:/usr/bin/python3 \
        --variable N_OMP_THREADS:8 \
        --variable CARTA_BACKEND_EXECUTABLE:/home/acdc1301/carta_build/carta-backend/build/carta_backend \
        --variable CARTA_FRONTEND_FOLDER:/home/acdc1301/carta_build/carta-frontend/build \
        --variable INITIAL_IMAGE_FOLDER:/home/acdc1301/set_QA_e2e_v2 \
        --variable SNAPSHOT_FOLDER:../snapshot \
        --variable WINDOW_SIZE_Y:874 \
        --report report_parallel_manual_run_04.html \
        --log log_parallel_manual_run_04.html \
        --output output_parallel_manual_run_04.xml \
        ../functional_test/matching.robot \
        ../functional_test/moment_generator.robot \
        ../functional_test/check_file_info.robot \
        ../functional_test/statistics_widget.robot \
        ../functional_test/cursor_info.robot
    rm -rf utilities
fi