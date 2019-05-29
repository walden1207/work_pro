from apps.Public.common import rwSqlliteDB
import os
from DAC.settings import BASE_DIR

gateMacFile = "00-50-56-C0-00-AA"
# 设置临时文件路径
tempfiles = os.path.join(BASE_DIR, "media", "tempfiles")
field_list = [["deviceType", "char", 20], ["updateTime", "datetime", 6], ["deviceID", "int", None]]

# 拷贝模板文件到tempfiles
temp_db = (os.path.join(tempfiles, gateMacFile, "instruct.db"))

if not os.path.exists(os.path.join(tempfiles, gateMacFile)):
    os.mkdir(os.path.join(tempfiles, gateMacFile))


DB = rwSqlliteDB(temp_db)
# DB.create_table("ABB", field_list)
DB.insert_table("ABB", [["ABB", "2018-05-28 10:03:00", 2], ["ABB", "2018-05-28 10:03:00", 3]])