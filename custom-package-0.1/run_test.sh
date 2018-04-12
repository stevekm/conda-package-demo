#!/bin/bash
script_output="$(my_script.sh)"
expected_output="This is the custom package script!"
if [ "${script_output}" == "${expected_output}" ]; then
    :
else
    exit 1
fi
