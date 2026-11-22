#!/bin/bash
# Author: Avisha Arora | Roll No: 2601730308
# Capstone Q2 - System Information Report

echo "========================================"
echo "       SYSTEM INFORMATION REPORT"
echo "========================================"
echo "Name: Avisha Arora"
echo "Roll Number: 2601730308"
echo "Date: $(date)"
echo

echo "---------- CPU INFORMATION ----------"
echo "CPU Model:"
lscpu | awk -F: '/Model name/ {print $2; exit}'

echo "Number of CPU cores:"
lscpu | awk -F: '/Core(s) per socket/ {cores=$2}
                  /Socket(s)/ {sockets=$2}
                  END {gsub(/ /,"",cores); gsub(/ /,"",sockets);
                       print cores*sockets " physical cores"}'
echo

echo "---------- MEMORY INFORMATION ----------"
free -h | awk '/Mem:/ {
    print "Total Memory: " $2
    print "Used Memory: " $3
}'
echo

echo "---------- TOP 3 PROCESSES BY CPU ----------"
ps -eo pid,comm,%cpu --sort=-%cpu | head -4
echo

echo "========================================"
echo "Report generated successfully."
