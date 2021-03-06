# maven集成Tomcat插件

Maven已经是Java的项目管理标配，如何在JavaEE开发使用Maven调用Web应用，是很多同学关心的问题。本文将介绍，Maven如何介绍Tomcat插件。

Maven Tomcat插件现在主要有两个版本，tomcat-maven-plugin和tomcat7-maven-plugin，使用方式基本相同。

tomcat-maven-plugin 插件官网：[http://mojo.codehaus.org/tomcat-maven-plugin/plugin-info.html](http://mojo.codehaus.org/tomcat-maven-plugin/plugin-info.html)。

tomcat7-maven-plugin 插件官网：[http://tomcat.apache.org/maven-plugin.html](http://tomcat.apache.org/maven-plugin.html)。

## tomcat-maven-plugin  插件使用配置

POM.xml 加入以下plugin

```text
<plugin>
<groupId>org.codehaus.mojo</groupId>
<artifactId>tomcat-maven-plugin</artifactId>
<version>1.1</version>
<configuration>
<path>/wp</path>
<port>8080</port>
<uriEncoding>UTF-8</uriEncoding>
<url>http://localhost:8080/manager/html</url>
<server>tomcat6</server>
</configuration>
</plugin>
```

> path 是访问应用的路径
>
> port 是tomcat 的端口号
>
> uriEncoding URL按UTF-8进行编码，这样就解决了中文参数乱码。
>
> Server 指定tomcat名称。

## 插件运行

如果Eclipse 安装了Maven插件，选 择pom.xml文件，击右键——&gt;选择 Run As——&gt; Maven build 。

[![image](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%2816%29.png)](http://static.oschina.net/uploads/img/201310/14145819_EQjC.png)

如果是第一次运行，会弹出下面对话框。在Goals框加加入以下命令: tomcat:run

## [![image](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%2817%29.png)](http://static.oschina.net/uploads/img/201310/14145820_5Bqc.png)

这样Tomcat 插件就可以运行。

下面介绍几个常用的Goal

| 命令 | 描述 |
| :--- | :--- |
| tomcat:deploy | 部署一个web war包 |
| tomcat:reload | 重新加载web war包 |
| tomcat:start | 启动tomcat |
| tomcat:stop | 停止tomcat |
| tomcat:undeploy | 停止一个war包 |
| tomcat:run | 启动嵌入式tomcat ，并运行当前项目 |

## tomcat7-maven-plugin 使用配置

POM.xml 加入以下plugin

```text
<plugin>
<groupId>org.apache.tomcat.maven</groupId>
<artifactId>tomcat7-maven-plugin</artifactId>
<version>2.1</version>
<configuration>
<port>9090</port>
<path>/mgr</path>
<uriEncoding>UTF-8</uriEncoding>
<finalName>mgr</finalName>
<server>tomcat7</server>
</configuration>
</plugin>
```

与tomcat6具体配置一样。

## 插件使用

在这里要注意一下，该插件命名方式有些不同，比如启动tomcat ，对应的目标命令是: tomcat7:run ,同样，其它命令也是这样，需要更改为：tomcat7：&lt;插件执行点&gt;

