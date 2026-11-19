from multiprocessing import Pool, Event
import os
import signal
import subprocess
import time
import sys

if len(sys.argv) == 1:
    config_file = "./config.txt"
elif len(sys.argv) == 2:
    config_file = sys.argv[1]

with open(config_file, "r") as fobj:
    tmp = fobj.readlines()

n_process = int(tmp[0])
custom_robot_flags = tmp[1].strip()

# having longer runs run first
test_suites = {
    3200: "matching.robot",
    3201: "load_catalog.robot",              
    3202: "moment_generator.robot",
    3203: "rendering_WebGL2.robot",                
    3204: "rendering_non_WebGL2.robot",  
    3205: "image_fitting.robot",         
    3206: "pv_generator.robot",          
    3207: "load_image_basic.robot",
    3208: "region_carta.robot",
    3209: "catalog_widget.robot",
    3210: "spectral_profiler.robot",
    3211: "image_viewer.robot",                    
    3212: "animator.robot",
    3213: "conversion_spectral.robot",
    3214: "popout_image_viewer.robot",             
    3215: "conversion_spatial.robot",        
    3216: "conversion_intensity.robot",        
    3217: "load_image_advanced.robot",   
    3218: "annotation.robot",            
    3219: "region_ds9.robot",                         
    3220: "statistics_widget.robot",
    3221: "spectral_line_query.robot",     
    3222: "check_file_info.robot", 
    3223: "channel_map_view.robot",                   
    3224: "region_casa.robot",
    3225: "export_test.robot",             
    3226: "spatial_profiler.robot",          
    3227: "histogram_widget.robot",      
    3228: "cube_histogram.robot",
    3229: "file_browser.robot",        
    3230: "workspace.robot",
    3231: "stokes_analysis.robot",
    3232: "conversion_time.robot",       
    3233: "cursor_info.robot",           
    }

RERUN_THRESHOLD = 5.0  # only rerun when the failed percentage is less than 5% to save time

stop_event = None  # set in each worker by init_worker()

def init_worker(event):
    # Workers swallow Ctrl+C. The robot processes still receive SIGINT from the
    # terminal and stop gracefully; the main process coordinates the shutdown.
    # Use a no-op handler rather than SIG_IGN: SIG_IGN would be inherited by the
    # robot child processes, which then could not be stopped with Ctrl+C at all.
    global stop_event
    stop_event = event
    signal.signal(signal.SIGINT, lambda signum, frame: None)

def run(cmd):
    return subprocess.run(cmd, shell=True).returncode

def parse_summary(test_suite_name):
    # return e.g. 'fail="0"    pass="12"\tsuite_name', or None if no usable output
    try:
        with open("./output_parallel_run_%s.xml"%test_suite_name, 'r') as fobj:
            tmp = fobj.readlines()
    except OSError:
        return None
    for ii in range(len(tmp)-1, 0, -1):
        if tmp[ii][0:5] == '<stat' and "All Tests" in tmp[ii]:
            tmp3 = tmp[ii].split()
            return tmp3[2] + "    " + tmp3[1] + "\t" + test_suite_name
    return None

def test_runner(port):
    if stop_event.is_set():
        return None  # interrupted: skip suites that have not started yet
    test_suite_name = test_suites[port][:-6]
    run("time robot --variable CARTA_PORT:%d --variable SNAPSHOT_FOLDER:../snapshot --report report_parallel_run_%s.html --log log_parallel_run_%s.html --output output_parallel_run_%s.xml %s ../functional_test/%s"%(port, test_suite_name, test_suite_name, test_suite_name, custom_robot_flags, test_suites[port]))
    return parse_summary(test_suite_name)

def rerun_runner(port):
    if stop_event.is_set():
        return None
    test_suite_name = test_suites[port][:-6]
    print("\nRerun failed tests in %s..."%test_suite_name)
    run("time robot --variable CARTA_PORT:%d --variable SNAPSHOT_FOLDER:../snapshot --rerunfailed output_parallel_run_%s.xml --report report_parallel_run_%s_rerun.html --log log_parallel_run_%s_rerun.html --output output_parallel_run_%s_rerun.xml %s ../functional_test/%s"%(port, test_suite_name, test_suite_name, test_suite_name, test_suite_name, custom_robot_flags, test_suites[port]))
    if os.path.exists("output_parallel_run_%s_rerun.xml"%test_suite_name):
        return test_suite_name
    return None

def parallel_map(func, ports, n, event):
    """Run func over ports in a pool. Returns (results, interrupted).

    First Ctrl+C: robot finishes its current test and writes its output, no new
    suites are started, and we wait for the running ones. Second Ctrl+C: the
    robot processes stop immediately and the pool is terminated.
    """
    with Pool(n, initializer=init_worker, initargs=(event,)) as p:
        async_result = p.map_async(func, ports, chunksize=1)
        try:
            return async_result.get(), False
        except KeyboardInterrupt:
            event.set()
            print("\n\nCtrl+C received: letting running suites finish their current test and write output. "
                  "No new suites will start. Press Ctrl+C again to force quit.\n", flush=True)
        try:
            return async_result.get(), True
        except KeyboardInterrupt:
            print("\n\nSecond Ctrl+C received: force quitting.\n", flush=True)
            p.terminate()
            p.join()
            sys.exit(130)

def combine_reports(output_files, output, log, report):
    output_files = [f for f in output_files if os.path.exists(f)]
    if not output_files:
        print("\nNo robot output to combine.")
        return
    run("rebot --outputdir . --output %s -l %s -r %s %s"%(output, log, report, " ".join(output_files)))
    run("open %s"%report)

if __name__ == '__main__':
    t_start = time.time()
    run("rm -rf run_* *.png *.xml *.html")
    run("cp -r ../utilities .")
    stop_event = Event()
    summary, interrupted = parallel_map(test_runner, range(3200, 3200+len(test_suites), 1), n_process, stop_event)
    summary = [s for s in summary if s is not None]  # drop suites skipped or without output

    # show summary in terminal and collect failed suites to rerun
    rerun_suites = []
    for suite_summary in summary:
        print(suite_summary)
        if 'fail="0"' not in suite_summary:
            rerun_suites.append(suite_summary.split()[2])

    # counting failed test percentage
    total_tests = 0
    total_failed = 0
    for suite_summary in summary:
        tmp = suite_summary.split()
        tmp_failed = int(tmp[0].split('"')[1])
        tmp_passed = int(tmp[1].split('"')[1])
        total_tests = total_tests + tmp_failed + tmp_passed
        total_failed = total_failed + tmp_failed

    test_failed_percentage = total_failed / total_tests * 100.0 if total_tests > 0 else 0.0
    print(f"\nTotal tests: {total_tests}, Failed tests: {total_failed}, Failed percentage: {test_failed_percentage:.2f}%")

    # combine test reports
    combine_reports(["output_parallel_run_%s.xml"%value[:-6] for value in test_suites.values()],
                    "output.xml", "log.html", "report.html")
    t_middle = time.time()
    print(f"\nElapsed time for parallel run: {(t_middle - t_start) / 60.0} mins...")

    # rerun failed tests
    if interrupted:
        print("\nRun was interrupted, skip rerun.")
    elif len(rerun_suites) != 0 and test_failed_percentage < RERUN_THRESHOLD:  # only rerun when there are failed tests and the failed percentage is less than 5% to save time
        # rerun each failed suite in parallel on its original port
        rerun_ports = [port for port, value in test_suites.items() if value[:-6] in rerun_suites]
        rerun_done, _ = parallel_map(rerun_runner, rerun_ports, min(n_process, len(rerun_ports)), stop_event)
        combine_reports(["output_parallel_run_%s_rerun.xml"%name for name in rerun_done if name is not None],
                        "output_rerun.xml", "log_rerun.html", "report_rerun.html")
    elif test_failed_percentage >= RERUN_THRESHOLD:
        print(f"\nFailed percentage is higher than {RERUN_THRESHOLD}%, skip rerun to save time.")

    t_end = time.time()
    print(f"\nTotal elapsed time: {(t_end - t_start) / 60.0} mins. Check report.html (and report_rerun.html) to see the test results.")
