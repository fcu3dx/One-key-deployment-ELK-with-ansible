# 问题

```ansible-playbook

- name: started elasticsearch
  # systemd:
  #   naem: elasticsearch.service
  #   daemon_reload: yes
  #   state: started
  #  不知道什么原因，这个不能启动，换成shell可以正常启动

  # 明天试一下先 daemon_reload
  # 然后下一下进程再启动

- name: rpm -ql elasticsearch
  shell: rpm -ql elasticsearch | grep -v not | wc -l
  register: es_installed
- debug:
    var: es_installed

- name: Uninstall elasticsearch
  yum:
    name: elasticsearch
    state: absent
  when: es_installed.stdout != "0"

检查 shell执行后返回的行数，来判断是否执行当前命令。

然后复制卸载软件（如果有）、安装、配置、启动软件。

  ```
