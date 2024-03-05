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
               3106: "region.robot",
               3107: "annotation.robot",
               3108: "matching.robot",
               3109: "moment_generator.robot",
               3110: "pv_generator.robot",
               3111: "load_image.robot",
               3112: "rendering.robot",
               3113: "spatial_profiler.robot",
               3114: "spectral_line_query.robot",
               3115: "spectral_profiler.robot",
               3116: "statistics_widget.robot",
               3117: "WebGL_test.robot"
               }

def test_runner(port):
    test_suite_name = test_suites[port][:-6]
    os.system("time robot --variable CARTA_PORT:%d --variable SNAPSHOT_FOLDER:../snapshot --report report_parallel_run_%s.html --log log_parallel_run_%s.html --output output_parallel_run_%s.xml %s ../functional_test/%s"%(port, test_suite_name, test_suite_name, test_suite_name, custom_robot_flags, test_suites[port]))
    with open("./output_parallel_run_%s.xml"%test_suite_name, 'r') as fobj:
        tmp = fobj.readlines()
    tmp2 = tmp[-6]
    tmp3 = tmp2.split()
    test_result = tmp3[2] + "    " + tmp3[1] + "\t" + test_suite_name
    return test_result

if __name__ == '__main__':
    t_start = time.time()
    os.system("rm -rf run_* *.png *.xml *.html")
    os.system("cp -r ../utilities .")
    with Pool(n_process) as p:
        summary = p.map(test_runner, range(3100, 3118, 1))
    
    # show summary in terminal and collect failed suites to rerun
    rerun_suites = []
    for suite_summary in summary:
        print(suite_summary)
        if 'fail="0"' not in suite_summary:
            rerun_suites.append(suite_summary.split()[2])

    # combine test reports
    output_list = ""
    for value in test_suites.values():
        output_list = output_list + "output_parallel_run_%s.xml "%value[:-6]
    os.system("rebot --outputdir . --output output.xml -l log.html -r report.html %s"%output_list)
    os.system("open report.html")
    t_middle = time.time()
    print(f"\nElapsed time for parallel run: {(t_middle - t_start) / 60.0} mins...")

    # rerun failed tests
    if len(rerun_suites) != 0:
        output_list = ""
        for test_suite_name in rerun_suites:
            print("\nRerun failed tests in %s..."%test_suite_name)
            os.system("time robot --variable CARTA_PORT:3200 --variable SNAPSHOT_FOLDER:../snapshot --rerunfailed output_parallel_run_%s.xml --report report_parallel_run_%s_rerun.html --log log_parallel_run_%s_rerun.html --output output_parallel_run_%s_rerun.xml %s ../functional_test/%s.robot"%(test_suite_name, test_suite_name, test_suite_name, test_suite_name, custom_robot_flags, test_suite_name))
            output_list = output_list + "output_parallel_run_%s_rerun.xml "%test_suite_name
        os.system("rebot --outputdir . --output output_rerun.xml -l log_rerun.html -r report_rerun.html %s"%output_list)
        os.system("open report_rerun.html")

    t_end = time.time()
    print(f"\nTotal elapsed time: {(t_end - t_start) / 60.0} mins. Check report.html (and report_rerun.html) to see the test results.")
    