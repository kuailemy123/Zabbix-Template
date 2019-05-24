## 介绍

收藏zabbix监控服务的模板，各服务目录中都有使用说明，在`README.md`文档中



## 推送配置和脚本到zabbix客户端

1. 在ansible控制机上克隆本仓库

   ```
   git clone https://github.com/kuailemy123/Zabbix-Template.git
   ```

2. 进去`Ansible palybook目录`

   ```
   cd Zabbix-Template/Ansible\ Playbook/
   ```

3. 执行ansible playbook命令

   ```
   ansible-playbook push-conf.yaml -l 172.10.11.20 -e "app=System"
   ```

   > -l 172.10.11.20 限制执行主机
   >
   > -e "app=System" 指定运行变量，app指的Zabbix-Template目录下的文件名称，如:Happroxy,Keepalived
   >
   > -i 可以指定ansible hosts文件