#!/bin/bash

(
	#set -x
	set -e
	
	this_script="$(readlink -e "${BASH_SOURCE[0]}")"
	this_script_dir="$(dirname "${this_script}")"
	
	bagtest_data_dir="${this_script_dir}/data/BagTest-data"
	csv_output_file="${bagtest_data_dir}/serial_output.csv"
	
	# Validate number of parameters passed
	if [ "$#" -ne "1" ]; then
		echo "Usage: $(basename "$this_script") [arduino-serial-port]"
		echo "Example port would be /dev/ttyUSB0"
		exit 1
	fi
	
	stty -F "$1" '115200'
	cat "$1" > "$csv_output_file"
)
