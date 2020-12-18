# maven中的MANIFEST.MF文件中的Class-Path中增加当前目录\(.\)

```text
<configuration>  
 <archive>  
  <manifest>  
   <mainClass>com.dongwei.test.Main</mainClass>  
   <addClasspath>true</addClasspath>  
   <classpathPrefix>lib/</classpathPrefix>  
  </manifest>  
  <manifestEntries>  
   <Class-Path>.</Class-Path>  
  </manifestEntries>  
 </archive>  
</configuration>
```

由于某些原因，如果maven生成的MANIFEST.MF中的Class-Path的内容缺少一些内容，比如当前执行目录\(.\)，那么可以通过上面manifestEntries的方式增加进来，增加后的效果：

```text
 Manifest-Version: 1.0  

Archiver-Version: Plexus Archiver  

Created-By: Apache Maven  

Built-By: wei.dong  

Build-Jdk: 1.6.0_24  

Main-Class: com.dongwei.test.Main  

Class-Path: . lib/spring-core-3.0.5.RELEASE.jar lib/spring-asm-3.0.5.R  

 ELEASE.jar lib/commons-logging-1.1.1.jar lib/spring-context-3.0.5.REL  

 EASE.jar lib/spring-aop-3.0.5.RELEASE.jar lib/aopalliance-1.0.jar lib  

 /spring-expression-3.0.5.RELEASE.jar lib/spring-context-support-3.0.5  

 .RELEASE.jar lib/spring-beans-3.0.5.RELEASE.jar lib/spring-jdbc-3.0.5  

 .RELEASE.jar lib/spring-tx-3.0.5.RELEASE.jar lib/log4j-1.2.14.jar lib  

 /slf4j-nop-1.4.3.jar lib/slf4j-api-1.4.3.jar lib/commons-lang-2.5.jar  

  lib/commons-dbcp-1.2.2.jar lib/commons-pool-1.3.jar lib/commons-io-1  

 .4.jar lib/commons-digester-2.0.jar lib/commons-beanutils-1.8.0.jar l  

 ib/commons-configuration-1.6.jar lib/commons-collections-3.2.1.jar li  

 b/commons-beanutils-core-1.8.0.jar lib/quartz-1.8.4.jar lib/jta-1.1.j  

 ar lib/mysql-connector-java-5.1.12.jar
```

