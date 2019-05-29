## 介绍

通过zabbix agent方式获取Keepalived的进程cpu,内存使用情况

##  客户端操作



## 服务端操作

1. 在web管理页面将`zbx_keepalived_templates_v3.xml` 导入
2. 创建一个主机组 `Keepalived Servers`, 并将相关主机关联
3. 根据自身情况，修改导入的模板`Template App Keepalived<` 中的宏变量 `{$KEEPALIVED_CONFIG}`
4. 将模板`Keepalived`关联到相关主机