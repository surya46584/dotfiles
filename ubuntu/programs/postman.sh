#!/bin/bash

if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Downloading Postman"
wget https://dl.pstmn.io/download/latest/linux64 -O $PROJECT_TEMP_PATH/postman.tar.gz
cd $PROJECT_TEMP_PATH

echo "(+) Moving Postman"
sudo mkdir -p /usr/local/stow/postman
sudo tar -xvf $PROJECT_TEMP_PATH/postman.tar.gz -C /usr/local/stow/postman
rm $PROJECT_TEMP_PATH/postman.tar.gz

if [ ! -s /usr/bin/postman ]; then
    echo "(+) Symlink postman"
    cd /usr/local/stow
    sudo stow postman
fi

echo "(+) Creating Desktop Entry $HOME_PATH/.local/share/applications/postman.desktop"

cat > $HOME_PATH/.local/share/applications/postman.desktop << EOF
[Desktop Entry]
Version=1.0
Name=Postman
Exec=postman
Type=Application
Terminal=false
Icon=/opt/Postman/resources/app/assets/icon.png
Categories=Development;
EOF

echo "(+) Complete! Look for Postman in your application menu."
