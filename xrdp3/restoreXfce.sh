## restore Xfce und Desktop settings from NN
sudo rm -rf Desktop .config
sudo cp -r NN/.ssh  NN/.config  NN/Desktop  .
sudo chmod -R 777  .ssh .config     Desktop
sudo pkill -KILL -u abc
