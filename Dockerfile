# ベースイメージの選択
FROM openjdk:8-jre-slim

# tmuxのインストール
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
WORKDIR /minecraft

# プラグインディレクトリの作成
RUN mkdir -p /minecraft/plugins

ADD https://dev.bukkit.org/projects/worldedit/files/latest /minecraft/plugins/worldedit.jar

# PaperMCサーバーファイルのダウンロード
ADD https://papermc.io/api/v2/projects/paper/versions/1.16.5/builds/503/downloads/paper-1.16.5-503.jar /minecraft/paper.jar

# EULAに同意
RUN echo "eula=true" > eula.txt

# サーバーの起動コマンド
# CMD ["java", "-Xms512M", "-Xmx1G", "-jar", "/minecraft/paper.jar", "--nogui"]
CMD java -Xms512M -Xmx1G -jar /minecraft/paper.jar --nogui
