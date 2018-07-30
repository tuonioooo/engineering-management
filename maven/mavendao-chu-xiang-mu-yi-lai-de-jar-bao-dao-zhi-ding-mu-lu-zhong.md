# maven导出项目依赖的jar包

* ### 导出到默认目录 targed/dependency

执行如下命令：

```
mvn dependency:copy-dependencies
```

或在eclipse中，选择项目的pom.xml文件，点击右键菜单中的Run As,见下图红框中，在弹出的Configuration窗口中，输入

dependency:copy-dependencies后，点击运行，maven项目所依赖的jar包会导出到targed/dependency目录中。

[![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%283%29.jpg)](http://static.oschina.net/uploads/space/2014/0326/093320_v2r1_1410765.jpg)

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%2815%29.png)

* ### 导出jar到自定义目录中

在maven项目下创建lib文件夹，执行如下命令：

```
mvn dependency:copy-dependencies -DoutputDirectory=lib
```

maven项目所依赖的jar包都会复制到项目目录下的lib目录下

* ### 设置依赖级别 

同时可以设置依赖级别，通常使用compile级别

```
mvn dependency:copy-dependencies -DoutputDirectory=lib   -DincludeScope=compile
```

?

| 1 |  |
| :--- | :--- |




