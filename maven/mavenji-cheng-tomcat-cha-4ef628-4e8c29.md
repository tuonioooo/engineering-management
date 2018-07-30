# maven集成Tomcat插件\(二\)

1. Tomcat 7 示例

这个例子说明了如何在Tomcat7打包并部署WAR文件。

添加具有角色管理器GUI和管理脚本的用户。

%TOMCAT7\_PATH%/conf/tomcat-users.xml

```
<?xml version='1.0' encoding='utf-8'?>
<tomcat-users>

<role rolename="manager-gui"/>
<role rolename="manager-script"/>
<user username="admin" password="password" roles="manager-gui,manager-script" />

</tomcat-users>
```

1.2 Maven 认证

添加在上面Maven 设置文件的 Tomcat 用户，是之后Maven使用此用户来登录Tomcat服务器。

%MAVEN\_PATH%/conf/settings.xml

```
<?xml version="1.0" encoding="UTF-8"?>
<settings ...>
<servers>
<server>
<id>TomcatServer</id>
<username>admin</username>
<password>password</password>
</server>

</servers>
</settings>
```

1.3 Tomcat7 Maven 插件

声明一个Maven的Tomcat插件。

pom.xml

```
<plugin>
<groupId>org.apache.tomcat.maven</groupId>
<artifactId>tomcat7-maven-plugin</artifactId>
<version>2.2</version>
<configuration>
<url>http://localhost:8080/manager/text</url>
<server>TomcatServer</server>
<path>/yiibaiWebApp</path>
</configuration>
</plugin>
```

怎么运行的？

在部署过程中，它告诉 Maven 通过部署 WAR 文件Tomcat服务器， “[http://localhost:8080/manager/text”](http://localhost:8080/manager/text”) , 在路径“/yiibaiWebApp“上, 使用 “TomcatServer” \(settings.xml\) 用户名和密码来进行认证。

1.4 发布到Tomcat

以下的命令是用来操纵Tomcat WAR文件。

```
mvn tomcat7:deploy
mvn tomcat7:undeploy
mvn tomcat7:redeploy
```

示例

```
> mvn tomcat7:deploy

...
[INFO] Deploying war to http://localhost:8080/yiibaiWebApp
Uploading: http://localhost:8080/manager/text/deploy?path=%2FyiibaiWebApp&update=true
Uploaded: http://localhost:8080/manager/text/deploy?path=%2FyiibaiWebApp&update=true (13925 KB at 35250.9 KB/sec)

[INFO] tomcatManager status code:200, ReasonPhrase:OK
[INFO] OK - Deployed application at context path /yiibaiWebApp
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 8.507 s
[INFO] Finished at: 2015-08-05T11:35:25+08:00
[INFO] Final Memory: 28M/308M
[INFO] ------------------------------------------------------------------------
```

## 2. Tomcat 6 示例

这个例子说明了如何在Tomcat6打包和部署WAR文件。这些步骤和Tomcat7是一样的，只是部署URL和命令名称不同。

2.1 Tomcat 认证

%TOMCAT6\_PATH%/conf/tomcat-users.xml

```
<?xml version='1.0' encoding='utf-8'?>
<tomcat-users>

<role rolename="manager-gui"/>
<role rolename="manager-script"/>
<user username="admin" password="password" roles="manager-gui,manager-script" />

</tomcat-users>
```

2.2 Maven 认证

%MAVEN\_PATH%/conf/settings.xml

```
<?xml version="1.0" encoding="UTF-8"?>
<settings ...>
<servers>
<server>
<id>TomcatServer</id>
<username>admin</username>
<password>password</password>
</server>

</servers>
</settings>
```

2.3 Tomcat6 Maven 插件

pom.xml

```
<plugin>
<groupId>org.apache.tomcat.maven</groupId>
<artifactId>tomcat6-maven-plugin</artifactId>
<version>2.2</version>
<configuration>
<url>http://localhost:8080/manager</url>
<server>TomcatServer</server>
<path>/yiibaiWebApp</path>
</configuration>
</plugin>
```

2.4 发布到Tomcat

```
mvn tomcat6:deploy
mvn tomcat6:undeploy
mvn tomcat6:redeploy
```

示例

```
> mvn tomcat6:deploy

...
[INFO] Deploying war to http://localhost:8080/yiibaiWebApp
Uploading: http://localhost:8080/manager/deploy?path=%2FyiibaiWebApp
Uploaded: http://localhost:8080/manager/deploy?path=%2FyiibaiWebApp (13925 KB at 32995.5 KB/sec)

[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 22.652 s
[INFO] Finished at: 2014-08-05T12:18:54+08:00
[INFO] Final Memory: 30M/308M
[INFO] ------------------------------------------------------------------------
```



