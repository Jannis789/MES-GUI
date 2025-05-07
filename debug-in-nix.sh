#!/usr/bin/env bash
nix-shell --run "python3 -m debugpy --listen 5678 --wait-for-client $1"
