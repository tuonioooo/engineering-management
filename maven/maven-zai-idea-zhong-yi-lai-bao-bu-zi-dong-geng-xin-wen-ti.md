# maven 在idea中依赖包不自动更新问题

## 【解决办法】

### 方案一 ：maven模块，点击刷新（未生效）

![](../.gitbook/assets/20190428150523444.png)

### 方案二：右键项---&gt;maven---&gt;Reimport （未生效）

![](../.gitbook/assets/2019042815025446.png)

### 方案三：settings--&gt;maven---&gt;Igonred Files ，Ignored files 上的√一定不要勾选上（未生效）

![](../.gitbook/assets/20190428150710315.png)

### 方案四： settings---&gt;maven 去掉Work offline上面的√，这种方法生效了！！！！！！！

![](../.gitbook/assets/20190428150926516.png)

