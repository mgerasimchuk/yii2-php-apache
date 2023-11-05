# Yii2 PHP Apache common docker image

## Сборка и пуш в registry

### multi-platform

```
docker run --privileged --rm tonistiigi/binfmt --install all
docker buildx create --platform linux/amd64,linux/arm64 --use --name multi-platform
docker buildx build --platform linux/amd64,linux/arm64 -t mgerasimchuk/yii2-php-apache:php7.4 --file Dockerfile --push .
```

### single platform

```
docker build -t mgerasimchuk/yii2-php-apache:php7.4 . && docker push mgerasimchuk/yii2-php-apache:php7.4
```

## Как использовать
В контейнер маунтим весь проект, но каждый application(backend, frontend)
запускается в своем отдельном контейнере.

На примере frontend приложения, которое является частью проекта на основе advanced шаблона:
```
docker run \
-v <YOUR-YII2-PROJECT-PATH>:/app \
-p 80:80 \
-e APACHE_INDEX_PHP_DIRECTORY="/app/frontend/web" \
mgerasimchuk/yii2-php-apache:php7.4
```
