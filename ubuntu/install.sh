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


echo "Gnome-Tweak-Toolのインストール"
sudo apt -y install gnome-shell gnome-tweak-tool

echo "テーマ系のインストール"
sudo add-apt-repository ppa:numix/ppa
sudo apt -y update
sudo apt -y install numix-icon-theme-circle
sudo apt -y upgrade

sudo add-apt-repository ppa:dyatlov-igor/materia-theme
sudo apt -y update
sudo apt -y install materia-gtk-theme
sudo apt-get -y upgrade

echo "vimのインストール" 
sudo apt-get -y install vim
mkdir $HOME/.vim
cp $HOME/.vim vim/*

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


echo "ex-fatマウント用のパッケージインストール"
sudo apt -y install exfat-fuse exfat-utils 

echo "google chromeのインストール"
sudo dpkg -i google-chrome-stable_current_amd64.deb 


echo "Gitのインストール"
sudo apt -y install git
mkdir $HOME/gir

echo "VLCのインストール"
sudo snap install vlc


echo "Done!!!"
