#!/bin/bash
script_output="$(my_script.sh)"
expected_output="This is the custom package script!"
[ "${script_output}" != "${expected_output}" ] && exit 1
