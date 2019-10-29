#!/usr/bin/expect -f
"spawn /usr/share/logstash/bin/logstash-plugin install {{ xpackurl }}"
expect {
  "y/N" {send "y\n"; ; exp_continue}
}
exit