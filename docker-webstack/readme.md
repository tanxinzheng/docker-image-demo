```
docker run -it --name webstack \
-p 50009:8000 \
-e DB_HOST="mysql.tanxz.com" \
-e DB_PORT="3306" \
-e DB_DATABASE="webstack" \
-e DB_USERNAME="webstack" \
-e DB_PASSWORD="1gynj30J&" \
-e ENTRYPOINT_CHOICE="new-server" \
--restart=always \
iyzyi/webstack-laravel
```