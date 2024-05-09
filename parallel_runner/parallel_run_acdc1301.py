from multiprocessing import Pool
import os
import time
import sys
from datetime import date
import glob

if len(sys.argv) == 1:
    config_file = "./config.txt"
elif len(sys.argv) == 2:
    config_file = sys.argv[1]

with open(config_file, "r") as fobj:
    tmp = fobj.readlines()

n_process = int(tmp[0])
custom_robot_flags = tmp[1]

# having longer runs run first
test_suites = {3100: "region.robot",
               3101: "catalog_widget.robot",
               3102: "load_image.robot",
               3103: "matching.robot",
               3104: "moment_generator.robot",
               3105: "pv_generator.robot",
               3106: "statistics_widget.robot",
               3107: "rendering.robot",
               3108: "image_fitting.robot",
               3109: "animator.robot",
               3110: "annotation.robot",
               3111: "spectral_line_query.robot",
               3112: "check_file_info.robot",
               3113: "statistics_widget.robot",
               3114: "spatial_profiler.robot",
               3115: "cube_histogram.robot",
               3116: "cursor_info.robot",
               3117: "WebGL_test.robot"
               }

robot_test_dir = '/home/acdc1301/carta_robot_test'
ddate = date.today().strftime("%Y%m%d")
output_dir = f"/home/acdc1301/e2e_reports/{ddate}"
# run_dir = f'{robot_test_dir}/parallel_runner'
run_dir = f'/home/acdc1301/temp_parallel_runner'

def test_runner(port):
    test_suite_name = test_suites[port][:-6]
    os.system(f"time robot --variable CARTA_PORT:{port} --variable SNAPSHOT_FOLDER:{robot_test_dir}/snapshot --report report_parallel_run_{test_suite_name}.html --log log_parallel_run_{test_suite_name}.html --output output_parallel_run_{test_suite_name}.xml {custom_robot_flags} {robot_test_dir}/functional_test/{test_suites[port]}")
    with open(f"{run_dir}/output_parallel_run_{test_suite_name}.xml", 'r') as fobj:
        tmp = fobj.readlines()
    tmp2 = tmp[-6]
    tmp3 = tmp2.split()
    test_result = tmp3[2] + "    " + tmp3[1] + "\t" + test_suite_name
    return test_result

if __name__ == '__main__':
    t_start = time.time()
    os.system(f"rm -rf {run_dir}/run_* {run_dir}/*.png {run_dir}/*.xml {run_dir}/*.html")
    os.system(f"cp -r {robot_test_dir}/utilities .")
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
    exist_dir = len(glob.glob(f"{output_dir}*"))
    if exist_dir > 0:
        output_dir = f"{output_dir}_{exist_dir}"
    os.system(f"mkdir -p {output_dir}")

    for value in test_suites.values():
        output_list = f"{output_list}output_parallel_run_{value[:-6]}.xml "
    os.system(f"rebot --outputdir {output_dir} --output output.xml -l log.html -r report.html {output_list}")
    # os.system("open report.html")
    t_middle = time.time()
    print(f"\nElapsed time for parallel run: {(t_middle - t_start) / 60.0} mins...")

    # rerun failed tests
    if len(rerun_suites) != 0:
        output_list = ""
        for test_suite_name in rerun_suites:
            print(f"\nRerun failed tests in {test_suite_name}...")
            os.system(f"time robot --variable CARTA_PORT:3200 --variable SNAPSHOT_FOLDER:{robot_test_dir}/snapshot --rerunfailed output_parallel_run_{test_suite_name}.xml --report report_parallel_run_{test_suite_name}_rerun.html --log log_parallel_run_{test_suite_name}_rerun.html --output output_parallel_run_{test_suite_name}_rerun.xml {custom_robot_flags} {robot_test_dir}/functional_test/{test_suite_name}.robot")
            output_list = f"{output_list}output_parallel_run_{test_suite_name}_rerun.xml"
        os.system(f"rebot --outputdir {output_dir} --output output_rerun.xml -l log_rerun.html -r report_rerun.html {output_list}")
        # os.system("open report_rerun.html")

    t_end = time.time()
    print(f"\nTotal elapsed time: {(t_end - t_start) / 60.0} mins. Check report.html (and report_rerun.html) to see the test results.")

    os.system(f"mv branch_info.txt {output_dir}")
    