#!/bin/bash

for f in /data/tei/${COL_ID}/*.xml
do
    /data/Stylesheets/bin/teitodocx ${f}
done
