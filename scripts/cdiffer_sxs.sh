#!/bin/bash

set -o xtrace

diff --unified --show-c-function "$@" | cdiff -s

