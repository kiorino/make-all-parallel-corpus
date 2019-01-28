#!/bin/bash

FINDDIR=$1
if [ ! -e $FINDDIR ]; then
		echo "$FINDDIR is not exit"
		exit 1
fi

for xmlfile in `find ${FINDDIR} -name "*.xml" | sort`
do
		perl `pwd`/make_parallel.pl ${xmlfile}
done
