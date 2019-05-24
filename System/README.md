## 介绍

1. 通过iostat获取io指标
2. 通过ss获取tcp连接指标

##  客户端操作

1. 将配置`userparameter_system.conf` 放在`/etc/zabbix/zabbix_agentd.d/` 目录中
2. 将脚本`disk_discovery.sh` 放在 `/etc/zabbix/scripts/` 目录中
2. 重启客户端`/etc/init.d/zabbix-agent restart`
3. 重启后测试`zabbix_agentd -t tcp.json`

## 服务端操作

1. 测试是否能获取`zabbix_get -s 172.20.2.215 -k tcp.json`
2. 在web管理页面将`zbx_system_templates_v3.xml` 导入
5. 将模板`Template App System`关联到相关主机