#!/bin/bash

set -e

results=$(content_shell --dump-render-tree test/okeyee_test.html)

echo -e "$results" | grep "CONSOLE"

REGEX="All [0-9]+ tests pass"

if [[ $results =~ $REGEX ]]
then
echo Success!
  exit 0
else
echo Fail!
  exit 1
fi


