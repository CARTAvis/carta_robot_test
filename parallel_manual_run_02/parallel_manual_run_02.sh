if [[ $OSTYPE == 'darwin'* ]]; then
    rm -rf utilities 
    cp -r ../utilities .
    time robot --variable CARTA_PORT:3012 \
        --variable SNAPSHOT_FOLDER:../snapshot \
        --variable DELAY:0.2 \
        --variable N_OMP_THREADS:8 \
        --report report_parallel_manual_run_02.html \
        --log log_parallel_manual_run_02.html \
        --output output_parallel_manual_run_02.xml \
        ../functional_test/catalog_widget.robot \
        ../functional_test/image_fitting.robot \
        ../functional_test/rendering.robot \
        ../functional_test/spatial_profiler.robot
    rm -rf utilities
fi 

if [[ $USERNAME == 'acdc1301' ]]; then
    rm -rf utilities 
    cp -r ../utilities .
    time robot --variable CARTA_PORT:3012 \
        --variable PYTHON3_EXECUTABLE:/home/acdc1301/anaconda3/bin/python \
        --variable DELAY:0.2 \
        --variable N_OMP_THREADS:8 \
        --variable CARTA_BACKEND_EXECUTABLE:/home/acdc1301/carta_build/carta-backend/build/carta_backend \
        --variable CARTA_FRONTEND_FOLDER:/home/acdc1301/carta_build/carta-frontend/build \
        --variable INITIAL_IMAGE_FOLDER:/home/acdc1301/set_QA_e2e_v2 \
        --variable SNAPSHOT_FOLDER:../snapshot \
        --variable WINDOW_SIZE_Y:800 \
        --report report_parallel_manual_run_02.html \
        --log log_parallel_manual_run_02.html \
        --output output_parallel_manual_run_02.xml \
        ../functional_test/catalog_widget.robot \
        ../functional_test/image_fitting.robot \
        ../functional_test/rendering.robot \
        ../functional_test/spatial_profiler.robot
    rm -rf utilities
fi