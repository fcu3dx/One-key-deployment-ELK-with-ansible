# 使用 ansible-playbook 安装 elastic stack

Elastic Stack 包括 Elasticsearch、Kibana、Beats 和 Logstash（也称为 ELK Stack）。能够安全可靠地获取任何来源、任何格式的数据，然后实时地对数据进行搜索、分析和可视化。

## 服务器规划

总计使用5台服务器，主要部署 `Elasticsearch`、`Logstash`、`Kibana`,各种Beats是分别部署到应用服务器上的，用于向ELK发送数据。具体规划如下：

1、Elasticsearch服务器

服务器IP

- 10.9.1.91 (主节点、存储、)
- 10.9.1.92 (主节点、存储、)
- 10.9.1.93 (主节点、存储、)

使用端口：

- http: 9200
- tcp: 9300

2、、 Logstash 服务器

- 10.9.1.96
- 10.9.1.97

使用端口：

- tcp: 5044
- tcp: 9600

3、Kibana服务器

- 10.9.1.97

使用端口

- 5601

## 实施过程

### 添加Inventory

在 /etc/ansible/hosts下或任意目录下添加主机信息（需要在执行`ansible`命令时使用 `-i host_file` 命令）。

```yml

# 需要安装JDK的主机,ELK基于Java,所有主机均需要安装JDK1.7以上，这里使用JDK1.8。 
[jdk_server]
10.9.1.9[1:3]
10.9.1.9[6:7]

# Elasticsearch 主机，包括IP和配置文件中的各项参数，比如 Nodename,network,内存大小等
[es_servers]
10.9.1.91 node_name=gxsk_es_01 node_master=true node_data=true network_host=10.9.1.91
10.9.1.92 node_name=gxsk_es_02 node_master=true node_data=true network_host=10.9.1.92
10.9.1.93 node_name=gxsk_es_03 node_master=true node_data=true network_host=10.9.1.93

[ls_servers]
10.9.1.96 node_name=gxsk_ls_01 network_host=10.9.1.96
10.9.1.97 node_name=gxsk_ls_02 network_host=10.9.1.97

[kibana_servers]
10.9.1.97 node_name=gxsk_kibana_01 network_host=10.9.1.97
```

## 参考文章

[https://www.cnblogs.com/654wangzai321/p/8046742.html](https://www.cnblogs.com/654wangzai321/p/8046742.html)
