## 介绍

通过socat访问haproxy sockert获取指标

##  客户端操作

1. 确保`socat`被安装
2. 将`haproxy_discovery.sh`, `haproxy_stats.sh` 放在 `/etc/zabbix/scripts/` 目录中
3. 将`userparameter_haproxy.conf` 放在`/etc/zabbix/zabbix_agentd.d/` 目录中
4. 执行`usermod -a -G haproxy zabbix`, 以便zabbix有权限访问haproxy的socket
5. 重启客户端`/etc/init.d/zabbix-agent restart`
6. 重启后测试`zabbix_agentd -t haproxy.list.discovery[FRONTEND]`

   

## 服务端操作

1. 测试是否能获取`zabbix_get -s 172.20.2.215 -k 'haproxy.list.discovery'`
2. 在web管理页面将`zbx_haproxy_templates_v3.xml` 导入
3. 创建一个主机组 `Haproxy Servers`, 并将相关主机关联
4. 根据自身情况，修改导入的模板`Haproxy`中的宏变量`{$HAPROXY_CONFIG}`  `{$HAPROXY_SOCK}`
5. 将模板`Haproxy`关联到相关主机
6. 将`haproxy_status.json`导入到grafana



## 脚本测试

```
haproxy_discovery.sh $1 $2
$1 haproxy socket的路径
$2 is FRONTEND or BACKEND or SERVERS

haproxy_discovery.sh /var/run/haproxy/info.sock FRONTEND
haproxy_discovery.sh /var/run/haproxy/info.sock BACKEND
haproxy_discovery.sh /var/run/haproxy/info.sock SERVERS

haproxy_stats.sh /var/run/haproxy/info.sock www-backend www01 status
haproxy_stats.sh www-backend BACKEND status
haproxy_stats.sh https-frontend FRONTEND status

echo "show stat" | socat /var/run/haproxy/info.sock stdio | grep "^www-backend,www01" | cut -d, -f9
echo "show stat" | socat /var/run/haproxy/info.sock stdio | grep "^www-backend,BACKEND" | cut -d, -f10
echo "show stat" | socat /var/run/haproxy/info.sock stdio | grep "^https-frontend,FRONTEND" | cut -d, -f5
echo "show stat" | socat /var/run/haproxy/info.sock stdio | grep "^api-backend,api02" | cut -d, -f18 | cut -d\  -f1
echo "show stat" | socat /var/run/haproxy/info.sock stdio
```

