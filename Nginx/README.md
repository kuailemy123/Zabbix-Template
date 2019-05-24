## 介绍

通过http方式访问nginx stats模块获取指标

##  客户端操作

1. 在nginx上配置`phpfpm_status.conf`
2. 将`userparameter_nginx.conf`放在`/etc/zabbix/zabbix_agentd.d/`目录中
3. 重启客户端`/etc/init.d/zabbix-agent restart`
4. 重启后测试`zabbix_agentd -t nginx.json[127.0.0.1,80,status]`

## 服务端操作

1. 测试是否能获取`zabbix_get -s 172.20.2.215 -k 'nginx.json[127.0.0.1,80,status]`
2. 在web管理页面将`zbx_nginx_template_v3.xml`导入
3. 创建一个主机组`Nginx Servers`, 并将相关主机关联
4. 根据自身情况,修改导入的模板`Template App Nginx`中的宏变量 `{$NGINX_SERVER}` `{$NGINX_PORT}` `{$NGINX_STATUS}`
5. 将模板`Nginx`关联到相关主机
6. 将`nginx_status.json`导入到grafana