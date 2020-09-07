#!/bin/bash

(
	set -x
	set -e
	
	this_script="$(readlink -e "${BASH_SOURCE[0]}")"
	this_script_dir="$(dirname "${this_script}")"
	
	workspace_dir="${this_script_dir}/workspace"
	
	# Setup the workspace/ directory
	(cd "$workspace_dir"
		rm -rf ./{*,.venv}
	)
)
