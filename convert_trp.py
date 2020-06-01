import glob
import os
from json2xml import json2xml
from json2xml.utils import readfromjson

col_id = os.environ.get('COL_ID')


file = f"/data/trnskrbs_{col_id}/col/trp.json"
out_file = f"/data/trnskrbs_{col_id}/col/trp.xml"
data = readfromjson(file)
xml_string = json2xml.Json2xml(data, wrapper="all", pretty=True).to_xml()

with open(out_file, "w") as f:
    f.write(xml_string)
