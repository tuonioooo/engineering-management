# maven settings配置详解

* **settings官方配置详解**

[http://maven.apache.org/settings.html\#](http://maven.apache.org/settings.html#)

* **settings配置**

```
<?xml version="1.0" encoding="UTF-8"?>

<!--
 | 这是Maven的配置文件，有下面两种level:
 |
 |  1. User Level. 只为单个用户提供配置，通常在${user.home}/.m2/settings.xml 目录下。
 |
 |                 注: 这个位置可以在命令行中输入如下改变：
 |
 |                 -s /path/to/user/settings.xml
 |
 |  2. Global Level.为一台机器上所有Maven用户提供配置。通常在${maven.home}/conf/settings.xml目录下。
 |
 |                 注: 这个位置可以在命令行中输入如下改变：
 |　　　　　　　　　　
 |                 -gs /path/to/global/settings.xml
 |
 |-->
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0" 
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd">

 <!-- localRepository
   | 指定存储Maven要用到jar包的本地仓库位置
   | 默认: ~/.m2/repository
  -->
  <localRepository>/path/to/local/repo</localRepository>


  <!-- interactiveMode
   | 指定当需要输入时，Maven是否提示.
   | 如果设置为false，Maven会使用一个合理的默认值,也许是基于其他设置,比如问题的参数
   | 默认: true
　-->
  <interactiveMode>true</interactiveMode>


  <!-- offline
   | 指定在build时，是否需要Maven连接网络，去下载一些jar包、部署文件等。
   | 默认: false
  -->
  <offline>false</offline>


  <!-- pluginGroups
   | 这里面有一系列的group标识，当要解析插件时，会根据前缀自动搜索。
   | 比如：当执行命令"mvn prefix:goal". Maven会自动把 "org.apache.maven.plugins" 和"org.codehaus.mojo" 加进来。
   |-->
  <pluginGroups>

    <pluginGroup> com.your.plugins </pluginGroup>

  </pluginGroups>

  <!-- proxies
   | 这里面有一系列的代理设置，无法直接连接中心仓库网络时使用。
   | 除非另有说明(通过系统属性或命令行开关),第一个代理规范在这个列表标记为活动将被使用。
   |-->
  <proxies>
    <!--
    <proxy>
      <id>optional</id>
      <active>true</active>
      <protocol>http</protocol>
      <username>proxyuser</username>
      <password>proxypass</password>
      <host>proxy.host.net</host>
      <port>80</port>
      <nonProxyHosts>local.net|some.host.com</nonProxyHosts>
    </proxy>
    -->
    <proxy>
        <id>my-proxy</id>
        <active>true</active>
        <protocol>http</protocol>
        <host>218.14.227.197</host>
        <port>3128</port>
    </proxy>
  </proxies>

  <!-- servers
   | This is a list of authentication profiles, keyed by the server-id used within the system.
   | Authentication profiles can be used whenever maven must make a connection to a remote server.
   |-->
  <servers>
    <!-- server
     | 指定连接到某台特定服务器时的权限信息, 用id作为唯一标识。
     | 注:你可以指定用户名/密码或私钥/口令, 但确保用户名和密码配对，私钥和口令配对
    -->
    <server>
      <id>deploymentRepo</id>
      <username>repouser</username>
      <password>repopwd</password>
    </server>


    <server>
      <id>siteServer</id>
      <privateKey>/path/to/private/key</privateKey>
      <passphrase>可选，如果不用的话，置空</passphrase>
    </server>

  </servers>

  <!-- mirrors
   | This is a list of mirrors to be used in downloading artifacts from remote repositories.
   | 
   | It works like this: a POM may declare a repository to use in resolving certain artifacts.
   | However, this repository may have problems with heavy traffic at times, so people have mirrored
   | it to several places.
   |
   | That repository definition will have a unique id, so we can create a mirror reference for that
   | repository, to be used as an alternate download site. The mirror site will be the preferred 
   | server for that repository.
   |-->
  <mirrors>
    <!-- mirror
     | 表示镜像库，用来代替指定的仓库 
     -->
    <mirror>
      <id>mirrorId</id>
      <mirrorOf>repositoryId</mirrorOf>
      <name>Human Readable Name for this Mirror.</name>
      <url>http://my.repository.com/repo/path</url>
    </mirror>

  </mirrors>

  <!-- profiles
   |  Profiles用来指定本地机器路径和仓库位置，使程序可以在本地环境中运行。 
   | 比如你有一个集成测试的插件 cactus，它需要知道你的tomcat安装在哪。
   |-->
  <profiles>
    <!-- profile
     | 指定build过程中需要的一些指示，会使用一个或更多的激活配置。
     | 为了集成考虑,通过<activatedProfiles/>标签来激活配置（或用命令行）。
     | 每个profile有一个独立的id.
     |
     | profile识别的常见best practise是使用统一的、直观的、便于理解的命名惯例，。
     | 例如：'env-dev', 'env-test', 'env-production', 'user-jdcasey', 'user-brett'.
     |
     | 下面这个profile是指定jdk版本的.
     -->
    <profile>
      <id>jdk-1.4</id>

      <activation>
        <jdk>1.4</jdk>
      </activation>

      <repositories>
        <repository>
          <id>jdk14</id>
          <name>Repository for JDK 1.4 builds</name>
          <url>http://www.myhost.com/maven/jdk14</url>
          <layout>default</layout>
          <snapshotPolicy>always</snapshotPolicy>
        </repository>
      </repositories>
    </profile>


    <!--插件配置的profile
     |
     | ...
     | <plugin>
     |   <groupId>org.myco.myplugins</groupId>
     |   <artifactId>myplugin</artifactId>
     |   
     |   <configuration>
     |     <tomcatLocation>${tomcatPath}</tomcatLocation>
     |   </configuration>
     | </plugin>
     | ...
     -->
    <profile>
      <id>env-dev</id>

      <activation>
        <property>
          <name>target-env</name>
          <value>dev</value>
        </property>
      </activation>

      <properties>
        <tomcatPath>/path/to/tomcat/instance</tomcatPath>
      </properties>
    </profile>

  </profiles>

  <!-- activeProfiles
   | 表示激活的profile，通过上面的profile id 来指定.
   -->
  <activeProfiles>
    <activeProfile>alwaysActiveProfile</activeProfile>
    <activeProfile>anotherAlwaysActiveProfile</activeProfile>
  </activeProfiles>

</settings>
```



