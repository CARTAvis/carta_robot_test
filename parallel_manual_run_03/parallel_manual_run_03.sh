rm -rf utilities 
cp -r ../utilities .
robot --variable CARTA_PORT:3013 \
      --report report_parallel_manual_run_03.html \
      --log log_parallel_manual_run_03.html \
      --output output_parallel_manual_run_03.xml \
      ../functional_test/pv_generator.robot \
      ../functional_test/matching.robot \
      ../functional_test/rendering.robot \
      ../functional_test/cube_histogram.robot

