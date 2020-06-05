#!/bin/bash

for f in ./tei/*.xml
do
    ./Stylesheets/bin/teitodocx ${f}
done
