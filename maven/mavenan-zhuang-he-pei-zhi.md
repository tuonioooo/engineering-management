# maven安装和配置

**一、准备工作**

1、确定电脑上已经成功安装jdk7.0以上版本

2、win10操作系统

3、maven安装包            下载地址：[http://maven.apache.org/download.cgi](http://maven.apache.org/download.cgi)

**二、解压Maven安装包**

在上述地址中下载最新的Maven版本，解压到指定目录（此处根据自己的需要），本人解压到D:\install\maven\apache-maven-3.5.0目录下，里面有bin、lib  conf等文件夹。

**三、配置Maven环境变量**

在我的电脑-------属性-------高级系统设置---------环境变量---------系统变量--------新建

变量名：M2\_HOME

变量值：D:\install\maven\apache-maven-3.5.0

找到Path在环境变量值尾部加入：;%M2\_HOME%\bin;  //前面注意分号

**四、检查jdk和maven的环境变量是否配置成功**

** ** 打开dos窗口运行命令mvn -v,出现如下图所示的信息说明安装成功；

![](https://images2017.cnblogs.com/blog/1223891/201708/1223891-20170822135955183-1923582688.png)

**五、修改本地仓库位置（如果不想修改本地仓库位置则这一步骤省略即可）**

Maven会将下载的类库（jar包）放置到本地的一个目录下（一般默认情况下maven在本机的仓库位于C:\我的文档中.m2.\repository），如果想重新定义这个目录的位置就需要修改Maven本地仓库的配置：

* 在自己喜欢的位置创建文件夹，此处本人创建的位置是（E:.m2\repository）

* 在安装Maven的目录下找到conf文件夹，在文件夹中找到settings.xml文件，复制settings.xml文件放于E:.m2，如下图所示：

  ![](/assets/123.png)

* 修改settings.xml文件，如下图所示：

![](/assets/import-maven-01.png)



* 实验一下我们刚才做的事情产生作用没有，控制台输入：mvn help:system

![](https://images2017.cnblogs.com/blog/1223891/201708/1223891-20170822142037418-203373011.png)

**     执行完该命令之后，在F:/Maven/repo下面会出现很多文件，这些文件就maven从中央仓库下载到本地仓库的文件。**

