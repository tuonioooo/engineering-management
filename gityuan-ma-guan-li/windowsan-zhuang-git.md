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

#### 

#### 生成SSH Key 

配置email，命令如下：

> $git config --global user.name "your name"
>
> $git config --global user.email "your@email.address"

其中"your name"换成你的名字，"your@email.address"换成你的邮箱地址。

在使用Git前，需要先生成一个SSH Key，来保证你的local box和服务器之间通信的安全，识别代码的改动。选择一个文件夹，单击右键，选择“Git Bash Here”, 然后在命令行窗口中输入:

> ssh-keygen –c [“username@email.com](mailto:“username@email.com)” –t rsa

这里使用的email地址是你注册Git时使用的email地址。 这里基本上也一路enter就好了，中间会有一步提示你输入 passphrase, 就是密码或者通行码，可以随便编一个或者直接回车，为空就好。之后窗口会显示生成的rsa文件存放的位置。

如果是在XP系统上，位置应该是 “C:\Documents and Settings\username.ssh\”

; 如果是在Win7系统上，位置应该是  “C:\Users\username.ssh”。

#### 注册Git Account

注册过程大同小异，唯一不同的地方就是需要输入一个 “SSH Public Key”。这时就需要用到刚刚生成的rsa key文件了。用notepad打开

id\_rsa.pub

，文件的内容就是你的public SSH key.  copy

&

past，注册就完成了。

#### 开始Git之旅

在source code文件夹上使用  “

Git Bash Here

”，然后输入你的Git name和邮箱

> git config --global user.email
>
> [username@email.com](mailto:username@email.com)  
> git config --global user.name “username”

初始化文件夹:

> git init

添加文件

> git add .

提交的服务器

> git commit –m ‘start project’
>
> git remote add origin  
> git@github.com:username/project.git
>
> git push origin master

project.git是你在github创建的项目的名字

