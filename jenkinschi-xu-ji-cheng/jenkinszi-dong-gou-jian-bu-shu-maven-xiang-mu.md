# Jenkins自动构建部署maven项目的WEB项目

* ### **Jenkins安装过程略，参考**[**Jenkins环境构建  **](/jenkinschi-xu-ji-cheng/jenkinshuan-jing-gou-jian.md)
* ### 配置系统工具

![](/assets/import-jenkins-21.png)

配置maven配置文件地址，就在maven的conf目录下的settings.xml文件

![](/assets/import-jenkins-22.png)

配置JDK位置

![](/assets/import-jenkins-23.png)

配置git位置，git是安装的，可以使用下述命令获取git位置

![](/assets/import-jenkins-24.png)

配置maven位置

![](/assets/import-jenkins-25.png)

* ### 安装插件

目标是将项目打包后发布到tomcat中去，所以现在我们需要安装一个发布到tomcat的jenkins插件点击系统管理，选择管理插件

![](/assets/import-jenkins-26.png)

点击可选插件，然后在右上方搜索框搜索container，选择Deploy to container Plugin，点击安装即可

![](/assets/import-jenkins-27.png)

* ### jenkins从Git自动下载项目，通过maven编译部署到Tomcat

#### 1.新建项目

点击左上方新建，新建构建项目

![](/assets/import-jenkins-28.png)

填写项目名，选择自由风格

![](/assets/import-jenkins-30.png)

配置源码管理

![](/assets/import-jenkins-31.png)构建配置

![](/assets/import-jenkins-32.png)构建后步骤  选择发布war包到一个容器中

### ![](/assets/import-jenkins-33.png)

* ### 开始构建

点击左方的立即构建，下方会出现构建队列

![](/assets/import-jenkins-35.png)

点击进入队列，然后点击Console output 可以看到构建过程中打印的日志信息，可以用来在构建失败时排错

![](/assets/import-jenkins-36.png)构建之后，会看到输出提示

![](/assets/import-jenkins-37.png)

看一看是否成功发布了

我的tomcat地址是[http://localhost:8082/apidoc](http://localhost/apidoc)，之前填写contextpath是apidoc

![](/assets/import-jenkins-40.png)

> 注意：tomcat服务一定要是开着的，否则会报如下错误
>
> ```
> Deploying D:\Tools\jenkins\workspace\springboot-apidoc\target\springboot-apidoc-0.0.1-SNAPSHOT.war to container Tomcat 8.x Remote with context apidoc
> ```
>
> ```
> ERROR: Build step failed with exception
> org.codehaus.cargo.container.ContainerException: Failed to redeploy [D:\Tools\jenkins\workspace\springboot-apidoc\target\springboot-apidoc-0.0.1-SNAPSHOT.war]
>     at org.codehaus.cargo.container.tomcat.internal.AbstractTomcatManagerDeployer.redeploy(AbstractTomcatManagerDeployer.java:192)
>     at hudson.plugins.deploy.CargoContainerAdapter.deploy(CargoContainerAdapter.java:77)
>     at hudson.plugins.deploy.CargoContainerAdapter$DeployCallable.invoke(CargoContainerAdapter.java:147)
>     at hudson.plugins.deploy.CargoContainerAdapter$DeployCallable.invoke(CargoContainerAdapter.java:117)
>     at hudson.FilePath.act(FilePath.java:1076)
>     at hudson.FilePath.act(FilePath.java:1059)
>     at hudson.plugins.deploy.CargoContainerAdapter.redeploy(CargoContainerAdapter.java:114)
>     at hudson.plugins.deploy.PasswordProtectedAdapterCargo.redeploy(PasswordProtectedAdapterCargo.java:93)
>     at hudson.plugins.deploy.DeployPublisher.perform(DeployPublisher.java:64)
>     at hudson.tasks.BuildStepMonitor$3.perform(BuildStepMonitor.java:45)
>     at hudson.model.AbstractBuild$AbstractBuildExecution.perform(AbstractBuild.java:744)
>     at hudson.model.AbstractBuild$AbstractBuildExecution.performAllBuildSteps(AbstractBuild.java:690)
>     at hudson.model.Build$BuildExecution.post2(Build.java:186)
>     at hudson.model.AbstractBuild$AbstractBuildExecution.post(AbstractBuild.java:635)
>     at hudson.model.Run.execute(Run.java:1840)
>     at hudson.model.FreeStyleBuild.run(FreeStyleBuild.java:43)
>     at hudson.model.ResourceController.execute(ResourceController.java:97)
>     at hudson.model.Executor.run(Executor.java:429)
> Caused by: java.net.ConnectException: Connection refused: connect
>     at java.net.DualStackPlainSocketImpl.connect0(Native Method)
>     at java.net.DualStackPlainSocketImpl.socketConnect(Unknown Source)
>     at java.net.AbstractPlainSocketImpl.doConnect(Unknown Source)
>     at java.net.AbstractPlainSocketImpl.connectToAddress(Unknown Source)
>     at java.net.AbstractPlainSocketImpl.connect(Unknown Source)
>     at java.net.PlainSocketImpl.connect(Unknown Source)
>     at java.net.SocksSocketImpl.connect(Unknown Source)
>     at java.net.Socket.connect(Unknown Source)
>     at java.net.Socket.connect(Unknown Source)
>     at sun.net.NetworkClient.doConnect(Unknown Source)
>     at sun.net.www.http.HttpClient.openServer(Unknown Source)
>     at sun.net.www.http.HttpClient.openServer(Unknown Source)
>     at sun.net.www.http.HttpClient.
> <
> init
> >
> (Unknown Source)
>     at sun.net.www.http.HttpClient.New(Unknown Source)
>     at sun.net.www.http.HttpClient.New(Unknown Source)
>     at sun.net.www.protocol.http.HttpURLConnection.getNewHttpClient(Unknown Source)
>     at sun.net.www.protocol.http.HttpURLConnection.plainConnect0(Unknown Source)
>     at sun.net.www.protocol.http.HttpURLConnection.plainConnect(Unknown Source)
>     at sun.net.www.protocol.http.HttpURLConnection.connect(Unknown Source)
>     at org.codehaus.cargo.container.tomcat.internal.TomcatManager.invoke(TomcatManager.java:561)
>     at org.codehaus.cargo.container.tomcat.internal.TomcatManager.list(TomcatManager.java:876)
>     at org.codehaus.cargo.container.tomcat.internal.TomcatManager.getStatus(TomcatManager.java:889)
>     at org.codehaus.cargo.container.tomcat.internal.AbstractTomcatManagerDeployer.redeploy(AbstractTomcatManagerDeployer.java:173)
>     ... 17 more
> ```



