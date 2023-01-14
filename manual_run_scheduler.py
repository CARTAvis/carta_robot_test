#!/usr/bin/env python
import numpy as np

"""
This script helps you to generate a set of execution list based on the input number 
of executors. You need to update 'test_suites_dict' including the execution time 
per test suite based on your hardware environment. Then the script will provide you 
the execution lists with minimal total execution time per executor. The output on
screen may be copied and pasted to the shell script per executor.
"""


n_executor = 4

# execution time per suite from actual e2e test run
test_suites_dict = {'../functional_test/animator.robot':'3:39', 
                    '../functional_test/check_file_info.robot':'2:17',
                    '../functional_test/cursor_info.robot':'0:33',
                    '../functional_test/catalog_widget.robot':'6:01',
                    '../functional_test/spectral_line_query.robot':'2:56',
                    '../functional_test/WebGL_test.robot':'0:25',
                    '../functional_test/image_fitting.robot':'5:05',
                    '../functional_test/spatial_profiler.robot':'2:23',
                    '../functional_test/load_image.robot':'5:11',
                    '../functional_test/moment_generator.robot':'6:02',
                    '../functional_test/pv_generator.robot':'4:54',
                    '../functional_test/matching.robot':'7:24',
                    '../functional_test/rendering.robot':'4:35',
                    '../functional_test/cube_histogram.robot':'1:34',
                    '../functional_test/region.robot':'9:15',
                    '../functional_test/spectral_profiler.robot':'5:44',
                    '../functional_test/statistics_widget.robot':'2:38'
}

##########################################################################



def mmss_to_second(mmss_string):
    tmp = mmss_string.split(":")
    return float(tmp[0]) * 60.0 + float(tmp[1])

def second_to_mmss(second):
    return "%dm%ds"%(second//60, second%60)

for key in test_suites_dict:
    test_suites_dict[key] = mmss_to_second(test_suites_dict[key])

suites = np.array(list(test_suites_dict.keys()))
execution_time = np.array(list(test_suites_dict.values()))
suites = suites[execution_time.argsort()[::-1]]
execution_time = execution_time[execution_time.argsort()[::-1]]

final_suite_execution_list = []
final_suite_execution_time_list = []

for i in range(n_executor):
    final_suite_execution_list.append([suites[i]])
    final_suite_execution_time_list.append(execution_time[i])

for j in range(n_executor, len(suites)):
    which_executor_to_add = np.array(final_suite_execution_time_list).argmin()
    final_suite_execution_list[which_executor_to_add].append(suites[j])
    final_suite_execution_time_list[which_executor_to_add] += execution_time[j]

# print optimized execution list and corresponding shell script for copy-and-paste
for ii in range(n_executor):
    print("#%d"%(ii + 1), final_suite_execution_list[ii], second_to_mmss(final_suite_execution_time_list[ii]))
    print("rm -rf utilities")
    print("cp -r ../utilities .")
    print("robot --variable CARTA_PORT:%d \ "%(3011 + ii))
    print("      --report report_parallel_manual_run_%02d.html \ "%(ii + 1))
    print("      --log log_parallel_manual_run_%02d.html \ "%(ii + 1))
    print("      --output output_parallel_manual_run_%02d.xml \ "%(ii + 1))
    for jj in range(len(final_suite_execution_list[ii])):
        if jj == len(final_suite_execution_list[ii]) - 1:
            print("     ", final_suite_execution_list[ii][jj])
        else:
            print("     ", final_suite_execution_list[ii][jj], "\ ")
    print("rm -rf utilities")
    print("\n")

    

