# Jenkins自动构建部署maven项目

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

![](/assets/import-jenkins-33.png)

