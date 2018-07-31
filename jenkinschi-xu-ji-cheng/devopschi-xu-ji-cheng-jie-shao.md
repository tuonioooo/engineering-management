# DevOps持续集成介绍

## 前言

本以为DevOps与Docker无关了，没想到Docker在这个领域也是神一样的存在。Docker支持持续集成/持续交互\(CI/CD\)，Docker的目标是让我们的环境构建变得简单，让开发人员更关注自己的代码，同时也不需要运维介入，每一次代码的提交都可以实时地发布到对应的测试环境，提前验证代码的正确性。这之中持续集成最经典的案例当属Docker+Jenkins+Github的持续集成方案了，下一篇会详细描述实践过程。本文还是先来看看到底什么是DevOps,以及它的核心理念。

## 什么是DevOps

DevOps（Development和Operations的组合词）是一种重视“软件开发人员（Dev）”和“IT运维技术人员（Ops）”之间沟通合作的文化、运动或惯例。透过自动化“软件交付”和“架构变更”的流程，来使得构建、测试、发布软件能够更加地快捷、频繁和可靠。--[维基百科](https://zh.wikipedia.org/wiki/DevOps)

DevOps（英文Development和Operations的组合）是一组过程、方法与系统的统称，用于促进开发（应用程序/软件工程）、技术运营和质量保障（QA）部门之间的沟通、协作与整合。它的出现是由于软件行业日益清晰地认识到：为了按时交付软件产品和服务，开发和运营工作必须紧密合作。--[百度百科](http://www.baidu.com/link?url=rWJO7Ej7BstI8IZmc9C2mPu9M3mPQDgOO5OldxVcHV1zh3bwwLtcSlDtPG_gwXQWoAH8SYqIuFpScspymQdI2_&wd=&eqid=d323d5500000112f0000000559635227)

**提到DevOps不得不提到的就是持续集成：**

持续集成是一种软件开发实践，团队成员经常整合他们的工作，通常每个人至少每天集成 - 每天都会进行多次整合。 每个集成都通过自动构建（包括测试）进行验证，以尽可能快地检测集成错误。 许多团队发现，这种方法导致了大大降低的集成问题，并允许团队更快地开发连贯的软件。

## 为什么会有DevOps?

DevOps这个新理念的出现，是为了应对IT环境中普遍面临的一些挑战。

![](/assets/import-devops-01.png)









