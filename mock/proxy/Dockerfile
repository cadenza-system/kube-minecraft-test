# ベースイメージの選択
FROM openjdk:8-jre-slim

# mcrconのインストール
RUN apt-get update && apt-get install -y git build-essential \
    && git clone https://github.com/Tiiffi/mcrcon.git \
    && cd mcrcon \
    && gcc -std=gnu99 -pedantic -Wall -Wextra -O2 -s -o mcrcon mcrcon.c \
    && mv mcrcon /usr/local/bin/ \
    && cd .. \
    && rm -rf mcrcon \
    && apt-get remove -y git build-essential \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリの設定
WORKDIR /waterfall

# Waterfallサーバーファイルのダウンロード
ADD https://api.papermc.io/v2/projects/waterfall/versions/1.20/builds/554/downloads/waterfall-1.20-554.jar /waterfall/waterfall.jar

# サーバーの起動コマンド
CMD ["java", "-Xms512M", "-Xmx1G", "-jar", "/waterfall/waterfall.jar", "--nogui"]
