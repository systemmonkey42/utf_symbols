#!/bin/bash -x

while getopts ":f:" opt; do
	case "${opt}" in
		f)
			filter="${OPTARG}"
			;;
	esac
done

if [ -n "${filter}" ]; then
	if sed -e '/^[A-Z][^A-Z]*$/s/.*/\L&/' -e '/^[^a-z]*$/s/.*/\L&/' < "${filter}" | sort -u > "${filter}.new" ; then
		mv "${filter}.new" "${filter}"
	fi
	/bin/rm -f "${filter}.new"
else
	read -r count < <(cat ./*.dic | wc -l)

	{
		echo "$count"
		cat ./*.dic
	} | sed -e '/^[A-Z][^A-Z]*$/s/.*/\L&/' -e '/^[^a-z]*$/s/.*/\L&/' | sort -u > "spell/symbols.dic"

	(
		cd spell &&
			vim --cmd "mkspell! en.utf-8.add.spl symbols" --cmd q
	)
fi
