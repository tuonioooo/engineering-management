# maven命令创建web项目

通过dos命令行定位到要创建项目的目录，执行以下命令：

`mvn archetype:create -DgroupId=com.learn -DartifactId=LearnNew -DarchetypeArtifactId=maven-archetype-webapp`

或者使用自定义的仓库配置文件

```text
mvn archetype:create -s E:/.m2/settings.xml -DgroupId=com.learn -DartifactId=LearnNew -DarchetypeArtifactId=maven-archetype-webapp
```

**执行结果如下：**

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%284%29.jpg)

**生成项目目录机构：**

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%285%29.jpg)

打开index.jsp 就能看到

```text
<body> 
<h2>Hello World!</h2> 
</body> 
</html>
```

执行mvn install，并将target下面的LearnNew.war放于tomcat的webapps下面，启动tomcat，通过浏览器访问: [http://localhost:8080/LearnNew/](http://localhost:8080/LearnNew/) 将会看到熟悉的：”Hello World!“

