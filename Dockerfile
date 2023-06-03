# Dockerfile
FROM golang:1.16-buster

# ワーキングディレクトリの設定
WORKDIR /workspace

# Pythonをインストール
RUN apt-get update && apt-get install -y python3 python3-pip

# Node.jsをインストール
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && apt-get install -y nodejs

# npmをインストール
RUN npm install npm@latest -g

# gitをインストール
RUN apt-get install -y git

# pythonパッケージ管理ツールを更新
RUN pip3 install --upgrade pip setuptools wheel

# 環境変数を設定
ENV GOPATH=/workspace/go
ENV PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# コンテナ起動時にbashシェルを開始
CMD [ "/bin/bash" ]
