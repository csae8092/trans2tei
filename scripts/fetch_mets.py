import os
from transkribus_utils import transkribus_utils

user = os.environ.get('TR_USER')
pw = os.environ.get('TR_PW')
col_id = os.environ.get('COL_ID')

mpr_docs = transkribus_utils.trp_collection_to_mets(col_id, user, pw, file_path='./mets')
