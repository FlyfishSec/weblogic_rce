# CVE-2019-2725
# CNVD-C-2019-48814
 cve2019-2725_RCE - Weblogic _async remote command execution exploit
 =
 cve2019_2725、CNVD-C-2019-48814 weblogic _async反序列话远程代码执行漏洞，
 http://www.cnvd.org.cn/webinfo/show/4989

 Weblogic _async远程命令执行漏洞命令回显版exp，不需要安装任何库，通杀Windows&Linux。
 Linux Payload用的Jason的，Windows Payload是修改的10271，java.lang.Runtime执行。同样使用写临时文件方式回显漏洞，命令回显后即删除，效果谁用谁知道。
 >分析过网上各种exp，Windows好使的基本没有，甚至有使用jason的payload直接丢个powershell反弹命令进去,就说能反弹Windows了(你特么测试过能用么，纯属蹭热度...)，还有各种界面版不开源的渣渣，执行命令404不说，写完文件都不带清理的么？

## Usage
 
>cve2019-2725_weblogic_rce.exe http://192.168.31.5:7001 "cat /etc/passwd"

![cve2019-2725](https://raw.githubusercontent.com/FlyfishSec/CVE-2019-2725_check/master/cve2019-2725.JPG)  
![rsgen_default](https://raw.githubusercontent.com/FlyfishSec/rsGen/master/Usage/rsgen_default.png "rsgen_default")  

## 漏洞详情
   
   * 关于Oracle WebLogic wls9-async组件存在反序列化远程命令执行漏洞的安全公告
http://www.cnvd.org.cn/webinfo/show/4989
   * WebLogic RCE（CVE-2019-2725）漏洞之旅
https://www.freebuf.com/vuls/202800.html
   * Oracle Security Alert Advisory – CVE-2019-2725
https://www.oracle.com/technetwork/security-advisory/alert-cve-2019-2725-5466295.html

## Contact
Flyfish#lcx.cc
