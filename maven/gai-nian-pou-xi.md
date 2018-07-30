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

Maven是一个项目管理工具，它包含了一个项目对象模型 \(Project Object Model\)，一组标准集合，一个项目生命周期\(Project Lifecycle\)，一个依赖管理系统\(Dependency Management System\)，和用来运行定义在生命周期阶段\(phase\)中插件\(plugin\)目标\(goal\)的逻辑。当你使用Maven的时候，你用一个明确定义的项目对象模型来描述你的项目，然后Maven可以应用横切的逻辑，这些逻辑来自一组共享的（或者自定义的）插件。

Maven 有一个生命周期，当你运行 mvn install 的时候被调用。这条命令告诉 Maven 执行一系列的有序的步骤，直到到达你指定的生命周期。遍历生命周期旅途中的一个影响就是，Maven 运行了许多默认的插件目标，这些目标完成了像编译和创建一个 JAR 文件这样的工作。

此外，Maven能够很方便的帮你管理项目报告，生成站点，管理JAR文件，等等。

## 生命周期

Maven的生命周期是为了对所有的构建过程进行了抽象了，便于统一。

clean\(清理\)

cleanup\(清理所有\)

此生命周期旨在给工程做清理工作，它主要包含以下阶段：

pre-clean - 执行项目清理前所需要的工作。

clean - 清理上一次build项目生成的文件。

post-clean - 执行完成项目清理所需的工作.

default\(默认\)

validate - 验证项目是否正确且所有必要的信息都可用。

initialize - 初始化构建工作，如：设置参数，创建目录等。

generate-sources - 为包含在编译范围内的代码生成源代码.

process-sources - 处理源代码, 如过滤值.

generate-resources -

process-resources - 复制并处理资源文件，至目标目录，准备打包。

compile - 编译项目中的源代码.

process-classes - 为编译生成的文件做后期工作, 例如做Java类的字节码增强.

generate-test-sources - 为编译内容生成测试源代码.

process-test-sources - 处理测试源代码。

generate-test-resources -process-test-resources - 复制并处理资源文件，至目标测试目录。

test-compile - 将需测试源代码编译到路径。一般来说，是编译/src/test/java目录下的java文件至目标输出的测试classpath目录中。

process-test-classes -

test - 使用合适的单元测试框架运行测试。这些测试代码不会被打包或部署。

prepare-package -

package - 接受编译好的代码，打包成可发布的格式，如 JAR 。

pre-integration-test -

integration-test - 按需求将发布包部署到运行环境。

post-integration-test -verify -install -将包安装到本地仓库，给其他本地引用提供依赖。

deploy -完成集成和发布工作，将最终包复制到远程仓库以便分享给其他开发人员。

site\(站点\)

pre-site - 执行一些生成项目站点前的准备工作。

site - 生成项目站点的文档。

post-site - 执行需完成站点生成的工作，如站点部署的准备工作。

site-deploy - 向制定的web服务器部署站点生成文件。 \[2\] 

Maven生命周期参考：Apache Maven Project \[2\]  ，书籍《Maven In Action》



