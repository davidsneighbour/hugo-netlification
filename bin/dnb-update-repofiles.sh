#!/usr/bin/env bash

REQUIRED_TOOLS=(
  npm
  curl
)

for TOOL in "${REQUIRED_TOOLS[@]}"; do
  if ! command -v "${TOOL}" >/dev/null; then
    echo "${TOOL} is required... "
    exit 1
  fi
done

# https://github.com/ozum/replace-between
node ./node_modules/replace-between/bin/replace-between.js \
  --source ../../templates/readme/components.md \
  --target README.md \
  --token COMPONENTS
