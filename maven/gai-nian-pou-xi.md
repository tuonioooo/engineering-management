# 概念剖析

## 概述

[Maven](https://baike.baidu.com/item/Maven)项目对象模型\(POM\)，可以通过一小段描述信息来管理项目的构建，报告和文档的软件[项目管理工具](https://baike.baidu.com/item/项目管理工具)。

Maven 除了以程序构建能力为特色之外，还提供高级项目管理工具。由于 Maven 的缺省构建规则有较高的可重用性，所以常常用两三行 Maven 构建脚本就可以构建简单的项目。由于 Maven 的面向项目的方法，许多 Apache Jakarta 项目发文时使用 Maven，而且公司项目采用 Maven 的比例在持续增长。

Maven这个单词来自于意第绪语（犹太语），意为知识的积累，最初在Jakata Turbine项目中用来简化构建过程。当时有一些项目（有各自Ant build文件），仅有细微的差别，而JAR文件都由[CVS](https://baike.baidu.com/item/CVS)来维护。于是希望有一种标准化的方式构建项目，一个清晰的方式定义项目的组成，一个容易的方式发布项目的信息，以及一种简单的方式在多个项目中共享JARs。

## 特点

那么，Maven 和 Ant 有什么不同呢？在回答这个问题以前，首先要强调一点：Maven 和 Ant 针对构建问题的两个不同方面。Ant 为 Java 技术开发项目提供跨平台构建任务。Maven 本身描述项目的高级方面，它从 Ant 借用了绝大多数构建任务。因此，由于 Maven 和[Ant](https://baike.baidu.com/item/Ant/785685)代表两个差异很大的工具，所以接下来只说明这两个工具的等同组件之间的区别，如表 1 所示。

|  | maven | **Ant** |
| :--- | :--- | :--- |
| 标准构建文件 | project.xml 和 maven.xml | build.xml |
| 特性处理顺序 | ${maven.home}/bin/driver.properties${project.home}/project.properties${project.home}/build.properties${user.home}/build.properties通过 -D 命令行选项定义的系统特性**最后一个**定义起决定作用。 | 通过 -D 命令行选项定义的系统特性由 任务装入的特性**第一个**定义最先被处理。 |
| 构建规则 | 构建规则更为动态（类似于编程语言）；它们是基于 Jelly 的可执行 XML。 | 构建规则或多或少是静态的，除非使用&lt;script&gt;任务 |
| 扩展语言 | 插件是用 Jelly（XML）编写的。 | 插件是用 Java 语言编写的。 |
| 构建规则可扩展性 | 通过定义 &lt;preGoal&gt; 和 &lt;postGoal&gt; 使构建 goal 可扩展。 | 构建规则不易扩展；可通过使用 &lt;script&gt; 任务模拟 &lt;preGoal&gt; 和 &lt;postGoal&gt; 所起的作用。 |



