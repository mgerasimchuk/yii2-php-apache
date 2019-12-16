# Yii2 PHP Apache common docker image

## Сборка и пуш в registry
docker build -t mgerasimchuk/yii2-php-apache:php7.1 . &&\
docker push mgerasimchuk/yii2-php-apache:php7.1

## Как использовать
В контейнер маунтим весь проект, но каждый application(backend, frontend)
запускается в своем отдельном контейнере.

На примере frontend приложения, которое является частью проекта на основе advanced шаблона:
```
docker run \
-v <YOUR-YII2-PROJECT-PATH>:/app \
-p 80:80 \
-e APACHE_INDEX_PHP_DIRECTORY="/app/frontend/web" \
mgerasimchuk/yii2-php-apache:php7.1
```
