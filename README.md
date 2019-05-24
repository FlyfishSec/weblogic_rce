CNVD-C-2019-48814、CVE-2019-2725 Weblogic _async remote command execution exp
===
The main code is based on js implementation.
  Linux Payload uses Jason, Windows Payload is modified 10271, java.lang.Runtime is executed.
 
## Environmental needs

  All versions of Windows.

## Usage

`cve2019-2725_weblogic_rce.bat http://192.168.31.5:7001 "cat /etc/passwd"`

![cve2019-2725](https://raw.githubusercontent.com/FlyfishSec/weblogic_rce/master/Usage.gif "Weblogic _async remote command execution exp")  

## Vulnerability information
   
   * [关于Oracle WebLogic wls9-async组件存在反序列化远程命令执行漏洞的安全公告](http://www.cnvd.org.cn/webinfo/show/4989)
   * [WebLogic RCE（CVE-2019-2725）漏洞之旅](https://www.freebuf.com/vuls/202800.html)
   * [Oracle Security Alert Advisory – CVE-2019-2725](https://www.oracle.com/technetwork/security-advisory/alert-cve-2019-2725-5466295.html)

## Contact

Flyfish#lcx.cc
