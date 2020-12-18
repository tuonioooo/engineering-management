# Linux安装Nexus

## Linux安装Nexus

## 一、搭建nexus服务的意义 <a id="&#x4E00;&#x642D;&#x5EFA;nexus&#x670D;&#x52A1;&#x7684;&#x610F;&#x4E49;"></a>

1. 作为内网的统一代理，团队合作开发时不用每人都去外网下载一次；
2. 解决部分变态公司内网管制无法访问外网的问题，选一台有外网权限的机器搭建服务器，其余人直接内网访问此服务；
3. 团队合作开发时解决maven项目依赖问题；

## 二、安装nexus <a id="&#x4E8C;&#x5B89;&#x88C5;nexus"></a>

```text
# 下载安装包：
wget https://sonatype-download.global.ssl.fastly.net/nexus/oss/nexus-2.14.4-03-bundle.tar.gz

# 解压
mkdir /data/apps
cd /data/apps
tar -zxvf ~/nexus-2.14.4-03-bundle.tar.gz
```

## 三、配置nexus <a id="&#x4E09;&#x914D;&#x7F6E;nexus"></a>

编辑配置文件：vim conf/nexus.properties

```text
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

## 四、启动nexus <a id="&#x56DB;&#x542F;&#x52A8;nexus"></a>

启动脚本：bin/nexus

```text
# 启动脚本有如下参数可选
[root@ci-gitlab nexus-2.14.4-03]# bin/nexus
Usage: ./nexus { console | start | stop | restart | status | dump }
```

注意：nexus采用wrapper做为WEB容器，nexus只是shell脚本，最终会调用jsw目录下对应平台中的wrapper二进制文件

## 五、管理nexus <a id="&#x4E94;&#x7BA1;&#x7406;nexus"></a>

### 1. 默认的用户： <a id="1-&#x9ED8;&#x8BA4;&#x7684;&#x7528;&#x6237;"></a>

admin/admin123  
deployment/deployment123

### 2. 修改用户信息 <a id="2-&#x4FEE;&#x6539;&#x7528;&#x6237;&#x4FE1;&#x606F;"></a>

admin登陆后，点击左侧【Security–Users】,在列表中选择用户，右键可更改密码和重围密码， 底部表格中可修改用户其余信息

## 六、在项目中使用nexus <a id="&#x516D;&#x5728;&#x9879;&#x76EE;&#x4E2D;&#x4F7F;&#x7528;nexus"></a>

### 1. 作为插件库 <a id="1-&#x4F5C;&#x4E3A;&#x63D2;&#x4EF6;&#x5E93;"></a>

点击左侧【Views/Repositories–Repositories】,选择【Public Repositories】，复制其Repository Path字段  
编辑pom.xml文件，添加如下段：

```text
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

### 2. 作为deploy库 <a id="2-&#x4F5C;&#x4E3A;deploy&#x5E93;"></a>

点击左侧【Views/Repositories–Repositories】,选择【 Release 或 Snapshots】，复制其Repository Path字段  
编辑pom.xml文件，添加如下段：

```text
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

```text
[ERROR] Failed to execute goal org.apache.maven.plugins:maven-deploy-plugin:2.7:deploy (default-deploy) on project helloworld-a: Deployment failed: repository element was not specified in the POM inside distributionManagement element or in -DaltDeploymentRepository=id::layout::url parameter -> [Help 1]
```

