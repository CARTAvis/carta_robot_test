rm -rf utilities 
cp -r ../utilities .
robot --variable CARTA_PORT:3013 \
      --report report_parallel_manual_run_03.html \
      --log log_parallel_manual_run_03.html \
      --output output_parallel_manual_run_03.xml \
      ../functional_test/moment_generator.robot \
      ../functional_test/load_image.robot \
      ../functional_test/statistics_widget.robot \
      ../functional_test/image_fitting.robot 
rm -rf utilities 
