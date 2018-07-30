# git版本回滚命令

有时候使用Git工作得小心翼翼，特别是涉及到一些高级操作，例如 reset, rebase 和 merge。甚至一些很小的操作，例如删除一个分支，我都担心数据丢失。

不久之前，我在做一些大动作（rebasing）之前，我总是备份整个版本库，以防万一。直到最近我才发现git的历史记录是不可修改的，也就是说你不能更改任何已经发生的事情。你做的任何操作都只是在原来的操作上修改。也就是说，即使你删除了一个分支，修改了一个提交，或者强制重置，你仍然可以回滚这些操作。

让我们来看一些例子：

> $ git init
>
> $ touch foo.txt
>
> $ git add foo.txt
>
> $ git commit -m "initial commit"
>
> $ echo 'new data' &gt;&gt; foo.txt
>
> $ git commit -a -m "more stuff added to foo"

你现在看git的历史记录，你可以看到两次提交：

> $ git log
>
> \* 98abc5a \(HEAD, master\) more stuff added to foo
>
> \* b7057a9 initial commit

现在让我们来重置回第一次提交的状态：

> $ git reset --hard b7057a9
>
> $ git log
>
> \* b7057a9 \(HEAD, master\) initial commit

这看起来我们是丢掉了我们第二次的提交，没有办法找回来了。但是 reflog 就是用来解决这个问题的。简单的说，它会记录所有HEAD的历史，也就是说当你做 reset，checkout等操作的时候，这些操作会被记录在reflog中。

> $ git reflog
>
> b7057a9 HEAD@{0}: reset: moving to b7057a9
>
> 98abc5a HEAD@{1}: commit: more stuff added to foo
>
> b7057a9 HEAD@{2}: commit \(initial\): initial commit

所以，我们要找回我们第二commit，只需要做如下操作：

> $ git reset --hard 98abc5a

再来看一下 git 记录：

> $ git log
>
> \* 98abc5a \(HEAD, master\) more stuff added to foo
>
> \* b7057a9 initial commit

所以，如果你因为reset等操作丢失一个提交的时候，你总是可以把它找回来。除非你的操作已经被git当做垃圾处理掉了，一般是30天以后

