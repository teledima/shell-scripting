#!/bin/bash
base_dir=${1:-.}
work_dir="${base_dir}_copy"
cp -r $base_dir $work_dir
cd $work_dir

declare -A dict_table=( \
	["а"]="a" ["б"]="b" ["в"]="v" ["г"]="g" ["д"]="d" ["е"]="e" ["ё"]="yo" ["ж"]="zh" ["з"]="z" ["и"]="i" ["й"]="j" \
	["к"]="k" ["л"]="l" ["м"]="m" ["н"]="n" ["о"]="o" ["п"]="p" ["р"]="r" ["с"]="s" ["т"]="t" ["у"]="u" ["ф"]="f"\
	["х"]="x" ["ц"]="cz" ["ч"]="ch" ["ш"]="sh" ["щ"]="shh" ["ъ"]="\`\`" ["ы"]="y\`" ["ь"]="\`" ["э"]="e\`" ["ю"]="yu" ["я"]="ya"\
)
IFS=$'\n'
list_dirs=($(ls --quoting-style="c" -p | grep "/$" | sed 's/\///g'))
for dir in ${list_dirs[*]}; do
	newdirname=""
	while IFS= read -n 1 char; do
		if [[ $char != *[a-zA-Zа-яА-Я]* ]]; then
			newdirname+=$char
		elif [[ ${dict_table[${char,,}]} ]]; then
			if [ ${char^^} = $char  ]; then
				newdirname+=${dict_table[${char,,}]^^}
			else
				newdirname+=${dict_table[${char,,}]}
			fi
		else
			newdirname+=$char
	 	fi 
	done <<< ${dir:1:-1}
	mv ${dir:1:-1} $newdirname 2> /dev/null
done
