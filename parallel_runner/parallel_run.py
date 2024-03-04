from multiprocessing import Pool
import os
import time
import sys

if len(sys.argv) == 1:
    config_file = "./config.txt"
elif len(sys.argv) == 2:
    config_file = sys.argv[1]

with open(config_file, "r") as fobj:
    tmp = fobj.readlines()

n_process = int(tmp[0])
custom_robot_flags = tmp[1]


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
    os.system("time robot --variable CARTA_PORT:%d --variable SNAPSHOT_FOLDER:../snapshot --report report_parallel_run_%s.html --log log_parallel_run_%s.html --output output_parallel_run_%s.xml %s ../functional_test/%s"%(port, test_suite_name, test_suite_name, test_suite_name, custom_robot_flags, test_suites[port]))


if __name__ == '__main__':
    t_start = time.time()
    os.system("rm -rf run_* *.png *.xml *.html")
    os.system("cp -r ../utilities .")
    with Pool(n_process) as p:
        print(p.map(test_runner, range(3100, 3117, 1)))
    
    output_list = ""
    for value in test_suites.values():
        output_list = output_list + "output_parallel_run_%s.xml "%value[:-6]
    os.system("rebot --outputdir . --output output.xml -l log.html -r report.html %s"%output_list)
    t_end = time.time()
    print(f"Elapsed time: {(t_end - t_start) / 60.0} mins. Check report.html to see the test results in one place.")