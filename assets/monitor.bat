@echo off

rem ��������utf-8����
rem chcp 65001
rem tasklist | find /i "%pid%"
rem "%errorlevel%"=="1" �������
rem  if "%errorlevel%"=="1" (goto f) else (goto e)
rem  :f
rem  echo [ %time:~,-3% ]���������У�����Ҫ�رգ�
rem  call:startApp
rem  exit
rem  :e
rem  taskkill /f /pid %pid%
rem  call:startApp
rem  exit


set BASE_PATH=%cd%

set APP_PROFILE=dev

set RUN_CMD=java -XX:+UseG1GC -Xms512m -Xmx1024m -server -XX:+HeapDumpOnOutOfMemoryError  -XX:HeapDumpPath=./tmp  -Dapp.path=%BASE_PATH% -Dspring.profiles.active=%APP_PROFILE% -jar app.jar


rem �ж��ļ��Ƿ����
if not exist application.pid (
  echo application.pid file not exist  >> monitor.log
  call:startApp
  exit
)
 
rem ��ȡ�ļ���ÿ�ζ�ȡһ�У�Ĭ���Կո�ָ���Ĭ��ȡ��һ��
for /f %%i in ('type application.pid') do (
  set pid=%%i
)

rem //���pid���̴��ڣ���kill��
for /f "tokens=2" %%a in ('tasklist ^| find /i "%pid%"') do (
	if %%a==%pid% (goto f)
	:f
	echo ��ǰ����%pid%�������������κβ��� >> monitor.log
	exit
)
rem //���pid���̲����ڵĻ��������forѭ������ִ�У�ֱ��ִ������Ĵ���

echo [ %time:~,-3% ]���������У�����Ҫ�رգ� >> monitor.log
call:startApp
exit

:startApp
echo [ %time:~,-3% ]������������ %RUN_CMD%  >> monitor.log
start %RUN_CMD%
goto:eof










