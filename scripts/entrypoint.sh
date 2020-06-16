#!/bin/bash

echo "#######################################"
 echo "Download METS-files for Documents in Collection ${COL_ID}"
echo "#######################################"

# python /data/scripts/fetch_mets.py
echo "#######################################"
echo "Generating TEIS from METS for Documents from Collection ${COL_ID}"
echo "#######################################"

ant -DCOL_ID=${COL_ID} -f /data/scripts/build_tei.xml


echo "#######################################"
echo "Generating DOCX for TEIS from Collection ${COL_ID}"
echo "#######################################"
