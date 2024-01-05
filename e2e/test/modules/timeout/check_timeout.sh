#!/usr/bin/bash

echo "1ms timeout"
echo "return code: "`curl -s mockserver.timeout -o /dev/null -w "%{http_code}\n"`" (Gateway Timeout)"
