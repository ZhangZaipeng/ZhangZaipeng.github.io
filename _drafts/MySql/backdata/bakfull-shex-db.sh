#!/bin/sh
# mysql data backup script
# create by 2018-08-08 
# auth zhangzp
set -x
set -e

BackUpDir=/data/mysql/back_data
LogFile=/data/mysql/back_data/mysqlbak.log
DATE=`date +%Y-%m-%d_%H:%M:%S`

echo " " >> $LogFile
echo " " >> $LogFile
echo "-------------------------------------------" >> $LogFile 
echo $(date +"%Y-%m-%d %H:%M:%S") >> $LogFile
echo "--------------------------" >> $LogFile

cd $BackUpDir

DumpFile=/data/mysql/back_data/$DATE.sql

GZDumpFile=/data/mysql/back_data/$DATE.sql.tgz

/usr/local/mysql/bin/mysqldump shex_db  > $DumpFile

echo "Dump Done" >> $LogFile

tar czvf $GZDumpFile $DumpFile >> $LogFile 2>&1 

echo "[$GZDumpFile]Backup Success!" >> $LogFile

rm -f $DumpFile 

# 采用增量备份的文件,如果完整备份后,则删除增量备份的文件.

cd $BackUpDir/daily

rm -f *

cd $BackUpDir

echo "Backup Done!"
echo "please Check $BackUpDir Directory!"
echo "copy it to your local disk or ftp to somewhere !!!"

ls -al $BackUpDir
