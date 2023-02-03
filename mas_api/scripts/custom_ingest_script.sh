#!/bin/bash

# Script to run a custom ingest script located in the folder /ingest_scripts/

# Example usage
#/custom_ingest_script.sh -f /ingest_scripts/filename.sh

# -f = filename of the script to run without the .sh extension

set -eu

filename=""

INGEST_SCRIPTS_ROOT_DIR="/ingest_scripts"

while getopts f: opt; do
    case $opt in
    f) filename=$OPTARG ;;
    *)
        echo 'Error in command line parsing' >&2
        exit 1
        ;;
    esac
done

shift "$((OPTIND - 1))"

if [ -z "$filename" ]; then
    echo 'Missing -f (name of the script file to execute)' >&2
    exit 1
fi

ingest_script_file="$INGEST_SCRIPTS_ROOT_DIR/$filename.sh"

if [ ! -e "$ingest_script_file" ]; then
    echo "The specified '$filename.sh' does not exist" >&2
    exit 1
fi

exec "$ingest_script_file"