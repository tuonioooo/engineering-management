# maven的&lt;profile&gt;标签，打包不同配置的变量包

```text
<profiles>
        <profile>
            <!-- 本地开发环境 -->
            <id>dev</id>
            <properties>
                <profiles.active>dev</profiles.active>
            </properties>
            <activation><!--默认是激活开发环境的-->
                <activeByDefault>true</activeByDefault>
            </activation>
        </profile>
        <profile>
            <!-- 线上运行环境 -->
            <id>prod</id>
            <properties>
                <profiles.active>prod</profiles.active>
            </properties>
        </profile>
    </profiles>
```

```text
<resources>
     <resource>
                <directory>src/main/resources</directory>
                <!-- 资源根目录排除各环境的配置，防止在生成目录中多余其它目录 -->
                <excludes>
                    <exclude>dev/*</exclude>
                    <exclude>prod/*</exclude>
                </excludes>
            </resource>
            <resource>
            <directory>src/main/resources/${profiles.active}</directory>
    </resource>
</resources>
```

> maven 带环境的打包命令
>
> cmd下的命令：mvn -Pdev package -Dmaven.test.skip=true
>
> idea软件命令下：-Pdev package -Dmaven.test.skip=true
>
> -P 指定部署环境

## 参考

[https://www.cnblogs.com/a591378955/p/8491687.html](https://www.cnblogs.com/a591378955/p/8491687.html)

[https://blog.csdn.net/vbirdbest/article/details/78744786](https://blog.csdn.net/vbirdbest/article/details/78744786)

