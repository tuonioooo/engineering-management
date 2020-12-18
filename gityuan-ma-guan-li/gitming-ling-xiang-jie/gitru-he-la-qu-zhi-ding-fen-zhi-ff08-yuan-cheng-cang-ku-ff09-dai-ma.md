# git如何拉取指定分支（远程仓库）代码

**问题背景：**

新项目还在开发阶段，没有正式对外发布，所以开发同事合并代码到develop上\(或者其他名称分支上\)，而不是到master分支上

通过git拉取代码的时候，默认拉取的是master分支，如下图：

![](../../.gitbook/assets/1090314-20180712173108722-558719819.png)

**拉取指定分支代码解决方案：**

**1.使用git命令拉取**

命令：`$ git clone -b develop git@192.168.101.107:unioncloud-separate/aicall.git`其中develop就是远程分支的名称

![](../../.gitbook/assets/1090314-20180712172935632-92877235.png)

2.当clone 下来只有master分支时，可以才用：取远程分支并在本地分化一个新分支的方案

```text
进入项目目录
git checkout -b 远程仓库分支名字
git pull origin 远程仓库分支名字
```

3.**使用TortoiseGit工具拉取**

![](../../.gitbook/assets/1090314-20180712172548667-434230880.png)

