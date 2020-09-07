#!/bin/bash

(
	set -x
	set -e
	
	this_script="$(readlink -e "${BASH_SOURCE[0]}")"
	this_script_dir="$(dirname "${this_script}")"
	
	pybagplot_dir="${this_script_dir}/source-code/pyBagPlot"
	arduino_cli_dir="${this_script_dir}/support-tools/arduino-cli"
	workspace_dir="${this_script_dir}/workspace"
	workspace_bin_dir="${workspace_dir}/bin"
	workspace_venv_dir="${workspace_dir}/.venv"
	
	# Setup the workspace/ directory
	mkdir -p "$workspace_dir"
	(cd "$workspace_dir"
		echo "NOTE: If you have issues using wget, try installing curl."
		# arduino_cli -> workspace/bin
		"${arduino_cli_dir}/install.sh"
	)
	
	# Ensure arduino:avr platform is installed
	# This installation is not localized to the workspace
	(
		export PATH="${workspace_bin_dir}:${PATH}"
		arduino-cli core update-index
		arduino-cli core install 'arduino:avr'
	)
	
	# Setup Python development venv
	python3 -m venv "$workspace_venv_dir"
	(cd "$pybagplot_dir"
		source "${workspace_venv_dir}/bin/activate"
		# This will install pyBagPlot into the venv
		# Any changes made to the python files will be reflected here live
		poetry install
		deactivate
	)
)
