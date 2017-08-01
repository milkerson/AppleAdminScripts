#!/bin/bash

timestamp=`date "+%Y%m%d"`

COUNT=`expr $timestamp - 7`

echo "$COUNT"

exit 0
