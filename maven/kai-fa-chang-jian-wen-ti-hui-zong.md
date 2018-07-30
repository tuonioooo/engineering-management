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



