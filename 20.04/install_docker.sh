# 参考サイト：https://www.atmarkit.co.jp/ait/articles/1804/18/news141_3.html

# パッケージインストール前にアップデート
sudo apt -y update

# HTTPS越しにリポジトリを使うためのaptを有効にするパッケージをインストール
sudo apt -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Docker公式GPG鍵を追加
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"


# Dockerの最新版をインストール
sudo apt -y update
sudo apt -y install docker-ce docker-ce-cli containerd.io 

# dockerグループにユーザーを追加してsudoなしで実行可能にする
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker 

docker version

docker run hello-world


echo "Done!"
