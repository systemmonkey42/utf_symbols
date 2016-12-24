#!/bin/bash -x

read -r count < <(cat ./*.dic | wc -l)

{
	echo "$count"
	cat ./*.dic
} | sed -e '/^[A-Z][^A-Z]*$/s/.*/\L&/' -e '/^[^a-z]*$/s/.*/\L&/' | sort -u > "spell/symbols.dic"

(
	cd spell &&
		vim --cmd "mkspell! en symbols" --cmd q
)
