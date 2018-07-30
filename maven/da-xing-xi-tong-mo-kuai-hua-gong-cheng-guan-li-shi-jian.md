# 大型系统模块化工程管理实践

* ## maven构建多模块项目示例1

原文：[https://www.cnblogs.com/h--d/p/6001366.html](https://www.cnblogs.com/h--d/p/6001366.html)

* ## 搭建多模块企业级项目示例2

原文：[https://www.cnblogs.com/quanyongan/archive/2013/05/28/3103243.html](https://www.cnblogs.com/quanyongan/archive/2013/05/28/3103243.html)

* ### maven最佳实践划分模块示例3

原文：[http://juvenshun.iteye.com/blog/305865](http://juvenshun.iteye.com/blog/305865)

* ### maven多模块项目的创建、提交和检出

原文：

[http://xc5.iteye.com/blog/1546414](http://xc5.iteye.com/blog/1546414)

  


1.创建父项目：maven项目。创建完成后删除src目录；删除项目属性java builder中的src目录。

2.在父项目中创建maven module子项目。

3.修改pom文件，添加依赖，修改groupId等。

4.选择父项目目录提交到svn。全部项目都会提交到svn。

Checkout：

file-》import-》checkout maven projects from SCM

--------------------------------------------------------------

1.从svn中checkout项目到工作区。

2.import maven项目，选择父目录，会自动将父、子项目同时导入到eclipse。

