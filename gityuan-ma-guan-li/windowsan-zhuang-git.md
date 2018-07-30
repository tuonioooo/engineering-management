# Windows安装Git

### 

### Git

是一个开源的完全分布式的源代码管理系统, 它在开源社区中非常流行，已经大有顶替subversion在开源社区中地位的趋势。

### 安装和配置msysGit

这里假定你使用的是Windows操作系统，虽然也许Git在Linux或者Mac系统上使用更方便。目前，在Winodws上比较好用的msysgit，可以在google code上下载: [http://code.google.com/p/msysgit/](http://code.google.com/p/msysgit/)。也可以通过官网下载：[https://git-scm.com/](https://git-scm.com/)

目前最新的版本是1.7.0.2, 虽然是preview版本，但是基本上还是很稳定的。 安装过程很简单，基本上一路next就好。 msysgit包括一个命令行工具和一个GUI程序。GUI目前还不是一个成熟的产品，但是如果你是在不想用命令行的话，也可以试试。

### Git在Windows 安装过程

在WinXP下安装Git详细步骤参考如下安装示意图：

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%281%29.png)

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%282%29.png)

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%283%29.png)

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%284%29.png)

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%285%29.png)

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%286%29.png)

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%287%29.png)

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%288%29.png)

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%289%29.png)

点击上图的“Finish”后Git的安装就完成了，安装完成后需要在进行一下环境变量的设置，改变环境变量的具体步骤可以参考下图：

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%2810%29.png)

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%2811%29.png)

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%2812%29.png)

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%2813%29.png)

![](file:///C:/Users/tony/AppData/Local/Temp/enhtmlclip/Image%2814%29.png)

### 配置用户和email

命令如下：

> $git config --global user.name "your name"
>
> $git config --global user.email "your@email.address"

其中"your name"换成你的名字，"your@email.address"换成你的邮箱地址。

#### 生成SSH Key

在使用Git前，需要先生成一个SSH Key，来保证你的local box和服务器之间通信的安全，识别代码的改动。选择一个文件夹，单击右键，选择“Git Bash Here”, 然后在命令行窗口中输入:

> ssh-keygen –c [“username@email.com](mailto:“username@email.com)” –t rsa

这里使用的email地址是你注册Git时使用的email地址。 这里基本上也一路enter就好了，中间会有一步提示你输入 passphrase, 就是密码或者通行码，可以随便编一个或者直接回车，为空就好。之后窗口会显示生成的rsa文件存放的位置。

如果是在XP系统上，位置应该是 “C:\Documents and Settings\username.ssh\”;

如果是在Win7系统上，位置应该是  “C:\Users\username.ssh”。

使用文本编辑器打开“id\_rsa.pub”就可以看到公钥的内容：

```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDLY5NBdoD6UNgFWje2KkWLkVN9YtSOYlaPI24A6GlDaH70Aaf1XPkhiUsEHXgE9gJtCFBz0yBS9SoZ8G62wOm4g2NSqubYQVIsRamzJXRsWmmFJxPzQXEjj2NQCs/oIMsYTZmE3ad9+zikDmXQUolL812FdiRWxkbG/nGMbN3DD1Lhhd0FTnGon/XX+BL3BuecAhEhGQZYSJaLkFR9S9iOgpnj+w99ArZVPspkj6GoRsfN55gm0eBagokk5FxUByCK1AFWIJZucFhBLqWUQv9orzrXEuI9x3Ek2mCz/Kr6QKAks2GS5k1bqTopj393qlIdA9o+S8NTCbXVpLCB0h8r daizhaoman@sina.com
```

此时只要把你的公钥放进你项目的服务中就可以进行git的相关操作。

### 解决中文目录支持问题 

* **ls不能显示中文目录**

解决办法：在git/etc/git-completion.bash中增加一行：

```
alias ls='ls --show-control-chars --color=auto'
```

* **git commit不能提交中文注释**

解决办法：修改git/etc/inputrc中对应的行：

```
set output-meta on
set convert-meta off
```



3、git log无法显示中文注释

解决办法：在git/etc/profile中增加一行：

  


export LESSCHARSET=iso8859

到这时有关于git在winxp下安装就介绍完了，希望这个能给一些朋友带来一定的帮助。同时更希望朋友们关注W3CPLUS，因为只有你们的关注才能带来我的成长。



