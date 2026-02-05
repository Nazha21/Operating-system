#!/bin/bash
# Top 5 memory-using processes: Name, PID, %MEM
ps -eo comm,pid,%mem --sort=-%mem | head -n 6
