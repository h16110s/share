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

# 鍵の指紋（fingerprint）が「9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88」かを、指紋の最後の8文字を検索することによって検証する
#   sudo apt-key fingerprint 0EBFCD88

# pub   4096R/0EBFCD88 2017-02-22
#       フィンガー・プリント = 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
# uid                  Docker Release (CE deb) <docker@docker.com>
# sub   4096R/F273FCD8 2017-02-22


# stable（安定版）リポジトリをセットアップする。「amd64」は、x86_64（＝64 bitのARMv8）のこと
# （「uname -m」コマンドを実行すると、「x86_64」と表示される）。
# 他には「armhf」（＝32 bitのARMv7、Raspberry Piなど）」や「s390x」（＝IBM z Systems）がある。
# 「lsb_release -cs」コマンドは「xenial」（参照：前掲の脚注*3）となる。
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
