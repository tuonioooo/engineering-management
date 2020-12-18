# maven+tomcat6-maven-plugin 实现热部署及调试

maven project，特别是maven module项目默认情况下是是无法直接通过tomcat等容器部署的，如图，我要部署fastdev\_web这个maven module，可以看出在tomcat部署对话框中是无法选择的，而且还可以看出，不管fastdev\_web不能选，所有的maven项目都不能选：

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%286%29.jpg)

这是因为maven项目的目录结构并不是标准的web目录结果，我们通过mavne骨架创建的项目,它的web.xml项目描述符不在tomcat所能识别的目录下,所在部署时才不能选择。这时就需要tomcat6-maven-plugin这个插件了。不然每次都得clean package打成war后手动部署到tomcat容器上去，最麻烦的就是这个尼玛不能实时生效\(每次修改都得clean package打成war包后放到tomcat上去\)。这样的话也忒麻烦了\(我就这样干了半个月\)...

pom.xml tomcat插件配置\(此处用tomcat6，注意tomcat7的url跟tomcat6的不一样\)：

```text
<plugin>
<groupId>org.apache.tomcat.maven</groupId>
<artifactId>tomcat6-maven-plugin</artifactId>
<version>2.0-beta-1</version>

<configuration>
<url>http://localhost:8080/manager</url>
<server>tomcat</server>
<username>admin</username>
<password>admin</password>
<path>/fastdev_web</path>
<contextReloadable>true</contextReloadable>
</configuration>
</plugin>
```

配置完这个后pom.xml还配置C:\Users\3panjiacai.MSS.m2\settings.xml\\(maven的全局配置,您的路径肯定跟我的不一样\\):

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%287%29.jpg)

settings.xml代码如下，这个id需跟我们pom.xml配置的id一致：

```text
</servers>
　　<server>
<id>tomcat</id>
<username>admin</username>
<password>admin</password>
</server>
</servers>
```

settings.xml配置完后，就需给admin用户赋权了，这个在tomcat安装目录下的conf/tomcat-users.xml文件，赋权代码如下：

```text
<role rolename="admin"/>
<role rolename="admin-gui"/>
<role rolename="manager"/>
<role rolename="manager-script"/>
<role rolename="manager-gui"/>
<role rolename="manager-jmx"/>
<role rolename="manager-status"/>
<user username="admin" password="admin" roles="admin,manager,manager-gui,admin-gui,manager-script,manager-jmx,manager-status"/>
```

到此所有配置完成，然后就可进行热部署了：

1、在myeclipse中运行,非远程\(tomcat没有启动\)

运行：clean tomcat6:run

重新部署：clean tomcat6:redeploy

清除部署：tomcat6:undeploy

2、在远程服务器运行\(tomcat必须启动\)，执行完后去tomcat webapp目录下看看发生了生命

部署：clean tomcat6:deploy

重新部署：clean tomcat6:redeploy

清除部署：tomcat6:undeploy

