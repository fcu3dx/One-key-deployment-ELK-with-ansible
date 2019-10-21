#!/usr/bin/expect -f
spawn /usr/share/elasticsearch/bin/elasticsearch-setup-passwords interactive
expect {
  "y/N" {send "y\n"; ; exp_continue}
  "elastic" {send "lm7GvkPVz8Lel9cvy8aG\n"; exp_continue}
  "apm_system" {send "oQ1F75SNocvecNx1KAyq\n"; exp_continue}
  "kibana" {send "eDTc6t618kibUpKpfWCZ\n"; exp_continue}
  "logstash_system" {send "cvaprPsnsJShSPGZ2gJb\n"; exp_continue}
  "beats_system" {send "vBmC6jHsm92s1P8HGmpE\n"; exp_continue}
  "remote_monitoring_user" {send "8BuEXIccUPbBnOdx7ApR\n"; exp_continue}
}
exit
