FROM yiisoftware/yii2-php:7.1-apache

RUN docker-php-ext-configure calendar && docker-php-ext-install calendar

RUN rm /etc/apache2/sites-enabled/000-default.conf &&\
    rm /etc/apache2/sites-available/000-default.conf

COPY default.conf /etc/apache2/sites-available/default.conf

RUN ln -s /etc/apache2/sites-available/default.conf /etc/apache2/sites-enabled/default.conf
