#!/bin/bash

(
	#set -x
	set -e
	
	this_script="$(readlink -e "${BASH_SOURCE[0]}")"
	this_script_dir="$(dirname "${this_script}")"
	
	bagtest_dir="${this_script_dir}/source-code/BagTest"
	workspace_dir="${this_script_dir}/workspace"
	workspace_bin_dir="${workspace_dir}/bin"
	workspace_build_dir="${workspace_dir}/build"
	
	# Validate number of parameters passed
	if [ "$#" -ne "1" ]; then
		echo "Usage: $(basename "$this_script") [arduino-programming-port]"
		echo "Example port would be /dev/ttyACM0"
		exit 1
	fi
	
	# Upload BagTest onto the arduino mega
	(cd "$bagtest_dir"
		export PATH="${workspace_bin_dir}:${PATH}"
		arduino-cli upload \
			--fqbn 'arduino:avr:mega' \
			--input-dir "${workspace_build_dir}" \
			--port "$1" \
			--verify
		echo "Upload via port ${1} successful."
	)
)
