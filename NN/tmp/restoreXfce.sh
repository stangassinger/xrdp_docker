## restore Xfce und Desktop settings from NN
rm -rf Desktop .config
cp -r NN/.config NN/Desktop .
pkill -KILL -u abc

