# SystemMonitor.py

import time
import psutil
from robot.api.deco import keyword


@keyword("Wait Until CPU Usage Is Below")
def wait_until_cpu_usage_is_below(
    threshold=80.0,
    timeout=30.0,
    check_interval=1.0,
):
    """
    Wait until overall system CPU usage falls below the threshold.

    Args:
        threshold: CPU usage percentage, e.g. 20 means 20%.
        timeout: Maximum number of seconds to wait.
        check_interval: Seconds between CPU measurements.

    Raises:
        AssertionError: If CPU usage does not fall below the threshold
                        before timeout.
    """

    threshold = float(threshold)
    timeout = float(timeout)
    check_interval = float(check_interval)

    start_time = time.monotonic()

    while True:
        cpu_usage = psutil.cpu_percent(interval=check_interval)

        print(f"Current system CPU usage: {cpu_usage:.1f}%")

        if cpu_usage < threshold:
            print(
                f"CPU usage {cpu_usage:.1f}% is below "
                f"threshold {threshold:.1f}%."
            )
            return

        elapsed = time.monotonic() - start_time

        if elapsed >= timeout:
            raise AssertionError(
                f"CPU usage did not fall below {threshold:.1f}% "
                f"within {timeout:.1f} seconds. "
                f"Last CPU usage: {cpu_usage:.1f}%."
            )
