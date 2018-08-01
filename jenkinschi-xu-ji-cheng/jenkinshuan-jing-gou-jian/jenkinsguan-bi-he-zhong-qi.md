# Jenkins启动、关闭和重启

## 浏览器方式

* ### 关闭Jenkins {#1-关闭jenkins}

在访问jenkins服务器的网址url地址后加上exit。

例如我jenkins的地址[http://localhost:8080/](http://localhost:8080/)，那么我只需要在浏览器地址栏上敲下[http://localhost:8080/exit](http://localhost:8080/exit)，就能关闭jenkins服务

* ### 重启Jenkies {#2-重启jenkies}
* [http://localhost:8080/restart](http://localhost:8080/restart)

* ### 重新加载配置信息 {#3-重新加载配置信息}

[http://localhost:8080/reload](http://localhost:8080/reload)

## 命令方式

* ### 启动Jenkins服务

net start jenkins  （注：如果Jenkins曾经启动过，启动服务不需要进入到某个目录）

* ### 停止Jenkins服务

net stop jenkins

> 用管理员身份启动cmd，否则会报系统错误5







