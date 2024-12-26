sudo docker create   --name kali \
                --network bridge \
                --platform linux/amd64 \
                -p 3389:3389 \
                -p 5908:5908 \
                -p 20022:20022 \
                -t \
                -v /home/tux/docker/volume/myHome:/home/abc/Documents:rw \
                kali
