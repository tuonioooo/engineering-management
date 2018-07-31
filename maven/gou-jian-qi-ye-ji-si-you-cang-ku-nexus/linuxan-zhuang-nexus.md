# Linux安装Nexus

# 一、搭建nexus服务的意义 {#一搭建nexus服务的意义}

1. 作为内网的统一代理，团队合作开发时不用每人都去外网下载一次；
2. 解决部分变态公司内网管制无法访问外网的问题，选一台有外网权限的机器搭建服务器，其余人直接内网访问此服务；
3. 团队合作开发时解决maven项目依赖问题；

# 二、安装nexus {#二安装nexus}

```
# 下载安装包：
wget https://sonatype-download.global.ssl.fastly.net/nexus/oss/nexus-2.14.4-03-bundle.tar.gz

# 解压
mkdir /data/apps
cd /data/apps
tar -zxvf ~/nexus-2.14.4-03-bundle.tar.gz
```

# 三、配置nexus {#三配置nexus}

编辑配置文件：vim conf/nexus.properties

```
# Jetty section
application-port=8081      # 访问端口
application-host=0.0.0.0   # 绑定IP
nexus-webapp=${bundleBasedir}/nexus   # 指定nexus程序目录
nexus-webapp-context-path=/nexus      # 指定访问的二组目录

# Nexus section
nexus-work=${bundleBasedir}/../sonatype-work/nexus
runtime=${bundleBasedir}/nexus/WEB-INF
```

以上都是默认配置，对应的访问地址为：  
[http://x.x.x.x:8081/nexus](http://x.x.x.x:8081/nexus)

如果要改为[http://x.x.x.x:8081](http://x.x.x.x:8081/)，则修改nexus-webapp-context-path=/即可

# 四、启动nexus {#四启动nexus}

启动脚本：bin/nexus

```
# 启动脚本有如下参数可选
[root@ci-gitlab nexus-2.14.4-03]# bin/nexus
Usage: ./nexus { console | start | stop | restart | status | dump }
```

注意：nexus采用wrapper做为WEB容器，nexus只是shell脚本，最终会调用jsw目录下对应平台中的wrapper二进制文件

# 五、管理nexus {#五管理nexus}

## 1. 默认的用户： {#1-默认的用户}

admin/admin123  
deployment/deployment123

## 2. 修改用户信息 {#2-修改用户信息}

admin登陆后，点击左侧【Security–Users】,在列表中选择用户，右键可更改密码和重围密码， 底部表格中可修改用户其余信息

# 六、在项目中使用nexus {#六在项目中使用nexus}

## 1. 作为插件库 {#1-作为插件库}

点击左侧【Views/Repositories–Repositories】,选择【Public Repositories】，复制其Repository Path字段  
编辑pom.xml文件，添加如下段：

```
<!-- 设定主仓库，按设定顺序进行查找。 -->
<!-- 设定主仓库，按设定顺序进行查找。 -->
    <repositories>
        <repository>
            <id>releases</id>
            <name>Team Nexus Repository</name>
            <url>${Repository Path}</url>
        </repository>

        <repository>
            <id>snapshots</id>
            <name>Team Nexus Repository</name>
            <url>${Repository Path}</url>
        </repository>
    </repositories>
```

## 2. 作为deploy库 {#2-作为deploy库}

点击左侧【Views/Repositories–Repositories】,选择【 Release 或 Snapshots】，复制其Repository Path字段  
编辑pom.xml文件，添加如下段：

```
<!-- 设定发布位置，mvn deploy时用到，不设置时会报错-->
    <distributionManagement>
        <repository>
            <id>ci-releases</id>
            <name>Gigold Nexus Repository</name>
            <url>http://ci-gitlab:8081/content/repositories/releases</url>
        </repository>
        <snapshotRepository>
            <id>ci-snapshots</id>
            <name>Gigold Nexus Repository</name>
            <url>http://ci-gitlab:8081/content/repositories/snapshots/</url>
        </snapshotRepository>
    </distributionManagement>
```

注意：不设置distributionManagement段，执行mvn deploy会报如下错误：

```
[ERROR] Failed to execute goal org.apache.maven.plugins:maven-deploy-plugin:2.7:deploy (default-deploy) on project helloworld-a: Deployment failed: repository element was not specified in the POM inside distributionManagement element or in -DaltDeploymentRepository=id::layout::url parameter -> [Help 1]
```



