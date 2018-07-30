# maven项目将自研发的依赖包打进Jar文件中

发布项目的时候有可能会有这样的要求，一个jar包中即包含自研的代码，也包含依赖的库（例如log4j的jar包之后的），maven打包的时候有两种方法可以实现这种要求。

### 使用maven-assembly-plugin插件

```
  <build>

<plugins>

    <plugin>

        <artifactId>maven-compiler-plugin</artifactId>

        <configuration>

            <source>1.7</source>

            <target>1.7</target>

            <encoding>${project.build.sourceEncoding}</encoding>

        </configuration>

    </plugin>

       <plugin>

          <artifactId>maven-assembly-plugin</artifactId>

        <configuration>

          <descriptorRefs>

            <descriptorRef>jar-with-dependencies</descriptorRef>

          </descriptorRefs>

          <archive>

                      <manifest>

                          <mainClass>com.itsenlin.Helloworld</mainClass>

                      </manifest>

                 </archive>

        </configuration>

        <executions>

          <execution>

            <id>make-assembly</id> <!-- this is used for inheritance merges -->

            <phase>package</phase> <!-- bind to the packaging phase -->

            <goals>

              <goal>single</goal>

            </goals>

          </execution>

        </executions>

       </plugin>

</plugins>

</build>


```



