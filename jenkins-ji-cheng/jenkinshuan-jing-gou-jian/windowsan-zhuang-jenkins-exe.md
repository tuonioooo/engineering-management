# Windows安装Jenkins.exe

## 下载Jenkins

下载地址 [https://jenkins.io/download/](https://jenkins.io/download/) ，如图所示：

![](../../assets/jenkins_1667030663183.jpg)

## 安装Jenkins

安装完之后，jenkins会自动启动，在安装目录中有一个jenkins.exe启动脚本，还有个war文件，用于java命令部署，如图所示：

![](../../.gitbook/assets/import-jenkins-08.png)

如果运行出现错误：[无法从命令行或调试器启动服务，必须首先安装Windows服务\(使用installutil.exe\)，然后用ServerExplorer、Windows服务器管理工具或NET START命令启动它](https://www.cnblogs.com/kido050313/p/7805108.html)

以管理员身份运行cmd：

```text
C:\Windows\system32>cd  C:\WINDOWS\Microsoft.NET\Framework\v2.0.50727

C:\Windows\Microsoft.NET\Framework\v2.0.50727>cd  C:\WINDOWS\Microsoft.NET\Framework\v2.0.50727

C:\Windows\Microsoft.NET\Framework\v2.0.50727>InstallUtil.exe D:\Tools\jenkins\jenkins.exe
```

windows再次启服务，需要通过cmd下的 service.msc中 找到Jekins手动启动即可

浏览器地址栏输入[http://localhost:8080/jenkins](http://localhost:8080/jenkins) 或 [http://localhost:8080/](http://localhost:8080/) 默认账号登录信息： admin/admin

![](../../.gitbook/assets/import-jenkins-09.png)

输入密码,成功进入页面

![](../../.gitbook/assets/import-jenkins-10.png)

本次我选择安装推荐的插件,插件安装成功后跳至此界面

![](../../.gitbook/assets/import-jenkins-11.png)

可以自己创建账户,也可以使用admin继续.

![](../../.gitbook/assets/import-jenkins-12.png)

![](../../.gitbook/assets/import-jenkins-13.png)

