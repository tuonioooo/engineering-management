# 开发常见问题汇总

### **1.maven在POM.xml中配置plugin的忽略测试功能配置**

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

### **2.maven install 报错，出现找不到符号**

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

### 3.Maven  Java.OutOfMemory错误

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

Windows环境中

找到文件%M2\_HOME%\bin\mvn.bat ，这就是启动Maven的脚本文件，在该文件中你能看到有一行注释为：

  @REM set MAVEN\_OPTS=-Xdebug -Xnoagent -Djava.compiler=NONE...

它的意思是你可以设置一些Maven参数，我们就在注释下面加入一行：





set MAVEN\_OPTS= -Xms128m -Xmx512m





之后，当你运行Maven命令如 mvn -version 的时候，你会看到如下的输出：





E:\test&gt;mvn -version





E:\test&gt;set MAVEN\_OPTS= -Xms128m -Xmx512m

Maven version: 2.0.9

Java version: 1.6.0\_07

OS name: "windows 2003" version: "5.2" arch: "x86" Family: "windows"





我们看到，配置的Maven选项生效了，OutOfMemoryError也能得以相应的解决。

