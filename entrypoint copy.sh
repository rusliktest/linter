#!/bin/bash -l

echo "======================"
echo "= Linting YAML files ="
echo "======================"

if [[ -n "$INPUT_CONFIG_FILE" ]]; then
    options+=(-c "$INPUT_CONFIG_FILE")
else if [[ -n "$INPUT_CONFIG_DATA" ]]; then
    options+=(-d "$INPUT_CONFIG_DATA")
else
    options+=(-d "{extends: default, rules: {line-length: {max: 112}}}")
fi

# if [[ -n "$INPUT_CONFIG_DATA" ]]; then
#     options+=(-d "$INPUT_CONFIG_DATA")
# else 
#     options+=(-d "config.yaml")
# fi

options+=(-f "$INPUT_FORMAT")

if [[ "$INPUT_STRICT" == "true" ]]; then
    options+=(-s)
fi

if [[ "$INPUT_NO_WARNINGS" == "true" ]]; then
    options+=(--no-warnings)
fi

# Enable globstar so ** globs recursively
shopt -s globstar
# Use the current directory by default
options+=("${INPUT_FILE_OR_DIR:-.}")

shopt -u globstar

yamllint "${options[@]}"
# **/\"*.{yaml,yml,.yamllint}\" 
# "${options[@]}"