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

### 添加YUM源

添加官方的YUM源，或者替换成清华的YUM源，我这里是自己定义的YUM源。

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

### 根据需要配置 install.yml 文件

主要配置的有：群集名称、集群节点、安装模块、jvm内存。
集群节点主要是**logstash**、**kibana** 配置文件中，连接 **elasticsearch** 使用，所以需要添加所有可能成为 **master** 节点的主机。
hosts 后面的可以指定单台主机（IP）,也可以使用定义好的名称（集群）

### 安装

```shell
ansible-playbook -i hosts install.yml
```

等候安装就行了。

## 参考文章

