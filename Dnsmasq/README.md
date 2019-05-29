## 介绍

通过zabbix agent方式获取Dnsmasq的进程cpu,内存使用情况

##  客户端操作


## 服务端操作

1. 在web管理页面将`zbx_dnsmasq_templates_v3.xml` 导入
2. 创建一个主机组 `Dnsmasq Servers`, 并将相关主机关联
4. 将模板`Template Service Dnsmasq`关联到相关主机