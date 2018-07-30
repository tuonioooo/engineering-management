# maven scm 用法\(SVN 的独有配置\)

Maven中为我们集成了软件配置管理的（SCM：Software Configuration Management）功能，他可以支持我们常用SVN、CVS等，到现在我使用的1.8.1版本，共支持18个命令：

> scm:branch - branch the project（创建项目的分支）
>
> scm:validate - validate the scm information in the pom（校验SCM的配置信息）
>
> scm:add - command to add file（增加一个文件）
>
> scm:unedit - command to stop editing the working copy（停止编辑当前COPY）
>
> scm:export - command to get a fresh exported copy（拉一个全新的分支）
>
> scm:bootstrap - command to checkout and build a project（checkout并编译工程）
>
> scm:changelog - command to show the source code revisions（显示源码版本）
>
> scm:list - command for get the list of project files（列出工程的文件）
>
> scm:checkin - command for commiting changes（提交变更）
>
> scm:checkout - command for getting the source code（获取源码）
>
> scm:status - command for showing the scm status of the working copy（获取本地项目的状态）
>
> scm:update - command for updating the working copy with the latest changes（从服务器获取最新的版本）
>
> scm:diff - command for showing the difference of the working copy with the remote one（比较本地与远程服务器的差异）
>
> scm:update-subprojects - command for updating all projects in a multi project build（更新子项目）
>
> scm:edit - command for starting edit on the working copy（编辑）
>
> scm:tag - command for tagging a certain revision（打标签）常用命令介绍



而我们常用只有以下这两个命令： 

Usage 

The SCM Plugin maps a lot of commands to a variety of scm implementations. But there are only 2 frequently used commands:

checkin - 提交变更

update - 从服务器上获取最新的版本配置及使用

其它的SCM都有自己独特的命令来操作提交变更、或从服务器上获取最新的源吗，如SVN及CVS的操作就很不相同，使用Maven担任的SCM机制，就可以使得SCM的操作变得统一，以下是一个SVN配置示例，将以下的示例配置到pom.xml文件中

```
<project>
...
<packaging>jar</packaging>
<version>1.0-SNAPSHOT</version>
<name>SCM Sample Project</name>
<url>http://somecompany.com</url>
<scm>
<connection>scm:svn:http://somerepository.com/svn_repo/trunk</connection>
<developerConnection>scm:svn:https://somerepository.com/svn_repo/trunk</developerConnection>
<url>http://somerepository.com/view.cvs</url>
</scm>
...
</project>
```



照这样配置好的，现在我们要做提交或者更新，就按如下按行命令 

提交：

```
mvn -Dmessage="<commit_log_here>" scm:checkin
```

获取最新版本：

```
mvn scm:updateSCM支持的连接类型
```



SCM支持两种连接类型：connection 及 developerConnection。 

以下是一个连接类型为connection的配置示例：

```
<project>
...
<build>
[...]
<plugins>
<plugin>
<groupId>org.apache.maven.plugins</groupId>
<artifactId>maven-scm-plugin</artifactId>
<version>1.8.1</version>
<configuration>
<connectionType>connection</connectionType>
</configuration>
</plugin>
...
</plugins
...
</build>
...
</project>
```

以下是一个连接类型为developerConnection的配置示例：

```
<project>
...
<build>
...
<plugins>
<plugin>
<groupId>org.apache.maven.plugins</groupId>
<artifactId>maven-scm-plugin</artifactId>
<version>1.8.1</version>
<configuration>
<connectionType>developerConnection</connectionType>
</configuration>
</plugin>
...
</plugins
...
</build>
...
</project>
```



