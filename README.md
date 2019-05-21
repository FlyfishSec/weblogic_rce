### Weblogic _async远程命令执行回显版exp
 &#160; &#160; &#160; &#160;主要代码基于js实现，通杀Windows&Linux。
 Linux Payload用的Jason的，Windows Payload是修改的10271，java.lang.Runtime执行。


### 填过的坑

1. 测试Windows的时候发现Windows环境下，使用写临时文件方式回显，只有第一次能正常回显，之后再执行，回显的仍然是上一次执行命令的结果？或者有时候weblogic报500,命令是执行成功了。一开始以为是写的文件后缀问题，换了几个后缀仍然不行。

2. 一直以为是请求缓存问题，于是尝试各种办法都不行，或是又出现命令回显不完整等情况。

3. 后来突然想到，既然第一次请求没问题，那就每次执行写一个随机文件请求不就可以了，执行完成清理临时文件。
 
### 使用环境

  Windows全版本。

### 效果

下载：https://github.com/FlyfishSec/weblogic_rce

`cve2019-2725_weblogic_rce.exe http://192.168.31.5:7001 "cat /etc/passwd"`

![cve2019-2725](https://raw.githubusercontent.com/FlyfishSec/weblogic_rce/master/Usage.gif "Weblogic _async远程命令执行回显版exp")  

 
### 聊聊

 _ &#160; &#160; &#160; &#160;分析过网上各种exp，Windows好使的基本没有，要么在linux的payload上直接加个powershell反弹命令进去,就说能反弹Windows了...还有各种界面版，执行命令404不说，写完文件都不带清理的？(现在EXP都是拿个人已有模板套用发出去蹭热度吗？)  _

_ &#160; &#160; &#160; &#160;再说有时候，就是想安安静静执行个命令看看（动不动就来个反弹shell？关于反弹，配合使用我写的rsGen效果杠杠的，详情https://github.com/FlyfishSec/rsGen）_

_ &#160; &#160; &#160; &#160;为什么不用python写？现在python是流行，基本懂点python的人都能写几行代码，有时候内网测试要求严格，甚至不让接自己笔记本，搞个exp到客户终端，还要装个python、java...于是决定用js重写一个自用。_

### Contact

Flyfish#lcx.cc
