## 介绍

通过http方式访问phpfpm stats模块获取指标

##  客户端操作

1. 将`userparameter_phpfpm.conf` 放在`/etc/zabbix/zabbix_agentd.d/` 目录中
2. 重启客户端`/etc/init.d/zabbix-agent restart`
3. 重启后测试`zabbix_agentd -t phpfpm.json[127.0.0.1,80,phpfpm_status]`

## 服务端操作

1. 测试是否能获取`zabbix_get -s 172.20.2.215 -k phpfpm.json[127.0.0.1,80,phpfpm_status]`
2. 在web管理页面将`zbx_phpfpm_template_v3.xml` 导入
3. 创建一个主机组`PHP-RPM Servers`, 并将相关主机关联
4. 根据自身情况,修改导入的模板`Haproxy`中的宏变量 `{$NGINX_SERVER}` `{$NGINX_PORT}` `{$NGINX_STATUS}`
5. 将模板`Template App HP-RPM`关联到相关主机