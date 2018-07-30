# 常见代码冲突解决方案 

## git merge / git pull可能会失败

有两种方法可以使git合并（或者git pull，这是一个git fetch，然后是一个git合并）可能会失败：

### Git可能无法启动合并

发生这种情况是因为git知道您的工作目录或登台区域中有可能由您正在合并的文件写入的更改。如果发生这种情况，那么在单个文件中不存在合并冲突。你需要修改或存储它列出的文件，然后再尝试做一个git pull。错误消息如下所示：

```
错误：条目'
<
文件名
>
'不是uptodate。
无法合并。
（工作目录中的更改）

```

要么

```
错误：条目'
<
文件名
>
'将被合并覆盖。
无法合并。
（中转区域的变化）

```

### Git在合并过程中可能会失败

发生这种情况是因为您提交的更改与其他人提交的更改相冲突。Git将尽最大努力合并这些文件，并且会让您在所列出的文件中手动解析。错误消息如下所示：

```
CONFLICT（内容）：合并
<
fileName
>
中的冲突

自动合并失败; 
修复冲突，然后提交结果。
```

## 在合并期间git失败的常见问题

### 我怎么知道哪些文件与其中有冲突？

如果你的合并失败，甚至没有启动，文件将不会有冲突。如果git在合并过程中发现冲突，它会列出错误信息后所有冲突的文件。您也可以通过执行'git status'来检查哪些文件已经合并冲突。

例：

```
  ＃要提交的更改：

  ＃（使用“git reset HEAD 
<
file
>
 ...”来取消）

  ＃

  ＃修改：
<
某些文件
>

  ＃

  ＃已更改但未更新：

  ＃（使用“git add 
<
file
>
 ...”来更新将要提交的内容）

  ＃（使用“git checkout  -  
<
file
>
 ...”放弃工作目录中的更改）

  ＃

  ＃unmerged：
<
file
>

  ＃
```

“要提交的更改”：对不受冲突影响的文件的所有提交的更改都将被暂存。

“已更改但未更新...已取消合并”：在存储库恢复到正常工作状态之前必须解决的所有冲突文件。

### 如何在文件本身中发现冲突？

冲突在带有清晰换行符的文件中标记：

```
<
<
<
<
<
<
<
 HEAD：mergetest

 这是我的第三行

 =======

 这是我添加的第四行
>
>
>
>
>
>
>
 4e2b407f501b68f8588aa645acafffa0224b9b78：mergetest
```

**&lt;&lt;&lt;&lt;&lt;&lt;&lt;**：表示有合并冲突的行的开始。第一组行是您试图合并更改**到**文件的行。

**=======**：表示用于比较的断点。将用户提交的更改（以上）分解为来自合并（下面）的更改，以直观地查看差异。

**&gt;&gt;&gt;&gt;&gt;&gt;&gt;**：表示有合并冲突的行结束。

### 如何解决文件中的合并冲突？

通过编辑文件来手动合并git合并时遇到的文件部分，从而解决冲突。这可能意味着放弃你的改变或者别人的或者两者的混合。您还需要删除文件中的“&lt;&lt;&lt;&lt;&lt;&lt;&lt;”，“=======”和“&gt;&gt;&gt;&gt;&gt;&gt;&gt;”。

### 在解决所有受影响的文件中的冲突后，我该怎么做？

git添加文件，git commit和git push（只为追踪的分支推送）。

（**注意中国**增加 - 需要提交一切，而不仅仅是已解决的冲突文件。）

## 工具来帮助您解决这两种类型的合并冲突

下面的下面的git工具可以帮助你解决简单和更复杂的git合并。

### 一般工具

#### git diff

[**git diff**](http://genomewiki.ucsc.edu/index.php/Working_with_Git#.27git_diff.27)：帮助查找版本库/文件状态之间[**差异**](http://genomewiki.ucsc.edu/index.php/Working_with_Git#.27git_diff.27)的命令。有助于预测和防止合并冲突。

**git diff origin / master &lt;fileName&gt;**：找到**fileName**的当前索引（HEAD）与中央仓库（origin / msater）中的内容之间的区别

```
diff --git a / mergetest b / mergetest

索引9be56b9..0aeff​​ac 100644

---一个/ mergetest

+++ b / mergetest

@@ -1,3 +1,4 @@

 你好

+我也在编辑这一行

 这是一个测试

这是我的第三行

+这是我添加的第四行
```

来自origin / master的更改用**+**标记，而本地存储库（HEAD）中的更改用**-**标记。此语法不会通知哪些行被添加被删除，而是哪些行来源于文件的哪个状态。

**git diff FETCH\_HEAD &lt;文件名&gt;**：将提供与上述相同的输出，但仅限于用户所做的最后一次读取的索引。这可能不是中央存储库中的最新版本。

#### git状态

[**git status**](http://genomewiki.ucsc.edu/index.php/Working_with_Git#.27git_status.27)：一个命令提供了所有在合并时被修改和冲突的文件的概述。

例：

```
   ＃要提交的更改：

   ＃（使用“git reset HEAD 
<
file
>
 ...”来取消）

   ＃

   ＃修改：
<
某些文件
>

   ＃

   ＃已更改但未更新：

   ＃（使用“git add 
<
file
>
 ...”来更新将要提交的内容）

   ＃（使用“git checkout  -  
<
file
>
 ...”放弃工作目录中的更改）

   ＃

   ＃unmerged：
<
file
>

   ＃
```

* “变更将被提交”：对不受冲突影响的文件的所有变更都将被分阶段进行。

* “已更改但未更新...已取消合并”：在存储库恢复到正常工作状态之前必须解决的所有冲突文件。

### 当git拒绝开始合并时专门用于工具

#### git存储

**重要提示：如果git经历了合并，并且存在合并冲突，请勿使用git stash！如果git拒绝合并，只能使用git存储，因为它预见到存在冲突。**

[**git stash**](http://genomewiki.ucsc.edu/index.php/Working_with_Git#.27git_stash.27)：存放你的临时区域和工作目录中的任何改变。这个命令在保存所有没有准备好提交的变化并且用户希望有一个更新的存储库时非常有用。

**git储存保存“&lt;保存消息&gt;”**：保存更改文件在工作目录和临时区域git知道

```
 git存储保存“存储示例的更改”

 已保存的工作目录和索引状态“在主服务器上：保存更改为隐藏示例”

 HEAD现在在4e2b407例如添加第二个文件。
```

**git stash pop**：删除指定的最新隐藏或任何隐藏，并将更改作为合并应用。如果合并失败，存储不会从列表中删除，必须手动删除。

#### git结帐

[**git checkout &lt;fileName&gt;**](http://genomewiki.ucsc.edu/index.php/Working_with_Git#.27git_checkout_HEAD_fileName.27)：可以用来清除工作目录中的更改，以便允许** git pull**。

#### 混帐重置 - 混合

[**git reset --mixed**](http://genomewiki.ucsc.edu/index.php/Working_with_Git#.27git_reset_--.5Boption.5D_HEAD.27)：可以用来[**取消**](http://genomewiki.ucsc.edu/index.php/Working_with_Git#.27git_reset_--.5Boption.5D_HEAD.27)文件以允许** git pull**。

### 当合并时出现git冲突的工具

#### 混帐重置

[**git reset --hard**](http://genomewiki.ucsc.edu/index.php/Working_with_Git#.27git_reset_--.5Boption.5D_HEAD.27)：重置版本库以退出合并冲突的情况。git reset，特别是用--hard选项可以用来退出合并冲突（点击[这里](http://genomewiki.ucsc.edu/index.php/Working_with_Git#Commit_IDs_and_Referring_to_ancestors)获取更多信息）。

**重要：在解决合并过程中git失败的情况下，不要使用除-hard之外的其他任何选项来重置，因为它们将在文件中留下冲突线标记，并且最终可能会提交冲突标记仍然存在的文件。**

## 方案

### Git拒绝启动合并/拉

错误消息：

```
错误：条目'
<
文件名
>
'不是uptodate。
无法合并。
（工作目录中的更改）

```

```
错误：条目'
<
文件名
>
'将被合并覆盖。
无法合并。
（变化上演，但没有承诺）

```

解决方案的步骤：

1. git stash save“
   &lt;
   描述正在被保存的东西的消息
   &gt;
   ”（将staging区域和工作目录中的所有更改保存在单独的索引中）
   **或者**
    git checkout 
   &lt;
   file
   &gt;
   （抛出所做的更改，以便可以进行合并）
2. git状态（验证所有更改都已启动）
3. git pull或git merge（引入来自中央存储库或其他分支的更改）
4. 只有在第1步中执行了“git stash”：git stash pop（将重新填充到工作目录中的更改，可能需要解决合并冲突）

### Git无法解析合并/拉取

错误信息：

```
CONFLICT（内容）：合并
<
fileName
>
中的冲突

自动合并失败; 
修复冲突，然后提交结果。
```

解决方案的步骤：

1. git status（在工作目录中显示所有冲突为未合并的文件）。
2. [解决合并冲突](http://genomewiki.ucsc.edu/index.php/Resolving_merge_conflicts_in_Git#Common_questions_for_when_git_fails_during_the_merge)
3. git add 
   &lt;
   files
   &gt;
4. git commit -m“
   &lt;
   信息提交信息
   &gt;
   ”

## 一个GitHub测试库来测试冲突

您可以尝试解决与此存储库的git冲突：[https](https://github.com/brianleetest/testGit/blob/master/README.md)：[//github.com/brianleetest/testGit/blob/master/README.md](https://github.com/brianleetest/testGit/blob/master/README.md)

1. 您将需要一个GitHub帐户并添加为协作者来推送您的更改。
2. 在两个不同的终端和位置创建两个单独的目录，gitClone和gitCloneLeader。
   领导者可以是第一个推动变革的人（需要成为合作者）。
3. 第一个“组员”步骤，直到在gitClone目录中等待。
4. 然后，执行gitCloneLeader目录中的所有“组长”步骤（推送需要导致冲突）。
5. 继续“组员”步骤（首先克隆库和编辑文件的git拉）。



