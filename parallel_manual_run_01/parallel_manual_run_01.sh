rm -rf utilities 
cp -r ../utilities .
robot --variable CARTA_PORT:3011 \
      --report report_parallel_manual_run_01.html \
      --log log_parallel_manual_run_01.html \
      --output output_parallel_manual_run_01.xml \
      ../functional_test/region.robot \
      ../functional_test/animator.robot \
      ../functional_test/check_file_info.robot \
      ../functional_test/cursor_info.robot \
      ../functional_test/WebGL_test.robot
rm -rf utilities
