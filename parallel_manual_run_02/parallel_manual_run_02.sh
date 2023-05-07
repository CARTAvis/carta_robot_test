if [[ $OSTYPE == 'darwin'* ]]; then
    rm -rf utilities 
    cp -r ../utilities .
    robot --variable CARTA_PORT:3012 \
        --report report_parallel_manual_run_02.html \
        --log log_parallel_manual_run_02.html \
        --output output_parallel_manual_run_02.xml \
        ../functional_test/load_image.robot \
        ../functional_test/spectral_line_query.robot \
        ../functional_test/spectral_profiler.robot \
        ../functional_test/statistics_widget.robot
    rm -rf utilities
fi 

if [[ $OSTYPE == 'linux'* ]]; then
    rm -rf utilities 
    cp -r ../utilities .
    robot --variable CARTA_PORT:3012 \
        --variable PYTHON3_EXECUTABLE:/home/kswang/anaconda3/bin/python \
        --variable N_OMP_THREADS:8 \
        --variable CARTA_BACKEND_EXECUTABLE:/home/kswang/carta_build/carta-backend/build/carta_backend \
        --variable CARTA_FRONTEND_FOLDER:/home/kswang/carta_build/carta-frontend/build \
        --variable INITIAL_IMAGE_FOLDER:/home/kswang/set_QA_e2e_v2 \
        --report report_parallel_manual_run_02.html \
        --log log_parallel_manual_run_02.html \
        --output output_parallel_manual_run_02.xml \
        ../functional_test/load_image.robot \
        ../functional_test/spectral_line_query.robot \
        ../functional_test/spectral_profiler.robot \
        ../functional_test/statistics_widget.robot
    rm -rf utilities
fi 