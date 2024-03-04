from multiprocessing import Pool
import os

test_suites = {3100: "animator.robot",
               3101: "catalog_widget.robot",
               3102: "check_file_info.robot",
               3103: "cube_histogram.robot",
               3104: "cursor_info.robot",
               3105: "image_fitting.robot",
               3106: "load_image.robot",
               3107: "matching.robot",
               3108: "moment_generator.robot",
               3109: "pv_generator.robot",
               3110: "region.robot",
               3111: "rendering.robot",
               3112: "spatial_profiler.robot",
               3113: "spectral_line_query.robot",
               3114: "spectral_profiler.robot",
               3115: "statistics_widget.robot",
               3116: "WebGL_test.robot"
               }

def test_runner(port):
    test_suite_name = test_suites[port][:-6]
    os.system("time robot --variable CARTA_PORT:%d --variable SNAPSHOT_FOLDER:../snapshot --variable DELAY:0.2 --variable N_OMP_THREADS:8 --report report_parallel_run_%s.html --log log_parallel_run_%s.html --output output_parallel_run_%s.xml ../functional_test/%s"%(port, test_suite_name, test_suite_name, test_suite_name, test_suites[port]))


if __name__ == '__main__':
    os.system("rm -rf run_* *.png *.xml *.html")
    os.system("cp -r ../utilities .")
    with Pool(6) as p:
        print(p.map(test_runner, range(3100, 3117, 1)))
    
    output_list = ""
    for value in test_suites.values():
        output_list = output_list + "output_parallel_run_%s.xml "%value[:-6]
    os.system("rebot --outputdir . --output output.xml -l log.html -r report.html %s"%output_list)