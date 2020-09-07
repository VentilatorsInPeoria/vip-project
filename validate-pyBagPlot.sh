#!/bin/bash

(
	#set -x
	set -e
	
	this_script="$(readlink -e "${BASH_SOURCE[0]}")"
	this_script_dir="$(dirname "${this_script}")"
	
	pybagplot_dir="${this_script_dir}/source-code/pyBagPlot"
	workspace_dir="${this_script_dir}/workspace"
	
	# Use Tox to validate pyBagPlot before pushing
	(cd "$pybagplot_dir"
		tox --workdir "${workspace_dir}/.tox"
	)
)
