#!/bin/bash

command -v stylua >/dev/null || brew install stylua

command -v stylua >/dev/null && stylua -- --check . || echo "Error: Stylua installation failed."

