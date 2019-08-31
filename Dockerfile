# ベースイメージの指定
FROM python:3.5.2-alpine

# ソースを置くディレクトリを変数として格納
ARG project_dir=/web/hello/

# 必要なファイルをローカルからコンテナにコピー
ADD requirements.txt $project_dir
ADD hello.py $project_dir

# requirements.txtに記載されたパッケージをインストール
WORKDIR $project_dir
RUN pip install -r requirements.txt

# flaskアプリケーションの起動
ENV FLASK_APP /web/hello/hello.py
CMD flask run -h 0.0.0.0 -p $PORT