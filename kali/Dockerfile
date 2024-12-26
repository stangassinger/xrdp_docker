FROM kali_base

ARG DESKTOP_ENVIRONMENT
ARG REMOTE_ACCESS
ARG KALI_PACKAGE
ARG SSH_PORT
ARG RDP_PORT
ARG VNC_PORT
ARG VNC_DISPLAY
ARG BUILD_ENV
ARG HOSTDIR
ARG CONTAINERDIR
ARG UNAME
ARG UPASS

ADD --chown=${UNAME}:${UPASS}  restoreXfce.sh  /home/${UNAME}/Desktop/restoreXfce.sh
RUN echo '[Desktop Entry]\n\
Version=1.0\n\
Type=Application\n\
Name=restore\n\
Comment=\n\
Exec=sh -c "./restoreXfce.sh"\n\
Icon=\n\
Path=\n\
Terminal=true\n\
StartupNotify=true' > /home/${UNAME}/Desktop/restore.desktop
RUN chmod 777 /home/${UNAME}/Desktop/restore.desktop
