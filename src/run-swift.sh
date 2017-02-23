#!/bin/bash

run_swift_root="/Users"
run_swift_folder="/Users/Shared/Guardia-pg"
run_swift_file="/Users/Shared/Guardia-pg/code.swift"

if [ ! -d "$run_swift_root" ]; then
    echo "You need to change the environment of Swift running."
else
    if [ -e "$run_swift_file" ]; then
        cd "$run_swift_folder"
        # calc compile time
        time_start=`date +%s`
        swiftc -o code.out  code.swift
        ./code.out
        time_end=`date +%s`
        echo ""
        echo "Compiled & Run with $[time_end-time_start]s."
        rm -rf code.out
    fi
fi
