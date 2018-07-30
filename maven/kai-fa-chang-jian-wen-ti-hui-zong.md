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

  


主要还是编码问题！！！

?

| 1 | &lt;encoding&gt;UTF-8&lt;/encoding&gt; |
| :--- | :--- |


```

```



