rm -rf utilities 
cp -r ../utilities .
robot --variable CARTA_PORT:3014 \
      --report report_parallel_manual_run_04.html \
      --log log_parallel_manual_run_04.html \
      --output output_parallel_manual_run_04.xml \
      ../functional_test/spectral_profiler.robot \
      ../functional_test/catalog_widget.robot \
      ../functional_test/spectral_line_query.robot \
      ../functional_test/cube_histogram.robot
rm -rf utilities