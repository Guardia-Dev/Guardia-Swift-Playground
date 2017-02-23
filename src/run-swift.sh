#!/bin/bash

run_swift_root="/Users"
run_swift_folder="/Users/Shared/Guardia-pg"
run_swift_file="/Users/Shared/Guardia-pg/code.swift"

if [ ! -d "$run_swift_root" ]; then
    echo "You need to change the environment of Swift running."
else
    if [ -e "$run_swift_file" ]; then
                # calc compile time
        time_start=`date +%s`
        swiftc -o "$run_swift_folder"/code.out  "$run_swift_folder"/code.swift
        gtimeout 2 "$run_swift_folder"/code.out>"$run_swift_folder"/code.log
        time_end=`date +%s`
        echo "">>"$run_swift_folder"/code.log

        filename="$run_swift_folder"/code.log
        filesize=`ls -l $filename | awk '{ print $5 }'`
        maxsize=$((1024*500))

        if [ $filesize -gt $maxsize ]; then
            echo "Memory Limit Exceeded!"
            echo "Memory Limit Exceeded!">"$filename"
        else
            echo "Memory Limit Success!"
            echo "Memory Limit Success!">>"$filename"
        fi

        echo "">>"$run_swift_folder"/code.log

        if [ "$[time_end-time_start]" -gt 2 ]; then
            echo "Running out of time! Faild!"
            echo "Running out of time! Faild!">>"$run_swift_folder"/code.log
        else
            echo "Compiled & Run with $[time_end-time_start]s. Success!"
            echo "Compiled & Run with $[time_end-time_start]s. Success!">>"$run_swift_folder"/code.log
        fi
        rm -rf code.out
    fi
fi
