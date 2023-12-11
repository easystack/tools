#!/usr/bin/bash

export BUILD_WITH_CONTAINER=0
make stability
sleep 120
./metrics/check_metrics.py

# TODO 