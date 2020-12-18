# maven项目将自研发的依赖包打进Jar文件中

发布项目的时候有可能会有这样的要求，一个jar包中即包含自研的代码，也包含依赖的库（例如log4j的jar包之后的），maven打包的时候有两种方法可以实现这种要求。

### 1.使用maven-assembly-plugin插件

```text
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

说明：

* assembly插件功能强大，不仅可以打jar包还可以打zip、war各种包。
* 打的jar包名会以-with-dependencies结尾
* 这种方式打的jar包中，是将依赖包的classes文件与本项目的classes文件放在一起打成jar包的，如下图所示（com目录是项目代码的classes文件，org目录是引入了org.apache.log4j构件的classes目录，如果依赖其他构件也有可能有其他的classes文件的目录）

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%288%29.jpg)

## 2.将依赖的jar包拷贝到target/classes目录下

因为maven默认是将target/classes目录下所有文件打成jar包，所以我们可以配置在编译的时候将依赖的构件拷贝到target/classes目录下，注意这种方法需要配置classpath。pom.xml配置如下：

```text
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

            <artifactId>maven-jar-plugin</artifactId>

            <configuration>

                <archive>

                    <manifest>

                        <!-- 告知 maven-jar-plugin添加一个 Class-Path元素到 MANIFEST.MF文件，以及在Class-Path元素中包括所有依赖项 -->

                        <addClasspath>true</addClasspath>

                        <!-- 所有的依赖项应该位于 lib文件夹  -->

                        <classpathPrefix>lib/</classpathPrefix>  </span>

                       <!--  当用户使用 lib命令执行JAR文件时，使用该元素定义将要执行的类名  -->

                        <mainClass>com.itsenlin.Helloworld</mainClass>

                    </manifest>

                </archive>

            </configuration>

        </plugin>


        <plugin>

            <artifactId>maven-dependency-plugin</artifactId>

            <executions>

                <execution>

                    <id>copy-dependencies</id>

                    <phase>prepare-package</phase>

                    <goals>

                        <goal>copy-dependencies</goal>

                    </goals>

                    <configuration>

                        <!-- ${project.build.directory}为Maven内置变量，缺省为target -->

                        <outputDirectory>${project.build.directory}/classes/lib</outputDirectory></strong></span>

                        <!-- 表示是否不包含间接依赖的包  -->

                        <excludeTransitive>false</excludeTransitive>

                        <!-- 表示复制的jar文件去掉版本信息 -->

                        <stripVersion>true</stripVersion>

                    </configuration>

                </execution>

            </executions>

        </plugin>

    </plugins>

</build>
```

说明：

* 这种方法与不把依赖打到jar包内的配置区别就是拷贝依赖包的位置有变化，见上面红色部分
* jar包解压之后如下图所示

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%289%29.jpg)

* 这种方式目前测试中发现一个不太好的地方，就是会把scope为test的包也拷贝到jar包中，虽然对功能无影响，但是会增加整个jar包的大小，并且增加了无用的jar包，如下图中的junit，目前还没找到原因，找到原因之后再增加相关内容（有知道的兄弟也可告知一下，谢谢：\)）。

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%2810%29.jpg)

