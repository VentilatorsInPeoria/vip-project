#!/bin/bash

(
	#set -x
	set -e
	
	this_script="$(readlink -e "${BASH_SOURCE[0]}")"
	this_script_dir="$(dirname "${this_script}")"
	
	workspace_dir="${this_script_dir}/workspace"
	workspace_venv_dir="${workspace_dir}/.venv"
	
	# Use Tox to validate pyBagPlot before pushing
	# shellcheck source=workspace/.venv/bin/activate
	source "${workspace_venv_dir}/bin/activate"
	pybagplot "${@}"
	deactivate
)
