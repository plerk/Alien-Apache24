#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

mkdir -p /tmp/build/apr /tmp/build/apr-util

cd /tmp/build/apr
curl http://www.motorlogy.com/apache/apr/apr-1.5.2.tar.gz | tar xvf -
cd apr-1.5.2
./configure && make && make install

cd /tmp/build/apr-util
curl http://www.motorlogy.com/apache/apr/apr-util-1.5.4.tar.gz | tar xvf -
cd apr-util-1.5.4
./configure && make && make install
