# maven普通项目转成web项目

创建Web工程，使用eclipse ee创建maven web工程

1.右键项目,选择Project Facets,点击Convert to faceted from

2.更改Dynamic Web Module的Version为2.5.\(3.0为Java7的,Tomcat6不支持\).

如果提示错误,可能需要在Java Compiler设置Compiler compliance level 为1.6 .或者需要在此窗口的Java的Version改成1.6.

3.点击下面的Further configuration available…，弹出Modify Faceted Project窗口

此处是设置web.xml文件的路径,输入src/main/webapp.

Generate web.xml deployment descriptor自动生成web.xml文件,可选可不选.

5.设置部署程序集\(Web Deployment Assembly\)

6.在右键项目打开此窗口.在左侧列表中会出现一个Deployment Assembly,点击进去后

7.删除test的两项,因为test是测试使用,并不需要部署.

8.设置将Maven的jar包发布到lib下.

Add -&gt; Java Build Path Entries -&gt; Maven Dependencies -&gt; Finish 

完成后有:

/src/main/webapp    /

/src/main/java      /WEB-INF/classes

/src/main/resources /WEB-INF/classes

Maven Dependencies  /WEB-INF/lib

4.点击OK

好了，这样就把一个maven项目转化成web项目了

