sudo docker image build --platform linux/amd64 \
        -t kali \
        --build-arg DESKTOP_ENVIRONMENT=xfce \
        --build-arg REMOTE_ACCESS=rdp \
        --build-arg KALI_PACKAGE=core \
        --build-arg RDP_PORT=3389 \
        --build-arg VNC_PORT=5908 \
        --build-arg VNC_DISPLAY=$XVNC_DISPLAY \
        --build-arg SSH_PORT=20022 \
        --build-arg BUILD_ENV=amd64 \
        --build-arg HOSTDIR \
        --build-arg CONTAINERDIR \
        --build-arg UNAME=abc \
        --build-arg UPASS=abc \
        .
