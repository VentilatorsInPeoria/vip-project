#!/bin/bash

(
	#set -x
	set -e
	
	this_script="$(readlink -e "${BASH_SOURCE[0]}")"
	this_script_dir="$(dirname "${this_script}")"
	
	workspace_dir="${this_script_dir}/workspace"
	workspace_bin_dir="${workspace_dir}/bin"
	workspace_build_dir="${workspace_dir}/build"
	
	bagtest_dir="${this_script_dir}/source-code/BagTest"
	
	export PATH="${workspace_bin_dir}:${PATH}"
	if [ "$1" != "--skip-deps" ]; then
		"${bagtest_dir}/install-deps.sh"
	fi
	# This command will create the build dir if it does not exist
	arduino-cli compile \
		--fqbn 'arduino:avr:mega' \
		--output-dir "${workspace_build_dir}" \
		"$bagtest_dir"
)
