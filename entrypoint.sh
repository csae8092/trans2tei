#!/bin/bash

python TranskribusPyClient/src/TranskribusCommands/do_login.py --persist --login ${TR_USER} --pwd ${TR_PW}
python TranskribusPyClient/src/TranskribusCommands/Transkribus_downloader.py --persist ${COL_ID}  --noImage
python TranskribusPyClient/src/TranskribusCommands/do_logout.py
ant -DCOL_ID=${COL_ID} -f build_tei.xml
./tei2doc
# rm -rf trnskrbs_${COL_ID}
