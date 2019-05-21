CVE-2019-2725 Weblogic _async远程命令执行回显版exp
===
主要代码基于js实现，通杀Windows&Linux。
 Linux Payload用的Jason的，Windows Payload是修改的10271，java.lang.Runtime执行。
 
## Environmental needs

  Windows全版本。

## Usage

>cve2019-2725_weblogic_rce.exe http://192.168.31.5:7001 "cat /etc/passwd"

![cve2019-2725](https://raw.githubusercontent.com/FlyfishSec/weblogic_rce/master/Usage.gif "Weblogic _async远程命令执行回显版exp")  

 
## Chat
>分析过网上各种exp，Windows好使的基本没有，要么在linux的payload上直接加个powershell反弹命令进去,就说能反弹Windows了...还有各种界面版，执行命令404不说，写完文件都不带清理的？(现在EXP都是拿个人已有模板套用发出去蹭热度吗？) 

>再说有时候，就是想安安静静执行个命令看看（动不动就来个反弹shell？）

>为什么不用python写？现在python是流行，基本懂点python的人都能写几行代码，有时候内网测试要求严格，甚至不让接自己笔记本，搞个exp到客户终端，还要装个python、java...于是决定用js重写一个自用。

## Vulnerability information
   
   * [关于Oracle WebLogic wls9-async组件存在反序列化远程命令执行漏洞的安全公告](http://www.cnvd.org.cn/webinfo/show/4989)
   * [WebLogic RCE（CVE-2019-2725）漏洞之旅](https://www.freebuf.com/vuls/202800.html)
   * [Oracle Security Alert Advisory – CVE-2019-2725](https://www.oracle.com/technetwork/security-advisory/alert-cve-2019-2725-5466295.html)

## Contact

Flyfish#lcx.cc
