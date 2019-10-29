#!/usr/bin/expect -f
spawn /usr/share/elasticsearch/bin/elasticsearch-plugin install file:/tmp/x-pack-6.2.4.zip
expect {
  "y/N" {send "y\n"; ; exp_continue}
}
exit