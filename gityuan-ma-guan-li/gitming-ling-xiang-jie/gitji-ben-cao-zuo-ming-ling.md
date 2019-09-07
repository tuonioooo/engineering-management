# git基本操作命令

## 参考文档：

菜鸟教程：[http://www.runoob.com/git/git-basic-operations.html](http://www.runoob.com/git/git-basic-operations.html)

官方文档：[https://git-scm.com/doc](https://git-scm.com/doc)

廖雪峰git教程：[https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000](https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)

* ## git版本控制命令

> 1.git config --global user.name "daizhao"  建立用户\(在本机git库中建立一个用户命名为daizhao\)
>
> 2.git config --global user.email "email"   建立邮箱........................................
>
> 3.git config --list                    查看你的配置信息
>
> 4.cd /e/workspace                         进入当前的目录
>
> 5.ls                            查看当前目录下的文件
>
> 6.vi ~/.ssh/config                  vi编辑器\(编辑ssh文件\)
>
> 7.cat ~/.ssh/config                  显示当前的SSH配置文件中的信息
>
> TCPKeepAlive  yes
>
> ServerAliveInterval=30
>
> Host  git\(别名\)
>
> HostName 219.232.251.2
>
> Port  52010
>
> User  git
>
> 8.cat ~/.ssh/id\_rsa                  查看文件
>
> 9.cat ~/.ssh/id\_rsa.pub                  打开文件中取得密匙
>
> 10.git clone git@git:/opt/git/jinhonglun-erp.git  连接远程服务器下载项目
>
> 11.git add .                         添加所有文件的命令
>
> 12 git add . 文件名                  添加指定文件的命令
>
> 13.git status                       查看当前版本控制提交的状态
>
> 14.git commit -m "注释"                  提交文件命令，-m "添加注释"
>
> 15.git pull origin master             从服务器当中更新一下操作
>
> 16.git push origin master             将本机的版本控制，提交到服务器版本控制
>
> 17.git rm -"文件名"                  删除一个指定的文件
>
> 18.git checkout -b "分支名"             建立一个分支
>
> 19.git branch   -d "分支名"             删除一个分支\(必须切换到master主控制下，才可以删除分支\)
>
> 20.git checkout "分支名"             变更当前的分支
>
> 21.git merge  "分支名"                  合并分支的代码\(必须切换到master主控制下，才可以合并\)
>
> 22.git 合并冲突时，修改代码之后，需要重新的git add .  git commit -m 提交操作
>
> 23.linux下的，中止操作命令是：aborted/crtl+c
>
> 24.git checkout -tb bugfix origin/v1.0-bugfix 从服务器端v1.0-bugfix，到本地建立bugfix分支，每次提交时，就不需要git pull/push origin bugfix,直接git pull/push 即可
>
> 25.git checkout --track "本地分支名" origin/serverfix          跟踪远程端的服务器版本，并且下载到本地
>
> 26.git config remote.\[remoteName\].push \[localBranchName\]:\[remoteBranchName\] eg:git config remote.origin.push bugfix2:v1.0-bugfix ,切换push提交远程服务器的版本\(切当前项目下仅有一个分支可提交\[git pull/push\]\)
>
> 27.git remote show origin              显示本地与远程端对应的版本
>
> 28.fetch和pull的区别：fetch：仅仅是从远端服务器中，下载下来，并不合并你当前的分支代码；pull:是从远端服务器中，下载下来，合并你当前的分支代码；
>
> 29.git remote -v:显示远程端的服务
>
> 30.git 建立分支之前，如果在当前版本有没提交的文件，那么建立分支之后，也会显示之前没提交的文件，此时，再次的变换分支到master上，也还会显示，没提交的文件；
>
> 如果在新建立的分支中，提交修改的代码，此时，在切换master版本中，不会显示没提交的文件，并且提交的内容不在master版本中体现，master会找到修改之前的代码自动更新；
>
> 而新版本提交之后，就显示刚才提交的内容，这点，恰恰是master与分支之间没提交代码时的区别；请加以注意；
>
> 注意事项：
>
> * 每次push之前，都要pull
>
> * 在分支修改之后，需要添加和commit，才能合并
>
> * staged状态之前存在四种文件：一个是冲突文件、修改文件、不在版本控制之内的文件、删除文件
>
> * 提交分支的话，只能在当前的分支下才可以提交分支，如果切换到其他分支或者是主控制分支上，在去提交的话，就会遇到错误;
>
> 31.git push origin bugfix4:new\_feature              把本地分支的代码提交到远程仓库中，并同时在仓库中建立new\_feature分支
>
> 32.git branch -r                                                      查看仓库的远程分支
>
> 33.git fetch origin new\_feature                            同步远程分支
>
> 34.git branch --track origin/new\_feature            将当前的分支跟踪到远程的分支下
>
> 35.git push origin bugfix5:new\_feature              指定分支，提交指定的仓库

* ## 远程仓库相关命令

> 检出仓库：$ git clone git://github.com/jquery/jquery.git
>
> 查看远程仓库：$ git remote -v
>
> 添加远程仓库：$ git remote add \[name\] \[url\]
>
> 删除远程仓库：$ git remote rm \[name\]
>
> 修改远程仓库：$ git remote set-url --push \[name\] \[newUrl\]
>
> 拉取远程仓库：$ git pull \[remoteName\] \[localBranchName\]
>
> 推送远程仓库：$ git push \[remoteName\] \[localBranchName\]

* ## **分支\(branch\)操作相关命令**

> 查看本地分支：$ git branch
>
> 查看远程分支：$ git branch -r
>
> 查看所有分支【本地+远程】：$ git branch -a
>
> 创建本地分支：$ git branch \[name\] ----注意新分支创建后不会自动切换为当前分支
>
> 切换分支：$ git checkout \[name\]
>
> 创建新分支并立即切换到新分支：$ git checkout -b \[name\]
>
> 删除分支：$ git branch -d \[name\] ---- -d选项只能删除已经参与了合并的分支，对于未有合并的分支是无法删除的。
>
> 如果想强制删除一个分支，可以使用-D选项
>
> 合并分支：$ git merge \[name\] ----将名称为\[name\]的分支与当前分支合并
>
> 创建远程分支\(本地分支push到远程\)：$ git push origin \[name\]
>
> 删除远程分支：$ git push origin :heads/\[name\]

* ## **版本\(tag\)操作相关命令**

> 查看版本：$ git tag
>
> 创建版本：$ git tag \[name\]
>
> 删除版本：$ git tag -d \[name\]
>
> 查看远程版本：$ git tag -r
>
> 创建远程版本\(本地版本push到远程\)：$ git push origin \[name\]
>
> 删除远程版本：$ git push origin :refs/tags/\[name\]

* ## **子模块\(submodule\)相关操作命令**

> 添加子模块：$ git submodule add \[url\] \[path\]
>
> 如：$ git submodule add git://github.com/soberh/ui-libs.git src/main/webapp/ui-libs
>
> 初始化子模块：$ git submodule init  ----只在首次检出仓库时运行一次就行
>
> 更新子模块：$ git submodule update ----每次更新或切换分支后都需要运行一下
>
> 删除子模块：（分4步走哦）
>
> 1\) $ git rm --cached \[path\]
>
> 2\) 编辑“.gitmodules”文件，将子模块的相关配置节点删除掉
>
> 3\) 编辑“ .git/config”文件，将子模块的相关配置节点删除掉
>
> 4\) 手动删除子模块残留的目录

* ## 忽略一些文件、文件夹不提交

> 在仓库根目录下创建名称为“.gitignore”的文件，写入不需要的文件夹名或文件，每个元素占一行即可，如
>
> target



