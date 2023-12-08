#!/usr/bin/bash

make stability
sleep 120
./metrics/check_metrics.py