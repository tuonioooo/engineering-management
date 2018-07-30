# 开发常见问题汇总

1.maven在POM.xml中配置plugin的忽略测试功能配置 

> &lt;plugin&gt;
>
>                       &lt;groupId&gt;org.apache.maven.plugins &lt;/groupId&gt;
>
>                       &lt;artifactId&gt;maven-surefire-plugin &lt;/artifactId&gt;
>
>                       &lt;version&gt;2.4.2 &lt;/version&gt;
>
>                       &lt;configuration&gt;
>
>                           **  &lt;skipTests &gt;true &lt;/skipTests&gt;**
>
>                       &lt;/configuration&gt;
>
>                  &lt;/plugin&gt;



