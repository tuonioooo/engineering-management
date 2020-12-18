# maven build标签（打入外部jar包、xml配置编译）

## 总体讲解

```text
<!-- build根标签 -->
<build>
  
  <!-- 指定打包文件名称（可用于除去jar文件版本号） -->
  <finalName>maven-build-demo</finalName>
  
  <!-- 指定过滤资源目录 -->
  <filters>
    <filter>${basedir}/profiles/test/test.properties</filter>
  </filters>
  
  <!-- 项目资源清单（可以配置多个项目资源） -->
  <resources>
    <!-- 项目资源  -->
    <resource>
      <!-- 资源目录（编译时会将指定资源目录中的内容复制到输出目录） -->
      <directory>src/main/resources</directory>
      <!-- 包含内容（编译时仅复制指定包含的内容） -->
      <includes>
        <include>*.properties</include>
        <include>*.xml</include>
        <include>*.json</include>
      </includes>
      <!-- 排除内容（编译时不复制指定排除的内容） -->
      <excludes>
        <exclude>*.txt</exclude>
      </excludes>
      <!-- 输出目录（默认为${build.outputDirectory}，即target/classes） -->
      <targetPath>${build.outputDirectory}</targetPath>
      <!-- 是否开启资源过滤（需要引入maven-resources-plugin插件）
       |   true：将用过滤资源（filters标签）中的内容 替换 资源中相应的占位符（${Xxxx}）内容
       |   false：不做过滤替换操作
       -->
      <filtering>true</filtering>
    </resource>
  </resources>
  
  <!-- 项目插件清单（需要用到什么插件，就添加什么插件） -->
  <plugins>
    <!-- 项目插件 -->
    <plugin>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-maven-plugin</artifactId>
      <!-- 配置参数 -->
      <configuration>
        <!-- 设为可执行程序 -->
        <executable>true</executable>
      </configuration>
      <executions>
        <!-- 执行操作 -->
        <execution>
          <!-- 执行目标 -->
          <goals>
            <goal>repackage</goal>
          </goals>
        </execution>
      </executions>
    </plugin>
    <!-- 项目插件 -->
    <plugin>
      <groupId>org.apache.maven.plugins</groupId>
      <artifactId>maven-resources-plugin</artifactId>
      <!-- 执行操作清单 -->
      <executions>
        <!-- 执行操作（示例说明：将项目的父级目录下的profiles下的指定文件复制到指定输出目录） -->
        <execution>
          <!-- 标识ID -->
          <id>copy-resources</id>
          <!-- 执行阶段 -->
          <phase>validate</phase>
          <!-- 执行目标（执行的操作） -->
          <goals>
            <goal>copy-resources</goal>
          </goals>
          <!-- 相关参数 -->
          <configuration>
            <outputDirectory>${basedir}/target/classes/</outputDirectory>
            <resources>
              <resource>
                <directory>${basedir}/../profiles</directory>
                <filtering>false</filtering>
                <includes>
                  <include>**/*.xml</include>
                  <include>*.json</include>
                </includes>
              </resource>
            </resources>
          </configuration>
        </execution>
      </executions>
    </plugin>
  </plugins>
</build>
```

## 打入外部Jar文件到jar包中

```text
<build>
		<finalName>goptcloud</finalName>
			<plugins>
				<plugin>
					<artifactId>maven-compiler-plugin</artifactId>
					<configuration>
						<source>1.8</source>
						<target>1.8</target>
						<encoding>UTF-8</encoding>
						<compilerArguments>
							<!-- 采用站位符的形式 导入外部jar文件  如果使用的maven版本地域3.1 可以使用该形式  <extdirs>${project.basedir}src\main\webapp\WEB-INF\lib</extdirs> -- >
							<extdirs>E:\dev_workspace\company_workspace\goptcloud\src\main\webapp\WEB-INF\lib</extdirs>
						</compilerArguments>
						<!--  如果使用的maven版本高于3.1，需要做如下修改：
						<compilerArgs> 
							<arg>-extdirs</arg> 
							<arg>${project.basedir}/src/main/webapp/WEB-INF/lib</arg>
						</compilerArgs> 
						-->
					</configuration>
				</plugin>
			</plugins>
	</build>
```

> [https://www.cnblogs.com/dreamowneryong/p/7307908.html](https://www.cnblogs.com/dreamowneryong/p/7307908.html)

## 打包xml文件到jar文件中

```text
<build>
		<finalName>goptcloud</finalName>
		<resources>
			<resource>
				<directory>src/main/java</directory>
				<includes>
					<include>**/*.xml</include>
				</includes>
				<filtering>true</filtering>
			</resource>
		</resources>
	</build>
```

