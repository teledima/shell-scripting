#!/bin/bash
files="ls --reverse -p ${1:-.}| grep -v '/$'"
echo "Count files: $(eval $files | wc -l)"
echo "Files list:"
eval $files
