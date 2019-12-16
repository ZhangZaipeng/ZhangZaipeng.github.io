#!/bin/bash

. ~/.bash_profile

set -x
set -e

sqoop import \
--connect jdbc:mysql://139.199.59.176:3306/sqoop \
--username hadoop3 --password hadoop3 \
--table EMP \
--delete-target-dir  \
--fields-terminated-by '\t' --lines-terminated-by '\n' \
--hive-import --hive-table emp_etl --hive-overwrite  \
-m 1

if [ "$?"-ne 0]; then   
    echo "sqoop import failed";   
    exit 1;   
fi  

hql="insert overwrite table result_etl select deptno, avg(sal) from emp_etl group by deptno"

hive -e "$hql"

if [ "$?" -ne 0 ]; then
    echo "hive failed";
    exit 1;
fi

#delete data from mysql
mysql -h hadoop3 -uhadoop3 -phadoop3 <<EOF
  use sqoop;
  TRUNCATE result_etl;
EOF

sqoop export \
--connect jdbc:mysql://139.199.59.176:3306/sqoop \
--username hadoop3 --password hadoop3 \
--table result_etl \
--fields-terminated-by '\t' \
--export-dir /user/hive/warehouse/result_etl \
-m 1

if [ "$?"-ne 0]; then
    echo "sqoop export failed";
    exit 1;
fi

exit 0
