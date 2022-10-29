@echo off

rem 声明采用utf-8编码
rem chcp 65001
rem tasklist | find /i "%pid%"
rem "%errorlevel%"=="1" 代表错误
rem  if "%errorlevel%"=="1" (goto f) else (goto e)
rem  :f
rem  echo [ %time:~,-3% ]程序不在运行！不需要关闭！
rem  call:startApp
rem  exit
rem  :e
rem  taskkill /f /pid %pid%
rem  call:startApp
rem  exit


set BASE_PATH=%cd%

set APP_PROFILE=dev

set RUN_CMD=java -XX:+UseG1GC -Xms512m -Xmx1024m -server -XX:+HeapDumpOnOutOfMemoryError  -XX:HeapDumpPath=./tmp  -Dapp.path=%BASE_PATH% -Dspring.profiles.active=%APP_PROFILE% -jar app.jar


rem 判断文件是否存在
if not exist application.pid (
  echo application.pid file not exist
  call:startApp
  exit
)
 
rem 读取文件，每次读取一行，默认以空格分隔，默认取第一列
for /f %%i in ('type application.pid') do (
  set pid=%%i
)

rem //如果pid进程存在，就kill掉
for /f "tokens=2" %%a in ('tasklist ^| find /i "%pid%"') do (
	if %%a==%pid% (goto f)
	:f
	echo 当前运行进程的pid=%pid%
	taskkill /f /pid %pid%
	call:startApp
	exit
)
rem //如果pid进程不存在的话，上面的for循环将不执行，直接执行下面的代码

echo [ %time:~,-3% ]程序不在运行！不需要关闭！
call:startApp
exit

:startApp
echo [ %time:~,-3% ]启动程序，运行 %RUN_CMD%
start %RUN_CMD%
goto:eof









