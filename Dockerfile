FROM python:3.8-buster
ENV PYTHONUNBUFFERED 1

# apt-getの更新と履歴の初期化
RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    nodejs \
    npm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 一時作業ディレクトリからpipでパッケージをインストール
RUN mkdir -p /pip_packages
WORKDIR /pip_packages
COPY  ./requirements.txt /pip_packages/requirements.txt
RUN pip install -r /pip_packages/requirements.txt

# 実際に作業するディレクトリ
RUN mkdir /code
WORKDIR /code

# jupyter labにアクセスさせるport番号(デフォルト)
EXPOSE 8888

ENTRYPOINT ["jupyter-lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
CMD ["--notebook-dir=/code"]