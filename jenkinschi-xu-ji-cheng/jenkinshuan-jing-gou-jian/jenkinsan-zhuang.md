# Jenkins安装

## 安装条件

对于本次旅行，您将需要：

* 一台机器：

  * 256 MB的RAM，但推荐超过512 MB

  * 10 GB的驱动器空间（适用于Jenkins和Docker镜像）

* 安装了以下软件：

  * Java 8（JRE或Java开发工具包（JDK）很好）

  * [Docker](https://docs.docker.com/)（导航到网站顶部的**获取Docker**以访问适合您平台的Docker下载）

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



