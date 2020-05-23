#!/usr/bin/expect -f
#log_file -a "expect.log"
set exp_internal 1 
set done1  0
set done2  0
set timeout 200 
spawn ./st-stm32cubeide_1.3.0_5720_20200220_1053_amd64.deb_bundle.sh --confirm
expect  "*Y/n*"
send    "y\r"
expect  "*Y/n*"
send    "y\r"
expect  "*Y/n*"
send    "y\r"
while {$done1 == 0} {
sleep 1
expect {
"*More*" { send  "\r" }
"*N/y*"  { send  "y\r"; set done1 1 }
}
}
while {$done2 == 0} {
sleep 1
expect {
"*More*" { send  "\r" }
"*N/y*"  { send  "y\r"; set done2 1 }
}
}
expect eof
