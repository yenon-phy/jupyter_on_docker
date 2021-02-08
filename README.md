# Docker版Jupyterlab環境

本環境は[arrowkatoさんの環境](https://github.com/arrowkato/jupyter_on_docker)
をベースにしています.

## 構成

- Jupyterlab
- \<your_required_packages\>

## 構築方法

1. docker-composeファイルがあるディレクトリで下記コマンド実行

`docker-compose up -d`

※ カスタマイズ（`requirements.txt`にモジュール追記など）した場合, `--build`を付ける

2. ブラウザより http://localhost:80 （変更可）にアクセス

3. 落とすときは下記コマンド実行

`docker-compose down`

## 備考

イメージに関して
- 3.X-slim-buster<br>
gccなどの処理系なし
- 3.X-buster<br>
gccなどの処理系あり

>note
>
>インストールにgccが<br>
>必要になるパッケージがある場合、後者を選択


tqdmが使えるようになるまで
- Extension Manager を Enable にする
- jupyter-widgets/jupyterlab-managerをインストール
- Reload & Build（再読み込みするとBuildするかどうか聞かれる）
