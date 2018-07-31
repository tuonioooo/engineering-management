# Jenkins安装

## 安装条件

对于本次旅行，您将需要：

* 一台机器：

  * 256 MB的RAM，但推荐超过512 MB

  * 10 GB的驱动器空间（适用于Jenkins和Docker镜像）

* 安装了以下软件：

  * Java 8（JRE或Java开发工具包（JDK）很好）

  * [Docker](https://docs.docker.com/)（导航到网站顶部的**获取Docker**以访问适合您平台的Docker下载，可以先不用下载）

## 下载Jenkins

对于Jenkins官方网站是Jenkins。如果点击给出的链接，就可以访问 [Jenkins官方网站](https://jenkins-ci.org/)的首页了，如下图所示。

![](file:///C:\Users\tony\AppData\Roaming\Tencent\Users\596807862\QQ\WinTemp\RichOle\9$%29$34JEHINBBZ@_GE7`_ZB.png)点击链接下载Jenkins.war 文件，这里选择的是最新版本。如下图所示：

![](file:///C:\Users\tony\AppData\Roaming\Tencent\Users\596807862\QQ\WinTemp\RichOle\19KX{IR{NZ3176`Q4WWYQ$1.png)

## 启动Jenkins

windows环境：

```
D:\worksp\yiibai.com> java -jar Jenkins.war
```

Linux环境：

```
[root@god local]# java -jar jenkins.war &
```

该命令后，各项任务将运行，其中一个是由名为 winstone 的嵌入式web服务器进行 war 文件提取。

```
七月 31, 2018 11:55:08 上午 jenkins.InitReactorRunner$1 onAttained
信息: Started all plugins
七月 31, 2018 11:55:08 上午 jenkins.InitReactorRunner$1 onAttained
信息: Augmented all extensions
七月 31, 2018 11:55:09 上午 jenkins.InitReactorRunner$1 onAttained
信息: Loaded all jobs
七月 31, 2018 11:55:10 上午 hudson.model.AsyncPeriodicWork$1 run
信息: Started Download metadata
七月 31, 2018 11:55:12 上午 hudson.model.AsyncPeriodicWork$1 run
信息: Finished Download metadata. 1,517 ms
七月 31, 2018 11:55:13 上午 org.springframework.context.support.AbstractApplicationContext prepareRefresh
信息: Refreshing org.springframework.web.context.support.StaticWebApplicationContext@22315391: display name [Root WebApplicationContext]; startup date [Tue Jul 31 11:55:13 CST 2018]; root of context hierarchy
七月 31, 2018 11:55:13 上午 org.springframework.context.support.AbstractApplicationContext obtainFreshBeanFactory
信息: Bean factory for application context [org.springframework.web.context.support.StaticWebApplicationContext@22315391]: org.springframework.beans.factory.support.DefaultListableBeanFactory@29e568e8
七月 31, 2018 11:55:13 上午 org.springframework.beans.factory.support.DefaultListableBeanFactory preInstantiateSingletons
信息: Pre-instantiating singletons in org.springframework.beans.factory.support.DefaultListableBeanFactory@29e568e8: defining beans [authenticationManager]; root of factory hierarchy
七月 31, 2018 11:55:13 上午 org.springframework.context.support.AbstractApplicationContext prepareRefresh
信息: Refreshing org.springframework.web.context.support.StaticWebApplicationContext@4808dc00: display name [Root WebApplicationContext]; startup date [Tue Jul 31 11:55:13 CST 2018]; root of context hierarchy
七月 31, 2018 11:55:13 上午 org.springframework.context.support.AbstractApplicationContext obtainFreshBeanFactory
信息: Bean factory for application context [org.springframework.web.context.support.StaticWebApplicationContext@4808dc00]: org.springframework.beans.factory.support.DefaultListableBeanFactory@6567b115
七月 31, 2018 11:55:13 上午 org.springframework.beans.factory.support.DefaultListableBeanFactory preInstantiateSingletons
信息: Pre-instantiating singletons in org.springframework.beans.factory.support.DefaultListableBeanFactory@6567b115: defining beans [filter,legacy]; root of factory hierarchy
七月 31, 2018 11:55:14 上午 jenkins.InitReactorRunner$1 onAttained
信息: Completed initialization
七月 31, 2018 11:55:14 上午 hudson.WebAppMain$3 run
信息: Jenkins is fully up and running
```



