## 介绍

1. 通过chronyc获取时间同步指标

##  客户端操作

1. 将配置`userparameter_chrony.conf` 放在`/etc/zabbix/zabbix_agentd.d/` 目录中
2. 重启客户端`/etc/init.d/zabbix-agent restart`
3. 重启后测试`zabbix_agentd -t chrony.json`

## 服务端操作

1. 测试是否能获取`zabbix_get -s 172.20.2.215 -k chrony.json`
2. 在web管理页面将`zbx_chrony_templates_v3.xml` 导入
5. 将模板`Template Service Chronyd`关联到相关主机