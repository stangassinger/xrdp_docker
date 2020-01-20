#!/usr/bin/expect -f
#log_file -a "expect.log"
set exp_internal 1 
set done  0
set timeout 20
spawn ./st-stm32cubeide_1.2.0_5034_20200108_0926_amd64.deb_bundle.sh --confirm
expect  "*Y/n*"
send    "y\r"
expect  "*Y/n*"
send    "y\r"
expect  "*Y/n*"
send    "y\r"
while {$done == 0} {
sleep 1
expect {
"*More*" { send  "\r" }
"*N/y*"  { send  "y\r"; set done 1 }
}
}
