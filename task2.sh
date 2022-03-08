#!/bin/bash
tmp_dir=${1:-.}
cd $tmp_dir

logfile=~/shell-scripting/task2-dir/task2.logs
list_files=$(ls | grep --ignore-case "\.tmp$" | tr '\n' ' ')
rm --force $list_files
echo "[$(date +"%Y-%M-%d %H:%M:%S")] List removed files: $list_files" >> $logfile 
