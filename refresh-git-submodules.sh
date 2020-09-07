#!/bin/bash

(
	set -x
	set -e
	
	this_script="$(readlink -e "${BASH_SOURCE[0]}")"
	this_script_dir="$(dirname "${this_script}")"
	
	(cd "$this_script_dir"
		# Pull in latest master branch commit for each submodule
		git submodule update --recursive --init --remote
	)
)
