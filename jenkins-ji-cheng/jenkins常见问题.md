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

#### 1.错误的问题
```
#场景一
[INFO] Changes detected - recompiling the module!
[INFO] Compiling 33 source files to /var/lib/jenkins/workspace/es/target/classes
[INFO] -------------------------------------------------------------
[ERROR] COMPILATION ERROR : 
[INFO] -------------------------------------------------------------
[ERROR] No compiler is provided in this environment. Perhaps you are running on a JRE rather than a JDK?
[INFO] 1 error
[INFO] -------------------------------------------------------------
[INFO] ------------------------------------------------------------------------
[INFO] BUILD FAILURE
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 02:42 min
[INFO] Finished at: 2018-05-29T18:32:22+08:00

# 场景二
/var/lib/jenkins/tools/hudson.tasks.Maven_MavenInstallation/maven_3.5.3/bin/mvn clean install
which: no java in (/var/lib/jenkins/tools/hudson.tasks.Maven_MavenInstallation/maven_3.5.3/bin:/sbin:/usr/sbin:/bin:/usr/bin)
The JAVA_HOME environment variable is not defined correctly
This environment variable is needed to run this program
NB: JAVA_HOME should point to a JDK not a JRE
Build step 'Invoke top-level Maven targets' marked build as failure
Finished: FAILURE

```

#### 解决方式

1.手动安装maven
安装maven  并配置到jenkins配置里
下载地址  https://maven.apache.org/download.cgi
wget  http://mirror.bit.edu.cn/apache/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz
tar zxvf apache-maven-3.5.2-bin.tar.gz
mv apache-maven-3.5.2 /usr/local/
/usr/loca/apache-maven-3.5.2/bin/mvn --version
jenkins -> 系统管理 -> 全局工具配置
Maven Configuration -> Settings file in filesystem -> File Path /usr/local/apache-maven-3.5.2/conf/settings.xml
Global settings file on filesystem -> File Path 同上
下拉到Maven，Maven安装，Name（自定义，如maven3.5.2），MAVEN_HOME填 “/usr/local/apache-maven-3.5.2”
左下角“save”

2.自动安装maven插件，jenkins有提供

## jenkins编译报错：Cannot run program "mvn" (in directory "/var/lib/jenkins/workspace/mall"): error=2, No such file or directory

https://www.oschina.net/question/1756518_2182111

## ERROR: Exception when publishing, exception message [Permission denied]

1.操作jenkins的用户 没有权限  
2.操作jenkins的用户 操作的文件 在移动或者覆盖 目标文件时，目标文件的权限用户 居然是root 用户 权限太大导致的
