PSEUDO UTF-8 Dictionary
=====================

This repository defines a UTF-8 format MySpell dictionary tested for use with VIM.

The dictionary metadata defines UTF-8 symbols including the common '_' as valid characters for the purpose of spell checking applications.

Usage
--------
Using the vim **Plug** framework, simply add the following line to your *.vimrc* file.

Plug 'systemmonkey42/utf_symbols'

This should be sufficient to retrieve the package, including a pre-compiled spelling file.

Building
------------

The dictionary is defined as a single 'symbols.aff' file which defines metadata about the dictionary, and a number of wordlists.

Each language and scope is defined via a wordlist using the following naming convention:

<language>_<scope>.dic
The following languages are currently defined

* c
* cpp

The following scopes are currently defined

* linux
* kernel

As an example, the *c_linux.dic* file contains all the data-types and #defines from the linux header files in /usr/include


