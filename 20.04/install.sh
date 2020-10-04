#! /bin/bash
# ホームディレクトリを英語表記にする
LANG=C xdg-user-dirs-gtk-update

# 正直うざいシステムに問題が見つかりましたを消す
# https://qiita.com/naoyukisugi/items/d0a30f1e7b9761fdf3e9
# 再起動必須
sudo rm /var/crash/*
sudo sed -i 's/enabled=1/enabled=0/g' /etc/default/apport

# snapパッケージのためのデーモンの再インストール（やらないとなんかtoo early~とかでる）
sudo apt purge -y snapd
sudo apt install -y snapd

echo "いらないものアンインストール"
sudo apt -y remove --purge gnome-sudoku
sudo apt -y remove --purge gnome-mines
sudo apt -y remove --purge gnome-mahjongg
sudo apt -y remove --purge aisleriot 
sudo apt -y remove --purge gnome-todo 
sudo apt -y remove --purge ubuntu-web-launchers

echo "Gnome-Tweak-Toolのインストール"
sudo apt -y install gnome-shell gnome-tweak-tool

echo "ex-fatマウント用のパッケージインストール"
sudo apt -y install exfat-fuse exfat-utils 

echo "コンパイル系のインストール" 
sudo apt -y install build-essential
sudo apt -y install \
        build-essential \
        libreadline-dev \
        libncursesw5-dev \
        libssl-dev \
        libsqlite3-dev \
        libgdbm-dev \
        libbz2-dev \
        liblzma-dev \
        zlib1g-dev \
        uuid-dev \
        libffi-dev \
        libdb-dev

echo "ネットワーク系のやつ"
sudo apt -y install net-tools

echo "vimのインストール" 
sudo apt-get -y install vim
mkdir $HOME/.vim
cp $HOME/.vim vim/*

echo "Gitのインストール"
sudo apt -y install git
mkdir $HOME/gir

echo "ツールのインストール"
sudo apt -y install \
        wget \
        curl \
        samba
        
echo ""
sudo apt -y install openssh-server
sudo systemctl enable ssh
sudo systemctl restart ssh

echo "google chromeのインストール"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb 

sudo apt -y update
sudo apt -y upgrade
sudo apt -y autoremove
sudo apt clean

# ランレベル変更する場合
# sudo systemctl set-default multi-user.target
# sudo systemctl set-default graphical.target

echo "Done!!!"
