# jenkins常见问题

## Jenkins启动jar包后，进程被杀死 解决方案
```
1. 使用java -jar启动，-Dhudson.util.ProcessTree.disable=true -jar jenkins.war
2. 使用Tomcat启动，添加JAVA_OPTS="$JAVA_OPTS -Dhudson.util.ProcessTree.disable=true"；
Linux系统修改catalina.sh，在环境变量的说明后，脚本开始前加上JAVA_OPTS="$JAVA_OPTS -Dhudson.util.ProcessTree.disable=true"；
Windows系统修改catalina.bat，在环境变量的说明后，脚本开始前加上set JAVA_OPTS=%JAVA_OPTS% "-Dhudson.util.ProcessTree.disable=true"；修改好Tomcat的配置文件后重新启动Tomcat
```

## Jenkins构建Maven项目，报内存不足错误

https://blog.csdn.net/GISuuser/article/details/100744519

## jenkins构建java项目找不到命令mvn,java的解决方法

https://www.cnblogs.com/weifeng1463/p/9109317.html

## jenkins编译报错：Cannot run program "mvn" (in directory "/var/lib/jenkins/workspace/mall"): error=2, No such file or directory

https://www.oschina.net/question/1756518_2182111

## ERROR: Exception when publishing, exception message [Permission denied]

1.操作jenkins的用户 没有权限
2.操作jenkins的用户 操作的文件 在移动或者覆盖 目标文件时，目标文件的权限用户 居然是root 用户 权限太大导致的
