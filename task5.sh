#!/bin/bash
echo $0
base_dir=${1:-.}
work_dir="${base_dir}_copy"
cp -r $base_dir $work_dir
cd $work_dir

list_files=($(find . -maxdepth 1 -type f | tr '\n' ' '))
for file in ${list_files[@]}; do
	md5_filename=($(md5sum $file))
	extension=${file##*.}
	newfullname="${md5_filename[0]}.$extension"
	mv -T $file $newfullname
done
