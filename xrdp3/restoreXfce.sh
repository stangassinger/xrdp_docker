## restore Xfce und Desktop settings from NN
sudo rm -rf Desktop .config
sudo cp -r NN/.ssh  NN/.config  NN/Desktop  .
# needed for frama-c
sudo cp -r NN/.opam  NN/.why3.conf  . 
sudo chmod -R 777  .ssh .config     Desktop
sudo chown abc -R .config
sudo chgrp abc -R .config
sudo pkill -KILL -u abc
## add to docker desktop
#  
#  [Desktop Entry]
#  Version=1.0
#  Type=Application
#  Name=persistConfig
#  Comment=
#  Exec=sh -c "echo 'storing .config'; cd ~; rm -rf NN/.config NN/Desktop; cp -r .config/ NN/.config; cp -r Desktop NN/Desktop; echo 'DONE.' ; sleep 5 "
#  Icon=checkbox
#  Path=
#  Terminal=true
#  StartupNotify=true
