# maven集成Tomcat插件

Maven已经是Java的项目管理标配，如何在JavaEE开发使用Maven调用Web应用，是很多同学关心的问题。本文将介绍，Maven如何介绍Tomcat插件。

Maven Tomcat插件现在主要有两个版本，tomcat-maven-plugin和tomcat7-maven-plugin，使用方式基本相同。

tomcat-maven-plugin 插件官网：[http://mojo.codehaus.org/tomcat-maven-plugin/plugin-info.html](http://mojo.codehaus.org/tomcat-maven-plugin/plugin-info.html)。

tomcat7-maven-plugin 插件官网：[http://tomcat.apache.org/maven-plugin.html](http://tomcat.apache.org/maven-plugin.html)。

## tomcat-maven-plugin  插件使用配置

POM.xml 加入以下plugin

```
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



