#!/bin/bash

run_swift_root="/Users"
run_swift_folder="/Users/Shared/Guardia-pg"
run_swift_file="/Users/Shared/Guardia-pg/code.swift"

if [ ! -d "$run_swift_root" ]; then
    echo "You need to change the environment of Swift running."
else
    if [ -e "$run_swift_file" ]; then
        cd "$run_swift_folder"
        swiftc -o code.out  code.swift
        ./code.out
        rm -rf code.out
    fi
fi
