# git合并冲突命令

场景一：

```text
error: Your local changes to the following files would be overwritten by merge: 
Please commit your changes or stash them before you merge.
```

解决办法：

1.服务器代码合并本地代码

```text
$ git stash     //暂存当前正在进行的工作。
$ git pull origin master //拉取服务器的代码
$ git stash pop //合并暂存的代码
```

2.服务器代码覆盖本地代码

```text
$git reset --hard  //回滚到上一个版本
$git pull origin master
```

