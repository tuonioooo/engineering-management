# 开发常见问题汇总

* ### **maven在POM.xml中配置plugin的忽略测试功能配置**

```
<plugin>
    <groupId>org.apache.maven.plugins </groupId>
    <artifactId>maven-surefire-plugin </artifactId>
    <version>2.4.2 </version>
    <configuration>
          <skipTests >true </skipTests>
    </configuration>
</plugin>
```

* ### **maven install 报错，出现找不到符号**

在编译插件中，添加&lt;encoding&gt;UTF-8&lt;/encoding&gt;

```
<plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.3</version>
                <configuration>
                    <source>1.7</source>
                    <target>1.7</target>
                    <encoding>UTF-8</encoding>
                    <compilerArguments>
                        <bootclasspath>${java.home}\lib\rt.jar;${java.home}\lib\jce.jar</bootclasspath>
                    </compilerArguments>
                </configuration>
            </plugin>
```

* ### Maven  Java.OutOfMemory错误

当Maven项目很大，或者你运行诸如 mvn site 这样的命令的时候，maven运行需要很大的内存，在默认配置下，就可能遇到java的堆溢出。如：

```
[INFO] Building jar: /home/dl9pf/svn/mindquarry/mindquarry-jcr/mindquarry-jcr-changes/target/mindquarry-migration-with-dependencies.jar
[INFO] ------------------------------------------------------------------------
[ERROR] FATAL ERROR
[INFO] ------------------------------------------------------------------------
[INFO] Java heap space
[INFO] ------------------------------------------------------------------------
[INFO] Trace
java.lang.OutOfMemoryError: Java heap space
at java.lang.AbstractStringBuilder.expandCapacity(AbstractStringBuilder.java:99)
at java.lang.AbstractStringBuilder.append(AbstractStringBuilder.java:518)
...
at org.codehaus.classworlds.Launcher.launchEnhanced(Launcher.java:315)
at org.codehaus.classworlds.Launcher.launch(Launcher.java:255)
at org.codehaus.classworlds.Launcher.mainWithExitCode(Launcher.java:430)
at org.codehaus.classworlds.Launcher.main(Launcher.java:375)
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 7 minutes 14 seconds
[INFO] Finished at: Wed Sep 05 07:44:55 CEST 2007
[INFO] Final Memory: 37M/63M
[INFO] ------------------------------------------------------------------------
```

解决的方法是调整java的堆大小的值。

**Windows环境中**

找到文件%M2\_HOME%\bin\mvn.bat ，这就是启动Maven的脚本文件，在该文件中你能看到有一行注释为：

@REM set MAVEN\_OPTS=-Xdebug -Xnoagent -Djava.compiler=NONE...

它的意思是你可以设置一些Maven参数，我们就在注释下面加入一行：

set MAVEN\_OPTS= -Xms128m -Xmx512m之后，当你运行Maven命令如 mvn -version 的时候，你会看到如下的输出：

E:\test&gt;mvn -version

E:\test&gt;set MAVEN\_OPTS= -Xms128m -Xmx512m

Maven version: 2.0.9

Java version: 1.6.0\_07

OS name: "windows 2003" version: "5.2" arch: "x86" Family: "windows"

我们看到，配置的Maven选项生效了，OutOfMemoryError也能得以相应的解决。

**Linux环境中 **

也可以通过设置环境变量解决该问题， 如，编辑文件 /etc/profile 如下

MAVEN\_OPTS=-Xmx512m

export JAVA\_HOME MAVEN\_HOME MAVEN\_OPTS JAVA\_BIN PATH CLASSPATH

如果你使用Hudson用 Hudson + Maven做持续集成，并不幸也遇到了类似的错误，那么上述两种方式都将不再起作用了，因为Hudson使用自己的maven-agent来启动Maven，不会去调用Maven的脚本，自然相应的配置也就无效了。

好在Hudson也给为我们提供了配置点，在Hudson的项目配置页面中，有一块Build区域，这里我们已经设置了Root Pom和Goals。注意该区域的右下角有一个"Advanced..."按钮，点击会看到MAVEN\_OPTS输入框，这里输入"-Xmx512m"就OK了。

m2eclipse中类似以上的方法都会失效，所幸m2eclipse提供了配置点。步骤如下：

项目上右击 -&gt; Run As -&gt; Run Configurations -&gt; Maven Build 上右击 -&gt; New

这时会看到一个maven运行配置对话框，这里面其它的配置我不多解释了，为了解决内存溢出的问题，我们可以选择第二个TAB: JRE，然后在VM arguments中输入配置如：-Xms128m -Xmx512m。

* ### 依赖冲突

解决方式：在依赖中排除有冲突的jar引用，比如：

> &lt;dependency&gt;
>
> &lt;groupId&gt;com.aliyun.oss&lt;/groupId&gt;
>
> &lt;artifactId&gt;aliyun-sdk-oss&lt;/artifactId&gt;
>
> &lt;version&gt;2.2.0&lt;/version&gt;
>
> **&lt;exclusions&gt;**
>
> **&lt;exclusion&gt; &lt;groupId&gt;org.apache.httpcomponents&lt;/groupId&gt;**
>
> **&lt;artifactId&gt;httpclient&lt;/artifactId&gt;**
>
> **&lt;/exclusion&gt;**
>
> **&lt;/exclusions&gt;**
>
> &lt;/dependency&gt;

* ### No compiler is provided in this environment. Perhaps you are running on a JRE rather than a JDK? 问题

解决方案：

1. 下载java jdk，并安装java jdk。下载地址：[http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html)

2. 在eclipse的菜单中，进入 Window &gt; Preferences &gt; Java &gt; Installed JREs &gt; Execution Environments，选择JavaSE-1.6, 在右侧选择jdk.

3. 然后在maven菜单中使用 “update project ...”.

4. ### Unable to locate the Javac Compiler in:   D:\Java\jre6..\lib\tools.jar

一般是项目编译的版本不对，更换高一点的版本，build path

* ### maven的缓存已损坏 相关问题（ The type org.springframework.context.ConfigurableApplicationContext cannot be resolved）

[http://blog.csdn.net/fujunsfzh/article/details/72673775](http://blog.csdn.net/fujunsfzh/article/details/72673775)

在markers view 中提示：“The type org.springframework.context.ConfigurableApplicationContext cannot be resolved. It is indirectly referenced from required .class files”

经查询发现 在 这里 发生了和我类似的问题， 原来问题是出现在maven中缓存上，maven的缓存已损坏

按照以下步骤解决：

在命令行中转到项目目录。

确保您的POM.xml与您的命令行在同一个目录中

运行命令 mvn dependency:purge-local-repository

如果您收到构建成功的消息，表示错误已解决。

如果仍然存在错误，请删除（〜/ .m2 / repository / org / springframework）文件夹并运行 mvn package

它现在可以正常工作

* ### 在POM配置Maven plugin提示错误“Plugin execution not covered by lifecycle configuration”的解决方案

eclipse在其POM文件的一处提示出错如下：

Plugin execution not covered by lifecycle configuration: org.apache.maven.plugins:maven-compiler-plugin:3.1:compile \(execution: default-compile, phase: compile\)

这表示m2e在其执行maven的生命周期管理时没有定义该插件，所以提示出错，其实m2e对此是提供了扩展机制的，我们可以通过如下操作来消除这个出错提示：

进入Window—&gt;Preferences—&gt;Maven配置，进入Lifecycle Mapping设置项，如下图：

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%2818%29.png)

从上图可以看出m2e管理maven生命周期的文件名是lifecycle-mapping-metadata.xml，以及该文件的存放路径

下一步我们就要去相应路径修改lifecycle-mapping-metadata.xml文件，但会发现这个文件在上图中提示的位置并不存在，那么此时就

以到eclipse的安装目录下的plugins下的org.eclipse.m2e.lifecyclemapping.defaults\_xxxxxx.jar

文件中找到该文件（如下图）:

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%2819%29.png)

通过解压软件可以发现lifecycle-mapping-metadata.xml文件的确在jar包中，把它从jar包中解压出来并放置到前图所示的路径下

打开lifecycle-mapping-metadata.xml文件，把未识别的插件在文件中加入即可：

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%2820%29.png)

修改完成后，需在m2e配置处把“Update Maven projects on startup”选项勾上，并重启eclipse即可消除出错示。

* ### 没有Project Facets的解决方法

解决步骤：

1、进入项目目录，可看到.project文件，打开。

2、找到&lt;natures&gt;...&lt;/natures&gt;代码段。

3、在第2步的代码段中加入如下标签内容并保存：

&lt;nature&gt;org.eclipse.wst.common.project.facet.core.nature&lt;/nature&gt;

&lt;nature&gt;org.eclipse.wst.common.modulecore.ModuleCoreNature&lt;/nature&gt;

&lt;nature&gt;org.eclipse.jem.workbench.JavaEMFNature&lt;/nature&gt;

4、在eclipse的项目上点右键，刷新项目。

5、在项目上点右键，进入属性（properties）

6、在左侧列表项目中点击选择“Project Facets”，在右侧选择“Dynamic Web Module”和"Java"，点击OK保存即可。

* ### Maven web项目到tomcat服务器时，没有将lib下的jar复制过去的解决办法

解决办法如下：

右击项目-&gt;properties-&gt;找到Deployment Assembly，右边便是编译打包的配置，看是不是缺少了lib库的依赖，我的就是，点击Add，添加maven依赖库。最后列表如下

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%2821%29.png)

再重新启动tomcat，启动成功！！

* ### maven编译报错 -source 1.5 中不支持 lambda 表达式

奇怪的是我的 Jenkins 构建机器上只安装了 JDK 8，为什么还会说不支持 diamond 和 lambda 呢？

在 [Maven Compiler 插件介绍](http://maven.apache.org/plugins/maven-compiler-plugin/) 里面找到了答案：`Also note that at present the default source setting is1.5and the default target setting is1.5, independently of the JDK you run Mavenwith.`

原来 Maven Compiler 插件默认会加 -source 1.5 及 -target 1.5 参数来编译（估计是为了兼容一些比较老的 [Linux](http://lib.csdn.net/base/linux) 服务器[操作系统](http://lib.csdn.net/base/operatingsystem)，它们通常只有 JDK 5），而我们的代码里使用了 JDK 7/8 的语法。解决办法在[这里](http://maven.apache.org/plugins/maven-compiler-plugin/examples/set-compiler-source-and-target.html)：

```
<project>
  [...]
  <build>
    [...]
    <plugins>
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-compiler-plugin</artifactId>
        <version>3.2</version>
        <configuration>
          <source>1.8</source>
          <target>1.8</target>
        </configuration>
      </plugin>
    </plugins>
    [...]
  </build>
  [...]
</project>
```

或

```
<project>
  [...]
  <properties>
    <maven.compiler.source>1.8</maven.compiler.source>
    <maven.compiler.target>1.8</maven.compiler.target>
  </properties>
  [...]
</project>
```

> ## Setting the -source and -target of the Java Compiler
>
> Sometimes when you may need to compile a certain project to a different version than what you are currently using. The javac can accept such command using -source and -target. The Compiler Plugin can also be configured to provide these options during compilation.
>
> For example, if you want to use the Java 8 language features \(-source 1.8\) and also want the compiled classes to be compatible with JVM 1.8 \(-target 1.8\), you can either add the two following properties, which are the default property names for the plugin parameters:



