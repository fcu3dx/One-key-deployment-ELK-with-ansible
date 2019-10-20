# 文件模板说明

## jvm.options.j2 文件

java配置文件，其它位置不建议更改，这里只对 JVM 使用内存进行更改。

这个参数是根据主机内存大小进行更改的，所以其变量放置于用于安装的 playbook 主文件中

es_jvm_money: ES服务使用内存大小，需要输入纯数字

## elasticsearch.ymlj2

ES 的主配置文件，需要配置

- cluster_name：  集群名称,所有服务器相同，配置于主palybook主文件中（es.yml)
- node_name：     节点名称,每个服务器不同，配置于 `Inventory' 文件中
- 数据存储路径：    path.data: /var/lib/elasticsearch
- 日志存储路径：    path.logs: /var/log/elasticsearch
- 数据备份（快照）路径：path.repo: /data/backup/elasticsearch
- network_host： 主机IP，每个服务器不同，配置于`Inventory' 文件中
- Http运行端口
- discovery_seed_hosts： 集群自动发现节点，所有服务器相同，配置于主palybook主文件中（es.yml)
- initial_master_nodes： 集群Master选举节点，所有服务器相同，配置于主palybook主文件中（es.yml)
- 集群Master选举最少数量：gateway.recover_after_nodes: 3
- X-pack配置

### X-pack配置

```shell
# 关闭认证
# 开启ssl传输
# ssl认证模式
# cert文件路径
# ca文件路径
```

xpack.security.enabled: false
xpack.security.transport.ssl.enabled: true
xpack.security.transport.ssl.verification_mode: certificate
xpack.security.transport.ssl.keystore.path: certs/elastic-certificates.p12
xpack.security.transport.ssl.truststore.path: certs/elastic-certificates.p12
