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
test_suites = {
    3100: "rendering.robot",             # 05:40
    3101: "load_image.robot",            # 05:14
    3102: "conversion.robot",            # ??:??
    3103: "region.robot",                # 05:08
    3104: "catalog_widget.robot",        # 04:02
    3105: "image_fitting.robot",         # 03:43
    3106: "matching.robot",              # 04:04
    3107: "moment_generator.robot",      # 03:51
    3108: "pv_generator.robot",          # 03:36
    3109: "spectral_profiler.robot",     # 03:01
    3110: "animator.robot",              # 02:19
    3111: "annotation.robot",            # 02:05
    3112: "check_file_info.robot",       # 01:36
    3113: "spectral_line_query.robot",   # 01:22
    3114: "channel_map_view.robot",      # 01:25
    3115: "spatial_profiler.robot",      # 01:15
    3116: "statistics_widget.robot",     # 01:14
    3117: "image_viewer.robot",          # ??:??
    3118: "file_browser.robot",          # ??:??
    3119: "histogram_widget.robot",      # ??:??
    3120: "cube_histogram.robot",        # 00:57
    3121: "cursor_info.robot",           # 00:19
    3122: "WebGL_test.robot",            # 00:16
    }

base_dir = f'/Users/kchou/bz'
robot_test_dir = f'{base_dir}/carta_robot_test'
ddate = date.today().strftime("%Y%m%d")
output_dir = f"{base_dir}/e2e_reports/{ddate}"
run_dir = f'{robot_test_dir}/kchou_test'

def test_runner(port):
    test_suite_name = test_suites[port][:-6]
    os.system(f"time robot --variable CARTA_PORT:{port} --variable SNAPSHOT_FOLDER:{robot_test_dir}/snapshot --report report_parallel_run_{test_suite_name}.html --log log_parallel_run_{test_suite_name}.html --output output_parallel_run_{test_suite_name}.xml {custom_robot_flags} {robot_test_dir}/functional_test/{test_suites[port]}")
    with open(f"{run_dir}/output_parallel_run_{test_suite_name}.xml", 'r') as fobj:
        tmp = fobj.readlines()
    for ii in range(len(tmp)-1, 0, -1):
        if tmp[ii][0:5] == '<stat' and "All Tests" in tmp[ii]:
            tmp2 = tmp[ii]
            break
    tmp3 = tmp2.split()
    test_result = tmp3[2] + "    " + tmp3[1] + "\t" + test_suite_name
    return test_result

if __name__ == '__main__':
    t_start = time.time()
    os.system(f"rm -rf {run_dir}/run_* {run_dir}/*.png {run_dir}/*.xml {run_dir}/*.html")
    os.system(f"cp -r {robot_test_dir}/utilities .")
    keys = list(test_suites.keys())
    with Pool(n_process) as p:
        summary = p.map(test_runner, range(keys[0], keys[-1]+1, 1))

    # show summary in terminal and collect failed suites to rerun
    rerun_suites = []
    for suite_summary in summary:
        if 'fail="0"' not in suite_summary:
            rerun_suites.append(suite_summary.split()[2])
    print("rerun:", rerun_suites)

    # combine test reports
    output_list = ""
    exist_dir = len(glob.glob(f"{output_dir}*"))
    if exist_dir > 0:
        output_dir = f"{output_dir}_{exist_dir}"
    os.system(f"mkdir -p {output_dir}")

    for value in test_suites.values():
        output_list = f"{output_list} output_parallel_run_{value[:-6]}.xml"
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
            output_list = f"{output_list} output_parallel_run_{test_suite_name}_rerun.xml"
        os.system(f"rebot --outputdir {output_dir} --output output_rerun.xml -l log_rerun.html -r report_rerun.html {output_list}")
        # os.system("open report_rerun.html")

    t_end = time.time()
    print(f"\nTotal elapsed time: {(t_end - t_start) / 60.0} mins. Check report.html (and report_rerun.html) to see the test results.")

    os.system(f"mv branch_info.txt {output_dir}")
    os.system(f"mv selenium-screenshot*.png {output_dir}")
    