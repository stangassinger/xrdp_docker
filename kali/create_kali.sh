docker create   --name kali-linux \
                --network bridge \
                --platform linux/amd64 \
                -p 3389:3389 \
                -p 5908:5908 \
                -p 20022:20022 \
                -t \
                -v ./kali/home/user:/opt \
                kali_linux
