#!/bin/sh

source /etc/profile
BASE_PATH=$(cd `dirname $0`; pwd)
echo "执行路径：$BASE_PATH"
cd $BASE_PATH
#pwd

#current_date=`date -d "-1 day" "+%Y%m%d"`  
#echo $current_date 

PID=$(pgrep -f /usr/local/jenkins) 
PID_COUNT=$(pgrep -f /usr/local/jenkins|wc -l)
#echo $PID_COUNT
HTTP_PORT=9999
LOG_PATH=/data/jenkins/jenkins.log

JAVA_PATH=/usr/local/java/jdk1.8.0_231/bin/java
RUN_CMD=nohup $JAVA_PATH -jar $BASE_PATH/jenkins.war --httpPort=$HTTP_PORT --logfile=$LOG_PATH --prefix=/jenkins &
#RUN_CMD=" nohup $JAVA_PATH -jar $BASE_PATH/jenkins.war --httpPort=$HTTP_PORT --logfile=$LOG_PATH --prefix=/jenkins & "
#RUN_CMD=" screen -d -m $JAVA_PATH -jar $BASE_PATH/jenkins.war --httpPort=$HTTP_PORT --logfile=$LOG_PATH --prefix=/jenkins  " 
startApp()
{
   echo "启动程序!" 
   $RUN_CMD
   echo "进程PID=$(pgrep -f /usr/local/jenkins)"
}



if test $PID_COUNT -eq 0; then
  startApp
else 
 echo '重新启动程序!'
 kill -s 9 $PID
 startApp
fi

