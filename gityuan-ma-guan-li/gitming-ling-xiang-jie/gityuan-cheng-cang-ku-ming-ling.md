# git远程仓库命令

* ## git建立远程仓库，让别人git clone下来

> 1，建立你的git 目录。
>
> ourunix@ubuntu:~$ mkdir testgit
>
> ourunix@ubuntu:~$ cd testgit/
>
> 2,建立你的git仓库。
>
> ourunix@ubuntu:~/testgit$ git init
>
> Initialized empty Git repository in /home/wlp/testgit/.git/
>
> 3，添加你的需要的项目初始文件，这里我就只添加一张文档了。
>
> ourunix@ubuntu:~/testgit$ echo "hello,git" &gt; sayhi.txt
>
> 4，跟踪及提交到仓库。
>
> ourunix@ubuntu:~/testgit$ git add sayhi.txt
>
> ourunix@ubuntu:~/testgit$ git commit -m "2011.4.13" sayhi.txt
>
> \[master \(root-commit\) b87b535\] 2011.4.13
>
> 1 files changed, 1 insertions\(+\), 0 deletions\(-\)
>
> create mode 100644 sayhi.txt
>
> 5.在本地的git仓库"添加一个远程仓库",当然这个远程仓库还是你自己的这个目录。
>
> ourunix@ubuntu:~/testgit$ git remote add origin ssh://你的IP/~/testgit/.git
>
> 这时候,本地的 .git/config 应该会改变
>
> 6.将本地的 master分支 ，跟踪到远程的分支
>
> ourunix@ubuntu:~/testgit$ git push origin master
>
> 7,显示远程信息
>
> ourunix@ubuntu:~/testgit$git remote show origin
>
> 8,利用其他局域网的电脑测试你的仓库
>
> ourunix@ubuntu:~/test$ git clone ssh://你的IP/home/～/testgit/.git
>
> Initialized empty Git repository in /home/wlp/test/git/.git/
>
> xxx‘s password:
>
> remote: Counting objects: 3, done.
>
> Receiving objects: 100% \(3/3\), done.
>
> remote: Total 3 \(delta 0\), reused 0 \(delta 0\)
>
> 9，大功告成，开始动手建立你的仓库吧。
>
> Ubuntu下测试ssh时使用ssh localhost 命令，出现错误提示connect to host localhost port 22:Connection refused
>
> 造成这个错误的原因可能是ssh-server未安装或者未启动。ubuntu 11.10 默认安装openssh-client，但是木有安装server
>
> 运行 ps -e \| grep ssh，查看是否有sshd进程
>
> 如果没有，说明server没启动，通过 /etc/init.d/ssh -start 启动server进程，如果提示ssh不存在 那么就是没安装server
>
> 通过 sudo apt-get install openssh-server命令安装即可



