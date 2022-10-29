#!/bin/sh

BASE_PATH=$(cd `dirname $0`; pwd)
echo "执行路径：$BASE_PATH"
cd $BASE_PATH
pwd

PID_FILE=application.pid
APP_PROFILE=$2
JAVA_PATH="/usr/local/java/jdk1.8.0_231/bin/java"
RUN_CMD=" screen -d -m $JAVA_PATH $3  -XX:+UseG1GC -Xms3g -Xmx3g -server -XX:+HeapDumpOnOutOfMemoryError  -XX:HeapDumpPath=/tmp/  -Dapp.path=$BASE_PATH -Dspring.profiles.active=$APP_PROFILE -jar app.jar "


 startApp()
 {
   echo "启动程序，运行 $RUN_CMD"
   $RUN_CMD
 }

case $1 in

       stop)
            echo "关闭程序"
            test -f $PID_FILE && xargs kill -9  < $PID_FILE || echo '程序不在运行！不需要关闭！'
            rm -f $PID_FILE
         ;;

      start)
            if [ -f "$PID_FILE" ]; then
                echo "程序已经启动，不能再次开启！"
            else
               startApp;
            fi;
         ;;

      restart)
            test -f $PID_FILE && xargs kill -9 < $PID_FILE || echo '程序不在运行！不需要关闭！'
            rm -f $PID_FILE
            startApp;
         ;;

        *)
            echo "请输入指令（start,stop,restart）！"
         ;;

esac
