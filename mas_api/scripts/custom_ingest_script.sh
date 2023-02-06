#!/bin/bash

# Script to run a custom ingest script located in the folder /ingest_scripts/

# Example usage
#/custom_ingest_script.sh -f /ingest_scripts/filename.sh

# -f = filename of the script to run without the .sh extension

set -eu

filename=""

INGEST_SCRIPTS_ROOT_DIR="/ingest_scripts"

# process arguments
while getopts f: opt; do
    case $opt in
    f) filename=$OPTARG ;;
    *)
        echo 'Error in command line parsing' >&2
        exit 1
        ;;
    esac
done

# remove processed options
shift "$((OPTIND - 1))"

# check if the filename paramater is empty
if [ -z "$filename" ]; then
    echo 'Missing -f (name of the script file to execute)' >&2
    exit 1
fi

# strip any leading whitespaces
filename="${filename#"${filename%%[![:space:]]*}"}"

# full path to script
ingest_script_file="$INGEST_SCRIPTS_ROOT_DIR/$filename.sh"

# check if the script file exists
if [ ! -e "$ingest_script_file" ]; then
    echo "The specified '$ingest_script_file' does not exist" >&2
    exit 1
fi

# execute the script file
exec "$ingest_script_file"