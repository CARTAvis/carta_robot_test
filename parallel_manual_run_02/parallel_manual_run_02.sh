rm -rf utilities 
cp -r ../utilities .
robot --variable CARTA_PORT:3012 \
      --report report_parallel_manual_run_02.html \
      --log log_parallel_manual_run_02.html \
      --output output_parallel_manual_run_02.xml \
      ../functional_test/matching.robot \
      ../functional_test/pv_generator.robot \
      ../functional_test/spatial_profiler.robot \
      ../functional_test/rendering.robot
rm -rf utilities 