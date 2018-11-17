# Windows安装Jenkins.exe

## 下载Jenkins

下载地址 [https://jenkins.io/download/](https://jenkins.io/download/) ，如图所示：

![](file:///C:\Users\tony\AppData\Roaming\Tencent\Users\596807862\QQ\WinTemp\RichOle\PN%28T%299}]RIDU%3Z96G`9[~5.png)

## 安装Jenkins

如图所示，一致next即可

![](file:///C:\Users\tony\AppData\Roaming\Tencent\Users\596807862\QQ\WinTemp\RichOle\R[[6NE2B%283BEYL7IT{~R%29}Q.png)

安装完之后，jenkins会自动启动，在安装目录中有一个jenkins.exe启动脚本，还有个war文件，用于java命令部署，如图所示：

![](/assets/import-jenkins-08.png)

如果运行出现错误：[无法从命令行或调试器启动服务，必须首先安装Windows服务\(使用installutil.exe\)，然后用ServerExplorer、Windows服务器管理工具或NET START命令启动它](https://www.cnblogs.com/kido050313/p/7805108.html)

以管理员身份运行cmd：

```
C:\Windows\system32>cd  C:\WINDOWS\Microsoft.NET\Framework\v2.0.50727

C:\Windows\Microsoft.NET\Framework\v2.0.50727>cd  C:\WINDOWS\Microsoft.NET\Framework\v2.0.50727

C:\Windows\Microsoft.NET\Framework\v2.0.50727>InstallUtil.exe D:\Tools\jenkins\jenkins.exe
```

浏览器地址栏输入[http://localhost:8080/jenkins](http://localhost:8080/jenkins) 或 http://localhost:8080/

![](/assets/import-jenkins-09.png)

输入密码,成功进入页面

![](/assets/import-jenkins-10.png)

本次我选择安装推荐的插件,插件安装成功后跳至此界面

![](/assets/import-jenkins-11.png)

可以自己创建账户,也可以使用admin继续.

![](/assets/import-jenkins-12.png)

![](/assets/import-jenkins-13.png)

