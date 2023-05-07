if [[ $OSTYPE == 'darwin'* ]]; then
    rm -rf utilities 
    cp -r ../utilities .
    robot --variable CARTA_PORT:3013 \
        --report report_parallel_manual_run_03.html \
        --log log_parallel_manual_run_03.html \
        --output output_parallel_manual_run_03.xml \
        ../functional_test/moment_generator.robot \
        ../functional_test/image_fitting.robot \
        ../functional_test/spatial_profiler.robot \
        ../functional_test/cursor_info.robot \
        ../functional_test/animator.robot
    rm -rf utilities 
fi

if [[ $OSTYPE == 'linux'* ]]; then
    rm -rf utilities 
    cp -r ../utilities .
    robot --variable CARTA_PORT:3013 \
        --variable PYTHON3_EXECUTABLE:/home/kswang/anaconda3/bin/python \
        --variable N_OMP_THREADS:8 \
        --variable CARTA_BACKEND_EXECUTABLE:/home/kswang/carta_build/carta-backend/build/carta_backend \
        --variable CARTA_FRONTEND_FOLDER:/home/kswang/carta_build/carta-frontend/build \
        --variable INITIAL_IMAGE_FOLDER:/home/kswang/set_QA_e2e_v2 \
        --report report_parallel_manual_run_03.html \
        --log log_parallel_manual_run_03.html \
        --output output_parallel_manual_run_03.xml \
        ../functional_test/moment_generator.robot \
        ../functional_test/image_fitting.robot \
        ../functional_test/spatial_profiler.robot \
        ../functional_test/cursor_info.robot \
        ../functional_test/animator.robot
    rm -rf utilities 
fi