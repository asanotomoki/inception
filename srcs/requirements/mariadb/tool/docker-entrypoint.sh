#!/bin/bash
set -e

# MariaDBサーバーをバックグラウンドで起動
mysqld_safe &
pid="$!"

# MariaDBサーバーが起動するのを待つ
until mysqladmin ping -h localhost --silent; do
    echo 'waiting for mysqld to be connectable...'
    sleep 2
done

# データベースの作成
mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"

# ユーザーの作成と権限の付与
mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"

# ルートパスワードの設定
mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${DB_PASSWORD}');"

# 変更を適用
mysql -e "FLUSH PRIVILEGES;"

# 設定完了後、バックグラウンドプロセスを終了
kill -s TERM "$pid"
wait "$pid"

# 最後に、mysqldをフォアグラウンドで実行
exec "$@"
